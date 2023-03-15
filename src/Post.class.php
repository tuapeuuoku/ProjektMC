<?php
class Post {
    private string $title;
    private string $imageUrl;
    private string $timeStamp;

    function __construct(string $title, string $imageUrl, string $timeStamp)
    {
        $this->title = $title;
        $this->imageUrl = $imageUrl;
        $this->timeStamp = $timeStamp;
    }
    public function getFileName() : string {
        return $this->imageUrl;
    }
    public function getTitle() : string {
        return $this->title;
    }
    public function getTimeStamp() : string {
        return $this->timeStamp;
    }

    static function get(int $id) : Post {
        global $db;
        $query = $db->prepare("SELECT * FROM post WHERE id = ?");
        $query->bind_param('i', $id);
        $query->execute();
        $result = $query->get_result();
        $resultArray = $result->fetch_assoc();
        return new Post($resultArray['title'], $resultArray['filename'], $resultArray['timestamp']);
    }

    static function getLast() : Post {
        global $db;
        $query = $db->prepare("SELECT * FROM post ORDER BY timestamp DESC LIMIT 1");
        $query->execute();
        $result = $query->get_result();
        $row = $result->fetch_assoc();
        $p = new Post($row['id'], $row['filename'], $row['timestamp']);
        return $p;
    }

    static function getPage(int $pageNumber = 1, int $postsPerPage = 10) {
        global $db;
        $query = $db->prepare("SELECT * FROM post LIMIT 10 OFFSET ?");
        $offset = ($pageNumber-1) * $postsPerPage;
        $query->bind_param('i', $id);
        $query->execute();
        $result = $query->get_result();
        $postsArray = array();
        while($row = $result->fetch_assoc()) {
            $post = new Post($row['title'], $row['filename'], $row['timestamp']);
            array_push($postsArray, $post);
        }
        return $postsArray;
    }
    static function upload(string $filename, string $title = ""){
        $uploadDir = "img/";
        $imageInfo = getimagesize($filename);
    if(!is_array($imageInfo)) {
        die("BŁĄD: Nieprawidłowy format obrazu");
        
    }
    $randomSeed = rand(10000,99999) . hrtime(true);
    $hash = hash("sha256", $randomSeed);
    $newfilename = $uploadDir . $hash . ".webp";
    if(file_exists($newfilename)){
        die("BŁĄD: Plik o tej nazwie juz istnieje");
    }
    $imageString = file_get_contents($filename);
    $gdImage = @imagecreatefromstring($imageString);
    imagewebp($gdImage, $newfilename);

    global $db;

    $query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ?, ?)");
    $dbTimestamp = date("Y-m-d H:i:s");
    $query->bind_param("sss", $dbTimestamp, $newfilename, $title);
    if(!$query->execute())
        die("Błąd zapisu do bazy danych");
    }
}


?>
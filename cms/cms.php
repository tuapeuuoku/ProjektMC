<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="uploadedFileInput">
            Wybierz plik do wgrania na serwer:
        </label><br>
        <input type="file" name="uploadedFile" id="uploadedFileInput" required><br>
        <input type="submit" value="Wyślij plik" name="submit"><br>
    </form>

    <?php
    //sprawdź czy został wysłany formularz
    if(isset($_POST['submit'])) 
    {
        //zdefiniuj folder do którego trafią pliki (ścieżka względem pliku index.php)
        $targetDir = "image/";

        //pobierz pierwotną nazwę pliku z tablicy $_FILES
        $sourceFileName = $_FILES['uploadedFile']['name'];

        //pobierz tymczasową ścieżkę do pliku na serwerze
        $tempURL = $_FILES['uploadedFile']['tmp_name'];

        //sprawdź czy mamy do czynienia z obrazem
        $imgInfo = getimagesize($tempURL);
        if(!is_array($imgInfo)) {
            die("BŁĄD: Przekazany plik nie jest obrazem!");
        }

        //wyciągnij pierwotne rozszerzenie pliku
        //$sourceFileExtension = pathinfo($sourceFileName, PATHINFO_EXTENSION);
        //zmień litery rozszerzenia na małe
        //$sourceFileExtension = strtolower($sourceFileExtension);
        /// niepotrzebne - generujemy webp

        //wygeneruj hash - nową nazwę pliku
        $newFileName = hash("sha256", $sourceFileName) . hrtime(true)
                            . ".webp";

        
        //zaczytujemy cały obraz z folderu tymczasowego do stringa
        $imageString = file_get_contents($tempURL);

        //generujemy obraz jako obiekt klasy GDImage
        //@ przed nazwa funkcji powoduje zignorowanie ostrzeżeń
        $gdImage = @imagecreatefromstring($imageString);

        //wygeneruj pełny docelowy URL
        $targetURL = $targetDir . $newFileName;

        //zbuduj docelowy URL pliku na serwerze
        //$targetURL = $targetDir . $sourceFileName;
        //wycofane na rzecz hasha

        //sprawdź czy plik przypadkiem już nie istnieje
        if(file_exists($targetURL)) {
            die("BŁĄD: Podany plik już istnieje!");
        }

        //przesuń plik do docelowej lokalizacji
        //move_uploaded_file($tempURL, $targetURL);
        //nieaktualne - generujemy webp
        imagewebp($gdImage, $targetURL);


        echo "Plik został poprawnie wgrany na serwer";
    }

    if(isset($_POST['submit']))
{
    $filename = $_FILES['uploadedFile']['name'];
    $tempFileUrl = $_FILES["uploadedFile"]["tmp_name"];
    $targetDir = "img/";
    $imageInfo = getimagesize($_FILES["uploadedFile"]["tmp_name"]);
    if(!is_array($imageInfo)) {
        die("BŁĄD: Nieprawidłowy format obrazu");
    }
 
    $imgString = file_get_contents($tempFileUrl);
    $gdImage = imagecreatefromstring($imgString);
 
    $targetExtension = pathinfo($filename, PATHINFO_EXTENSION);
    $targetExtension = strtolower($targetExtension);
 
    $filename = $filename . hrtime(true);
    $filename = hash("sha256", $filename);
 
    $targetUrl = $targetDir . $filename . "." . $targetExtension;
    if(file_exists($targetUrl))
        die("BŁĄD: Plik o tej nazwie juz istnieje");
    //move_uploaded_file($_FILES["uploadedFile"]["tmp_name"], $targetUrl);
    $targetUrl = $targetDir . $filename . ".webp";
    imagewebp($gdImage, $targetUrl);
 
    $db = new mysqli("localhost", "root", "", "cms");
    $q = "INSERT post (ID, timestamp, filename) VALUES (NULL, ?, ?)";
    $preparedQ = $db->prepare($q);
    $date = date('Y-m-d H:i:s');
    $preparedQ->bind_param('ss', $date, $filename);
    $result = $preparedQ->execute();
    if (!$result) {
        die("Błąd bazy danych");
    }
}
    ?>
</body>
</html>
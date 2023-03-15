<!DOCTYPE html>
<html lang="en">
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
        </label>
        <input type="file" name="uploadedFile" id="uploadedFileInput">
        <input type="submit" value="Wyślij plik" name="submit">
    </form>
<?php

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
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    $host = 'localhost';
    $username = 'root';
    $password = '';
    $dbName = 'projektmc';
    $db = new mysqli($host, $username, $password, $dbName);

    $sqlimage = "SELECT * FROM post ORDER BY TimeStamp DESC ";
    $result = $db->query($sqlimage);
    while ($row = $result->fetch_assoc()) {
        $hash = $row['FileName'];
        $url = "img/" . $hash . ".webp";
        
        echo "<img src =\"$url\">";
    };
    ?>
</body>

</html>
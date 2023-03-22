<?php
class User{
    private $email;
    private $password;

    public static function register(string $email, string $password){
        global $db;
        $query = $db ->prepare("INSERT INTO user VALUES (NULL, ?, ?)");
    }
}

?>
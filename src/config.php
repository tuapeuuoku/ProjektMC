<?php
require('./../vendor/autoload.php');


$db = new mysqli('localhost', 'root','','cms' );


require('./../src/Post.class.php');

$loader = new Twig\Loader\FilesystemLoader('./../src/templates');
$twig = new Twig\Environment($loader);

?>
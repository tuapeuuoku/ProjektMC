<?php
require("./../src/config.php");

use Steampixel\Route;

Route::add('/' , function() {
    global $twig;
    $posts = Post::getPage();
    $t = array("posts" => $posts);
    $twig->display("index.html.twig" ,$t);
    // phpinfo();
});

Route::add('/upload', function() {
    global $twig;
    $twig->display("upload.html.twig");
});
if(isset($_POST['submit']))
    Post::upload($_FILES['uploadedFile']['tmp_name'], $_POST['title']);

    Route::run('/cms/pub');
  

?>
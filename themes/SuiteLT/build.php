<?php

const DS = DIRECTORY_SEPARATOR;


// Build CSS
require 'less.php/Cache.php';
Less_Cache::$cache_dir = __DIR__.DS."build";

$files = array();
$files[ __DIR__.DS.'bootstrap/less/bootstrap.less'] = 'bootstrap/';
// Add your own
//$files[ __DIR__.DS.'custom/my.less'] = 'custom/';

$css_file_name = Less_Cache::Get( $files );

file_put_contents('dist/bootstrap.css', file_get_contents(__DIR__.DS."build".DS.$css_file_name));

// Build JS File
file_put_contents('dist/bootstrap.js', "\n");

$js_src_files = scandir(__DIR__.DS.'bootstrap/js');

foreach ($js_src_files as $file) {
    if($file == '.' OR $file == "..") {
        continue;
    }
    $path = __DIR__.DS."bootstrap/js".DS.$file;

    $pathinfo = pathinfo($path);
    if(isset($pathinfo['extension']) AND !empty($pathinfo['extension']) AND $pathinfo['extension'] == 'js') {
        file_put_contents('dist/bootstrap.js', file_get_contents($path), FILE_APPEND);
    }
}
<?php
const DS = DIRECTORY_SEPARATOR;


$path_in = __DIR__.DS.'dist/variables.json';
$path_out = __DIR__.DS.'bootstrap/less/variables.less';
$json = json_decode(file_get_contents($path_in));

//clear less file
file_put_contents($path_out, '\n');

// Write less to json excluding comments;
$file_handle = fopen($path_out, "w");

foreach ($json as $key => $value) {
    fputs($file_handle, $key.':'.$value.";\n");
}

fclose($file_handle);

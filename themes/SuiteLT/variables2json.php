<?php
const DS = DIRECTORY_SEPARATOR;

$json = array();
$path_in = __DIR__.DS.'bootstrap/less/variables.less';
$path_out = __DIR__.DS.'dist/variables.json';

// Write less to json excluding comments;
$file_handle = fopen($path_in, "r");

if($file_handle !== FALSE) {
    while (($buffer = fgets($file_handle, 120)) !== false)
    {
        if(substr($buffer, 0, 2) == '//') {
            continue;
        } else if(substr($buffer, 0, 2) == "\n") {
            continue;
        } else if(substr($buffer, 0, 2) == "\r\n") {
            continue;
        }

        $key_ends = strpos($buffer, ':');
        $value_begins = $key_ends + 1;

        $key = ltrim(rtrim(substr($buffer, 0, $key_ends)));
        $value = ltrim(rtrim(substr($buffer, $value_begins)));

        $value = substr($value, 0, strpos($value, ';'));

        if(!empty($key) AND !empty($value)) {
            $json[$key] = $value;
        }
        echo $buffer;
    }
}

fclose($file_handle);

$json = json_encode($json,  JSON_PRETTY_PRINT);
file_put_contents($path_out, $json );
<?php


function cp($source, $dest){
    global $MAP_FILES;
    if(is_dir($source)) {
        $dir_handle=opendir($source);
        while($file=readdir($dir_handle)){
            if($file!="." && $file!=".."){
                if(is_dir($source."/".$file)){
                    if(!is_dir($dest."/".$file)){
                        mkdir($dest."/".$file);
                    }
                    cp($source."/".$file, $dest."/".$file);
                } else {
                    copy($source."/".$file, $dest."/".$file);
                    $MAP_FILES['moved'][$source."/".$file] = $dest."/".$file;
                }
            }
        }
        closedir($dir_handle);
    } else {
        copy($source, $dest);
        $MAP_FILES['moved'][$source] = $dest;
    }
}

function file_str_replace ($search, $replace, $path) {
    if(!is_dir($path)) {
        $file_contents = file_get_contents($path);
        $found = strstr($file_contents, $search);
        if($found != false) {
            $replaced_text = str_replace($search, $replace, $file_contents);
            file_put_contents($path, $replaced_text);
            return true;
        }
    }
    return false;
}

function file_strpos ($search, $path) {
    if(!is_dir($path)) {

        $file_contents = file_get_contents($path);
        return strpos($file_contents, $search);

    }
    return false;
}

/**
 * @param $str string to split
 * @returns array string php identifiers
 */
function str_split_identifiers ($str) {
    $regex = '[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*';
    return preg_split($regex, $str);
}

function file_extension ($path) {
    $info = new SplFileInfo($path);
    return $info->getExtension();
}
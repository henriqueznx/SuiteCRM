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

function file_find_and_replace ($search, $replace, $path) {
    if(!is_dir($path)) {
        if($path == '/home/administrator/Documents/projects/SuiteCRM/Psr/Suite2Psr/Build/SuiteCRM/vendor/HTTP_WebDAV_Server/Server.php' &&
        strstr($search, 'Server') != false) {
            $break = 1;
        }
        $file_contents = file_get_contents($path);
        $found = strstr($file_contents, $search);
        if($found != false) {
            $replaced_text = str_replace($search, $replace, $file_contents);
            file_put_contents($path, $replaced_text);
            $break =1;
            return true;
        }
    }
    return false;
}

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
//                    $MAP_FILES[] = array("$source" => "$dest");
                    $MAP_FILES['moved'][$source] = $dest;
                }
            }
        }
        closedir($dir_handle);
    } else {
        copy($source, $dest);
        $MAP_FILES['moved'][$source] = $dest;
    }
}

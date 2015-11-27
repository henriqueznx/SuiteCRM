<?php
global $MAP_FILES;
foreach($MAP_FILES['moved'] as $original_path => $moved_path) {
    // Open moved files found in $MAP_FILES
    // Scan through moved file for old paths
    // Replace paths with their new location
    $original = str_replace($SUITECRM_ROOT,'',$original_path);
    $prefix = realpath($BUILD_ROOT);
    if (substr($moved_path, 0, strlen($prefix)) == $prefix) {
        $moved= substr($moved_path, strlen($prefix)+1);

    }
    foreach($MAP_FILES['moved'] as $original_path_search => $moved_path_replace) {

        $original_search = str_replace($SUITECRM_ROOT,'',$original_path_search);
        $prefix = realpath($BUILD_ROOT);
        if (substr($moved_path_replace, 0, strlen($prefix)) == $prefix) {
            $moved_search = substr($moved_path_replace, strlen($prefix)+1);
        }
        $original_search = str_replace('\\','/',$original_search);
        $moved_search = str_replace('\\','/',$moved_search);
        file_str_replace($original_search, $moved_search, $moved_path);
    }
}
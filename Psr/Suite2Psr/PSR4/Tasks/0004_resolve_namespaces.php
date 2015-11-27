<?php
global $MAP_FILES;

foreach($MAP_FILES['moved'] as $original_path => $moved_path) {
    $original = str_replace($SUITECRM_ROOT,'',$original_path);
    $prefix = realpath($BUILD_ROOT);
    if (substr($moved_path, 0, strlen($prefix)) == $prefix) {
        $moved= substr($moved_path, strlen($prefix)+1);

    }

    if(is_dir($moved_path)) {

    }
//    $moved_search = str_replace('\\','/',$moved_search);

        $file_lines = '';
        // map namespaces
        $namespace_pos_start = file_strpos('namespace', $moved_path);
        if($namespace_pos_start != false) {
            $file_lines = file($moved_path);
            foreach($file_lines as $line_number => $line) {
                // search for namespace
                if(strpos($line, 'namespace') != false) { $MAP_FILES['namespace_identifiers'][$moved_path][] = $line; }
                // map namespaces
            }
        }

//        // map classes
//        $class_pos_start = file_strpos('class', $moved_path);
//        if($class_pos_start != false) {
//            if(empty($file_lines)) { $file_lines = file($moved_path); }
//            foreach($file_lines as $line_number => $line) {
//                // search for classes
//                // map classes
//            }
//        }
//
//        // map interfaces
//        $interface_pos_start = file_strpos('interface', $moved_path);
//        if($interface_pos_start != false) {
//            if(empty($file_lines)) { $file_lines = file($moved_path); }
//            foreach($file_lines as $line_number => $line) {
//                // search for interfaces
//                // map interfaces
//            }
//        }
//
//        // trait
//        $trait_pos_start = file_strpos('trait', $moved_path);
//        if($trait_pos_start != false) {
//            if(empty($file_lines)) { $file_lines = file($moved_path); }
//            foreach($file_lines as $line_number => $line) {
//                // search for trait
//                // map trait
//            }
//        }
        // Resolve namespace issues
        // Map Differences
}
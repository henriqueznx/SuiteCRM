<?php
global $SUITECRM_ROOT, $module,  $MODULES, $BUILD_ROOT, $MODULES_ROOT, $MODULES_ROOT, $EXTENSION_ROOT, $module_TASKS_ROOT, $SUITE2PSR_ROOT;
/**
 * Copy application code
 */
foreach($MODULES as $m => $module) {
    $module_source_path = $SUITECRM_ROOT.$m;
//    $module_source_path = realpath($SUITECRM_ROOT.$m);

    $module_destination_path = $MODULES_ROOT.$module;
    if(!file_exists($module_destination_path) && is_dir($module_source_path)) { mkdir($module_destination_path, 0777, true); }
//    $module_destination_path = realpath($module_ROOT.$module);
    $module_destination_path = str_replace(DIRECTORY_SEPARATOR.DIRECTORY_SEPARATOR,'/',$module_destination_path);

    cp($module_source_path, $module_destination_path);

}



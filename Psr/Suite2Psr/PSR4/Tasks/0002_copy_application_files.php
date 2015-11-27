<?php
global $SUITECRM_ROOT, $APPLICATION, $BUILD_ROOT, $APPLICATION_ROOT, $MODULES_ROOT, $EXTENSION_ROOT, $APPLICATION_TASKS_ROOT, $SUITE2PSR_ROOT;
/**
 * Copy application code
 */
foreach($APPLICATION as $a => $application) {
    $application_source_path = $SUITECRM_ROOT.$a;
//    $application_source_path = realpath($SUITECRM_ROOT.$a);

    $application_destination_path = $APPLICATION_ROOT.$application;
    if(!file_exists($application_destination_path) && is_dir($application_source_path)) { mkdir($application_destination_path, 0777, true); }
//    $application_destination_path = realpath($APPLICATION_ROOT.$application);
    $application_destination_path = str_replace(DIRECTORY_SEPARATOR.DIRECTORY_SEPARATOR,'/',$application_destination_path);

    cp($application_source_path, $application_destination_path);

}



<?php
global $SUITECRM_ROOT, $VENDOR, $BUILD_ROOT, $APPLICATION_ROOT, $MODULES_ROOT, $EXTENSION_ROOT, $APPLICATION_TASKS_ROOT, $SUITE2PSR_ROOT;
/**
 * Copy vendor code
 */
foreach($VENDOR as $v => $vendor) {
    $vendor_source_path = realpath($SUITECRM_ROOT.$v);
    $vendor_destination_path = $BUILD_ROOT.$vendor;
    if(!file_exists($vendor_destination_path)) { mkdir($vendor_destination_path, 0777, true); }
    $vendor_destination_path = realpath($BUILD_ROOT.$vendor);
//    $vendor_destination_path = str_replace(DIRECTORY_SEPARATOR.DIRECTORY_SEPARATOR,'',$vendor_destination_path);

    cp($vendor_source_path, $vendor_destination_path);
}

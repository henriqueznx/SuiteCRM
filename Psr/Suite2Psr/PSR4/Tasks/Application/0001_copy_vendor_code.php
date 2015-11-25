<?php
/**
 * Copy vendor code
 */
foreach($VENDOR as $v => $vendor) {
    $vendor_source_path = $v;
    $vendor_destination_path = $BUILD_ROOT.DIRECTORY_SEPARATOR.$vendor;
    if(!file_exists($vendor_destination_path)) { mkdir($vendor_destination_path, 0777, true); }
    cp($vendor_source_path, $vendor_destination_path);
}
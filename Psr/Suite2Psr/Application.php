<?php
echo 'Suite2Psr Application'.PHP_EOL;
const sugarEntry = 'defined';

require_once "Utils.php";

if(!file_exists($APPLICATION_ROOT)) { mkdir($APPLICATION_ROOT, 0777, true); }

/**
 * Copy vendor code
 */
foreach($VENDOR as $v => $vendor) {
    $vendor_source_path = $v;
    $vendor_destination_path = $BUILD_ROOT.DIRECTORY_SEPARATOR.$vendor;
    if(!file_exists($vendor_destination_path)) { mkdir($vendor_destination_path, 0777, true); }
    echo $vendor_source_path.PHP_EOL;
    echo $vendor_destination_path.PHP_EOL;
    cp($vendor_source_path, $vendor_destination_path);
}
?>
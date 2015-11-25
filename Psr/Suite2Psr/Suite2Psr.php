<?php
echo 'Suite2Psr'.PHP_EOL;
echo print_r($argv, 1).PHP_EOL;

require("Configuration.php");
require("Application.php");
require("Modules.php");
require("Extension.php");
// Get Command line arguments
if(!file_exists($BUILD_ROOT)) { mkdir($BUILD_ROOT, 0777, true); }
exit();
?>
<?php
global $APPLICATION_ROOT;
echo 'Suite2Psr Application'.PHP_EOL;
const sugarEntry = 'defined';

require_once "Utils.php";

if(!file_exists($APPLICATION_ROOT)) { mkdir($APPLICATION_ROOT, 0777, true); }

?>
<?php
if(!defined('sugarEntry'))define('sugarEntry', true);

require_once('include/entryPoint.php');
//require_once('include/utils/file_utils.php');


//$test = BeanFactory::getBean('Accounts');

$return_array= Array();

$db = DBManagerFactory::getInstance();
$query="select distinct name from accounts where name like'%$_REQUEST[query]%' and deleted=0";
$result=$db->query($query);
if (!empty($result)) {
    while (($row=$db->fetchByAssoc($result)) != null) {
        $std = new stdClass();
        $std->value = $row['name'];
        //$std->data = $row['id'];
        $return_array[]=$std;
    }
}
$t = new stdClass();
$t->suggestions = $return_array;
echo json_encode($t);

//echo $_REQUEST[query];




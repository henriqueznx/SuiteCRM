<?php
if(!defined('sugarEntry'))define('sugarEntry', true);

require_once('include/entryPoint.php');
//require_once('include/utils/file_utils.php');


//$test = BeanFactory::getBean('Accounts');

$return_array= Array();

$db = DBManagerFactory::getInstance();
$query="select name, first_name, last_name from accounts left join users on accounts.assigned_user_id = users.id where name like'%$_REQUEST[query]%' and accounts.deleted=0 order by first_name, name";
$result=$db->query($query);
if (!empty($result)) {
    while (($row=$db->fetchByAssoc($result)) != null) {
        $std = new stdClass();
        $std->value = $row['name'];


        $data = new stdClass();
        $name = $row['first_name'].' '.$row['last_name'];
        $data->category = $name;
        $std->data = $data;

        //$std->data = $row['id'];
        $return_array[]=$std;
    }
}
$t = new stdClass();
$t->suggestions = $return_array;
echo json_encode($t);

//echo $_REQUEST[query];




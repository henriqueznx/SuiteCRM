<?php
if(!defined('sugarEntry'))define('sugarEntry', true);

require_once('include/entryPoint.php');
//require_once('include/utils/file_utils.php');


//$test = BeanFactory::getBean('Accounts');

$return_array= Array();

$db = DBManagerFactory::getInstance();

if(strtolower($_REQUEST['field'])=='assigned_user_name')
{
//    $query="select name, first_name, last_name from users left join users on accounts.assigned_user_id = users.id where name like'%$_REQUEST[query]%' and accounts.deleted=0 order by first_name, name";
    $query = <<<EOF
select concat(first_name,' ',last_name)name from users
              where users.deleted = 0
              and concat(last_name,' ',first_name) is not null
              and (users.first_name like '%$_REQUEST[query]%' or users.last_name like '%$_REQUEST[query]%')
EOF;

}
else if(strtolower($_REQUEST['field'])=='name')
{
//    $query="select name, first_name, last_name from users left join users on accounts.assigned_user_id = users.id where name like'%$_REQUEST[query]%' and accounts.deleted=0 order by first_name, name";
    $query = <<<EOF
select concat(first_name,' ',last_name)name from contacts
              where contacts.deleted = 0
              and concat(last_name,' ',first_name) is not null
              and (contacts.first_name like '%$_REQUEST[query]%' or contacts.last_name like '%$_REQUEST[query]%')
              order by first_name
EOF;

}
else if(strtolower($_REQUEST['field'])=='title')
{
//    $query="select name, first_name, last_name from users left join users on accounts.assigned_user_id = users.id where name like'%$_REQUEST[query]%' and accounts.deleted=0 order by first_name, name";
    $query = <<<EOF
select distinct title as name from contacts
              where contacts.deleted = 0
              and contacts.title like '%$_REQUEST[query]%'
              order by first_name
EOF;

}
else if(strtolower($_REQUEST['field'])=='phone_work')
{
//    $query="select name, first_name, last_name from users left join users on accounts.assigned_user_id = users.id where name like'%$_REQUEST[query]%' and accounts.deleted=0 order by first_name, name";
    $query = <<<EOF
select distinct phone_work as name from contacts
              where contacts.deleted = 0
              and contacts.phone_work like '%$_REQUEST[query]%'
              order by phone_work
EOF;

}
else if(strtolower($_REQUEST['field'])=='email1')
{
//    $query="select name, first_name, last_name from users left join users on accounts.assigned_user_id = users.id where name like'%$_REQUEST[query]%' and accounts.deleted=0 order by first_name, name";
    $query = <<<EOF
SELECT distinct email_address as name FROM email_addresses
where email_address like '%$_REQUEST[query]%'
EOF;

}
else
{
    $query="select name, first_name, last_name from accounts left join users on accounts.assigned_user_id = users.id where name like'%$_REQUEST[query]%' and accounts.deleted=0 order by name asc";
}

$result=$db->query($query);
if (!empty($result)) {
    while (($row=$db->fetchByAssoc($result)) != null) {
        $std = new stdClass();
        $std->value = $row['name'];


        //$data = new stdClass();
        //$name = $row['first_name'].' '.$row['last_name'];
        //$data->category = $name;
        //$std->data = $data;

        //$std->data = $row['id'];
        $return_array[]=$std;
    }
}
$t = new stdClass();
$t->suggestions = $return_array;
echo json_encode($t);

//echo $_REQUEST[query];




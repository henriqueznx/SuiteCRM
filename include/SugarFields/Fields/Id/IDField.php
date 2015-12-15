<?php
function IDField($arg) {
    if(!array_key_exists('name',$arg)) {
        $arg['name'] = 'id';
    }
    $array = array(
        'name' => $arg['name'],
        'value' => uniqid(),
        'vname' => 'LBL_ID',
        'type' => 'id',
        'len' => 255,
        'required' => false,
        'reportable'=> false,
        'massupdate' => false,
    );
    $field = array($arg['name'] => $array);
    return $field;
}
<?php
/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2017 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */


if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

require_once('include/SugarFields/Fields/Base/SugarFieldBase.php');
require_once('include/UploadMultipleFile.php');

class SugarFieldFile extends SugarFieldBase
{

    /**
     * @param $parentFieldArray
     * @param $vardef
     * @param $displayParams
     * @param $tabindex
     * @param bool $twopass
     */
    public function setup($parentFieldArray, $vardef, $displayParams, $tabindex, $twopass = true)
    {
        global $sugar_config;
        $returnArray = array();
        $isMultiple = "";
        $filename = "{$vardef['name']}_file";
        if (in_array($_REQUEST['module'], $sugar_config['multipleUploads'])) {
            $isMultiple = 'multiple="multiple"';
            $filename = $filename . "[]";
        }
        $this->ss->assign('filename', $filename);
        $this->ss->assign('attachments', $returnArray);
        $this->ss->assign('multiple', $isMultiple);
        parent::setup($parentFieldArray, $vardef, $displayParams, $tabindex, $twopass);
    }

    /**
     * @param string $parentFieldArray
     * @param vardef $vardef
     * @param $displayParams
     * @param $tabindex
     * @return string
     */
    public function getDetailViewSmarty($parentFieldArray, $vardef, $displayParams, $tabindex)
    {
        $this->fillInOptions($vardef, $displayParams);

        return parent::getDetailViewSmarty($parentFieldArray, $vardef, $displayParams, $tabindex);
    }

    /**
     * @param $parentFieldArray
     * @param $vardef
     * @param $displayParams
     * @param $tabindex
     * @return string
     */
    public function getEditViewSmarty($parentFieldArray, $vardef, $displayParams, $tabindex)
    {
        $this->fillInOptions($vardef, $displayParams);

        $keys = $this->getAccessKey($vardef, 'FILE', $vardef['module']);
        $displayParams['accessKeySelect'] = $keys['accessKeySelect'];
        $displayParams['accessKeySelectLabel'] = $keys['accessKeySelectLabel'];
        $displayParams['accessKeySelectTitle'] = $keys['accessKeySelectTitle'];
        $displayParams['accessKeyClear'] = $keys['accessKeyClear'];
        $displayParams['accessKeyClearLabel'] = $keys['accessKeyClearLabel'];
        $displayParams['accessKeyClearTitle'] = $keys['accessKeyClearTitle'];

        return parent::getEditViewSmarty($parentFieldArray, $vardef, $displayParams, $tabindex);
    }

    /**
     * @param $parentFieldArray
     * @param $vardef
     * @param $displayParams
     * @param $tabindex
     * @return string
     */
    public function getSearchViewSmarty($parentFieldArray, $vardef, $displayParams, $tabindex)
    {
        return $this->getSmartyView($parentFieldArray, $vardef, $displayParams, $tabindex, 'SearchView');
    }

    /**
     * @param $bean
     * @param $params
     * @param $field
     * @param $vardef
     * @param string $prefix
     */
    public function save(&$bean, $params, $field, $vardef, $prefix = '')
    {
        // Single files upload
        if (isset($_FILES['filename_file']['name']) &&
            !empty($_FILES['filename_file']['name']) &&
            !is_array($_FILES['filename_file']['name'])
        ) {
            $fakeDisplayParams = array();
            $this->fillInOptions($vardef, $fakeDisplayParams);

            require_once('include/upload_file.php');
            $upload_file = new UploadFile($prefix . $field . '_file');

            //remove file
            if (isset($_REQUEST['remove_file_' . $field]) && $params['remove_file_' . $field] == 1) {
                $upload_file->unlink_file($bean->$field);
                $bean->$field = "";
            }

            $move = false;
            if (isset($_FILES[$prefix . $field . '_file']) && $upload_file->confirm_upload()) {
                $bean->$field = $upload_file->get_stored_file_name();
                $bean->file_mime_type = $upload_file->mime_type;
                $bean->file_ext = $upload_file->file_ext;
                $move = true;
            }

            if (!empty($params['isDuplicate']) && $params['isDuplicate'] == 'true') {
                // This way of detecting duplicates is used in Notes
                $old_id = $params['relate_id'];
            }
            if (!empty($params['duplicateSave']) && !empty($params['duplicateId'])) {
                // It's a duplicate
                $old_id = $params['duplicateId'];
            }

            // Backwards compatibility for fields that still use customCode to handle the file uploads
            if (!$move && empty($old_id) && isset($_FILES['uploadfile'])) {
                $upload_file = new UploadFile('uploadfile');
                if ($upload_file->confirm_upload()) {
                    $bean->$field = $upload_file->get_stored_file_name();
                    $bean->file_mime_type = $upload_file->mime_type;
                    $bean->file_ext = $upload_file->file_ext;
                    $move = true;

                }
            } else {
                if (
                    !$move &&
                    !empty($old_id)&&
                    isset($_REQUEST['uploadfile']) &&
                    !isset($_REQUEST[$prefix . $field . '_file'])
                ) {
                    // I think we are duplicating a backwards compatibility module.
                    $upload_file = new UploadFile('uploadfile');
                }
            }


            if (empty($bean->id)) {
                $bean->id = create_guid();
                $bean->new_with_id = true;
            }

            if ($move) {
                $upload_file->final_move($bean->id);
                $upload_file->upload_doc(
                    $bean,
                    $bean->id,
                    $params[$prefix . $vardef['docType']],
                    $bean->$field,
                    $upload_file->mime_type
                );
            } else {
                if (!empty($old_id)) {
                    // It's a duplicate, I think

                    if (empty($params[$prefix . $vardef['docUrl']])) {
                        $upload_file->duplicate_file($old_id, $bean->id, $bean->$field);
                    } else {
                        $docType = $vardef['docType'];
                        $bean->$docType = $params[$prefix . $field . '_old_doctype'];
                    }
                } else {
                    if (!empty($params[$prefix . $field . '_remoteName'])) {
                        // We aren't moving, we might need to do some remote linking
                        $displayParams = array();
                        $this->fillInOptions($vardef, $displayParams);

                        if (isset($params[$prefix . $vardef['docId']])
                            && !empty($params[$prefix . $vardef['docId']])
                            && isset($params[$prefix . $vardef['docType']])
                            && !empty($params[$prefix . $vardef['docType']])
                        ) {
                            $bean->$field = $params[$prefix . $field . '_remoteName'];

                            require_once('include/utils/file_utils.php');
                            $extension = get_file_extension($bean->$field);
                            if (!empty($extension)) {
                                $bean->file_ext = $extension;
                                $bean->file_mime_type = get_mime_content_type_from_filename($bean->$field);
                            }
                        }
                    }
                }
            }

            if ($vardef['allowEapm'] == true && empty($bean->$field)) {
                $GLOBALS['log']->info("The $field is empty, clearing out the lot");
                // Looks like we are emptying this out
                $clearFields = array('docId', 'docType', 'docUrl', 'docDirectUrl');
                foreach ($clearFields as $clearMe) {
                    if (!isset($vardef[$clearMe])) {
                        continue;
                    }
                    $clearField = $vardef[$clearMe];
                    $bean->$clearField = '';
                }
            }
        } else {
            $this->multipleUploadSave($bean, $params, $field, $vardef, $prefix);
        }
    }

    /**
     * @param $bean
     */
    private function multipleUploadSave(&$bean)
    {
        global $sugar_config;

        if (empty($bean->id)) {
            $bean->id = create_guid();
            $bean->new_with_id = true;
        }

        if (in_array($bean->module_name, $sugar_config['multipleUploads'])) {
            if (isset($_REQUEST['remove_file']) && !empty($_REQUEST['remove_file'])) {
                foreach ($_REQUEST['remove_file'] as $remove_file) {
                    if (file_exists($remove_file)) {
                        if (!unlink($remove_file)) {
                            $GLOBALS['log']->error("*** Could not unlink() file: [ {$remove_file} ]");
                        }
                    }
                }
            }

            // Multiple files upload
            if (isset($_FILES['filename_file']) &&
                !empty($_FILES['filename_file']) &&
                is_array($_FILES['filename_file']['name'])
            ) {
                require_once('include/upload_file.php');
                $upload_file = new MultipleUploadFile('filename_file');

                // Number of files uploaded
                $total = count($_FILES['filename_file']['name']);
                for ($i = 0; $i < $total; $i++) {
                    $confirm_upload = $upload_file->confirm_multiple_upload($upload_file, $i);

                    $attachment_bean = BeanFactory::getBean('Attachments');
                    $id = create_guid();
                    $filename = $_FILES['filename_file']['name'][$i];
                    $attachment_bean->id = $id;
                    $attachment_bean->new_with_id = true;
                    $attachment_bean->name = $filename;
                    $attachment_bean->filename = $filename;
                    $attachment_bean->file_mime_type = $upload_file->mime_type;
                    $attachment_bean->file_ext = $upload_file->file_ext;
                    $attachment_bean->parent_type = $bean->module_name;
                    $attachment_bean->parent_id = $bean->id;
                    $attachment_bean->assigned_user_id = $bean->assigned_user_id;
                    $attachment_bean->save();

                    $move = false;
                    if (isset($_FILES['filename_file']) && $confirm_upload) {
                        $move = true;
                    }

                    if ($move) {
                        $upload_file->final_move_multiple($upload_file, $id, $i);
                    }
                }
            }
        }
    }

    /**
     * @param $vardef
     * @param $displayParams
     */
    private function fillInOptions(&$vardef, &$displayParams)
    {
        if (isset($vardef['allowEapm']) && $vardef['allowEapm'] == true) {
            if (empty($vardef['docType'])) {
                $vardef['docType'] = 'doc_type';
            }
            if (empty($vardef['docId'])) {
                $vardef['docId'] = 'doc_id';
            }
            if (empty($vardef['docUrl'])) {
                $vardef['docUrl'] = 'doc_url';
            }
        } else {
            $vardef['allowEapm'] = false;
        }

        // Override the default module
        if (isset($vardef['linkModuleOverride'])) {
            $vardef['linkModule'] = $vardef['linkModuleOverride'];
        } else {
            $vardef['linkModule'] = '{$module}';
        }

        // This is needed because these aren't always filled out in the edit/detailview defs
        if (!isset($vardef['fileId'])) {
            if (isset($displayParams['id'])) {
                $vardef['fileId'] = $displayParams['id'];
            } else {
                $vardef['fileId'] = 'id';
            }
        }
    }

}

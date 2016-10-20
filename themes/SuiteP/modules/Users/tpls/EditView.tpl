{*
/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2016 SalesAgility Ltd.
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
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
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
 * reasonably feasible for  technical reasons, the Appropriate Legal Notices must
 * display the words  "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */


*}

{{sugar_include type="smarty" file=$headerTpl}}
{sugar_include include=$includes}


{$ROLLOVER}
<script type="text/javascript" src="{sugar_getjspath file='modules/Emails/javascript/vars.js'}"></script>
<script type="text/javascript" src="{sugar_getjspath file='cache/include/javascript/sugar_grp_emails.js'}"></script>
<link rel="stylesheet" type="text/css" href="{sugar_getjspath file='modules/Users/PasswordRequirementBox.css'}">
<script type="text/javascript" src="{sugar_getjspath file='cache/include/javascript/sugar_grp_yui_widgets.js'}"></script>
<script type='text/javascript' src='{sugar_getjspath file='include/SubPanel/SubPanelTiles.js'}'></script>
<script type='text/javascript'>
    var ERR_RULES_NOT_MET = '{$MOD.ERR_RULES_NOT_MET}';
    var ERR_ENTER_OLD_PASSWORD = '{$MOD.ERR_ENTER_OLD_PASSWORD}';
    var ERR_ENTER_NEW_PASSWORD = '{$MOD.ERR_ENTER_NEW_PASSWORD}';
    var ERR_ENTER_CONFIRMATION_PASSWORD = '{$MOD.ERR_ENTER_CONFIRMATION_PASSWORD}';
    var ERR_REENTER_PASSWORDS = '{$MOD.ERR_REENTER_PASSWORDS}';
</script>
<script type='text/javascript' src='{sugar_getjspath file='modules/Users/User.js'}'></script>
<script type='text/javascript' src='{sugar_getjspath file='modules/Users/UserEditView.js'}'></script>
<script type='text/javascript' src='{sugar_getjspath file='modules/Users/PasswordRequirementBox.js'}'></script>
{$ERROR_STRING}
<!-- This is here for the external API forms -->
<form name="DetailView" id="DetailView" method="POST" action="index.php">
    <input type="hidden" name="record" id="record" value="{$ID}">
    <input type="hidden" name="module" value="Users">
    <input type="hidden" name="return_module" value="Users">
    <input type="hidden" name="return_id" value="{$RETURN_ID}">
    <input type="hidden" name="return_action" value="EditView">
</form>

<form name="EditView" enctype="multipart/form-data" id="EditView" method="POST" action="index.php">
    <input type="hidden" name="display_tabs_def">
    <input type="hidden" name="hide_tabs_def">
    <input type="hidden" name="remove_tabs_def">
    <input type="hidden" name="module" value="Users">
    <input type="hidden" name="record" id="record" value="{$ID}">
    <input type="hidden" name="action">
    <input type="hidden" name="page" value="EditView">
    <input type="hidden" name="return_module" value="{$RETURN_MODULE}">
    <input type="hidden" name="return_id" value="{$RETURN_ID}">
    <input type="hidden" name="return_action" value="{$RETURN_ACTION}">
    <input type="hidden" name="password_change" id="password_change" value="false">
    <input type="hidden" name="required_password" id="required_password" value='{$REQUIRED_PASSWORD}' >
    <input type="hidden" name="old_user_name" value="{$USER_NAME}">
    <input type="hidden" name="type" value="{$REDIRECT_EMAILS_TYPE}">
    <input type="hidden" id="is_group" name="is_group" value='{$IS_GROUP}' {$IS_GROUP_DISABLED}>
    <input type="hidden" id='portal_only' name='portal_only' value='{$IS_PORTALONLY}' {$IS_PORTAL_ONLY_DISABLED}>
    <input type="hidden" name="is_admin" id="is_admin" value='{$IS_FOCUS_ADMIN}' {$IS_ADMIN_DISABLED} >
    <input type="hidden" name="is_current_admin" id="is_current_admin" value='{$IS_ADMIN}' >
    <input type="hidden" name="edit_self" id="edit_self" value='{$EDIT_SELF}' >
    <input type="hidden" name="required_email_address" id="required_email_address" value='{$REQUIRED_EMAIL_ADDRESS}' >
    <input type="hidden" name="isDuplicate" id="isDuplicate" value="{$isDuplicate}">
    <div id="popup_window"></div>

    <script type="text/javascript">
        var EditView_tabs = new YAHOO.widget.TabView("EditView_tabs");

        {literal}
        //Override so we do not force submit, just simulate the 'save button' click
        SUGAR.EmailAddressWidget.prototype.forceSubmit = function() { document.getElementById('Save').click();}

        EditView_tabs.on('contentReady', function(e){
            {/literal}
            {if $ID}
            {literal}
            var eapmTabIndex = 4;
            {/literal}{if !$SHOW_THEMES}{literal}eapmTabIndex = 3;{/literal}{/if}{literal}
            EditView_tabs.getTab(eapmTabIndex).set('dataSrc','index.php?sugar_body_only=1&module=Users&subpanel=eapm&action=SubPanelViewer&inline=1&record={/literal}{$ID}{literal}&layout_def_key=UserEAPM&inline=1&ajaxSubpanel=true');
            EditView_tabs.getTab(eapmTabIndex).set('cacheData',true);
            EditView_tabs.getTab(eapmTabIndex).on('dataLoadedChange',function(){
                //reinit action menus
                $("ul.clickMenu").each(function(index, node){
                    $(node).sugarActionMenu();
                });
            });

            if ( document.location.hash == '#tab5' ) {
                EditView_tabs.selectTab(eapmTabIndex);
            }
            {/literal}
            {/if}

            {if $scroll_to_cal}
            {literal}
            //we are coming from the tour welcome page, so we need to simulate a click on the 4th tab
            // and scroll to the calendar_options div after the tabs have rendered
            document.getElementById('tab4').click();
            document.getElementById('calendar_options').scrollIntoView();
            {/literal}
            {/if}

        });
    </script>
<div id="EditView_tabs">
    {*display tabs*}
    {{counter name="tabCount" start=-1 print=false assign="tabCount"}}
    <ul class="nav nav-tabs">
        {{if $useTabs}}
        {{foreach name=section from=$sectionPanels key=label item=panel}}
        {{capture name=label_upper assign=label_upper}}{{$label|upper}}{{/capture}}
        {* if tab *}
        {{if (isset($tabDefs[$label_upper].newTab) && $tabDefs[$label_upper].newTab == true)}}
        {*if tab display*}
        {{counter name="tabCount" print=false}}
        {{if $tabCount == '0'}}
        <li role="presentation" class="active">
            <a id="tab{{$tabCount}}" data-toggle="tab" class="hidden-xs">
                {sugar_translate label='{{$label}}' module='{{$module}}'}
            </a>
            <a id="xstab{{$tabCount}}" href="#" class="visible-xs first-tab-xs dropdown-toggle" data-toggle="dropdown">
                {sugar_translate label='{{$label}}' module='{{$module}}'}
            </a>
            <ul id="first-tab-menu-xs" class="dropdown-menu">
                {{counter name="tabCountXS" start=-1 print=false assign="tabCountXS"}}
                {{foreach name=sectionXS from=$sectionPanels key=label item=panelXS}}
                {{counter name="tabCountXS" print=false}}
                <li role="presentation">
                    <a id="tab{{$tabCountXS}}"  data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-{{$tabCountXS}}');">
                        {sugar_translate label='{{$label}}' module='{{$module}}'}
                    </a>
                </li>
                {{/foreach}}
                 {{counter name="tabCountXS" print=false}}
                <li role="presentation">
                    <a data-toggle="tab" id="tab{{$tabCountXS}}" href="#">{{$MOD.LBL_MAIL_OPTIONS_TITLE}}</a>
                </li>
                {if $CHANGE_PWD == '1'}
                    {{counter name="tabCountXS" print=false}}
                    <li role="presentation">
                        <a data-toggle="tab" id="tab{{$tabCountXS}}" href="#">{{$MOD.LBL_CHANGE_PASSWORD_TITLE}}</a>
                    </li>
                {/if}

                {{counter name="tabCountXS" print=false}}
                <li role="presentation">
                    <a data-toggle="tab" id="tab{{$tabCountXS}}" href="#">{{$MOD.LBL_THEME}}</a>
                </li>

                {{counter name="tabCountXS" print=false}}
                <li role="presentation">
                    <a data-toggle="tab" id="tab{{$tabCountXS}}" href="#">{{$MOD.LBL_ADVANCED}}</a>
                </li>

                 {{counter name="tabCountXS" print=false}}
                <li role="presentation">
                    <a data-toggle="tab" id="tab{{$tabCountXS}}" href="#">{{$MOD.LBL_EAPM_SUBPANEL_TITLE}}</a>
                </li>

            </ul>
        </li>
        {{else}}
        <li role="presentation" class="hidden-xs">
            <a id="tab{{$tabCount}}"  data-toggle="tab">
                {sugar_translate label='{{$label}}' module='{{$module}}'}
            </a>
        </li>
        {{/if}}
        {{else}}
        {* if panel skip*}
        {{/if}}
        {{/foreach}}
        {{/if}}


        {{counter name="tabCount" print=false}}
        <li role="presentation" class="hidden-xs">
            <a data-toggle="tab" id="tab{{$tabCount}}" href="#">{{$MOD.LBL_MAIL_OPTIONS_TITLE}}</a>
        </li>
        {if $CHANGE_PWD == '1'}
        {{counter name="tabCount" print=false}}
        <li role="presentation" class="hidden-xs">
            <a data-toggle="tab" id="tab{{$tabCount}}" href="#">{{$MOD.LBL_CHANGE_PASSWORD_TITLE}}</a>
        </li>
        {/if}
        {{counter name="tabCount" print=false}}
        <li role="presentation" class="hidden-xs">
            <a data-toggle="tab" id="tab{{$tabCount}}" href="#">{{$MOD.LBL_THEME}}</a>
        </li>

        {{counter name="tabCount" print=false}}
        <li role="presentation" class="hidden-xs">
            <a data-toggle="tab" id="tab{{$tabCount}}" href="#">{{$MOD.LBL_ADVANCED}}</a>
        </li>

         {{counter name="tabCount" print=false}}
        <li role="presentation" class="hidden-xs">
            <a data-toggle="tab" id="tab{{$tabCount}}" href="#">{{$MOD.LBL_EAPM_SUBPANEL_TITLE}}</a>
        </li>

        {{if $SHOW_ROLES == true}}
        {{counter name="tabCount" print=false}}
        <li role="presentation" class="hidden-xs">
            <a data-toggle="tab" id="tab{{$tabCount}}" href="#">{{$MOD.LBL_USER_ACCESS}}</a>
        </li>
        {{/if}}
    </ul>

    <div class="clearfix"></div>
    {{if $useTabs}}
    <div class="tab-content">
        {{else}}
        <div class="tab-content" style="padding: 0; border: 0;">
            {{/if}}
            {* Loop through all top level panels first *}
            {{counter name="tabCount" start=0 print=false assign="tabCount"}}
            {{if $useTabs}}
            {{foreach name=section from=$sectionPanels key=label item=panel}}
            {{capture name=label_upper assign=label_upper}}{{$label|upper}}{{/capture}}
            {{if isset($tabDefs[$label_upper].newTab) && $tabDefs[$label_upper].newTab == true}}
            {{if $tabCount == '0'}}
            <div class="tab-pane-NOBOOTSTRAPTOGGLER active fade in" id='detailpanel_{{$tabCount}}' style="display: block;">
                {{include file='themes/SuiteP/include/EditView/tab_panel_content.tpl'}}
            </div>
            {{else}}
            <div class="tab-pane-NOBOOTSTRAPTOGGLER fade active in" id='detailpanel_{{$tabCount}}' style="display: none;">
                {{include file='themes/SuiteP/include/EditView/tab_panel_content.tpl'}}
            </div>
            {{/if}}
            {{/if}}
            {{counter name="tabCount" print=false}}
            {{/foreach}}
            {{counter name="tabCount" print=false}}
            <div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-{{$tabCount}}' >
                <div id="email_options">
                    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">
                        <tr>
                            <th align="left" scope="row" colspan="4">
                                <h4>{$MOD.LBL_MAIL_OPTIONS_TITLE}</h4>
                            </th>
                        </tr>
                        <tr>
                            <td scope="row" width="17%">
                            {$MOD.LBL_EMAIL}:  {if $REQUIRED_EMAIL_ADDRESS}<span class="required" id="mandatory_email">{$APP.LBL_REQUIRED_SYMBOL}</span> {/if}
                            </td>
                            <td width="83%">
                                {$NEW_EMAIL}
                            </td>
                        </tr>
                        <tr id="email_options_link_type" style='display:{$HIDE_FOR_GROUP_AND_PORTAL}'>
                            <td scope="row" width="17%">
                                {$MOD.LBL_EMAIL_LINK_TYPE}:&nbsp;{sugar_help text=$MOD.LBL_EMAIL_LINK_TYPE_HELP WIDTH=450}
                            </td>
                            <td>
                                <select id="email_link_type" name="email_link_type" tabindex='410'>
                                {$EMAIL_LINK_TYPE}
                                </select>
                            </td>
                        </tr>
                        {if !$HIDE_IF_CAN_USE_DEFAULT_OUTBOUND}
                        <tr id="mail_smtpserver_tr">
                            <td width="20%" scope="row"><span id="mail_smtpserver_label">{$MOD.LBL_EMAIL_PROVIDER}</span></td>
                            <td width="30%" ><slot>{$mail_smtpdisplay}<input id='mail_smtpserver' name='mail_smtpserver' type="hidden" value='{$mail_smtpserver}' /></slot></td>
                            <td>&nbsp;</td>
                            <td >&nbsp;</td>
                        </tr>
                         {if !empty($mail_smtpauth_req) }

                        <tr id="mail_smtpuser_tr">
                            <td width="20%" scope="row" nowrap="nowrap"><span id="mail_smtpuser_label">{$MOD.LBL_MAIL_SMTPUSER}</span></td>
                            <td width="30%" ><slot><input type="text" id="mail_smtpuser" name="mail_smtpuser" size="25" maxlength="64" value="{$mail_smtpuser}" tabindex='1' ></slot></td>
                            <td>&nbsp;</td>
                            <td >&nbsp;</td>
                        </tr>
                        <tr id="mail_smtppass_tr">
                            <td width="20%" scope="row" nowrap="nowrap"><span id="mail_smtppass_label">{$MOD.LBL_MAIL_SMTPPASS}</span></td>
                            <td width="30%" ><slot>
                            <input type="password" id="mail_smtppass" name="mail_smtppass" size="25" maxlength="64" value="{$mail_smtppass}" tabindex='1'>
                            <a href="javascript:void(0)" id='mail_smtppass_link' onClick="SUGAR.util.setEmailPasswordEdit('mail_smtppass')" style="display: none">{$APP.LBL_CHANGE_PASSWORD}</a>
                            </slot></td>
                            <td>&nbsp;</td>
                            <td >&nbsp;</td>
                        </tr>
                        {/if}

                        <tr id="test_outbound_settings_tr">
                            <td width="17%" scope="row"><input type="button" class="button" value="{$APP.LBL_EMAIL_TEST_OUTBOUND_SETTINGS}" onclick="startOutBoundEmailSettingsTest();"></td>
                            <td width="33%" >&nbsp;</td>
                            <td width="17%">&nbsp;</td>
                            <td width="33%" >&nbsp;</td>
                        </tr>
                        {/if}
                    </table>
                </div>
            </div>
            {{counter name="tabCount" print=false}}
            <div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-{{$tabCount}}' >
            {if $CHANGE_PWD == '1'}
                <div id="generate_password">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="edit view">
                        <tr>
                            <td width='40%'>
                                <table width='100%' cellspacing='0' cellpadding='0' border='0' >
                                    <tr>
                                        <th align="left" scope="row" colspan="4">
                                            <h4>{$MOD.LBL_CHANGE_PASSWORD_TITLE}</h4><br>
                                            {$ERROR_PASSWORD}
                                        </th>
                                    </tr>
                                </table>
                                    <!-- hide field if user is admin that is not editing themselves -->
                                    <div id='generate_password_old_password' {if ($IS_ADMIN && !$ADMIN_EDIT_SELF)} style='display:none' {/if}>

                                         <table width='100%' cellspacing='0' cellpadding='0' border='0' >
                                            <tr>
                                                <td width='35%' scope="row">
                                                    {$MOD.LBL_OLD_PASSWORD}
                                                </td>
                                                <td >
                                                    <input name='old_password' id='old_password' type='password' tabindex='2' onkeyup="password_confirmation();" >
                                                </td>
                                                <td width='40%'>
                                                </td>
                                            </tr>
                                         </table>
                                    </div>
                                <table width='100%' cellspacing='0' cellpadding='0' border='0' >
                                    <tr>
                                        <td width='35%' scope="row" snowrap>
                                            {$MOD.LBL_NEW_PASSWORD}
                                            <span class="required" id="mandatory_pwd">{if ($REQUIRED_PASSWORD)}{$APP.LBL_REQUIRED_SYMBOL}{/if}</span>
                                        </td>
                                        <td class='dataField'>

                                            <input name='new_password' id= "new_password" type='password' tabindex='2' onkeyup="password_confirmation();newrules('{$PWDSETTINGS.minpwdlength}','{$PWDSETTINGS.maxpwdlength}','{$REGEX}');" />
                                        </td>
                                        <td width='40%'>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td scope="row" width='35%'>
                                            {$MOD.LBL_CONFIRM_PASSWORD}
                                        </td>
                                        <td class='dataField'>
                                            <input name='confirm_new_password' id='confirm_pwd' style ='' type='password' tabindex='2' onkeyup="password_confirmation();"  >
                                        </td>
                                        <td width='40%'>
                                        <div id="comfirm_pwd_match" class="error" style="display: none;">{$MOD.ERR_PASSWORD_MISMATCH}</div>
                                             {*<span id="ext-gen63" class="x-panel-header-text">
                                                Requirements
                                                <span id="Filter.1_help" onclick="return SUGAR.util.showHelpTips(this,help());">
                                                    <img src="themes/default/images/help.gif"/>
                                                </span>
                                            </span>*}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='dataLabel'></td>
                                        <td class='dataField'></td>
                                    </td>
                                </table>

                                <table width='17%' cellspacing='0' cellpadding='1' border='0'>
                                    <tr>
                                        <td width='50%'>
                                            <input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey='{$APP.LBL_SAVE_BUTTON_KEY}' class='button' id='save_new_pwd_button' LANGUAGE=javascript onclick='if (set_password(this.form)) window.close(); else return false;' type='submit' name='button' style='display:none;' value='{$APP.LBL_SAVE_BUTTON_LABEL}'>
                                        </td>
                                        <td width='50%'>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width='60%' style="vertical-align:middle;">
                            </td>
                        </tr>
                    </table>
                </div>
            {else}
                <div id="generate_password">
                    <input name='old_password' id='old_password' type='hidden'>
                    <input name='new_password' id= "new_password" type='hidden'>
                    <input name='confirm_new_password' id='confirm_pwd' type='hidden'>
                </div>
            {/if}

            </div>
            {if $SHOW_THEMES}
            {{counter name="tabCount" print=false}}
            <div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-{{$tabCount}}' >
                <div id="themepicker" style="display:{$HIDE_FOR_GROUP_AND_PORTAL}">
                    <table class="edit view" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                        <tr>
                            <td scope="row" colspan="4"><h4>{$MOD.LBL_THEME}</h4></td>
                        </tr>
                        <tr>
                            <td width="17%">
                                <select name="user_theme" tabindex='366' size="20" id="user_theme_picker" style="width: 100%">
                                    {$THEMES}
                                </select>
                            </td>
                            <td width="33%">
                                <img id="themePreview" src="{sugar_getimagepath file='themePreview.png'}" border="1" />
                            </td>
                            <td width="17%">&nbsp;</td>
                            <td width="33%">&nbsp;</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            {/if}
             {{counter name="tabCount" print=false}}
            {* advanced users tab *}
            <div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-{{$tabCount}}' >
                <div id="settings" style="display:{$HIDE_FOR_GROUP_AND_PORTAL}">
                    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">

                        <tr>
                            <th width="100%" align="left" scope="row" colspan="4"><h4><slot>{$MOD.LBL_USER_SETTINGS}</slot></h4></th>
                        </tr>
                        <tr>
                            <td scope="row"  valign="top"><slot>{$MOD.LBL_EXPORT_DELIMITER}:</slot>&nbsp;{sugar_help text=$MOD.LBL_EXPORT_DELIMITER_DESC }</td>
                            <td ><slot><input type="text" tabindex='12' name="export_delimiter" value="{$EXPORT_DELIMITER}" size="5"></slot></td>
                            <td scope="row" width="17%">
                                <slot>{$MOD.LBL_RECEIVE_NOTIFICATIONS}:</slot>&nbsp;{sugar_help text=$MOD.LBL_RECEIVE_NOTIFICATIONS_TEXT}
                            </td>
                            <td width="33%">
                                <slot><input name='receive_notifications' class="checkbox" tabindex='12' type="checkbox" value="12" {$RECEIVE_NOTIFICATIONS}></slot>
                            </td>
                        </tr>

                        <tr>
                            <td scope="row" valign="top"><slot>{$MOD.LBL_EXPORT_CHARSET}:</slot>&nbsp;{sugar_help text=$MOD.LBL_EXPORT_CHARSET_DESC }</td>
                            <td ><slot><select tabindex='12' name="default_export_charset">{$EXPORT_CHARSET}</select></slot></td>
                            <td scope="row" valign="top">
                                <slot>{$MOD.LBL_REMINDER}:</slot>&nbsp;{sugar_help text=$MOD.LBL_REMINDER_TEXT }
                            </td>
                            <td valign="top"  nowrap>
                                <!--
                                <slot>{include file="modules/Meetings/tpls/reminders.tpl"}</slot>
								-->
                                <slot>{include file="modules/Reminders/tpls/remindersDefaults.tpl"}</slot>
                            </td>
                        </tr>
                        <tr>
                            <td></td><td></td><td></td>
                            <td>
                                <button type="button" class="btn btn-primary btn-sm" onClick="Alerts.prototype.enable()">
                                    {$MOD.LBL_ENABLE_NOTIFICATIONS}
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td scope="row" valign="top"><slot>{$MOD.LBL_USE_REAL_NAMES}:</slot>&nbsp;{sugar_help text=$MOD.LBL_USE_REAL_NAMES_DESC }</td>
                            <td ><slot><input tabindex='12' type="checkbox" name="use_real_names" {$USE_REAL_NAMES}></slot></td>
                            <td scope="row" valign="top">
                                <slot>{$MOD.LBL_MAILMERGE}:</slot>&nbsp;{sugar_help text=$MOD.LBL_MAILMERGE_TEXT }
                            </td>
                            <td valign="top"  nowrap>
                                <slot><input tabindex='12' name='mailmerge_on' class="checkbox" type="checkbox" {$MAILMERGE_ON}></slot>
                            </td>
                        </tr>
                        <!--{if !empty($EXTERNAL_AUTH_CLASS) && !empty($IS_ADMIN)}-->
                        <tr>
                            {capture name=SMARTY_LBL_EXTERNAL_AUTH_ONLY}&nbsp;{$MOD.LBL_EXTERNAL_AUTH_ONLY} {$EXTERNAL_AUTH_CLASS_1}{/capture}
                            <td scope="row" nowrap><slot>{$EXTERNAL_AUTH_CLASS} {$MOD.LBL_ONLY}:</slot>&nbsp;{sugar_help text=$smarty.capture.SMARTY_LBL_EXTERNAL_AUTH_ONLY}</td>
                            <td ><input type='hidden' value='0' name='external_auth_only'><input type='checkbox' value='1' name='external_auth_only' {$EXTERNAL_AUTH_ONLY_CHECKED}></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <!--{/if}-->
                    </table>
                </div>
                <div id="layout">
                    <table class="edit view" border="0" cellpadding="0" cellspacing="1" width="100%">
                        <tbody>
                        <tr>
                            <th align="left" scope="row" colspan="4"><h4>{$MOD.LBL_LAYOUT_OPTIONS}</h4></th>
                        </tr>
                        <tr id="use_group_tabs_row" style="display: {$DISPLAY_GROUP_TAB};">
                            <td scope="row"><span>{$MOD.LBL_USE_GROUP_TABS}:</span>&nbsp;{sugar_help text=$MOD.LBL_NAVIGATION_PARADIGM_DESCRIPTION }</td>
                            <td colspan="3"><input name="use_group_tabs" type="hidden" value="m"><input id="use_group_tabs" type="checkbox" name="use_group_tabs" {$USE_GROUP_TABS} tabindex='12' value="gm"></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td scope="row" align="left" style="padding-bottom: 2em;">{$TAB_CHOOSER}</td>
                                        <td width="90%" valign="top"><BR>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="17%" scope="row"><span>{$MOD.LBL_SUBPANEL_TABS}:</span>&nbsp;{sugar_help text=$MOD.LBL_SUBPANEL_TABS_DESCRIPTION }</td>
                            <td width="83%" colspan="3"><input type="checkbox" name="user_subpanel_tabs" {$SUBPANEL_TABS} tabindex='13'></td>
                        </tr>
                    </table>
                </div>
                <div id="locale" style="display:{$HIDE_FOR_GROUP_AND_PORTAL}">
                    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">
                        <tr>
                            <th width="100%" align="left" scope="row" colspan="4">
                                <h4><slot>{$MOD.LBL_USER_LOCALE}</slot></h4></th>
                        </tr>
                        <tr>
                            <td width="17%" scope="row"><slot>{$MOD.LBL_DATE_FORMAT}:</slot>&nbsp;{sugar_help text=$MOD.LBL_DATE_FORMAT_TEXT }</td>
                            <td width="33%"><slot><select tabindex='14' name='dateformat'>{$DATEOPTIONS}</select></slot></td>
                            <!-- END: prompttz -->
                            <!-- BEGIN: currency -->
                            <td width="17%" scope="row"><slot>{$MOD.LBL_CURRENCY}:</slot>&nbsp;{sugar_help text=$MOD.LBL_CURRENCY_TEXT }</td>
                            <td ><slot>
                                    <select tabindex='14' id='currency_select' name='currency' onchange='setSymbolValue(this.options[this.selectedIndex].value);setSigDigits();'>{$CURRENCY}</select>
                                    <input type="hidden" id="symbol" value="">
                                </slot></td>
                            <!-- END: currency -->
                        </tr>
                        <tr>
                            <td scope="row"><slot>{$MOD.LBL_TIME_FORMAT}:</slot>&nbsp;{sugar_help text=$MOD.LBL_TIME_FORMAT_TEXT }</td>
                            <td ><slot><select tabindex='14' name='timeformat'>{$TIMEOPTIONS}</select></slot></td>
                            <!-- BEGIN: currency -->
                            <td width="17%" scope="row"><slot>
                                    {$MOD.LBL_CURRENCY_SIG_DIGITS}:
                                </slot></td>
                            <td ><slot>
                                    <select id='sigDigits' onchange='setSigDigits(this.value);' name='default_currency_significant_digits'>{$sigDigits}</select>
                                </slot></td>
                            <!-- END: currency -->
                        </tr>
                        <tr>
                            <td scope="row"><slot>{$MOD.LBL_TIMEZONE}:</slot>&nbsp;{sugar_help text=$MOD.LBL_TIMEZONE_TEXT }</td>
                            <td ><slot><select tabindex='14' name='timezone'>{html_options options=$TIMEZONEOPTIONS selected=$TIMEZONE_CURRENT}</select></slot></td>
                            <!-- BEGIN: currency -->
                            <td width="17%" scope="row"><slot>
                                    <i>{$MOD.LBL_LOCALE_EXAMPLE_NAME_FORMAT}</i>:
                                </slot></td>
                            <td ><slot>
                                    <input type="text" disabled id="sigDigitsExample" name="sigDigitsExample">
                                </slot></td>
                            <!-- END: currency -->
                        </tr>
                        <tr>
                            {if ($IS_ADMIN)}
                                <td scope="row"><slot>{$MOD.LBL_PROMPT_TIMEZONE}:</slot>&nbsp;{sugar_help text=$MOD.LBL_PROMPT_TIMEZONE_TEXT }</td>
                                <td ><slot><input type="checkbox" tabindex='14'class="checkbox" name="ut" value="0" {$PROMPTTZ}></slot></td>
                            {else}
                                <td scope="row"><slot></td>
                                <td ><slot></slot></td>
                            {/if}
                            <td width="17%" scope="row"><slot>{$MOD.LBL_NUMBER_GROUPING_SEP}:</slot>&nbsp;{sugar_help text=$MOD.LBL_NUMBER_GROUPING_SEP_TEXT }</td>
                            <td ><slot>
                                    <input tabindex='14' name='num_grp_sep' id='default_number_grouping_seperator'
                                           type='text' maxlength='1' size='1' value='{$NUM_GRP_SEP}'
                                           onkeydown='setSigDigits();' onkeyup='setSigDigits();'>
                                </slot></td></tr>
                        {capture name=SMARTY_LOCALE_NAME_FORMAT_DESC}&nbsp;{$MOD.LBL_LOCALE_NAME_FORMAT_DESC}{/capture}
                        <tr>
                            <td  scope="row" valign="top">{$MOD.LBL_LOCALE_DEFAULT_NAME_FORMAT}:&nbsp;{sugar_help text=$smarty.capture.SMARTY_LOCALE_NAME_FORMAT_DESC }</td>
                            <td  valign="top"><slot><select tabindex='14' id="default_locale_name_format" name="default_locale_name_format" selected="{$default_locale_name_format}">{$NAMEOPTIONS}</select></slot></td>
                            <td width="17%" scope="row"><slot>{$MOD.LBL_DECIMAL_SEP}:</slot>&nbsp;{sugar_help text=$MOD.LBL_DECIMAL_SEP_TEXT }</td>
                            <td ><slot>
                                    <input tabindex='14' name='dec_sep' id='default_decimal_seperator'
                                           type='text' maxlength='1' size='1' value='{$DEC_SEP}'
                                           onkeydown='setSigDigits();' onkeyup='setSigDigits();'>
                                </slot></td>
                        </tr>
                    </table>
                </div>
                <div id="calendar_options" style="display:{$HIDE_FOR_GROUP_AND_PORTAL}">
                    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">
                        <tr>
                            <th align="left" scope="row" colspan="4"><h4>{$MOD.LBL_CALENDAR_OPTIONS}</h4></th>
                        </tr>
                        <tr>
                            <td width="17%" scope="row"><slot>{$MOD.LBL_PUBLISH_KEY}:</slot>&nbsp;{sugar_help text=$MOD.LBL_CHOOSE_A_KEY}</td>
                            <td width="20%" ><slot><input id='calendar_publish_key' name='calendar_publish_key' tabindex='17' size='25' maxlength='36' type="text" value="{$CALENDAR_PUBLISH_KEY}"></slot></td>
                            <td width="63%" ><slot>&nbsp;</slot></td>
                        </tr>
                        <tr>
                            <td width="15%" scope="row"><slot><nobr>{$MOD.LBL_YOUR_PUBLISH_URL|strip_semicolon}:</nobr></slot></td>
                            <td colspan=2><span class="calendar_publish_ok">{$CALENDAR_PUBLISH_URL}</span><span class="calendar_publish_none" style="display: none">{$MOD.LBL_NO_KEY}</span></td>
                        </tr>
                        <tr>
                            <td width="17%" scope="row"><slot>{$MOD.LBL_SEARCH_URL|strip_semicolon}:</slot></td>
                            <td colspan=2><span class="calendar_publish_ok">{$CALENDAR_SEARCH_URL}</span><span class="calendar_publish_none" style="display: none">{$MOD.LBL_NO_KEY}</span></td>
                        </tr>
                        <tr>
                            <td width="15%" scope="row"><slot>{$MOD.LBL_ICAL_PUB_URL|strip_semicolon}: {sugar_help text=$MOD.LBL_ICAL_PUB_URL_HELP}</slot></td>
                            <td colspan=2><span class="calendar_publish_ok">{$CALENDAR_ICAL_URL}</span><span class="calendar_publish_none" style="display: none">{$MOD.LBL_NO_KEY}</span></td>
                        </tr>
                        <tr>
                            <td width="17%" scope="row"><slot>{$MOD.LBL_FDOW}:</slot>&nbsp;{sugar_help text=$MOD.LBL_FDOW_TEXT}</td>
                            <td ><slot>
                                    <select tabindex='14' name='fdow'>{html_options options=$FDOWOPTIONS selected=$FDOWCURRENT}</select>
                                </slot></td>
                        </tr>
                    </table>
                </div>
            </div>
            {{counter name="tabCount" print=false}}
            <div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-{{$tabCount}}' >
                <div style="text-align:center; width: 100%">{sugar_image name="loading"}</div>
            </div>
            {{if $SHOW_ROLES == true}}
            {{counter name="tabCount" print=false}}
            {* access users tab (ACL ROLE matrix) *}
            <div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-{{$tabCount}}'>
                <div class="row detail-view-row">
                    {{$ROLE_HTML}}
                </div>
            </div>
            {{/if}}
            {{else}}
            <div class="tab-pane panel-collapse"></div>
            {{/if}}
        </div>
        {*display panels*}
        <div class="panel-content">
            <div>&nbsp;</div>
            {{counter name="panelCount" start=-1 print=false assign="panelCount"}}
            {{foreach name=section from=$sectionPanels key=label item=panel}}
            {{capture name=label_upper assign=label_upper}}{{$label|upper}}{{/capture}}
            {* if tab *}
            {{if (isset($tabDefs[$label_upper].newTab) && $tabDefs[$label_upper].newTab == true && $useTabs)}}
            {*if tab skip*}
            {{else}}
            {* if panel display*}
            {*if panel collasped*}
            {{if (isset($tabDefs[$label_upper].panelDefault) && $tabDefs[$label_upper].panelDefault == "collapsed") }}
            {*collapse panel*}
            {{assign var='collapse' value="panel-collapse collapse"}}
            {{assign var='collapsed' value="collapsed"}}
            {{assign var='collapseIcon' value="glyphicon glyphicon-plus"}}
            {{assign var='panelHeadingCollapse' value="panel-heading-collapse"}}
            {{else}}
            {*expand panel*}
            {{assign var='collapse' value="panel-collapse collapse in"}}
            {{assign var='collapseIcon' value="glyphicon glyphicon-minus"}}
            {{assign var='panelHeadingCollapse' value=""}}
            {{/if}}

            <div class="panel panel-default">
                <div class="panel-heading {{$panelHeadingCollapse}}">
                    <a class="{{$collapsed}}" role="button" data-toggle="collapse" aria-expanded="false">
                        <div class="col-xs-10 col-sm-11 col-md-11">
                            {sugar_translate label='{{$label}}' module='{{$module}}'}
                        </div>
                    </a>

                </div>
                <div class="panel-body {{$collapse}}" id="detailpanel_{{$panelCount}}">
                    <div class="tab-content">
                        {{include file='themes/SuiteP/include/EditView/tab_panel_content.tpl'}}
                    </div>
                </div>
            </div>

            {{/if}}
            {{counter name="panelCount" print=false}}
            {{/foreach}}
        </div>
        </div>
{{sugar_include type='smarty' file=$footerTpl}}


{{if $useTabs}}
{sugar_getscript file="cache/include/javascript/sugar_grp_yui_widgets.js"}
<script type="text/javascript">
var {{$form_name}}_tabs = new YAHOO.widget.TabView("{{$form_name}}_tabs");
{{$form_name}}_tabs.selectTab(0);
</script>
{{/if}}
<script type="text/javascript">
YAHOO.util.Event.onContentReady("{{$form_name}}",
    function () {ldelim} initEditView(document.forms.{{$form_name}}) {rdelim});
//window.setTimeout(, 100);
{{if $module == "Users"}}
window.onbeforeunload = function () {ldelim} return disableOnUnloadEditView(); {rdelim};
{{else}}
window.onbeforeunload = function () {ldelim} return onUnloadEditView(); {rdelim};
{{/if}}
// bug 55468 -- IE is too aggressive with onUnload event
if ($.browser.msie) {ldelim}
$(document).ready(function() {ldelim}
    $(".collapseLink,.expandLink").click(function (e) {ldelim} e.preventDefault(); {rdelim});
  {rdelim});
{rdelim}
</script>

{literal}

    <script type="text/javascript">

    var selectTab = function(tab) {
        $('#EditView_tabs div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').hide();
        $('#EditView_tabs div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').eq(tab).show().addClass('active').addClass('in');
    };

    var selectTabOnError = function(tab) {
        selectTab(tab);
        $('#EditView_tabs ul.nav.nav-tabs li').removeClass('active');
        $('#EditView_tabs ul.nav.nav-tabs li a').css('color', '');

        $('#EditView_tabs ul.nav.nav-tabs li').eq(tab).find('a').first().css('color', 'red');
        $('#EditView_tabs ul.nav.nav-tabs li').eq(tab).addClass('active');

    };

    var selectTabOnErrorInputHandle = function(inputHandle) {
        var tab = $(inputHandle).closest('.tab-pane-NOBOOTSTRAPTOGGLER').attr('id').match(/^detailpanel_(.*)$/)[1];
        selectTabOnError(tab);
    };


    $(function(){
        $('#EditView_tabs ul.nav.nav-tabs li').click(function(e){
            if(typeof $(this).find('a').first().attr('id') != 'undefined') {
                var tab = parseInt($(this).find('a').first().attr('id').match(/^tab(.)*$/)[1]);
                selectTab(tab);
            }
        });

        $('a[data-toggle="collapse"]').click(function(e){
            var content;
            if($(this).hasClass('collapsed')) {
                $(this).removeClass('collapsed');
                if($(this).closest('.panel-content').length) {
                    content = $(this).closest('.panel-content').find('.panel-body.panel-collapse.collapse');
                }
                else if($(this).closest('.panel.panel-default').length){
                    content = $(this).closest('.panel.panel-default').next();
                }
                content.addClass('in');
            } else {
                $(this).addClass('collapsed');
                if($(this).closest('.panel-content').length) {
                    content = $(this).closest('.panel-content').find('.panel-body.panel-collapse.collapse');
                }
                else if($(this).closest('.panel.panel-default').length){
                    content = $(this).closest('.panel.panel-default').next();
                }
                content.removeClass('in');
            }
        });
    });

    </script>

{/literal}


    <script type="text/javascript">

        var mail_smtpport = '{$MAIL_SMTPPORT}';
        var mail_smtpssl = '{$MAIL_SMTPSSL}';
        {literal}
        EmailMan = {};

        function Admin_check(){
            if (('{/literal}{$IS_FOCUS_ADMIN}{literal}') && document.getElementById('is_admin').value=='0'){
                r=confirm('{/literal}{$MOD.LBL_CONFIRM_REGULAR_USER}{literal}');
                return r;
            }
            else
                return true;
        }


        $(document).ready(function() {
            var checkKey = function(key) {
                if(key != '') {
                    $(".calendar_publish_ok").css('display', 'inline');
                    $(".calendar_publish_none").css('display', 'none');
                    $('#cal_pub_key_span').html( key );
                    $('#ical_pub_key_span').html( key );
                    $('#search_pub_key_span').html( key );
                } else {
                    $(".calendar_publish_ok").css('display', 'none');
                    $(".calendar_publish_none").css('display', 'inline');
                }
            };
            $('#calendar_publish_key').keyup(function(){
                checkKey($(this).val());
            });
            $('#calendar_publish_key').change(function(){
                checkKey($(this).val());
            });
            checkKey($('#calendar_publish_key').val());
        });
        {/literal}
    </script>
    {$JAVASCRIPT}

</form>
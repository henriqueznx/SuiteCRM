{*

/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.

 * SuiteCRM is an extension to SugarCRM Community Edition developed by Salesagility Ltd.
 * Copyright (C) 2011 - 2014 Salesagility Ltd.
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
 ********************************************************************************/




*}
<script src="http://rubaxa.github.io/Sortable/Sortable.js"></script>
<script type="text/javascript" src="include/javascript/bootstrap-multiselect-master/dist/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="include/javascript/bootstrap-multiselect-master/dist/css/bootstrap-multiselect.css" type="text/css"/>



{literal}
    <div id="selectColumnsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Choose columns</h4>
                </div>
                <div class="modal-body">
                    <div class="tableHolder">
                        <div>Displayed</div>
                        <ul id="simpleList" class="list-group displayedColumns">
                            <li class="list-group-item">Name</li>
                            <li class="list-group-item">Title</li>
                            <li class="list-group-item">Account Name</li>
                            <li class="list-group-item">Email</li>
                            <li class="list-group-item">Office Phone</li>
                            <li class="list-group-item">User</li>
                            <li class="list-group-item">Date Created</li>
                        </ul>
                    </div>

                    <div class="tableHolder">
                        <div>Hidden</div>
                        <ul id="simpleList2" class="list-group hiddenColumns">
                            <li class="list-group-item">Other Phone</li>
                            <li class="list-group-item">Fax</li>
                            <li class="list-group-item">Email</li>
                            <li class="list-group-item">Created By</li>
                            <li class="list-group-item">Modified By</li>
                            <li class="list-group-item">Do Not Call</li>
                            <li class="list-group-item">Emergency Contact</li>
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

	<div id="filterModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">Filter</h4>
				</div>
				<div class="modal-body">
                    <div>
                        <label class="filterLabel" for="firstName">First Name</label>
                        <input type="text" placeholder="First Name" id="firstName">
                    </div>
                    <div>
                        <label class="filterLabel" for="lastName">Last Name</label>
                        <input type="text" placeholder="Last Name" id="lastName">
                    </div>
                    <div>
                        <label class="filterLabel" for="accountName">Account Name</label>
                        <input type="text" placeholder="Account Name" id="accountName">
                    </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary applyFilter">Filter</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

    <div id="filterAdvancedModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Advanced Filter</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <label class="filterLabel" for="firstName">First Name</label>
                        <input type="text" placeholder="First Name" id="firstName">
                    </div>
                    <div>
                        <label class="filterLabel" for="lastName">Last Name</label>
                        <input type="text" placeholder="Last Name" id="lastName">
                    </div>
                    <div>
                        <label class="filterLabel" for="accountName">Account Name</label>
                        <input type="text" placeholder="Account Name" id="accountName">
                    </div>
                    <div>
                        <label class="filterLabel" for="assistant">Assistant</label>
                        <input type="text" placeholder="Assistant" id="assistant">
                    </div>
                    <div>
                        <label class="filterLabel" for="leadSource">Lead Source</label>
                        <select id="leadSource" class="multi" multiple="multiple">
                            <option value="Cold Call" label="Cold Call">Cold Call</option>
                            <option value="Existing Customer" label="Existing Customer">Existing Customer</option>
                            <option value="Self Generated" label="Self Generated">Self Generated</option>
                            <option value="Employee" label="Employee">Employee</option>
                            <option value="Partner" label="Partner">Partner</option>
                            <option value="Web Site" label="Web Site">Web Site</option>
                            <option value="Scottish Enterprise" label="Scottish Enterprise">Scottish Enterprise</option>
                            <option value="Word of mouth" label="Word of mouth">Word of mouth</option>
                            <option value="Email" label="Email">Email</option>
                            <option value="TradeShow" label="Trade Show">Trade Show</option>
                            <option value="Campaign" label="Campaign">Campaign</option>
                            <option value="Other" label="Other">Other</option>
                            <option value="AOS" label="AOS">AOS</option>
                        </select>
                    </div>
                    <div>
                        <label class="filterLabel" for="address">Any Address</label>
                        <input type="text" placeholder="Any Address" id="address">
                    </div>
                    <div>
                        <label class="filterLabel" for="city">City</label>
                        <input type="text" placeholder="City" id="city">
                    </div>
                    <div>
                        <label class="filterLabel" for="state">State</label>
                        <input type="text" placeholder="State" id="state">
                    </div>
                    <div>
                        <label class="filterLabel" for="postcode">Postal Code</label>
                        <input type="text" placeholder="Postal Code" id="postcode">
                    </div>
                    <div>
                        <label class="filterLabel" for="assignedTo">Assigned To</label>
                        <select id="assignedTo" class="multi" multiple="multiple">
                            <option value="1" label="Administrator">Administrator</option>
                            <option value="61439870-4b64-afa0-4f39-5458d3c9fbc5" label="Amelia Campbell">Amelia Campbell</option>
                            <option value="e490871c-958c-3b9f-f3af-5121f4316a2e" label="Andrew Mclauglan">Andrew Mclauglan</option>
                            <option value="28c8d0c1-a300-81df-c90d-564061ed4d8b" label="Ashley Nicolson">Ashley Nicolson</option>
                            <option value="39ea6766-2c4d-cc5d-12fc-56efd526e04a" label="Brian McLaughlin">Brian McLaughlin</option>
                            <option value="e01f075b-b536-cf66-363c-4fa3d5c08d38" label="Celia McMillan">Celia McMillan</option>
                            <option value="eb31313d-f19b-275e-c61b-4f3e7a66196a" label="Dale Murray">Dale Murray</option>
                            <option value="23138d89-2c26-9620-3654-5524ea989d95" label="Daniel Samson">Daniel Samson</option>
                            <option value="d378961f-6b87-f556-2d4c-5583f47d450a" label="Darren Tang">Darren Tang</option>
                            <option value="1ee818c4-04df-460a-b393-5631fdf81d49" label="Eleanor Logan">Eleanor Logan</option>
                            <option value="731041f3-47e1-a518-eb89-55c888e1f24f" label="Ewan McRobert">Ewan McRobert</option>
                            <option value="a535ed30-5c2e-a51e-d8c7-565ecd444163" label="Graeme McLaren">Graeme McLaren</option>
                            <option value="46dd85cd-bd35-eab4-36af-4451d67a1431" label="Greg Soper">Greg Soper</option>
                            <option value="884f30a0-9316-c0eb-b29d-55ded306d001" label="Gyula Madarasz">Gyula Madarasz</option>
                            <option value="208fac79-1e29-cbf4-87d5-52c9dbf9a976" label="Ian Davie">Ian Davie</option>
                            <option value="f0fc3421-ed3b-98ff-4593-5188b63ce486" label="Jim Mackin">Jim Mackin</option>
                            <option value="ed7a9b66-d0f2-ef62-eaa6-55b5e8248fef" label="John Moran">John Moran</option>
                            <option value="2cd5b1e0-11e8-003c-8798-5742cbfcf973" label="Kevin Sharpe">Kevin Sharpe</option>
                            <option value="10c20c3d-b750-3dc5-0f63-573acc6f2e7e" label="Lajos Birnstein">Lajos Birnstein</option>
                            <option value="52b6812f-e6ea-801e-fc25-52c9dc6c352c" label="Lewis Jessett">Lewis Jessett</option>
                            <option value="3b41773c-c77d-bfac-95f0-4d822a57b719" label="Matthew Lorimer">Matthew Lorimer</option>
                            <option value="976856eb-5615-1148-480c-5638926d3324" label="Meeting Room 1">Meeting Room 1</option>
                            <option value="f0c93fb5-b757-7b37-d932-561762cd8c38" label="Meeting Room 2">Meeting Room 2</option>
                            <option value="3db11e08-24f5-e5cd-b251-56d5b6c4cf9d" label="Michael Crews">Michael Crews</option>
                            <option value="cfa11a73-dd30-0d14-18b2-56389df991a1" label="Paul Godley">Paul Godley</option>
                            <option value="90e1153e-0a04-d3a6-2411-56efe54bbbdb" label="Sathish Sengodan">Sathish Sengodan</option>
                            <option value="df7fcc36-14f1-8214-8aa8-55ded5f7ef38" label="Uladzimir Barysiuk">Uladzimir Barysiuk</option>
                            <option value="51ad57a4-da7f-4872-228c-522461fb3a10" label="Will Rennie">Will Rennie</option>
                            <option value="78e6652d-fc97-82c3-c572-573acd670e07" label="Zoltan Kocsardi">Zoltan Kocsardi</option>
                        </select>
                    </div>
                    <div>
                        <label class="filterLabel" for="anyPhone">Any Phone</label>
                        <input type="text" placeholder="Any Phone" id="anyPhone">
                    </div>
                    <div>
                        <label class="filterLabel" for="anyEmail">Any Email</label>
                        <input type="text" placeholder="Any Email" id="anyEmail">
                    </div>
                    <div>
                        <label class="filterLabel" for="title">Title</label>
                        <input type="text" placeholder="Title" id="title">
                    </div>
                    <div>
                        <label class="filterLabel" for="country">Country</label>
                        <input type="text" placeholder="Country" id="country">
                    </div>
                    <div>
                        <label class="filterLabel" for="championStatus">Champion Status</label>
                        <select id="champtionStatus" class="multi" multiple="multiple">
                            <option value="Champion" label="Champion">Champion</option>
                            <option value="Primary_Champ" label="Primary Champion">Primary Champion</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary applyFilter">Filter</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

	<script src="include/javascript/jQuery-Autocomplete/dist/jquery.autocomplete.min.js"></script><!--https://github.com/devbridge/jQuery-Autocomplete-->

	<style>

		input.inputFilter{
			background-color:orange;
		}
		.autocomplete-suggestions { border: 1px solid #999; background: #FFF; overflow: auto; }
		.autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
		.autocomplete-selected { background: #F0F0F0; }
		.autocomplete-suggestions strong { font-weight: normal; color: #3399FF; }
		.autocomplete-group { padding: 2px 5px; }
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000; }

		input.relate {
			font-size: 12px;
		}

        .list-group{
            min-height:50px;
            border:1px solid #DCC5C5;;
        }

        .displayedColumns > li {
            background-color: #A8D8A2;
        }
        .hiddenColumns > li {
            background-color: #FFB2B2;
        }
        .filterButtonIcon
        {
            margin-right:10px;
        }

        label.filterLabel {
            display: inline-block;
            min-width: 110px;
            margin-top: 10px;
        }

        .popoverLabel
        {
            font-weight:bold;
            margin-right:10px;
        }
        /*.tableHolder {
            display: inline-block;
        }*/
	</style>


<script src="https://use.fontawesome.com/205c1fda24.js"></script>

<!-- https://github.com/RubaXa/Sortable -->
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"/>-->



<script>

	$(document).ready(function(){
        $('#search_form').hide();
        $('[data-toggle="popover"]').popover({trigger:'hover', html:true});

        $(document).ready(function() {
            $('.multi').multiselect({enableCaseInsensitiveFiltering: true, numberDisplayed:0});
        });

        $('.moduleTitle').hide();

        $('#selectColumnsModal').modal({show:false});
        Sortable.create(simpleList, { group:'test', draggable:'.list-group-item'});
        Sortable.create(simpleList2, { group:'test', draggable:'.list-group-item' });

        $('#clearFilter').on('click',function(){
           $('.activeFilter').css('visibility','hidden');
        });
        $('.applyFilter').on('click',function(){
            $('.activeFilter').css('visibility','visible');
        });

        $('#selectColumns').on('click',function(){
            $('#selectColumnsModal').modal('show');
        });

        $('#quickFilter').on('click',function(){
            $('#filterModal').modal('show');
        });

        $('#advancedFilter').on('click',function(){
            $('#filterAdvancedModal').modal('show');
        });

	    $("ul.clickMenu").each(function(index, node){
	  		$(node).sugarActionMenu();
	  	});

        $('.selectActionsDisabled').children().each(function(index) {
            $(this).attr('onclick','').unbind('click');
        });

        var selectedTopValue = $("#selectCountTop").attr("value");
        if(typeof(selectedTopValue) != "undefined" && selectedTopValue != "0"){
        	sugarListView.prototype.toggleSelected();
        }
/*
		$('.relate').autocomplete({
			serviceUrl: '/filter/testSearch.php',
			//groupBy:'category',
			params:{
				module:module,
			},
			minChars:2,
			onSelect: function (suggestion) {
				// alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
			}
		});
*/

		$('.relate').each(function(i,v){
			var field = $(this).next().val();
			var table = $(this).next().next().val();
			$(this).autocomplete({
				serviceUrl: '/filter/testSearch.php',
				params:{
					//module:module,
					field:field,
					table:table
				},
				minChars:2,
				onSelect: function (suggestion) {
					//console.log($(this));
					$(this).change();
					$(this).addClass('inputFilter');
				}
			});
		});

		$('.relate').on('change',function(){
			//console.log('change');
			var index = $(this).index('.relate');
			//console.log(index);
			//console.log($(this).val());
			if($(this).val().length > 0)
			{
				//$('.warning:eq('+index+')').show();
				$(this).addClass('inputFilter');
			}
			else
			{
				//$('.warning').hide();
				$(this).removeClass('inputFilter');
			}



		});

		$('.clearFilters').on('click',function(){
			$('.relate').val('');
			$('.warning').hide();
			$('input.inputFilter').removeClass('inputFilter');
		});



	});
{/literal}
</script>
{assign var="currentModule" value = $pageData.bean.moduleDir}
{assign var="singularModule" value = $moduleListSingular.$currentModule}
{assign var="moduleName" value = $moduleList.$currentModule}
{assign var="hideTable" value=false}


{if count($data) == 0}
	{assign var="hideTable" value=true}
	<div class="list view listViewEmpty">
		{if $displayEmptyDataMesssages}
        {if strlen($query) == 0}
                {capture assign="createLink"}<a href="?module={$pageData.bean.moduleDir}&action=EditView&return_module={$pageData.bean.moduleDir}&return_action=DetailView">{$APP.LBL_CREATE_BUTTON_LABEL}</a>{/capture}
                {capture assign="importLink"}<a href="?module=Import&action=Step1&import_module={$pageData.bean.moduleDir}&return_module={$pageData.bean.moduleDir}&return_action=index">{$APP.LBL_IMPORT}</a>{/capture}
                {capture assign="helpLink"}<a target="_blank" href='?module=Administration&action=SupportPortal&view=documentation&version={$sugar_info.sugar_version}&edition={$sugar_info.sugar_flavor}&lang=&help_module={$currentModule}&help_action=&key='>{$APP.LBL_CLICK_HERE}</a>{/capture}
                <p class="msg">
                    {$APP.MSG_EMPTY_LIST_VIEW_NO_RESULTS|replace:"<item2>":$createLink|replace:"<item3>":$importLink}
                </p>
        {elseif $query == "-advanced_search"}
            <p class="msg">
                {$APP.MSG_LIST_VIEW_NO_RESULTS_BASIC}
            </p>
        {else}
            <p class="msg">
                {capture assign="quotedQuery"}"{$query}"{/capture}
                {$APP.MSG_LIST_VIEW_NO_RESULTS|replace:"<item1>":$quotedQuery}
            </p>
            <p class = "submsg">
                <a href="?module={$pageData.bean.moduleDir}&action=EditView&return_module={$pageData.bean.moduleDir}&return_action=DetailView">
                    {$APP.MSG_LIST_VIEW_NO_RESULTS_SUBMSG|replace:"<item1>":$quotedQuery|replace:"<item2>":$singularModule}
                </a>

            </p>
        {/if}
    {else}
        <p class="msg">
            {$APP.LBL_NO_DATA}
        </p>
	{/if}
	</div>
{/if}
{$multiSelectData}
<div>
    <div class="btn-group">
        <button type="button" class="btn btn-default dropdown-toggle button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="glyphicon glyphicon-check" aria-hidden="true"></i><span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="#">Select All (20)</a></li>
            <li><a href="#">Select This Page (10)</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" id="loadFilter">Deselect All</a></li>
        </ul>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-default dropdown-toggle button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Bulk Action </i><span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="#">Email</a></li>
            <li><a href="#">Mass Update</a></li>
            <li><a href="#">Mail Merge</a></li>
            <li><a href="#">Add To Target List</a></li>
            <li><a href="#">Generate Letter</a></li>
            <li><a href="#">Export</a></li>
            <li><a href="#">Map</a></li>
        </ul>
    </div>
    <button class="btn btn-default button" type="button"><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> Create Contact</button>
    <button class="btn btn-default button" id="selectColumns" type="button"><i class="glyphicon glyphicon-th-list" aria-hidden="true"></i></button>
    <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="glyphicon glyphicon-filter" aria-hidden="true"></i><span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#" id='quickFilter'>Quick Filter</a></li>
                <li><a href="#" id="advancedFilter">Advanced Filter</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#" id="loadFilter">Load Filter</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#" id="clearFilter">Clear Filters</a></li>
            </ul>
    </div>
    <span class="label label-warning activeFilter" style="visibility:hidden" data-toggle="popover" title="3 Filtered Fields" data-content="<div><span class='popoverLabel'>Name:</span>Paul</div><div><span class='popoverLabel'>Last Name:</span>Godley</div><div><span class='popoverLabel'>Account Name:</span>Complete</div>">Filter Applied</span>

    <nav class="navbar-right">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>

{if $hideTable == false}
	<table cellpadding='0' cellspacing='0' width='100%' border='0' class='list view table'>
	<thead>
	{assign var="link_select_id" value="selectLinkTop"}
    {assign var="link_action_id" value="actionLinkTop"}
    {assign var="actionsLink" value=$actionsLinkTop}
    {assign var="selectLink" value=$selectLinkTop}
    {assign var="action_menu_location" value="top"}

	<!-- Start of filter prototype -->
	<tr height='20'>
		<!-- the first two td overlap the check box / edit icon-->
		<!--<td><button class="button clearFilters" type="button"><i class="fa fa-ban" aria-hidden="true"></i></button></td>-->
		<!--<td><button class="button"><i class="fa fa-filter" aria-hidden="true"></i></button></td>-->

        {*
		{foreach from=$displayColumns key=colHeader item=params}
			<!--<td><input class="inputFilter" type="text" /></td>-->
			<td><input class='relate' type='text' name="'+item+'"><input class="lookupType" type="hidden" value="{$colHeader}"></td>
		{/foreach}
        *}
	</tr>

	<!-- End of filter prototype -->
	<tr height='20'>
			{if $prerow}
				<td width='1%' class="td_alt">
					&nbsp;
				</td>
			{/if}
			{if !empty($quickViewLinks)}
			<td class='td_alt' width='1%' style="padding: 0px;">&nbsp;</td>
			{/if}
			{counter start=0 name="colCounter" print=false assign="colCounter"}
            {assign var='datahide' value="phone"}
			{foreach from=$displayColumns key=colHeader item=params}
                {if $colCounter == '3'}{assign var='datahide' value="phone,phonelandscape"}{/if}
                {if $colCounter == '5'}{assign var='datahide' value="phone,phonelandscape,tablet"}{/if}
                {if $colHeader == 'NAME' || $params.bold}<th scope='col' data-toggle="true">
				{else}<th scope='col' data-hide="{$datahide}">{/if}
					<div style='white-space: normal;'width='100%' align='{$params.align|default:'left'}'><span class="warning badge" style="display:none;"><i class="fa fa-filter" aria-hidden="true"></i></span>
	                {if $params.sortable|default:true}
	                    {if $params.url_sort}
	                        <a href='{$pageData.urls.orderBy}{$params.orderBy|default:$colHeader|lower}' class='listViewThLinkS1'>
	                    {else}
	                        {if $params.orderBy|default:$colHeader|lower == $pageData.ordering.orderBy}
	                            <a href='javascript:sListView.order_checks("{$pageData.ordering.sortOrder|default:ASCerror}", "{$params.orderBy|default:$colHeader|lower}" , "{$pageData.bean.moduleDir}{"2_"}{$pageData.bean.objectName|upper}{"_ORDER_BY"}")' class='listViewThLinkS1'>
	                        {else}
	                            <a href='javascript:sListView.order_checks("ASC", "{$params.orderBy|default:$colHeader|lower}" , "{$pageData.bean.moduleDir}{"2_"}{$pageData.bean.objectName|upper}{"_ORDER_BY"}")' class='listViewThLinkS1'>
	                        {/if}
	                    {/if}
	                    {sugar_translate label=$params.label module=$pageData.bean.moduleDir}
						&nbsp;&nbsp;
						{if $params.orderBy|default:$colHeader|lower == $pageData.ordering.orderBy}
							{if $pageData.ordering.sortOrder == 'ASC'}
								{capture assign="imageName"}arrow_down.{$arrowExt}{/capture}
	                            {capture assign="alt_sort"}{sugar_translate label='LBL_ALT_SORT_DESC'}{/capture}
								{sugar_getimage name=$imageName attr='align="absmiddle" border="0" ' alt="$alt_sort"}
							{else}
								{capture assign="imageName"}arrow_up.{$arrowExt}{/capture}
	                            {capture assign="alt_sort"}{sugar_translate label='LBL_ALT_SORT_ASC'}{/capture}
								{sugar_getimage name=$imageName attr='align="absmiddle" border="0" ' alt="$alt_sort"}
							{/if}
						{else}
							{capture assign="imageName"}arrow.{$arrowExt}{/capture}
	                        {capture assign="alt_sort"}{sugar_translate label='LBL_ALT_SORT'}{/capture}
							{sugar_getimage name=$imageName attr='align="absmiddle" border="0" ' alt="$alt_sort"}
						{/if}
	                    </a>
					{else}
	                    {if !isset($params.noHeader) || $params.noHeader == false}
						  {sugar_translate label=$params.label module=$pageData.bean.moduleDir}
	                    {/if}
					{/if}
					</div>
				</th>
				{counter name="colCounter"}
			{/foreach}

		</tr>
	</thead>
		{counter start=$pageData.offsets.current print=false assign="offset" name="offset"}
		{foreach name=rowIteration from=$data key=id item=rowData}
		    {counter name="offset" print=false}
	        {assign var='scope_row' value=true}

			{if $smarty.foreach.rowIteration.iteration is odd}
				{assign var='_rowColor' value=$rowColor[0]}
			{else}
				{assign var='_rowColor' value=$rowColor[1]}
			{/if}
			<tr height='20' class='{$_rowColor}S1'>
				{if $prerow}
				<td width='1%' class='nowrap'>
				 {if !$is_admin && is_admin_for_user && $rowData.IS_ADMIN==1}
						<input type='checkbox' disabled="disabled" class='checkbox' value='{$rowData.ID}'>
				 {else}
	                    <input title="{sugar_translate label='LBL_SELECT_THIS_ROW_TITLE'}" onclick='sListView.check_item(this, document.MassUpdate)' type='checkbox' class='checkbox' name='mass[]' value='{$rowData.ID}'>
				 {/if}
				</td>
				{/if}
				{if !empty($quickViewLinks)}
	            {capture assign=linkModule}{if $params.dynamic_module}{$rowData[$params.dynamic_module]}{else}{$pageData.bean.moduleDir}{/if}{/capture}
	            {capture assign=action}{if $act}{$act}{else}EditView{/if}{/capture}
				<td width='2%' nowrap>
                    {if $pageData.rowAccess[$id].edit}
                        <a title='{$editLinkString}' id="edit-{$rowData.ID}"
                           href="index.php?module={$linkModule}&offset={$offset}&stamp={$pageData.stamp}&return_module={$linkModule}&action={$action}&record={$rowData.ID}"
                                >
                            {capture name='tmp1' assign='alt_edit'}{sugar_translate label="LNK_EDIT"}{/capture}
                            {sugar_getimage name="edit_inline.gif" attr='border="0" ' alt="$alt_edit"}</a>
                    {/if}
	            </td>

				{/if}
				{counter start=0 name="colCounter" print=false assign="colCounter"}
				{foreach from=$displayColumns key=col item=params}
                    {$displayColumns[type]}
				    {strip}
					<td {if $scope_row} scope='row' {/if} align='{$params.align|default:'left'}' valign="top" type="{$displayColumns.$col.type}" field="{$col|lower}" class="{if $inline_edit && ($displayColumns.$col.inline_edit == 1 || !isset($displayColumns.$col.inline_edit))}inlineEdit{/if}{if ($params.type == 'teamset')}nowrap{/if}{if preg_match('/PHONE/', $col)} phone{/if}">
						{if $col == 'NAME' || $params.bold}<b>{/if}
					    {if $params.link && !$params.customCode}
	{capture assign=linkModule}{if $params.dynamic_module}{$rowData[$params.dynamic_module]}{else}{$params.module|default:$pageData.bean.moduleDir}{/if}{/capture}
	{capture assign=action}{if $act}{$act}{else}DetailView{/if}{/capture}
	{capture assign=record}{$rowData[$params.id]|default:$rowData.ID}{/capture}
	{capture assign=url}index.php?module={$linkModule}&offset={$offset}&stamp={$pageData.stamp}&return_module={$linkModule}&action={$action}&record={$record}{/capture}
	                        <{$pageData.tag.$id[$params.ACLTag]|default:$pageData.tag.$id.MAIN} href="{sugar_ajax_url url=$url}">
						{/if}

						{if $params.customCode}
							{sugar_evalcolumn_old var=$params.customCode rowData=$rowData}
						{else}
	                       {sugar_field parentFieldArray=$rowData vardef=$params displayType=ListView field=$col}

						{/if}
						{if empty($rowData.$col) && empty($params.customCode)}&nbsp;{/if}
						{if $params.link && !$params.customCode}
							</{$pageData.tag.$id[$params.ACLTag]|default:$pageData.tag.$id.MAIN}>
	                    {/if}
                        {if $inline_edit && ($displayColumns.$col.inline_edit == 1 || !isset($displayColumns.$col.inline_edit))}<div class="inlineEditIcon">{sugar_getimage name="inline_edit_icon.svg" attr='border="0" ' alt="$alt_edit"}</div>{/if}
					</td>
					{/strip}
	                {assign var='scope_row' value=false}
					{counter name="colCounter"}

				{/foreach}
				<td align='right'>{$pageData.additionalDetails.$id}</td>
		    	</tr>
		{foreachelse}
		<tr height='20' class='{$rowColor[0]}S1'>
		    <td colspan="{$colCount}">
		        <em>{$APP.LBL_NO_DATA}</em>
		    </td>
		</tr>
		{/foreach}
    {assign var="link_select_id" value="selectLinkBottom"}
    {assign var="link_action_id" value="actionLinkBottom"}
    {assign var="selectLink" value=$selectLinkBottom}
    {assign var="actionsLink" value=$actionsLinkBottom}
    {assign var="action_menu_location" value="bottom"}
    {include file='include/ListView/ListViewPagination.tpl'}
	</table>
{/if}
{if $contextMenus}
<script type="text/javascript">
{$contextMenuScript}
{literal}
function lvg_nav(m,id,act,offset,t){
    if(t.href.search(/#/) < 0){return;}
    else{
        if(act=='pte'){
            act='ProjectTemplatesEditView';
        }
        else if(act=='d'){
            act='DetailView';
        }else if( act =='ReportsWizard'){
            act = 'ReportsWizard';
        }else{
            act='EditView';
        }
    {/literal}
        url = 'index.php?module='+m+'&offset=' + offset + '&stamp={$pageData.stamp}&return_module='+m+'&action='+act+'&record='+id;
        t.href=url;
    {literal}
    }
}{/literal}
{literal}
    function lvg_dtails(id){{/literal}
        return SUGAR.util.getAdditionalDetails( '{$pageData.bean.moduleDir|default:$params.module}',id, 'adspan_'+id);{literal}}{/literal}
</script>
<script type="text/javascript" src="include/InlineEditing/inlineEditing.js"></script>
{/if}



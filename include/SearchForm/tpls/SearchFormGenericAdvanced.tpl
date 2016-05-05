
<script>
{literal}
	$(function() {

		$(document).foundation();

	var $dialog = $('<div></div>')
		.html(SUGAR.language.get('app_strings', 'LBL_SEARCH_HELP_TEXT'))
		.dialog({
			autoOpen: false,
			title: SUGAR.language.get('app_strings', 'LBL_SEARCH_HELP_TITLE'),
			width: 700
		});
		
		$('.help-search').click(function() {
		$dialog.dialog('open');
		// prevent the default action, e.g., following a link
	});
	
	});
{/literal}
</script>

<!-- include the foundation links -->
<link rel="stylesheet" href="include/javascript/foundation/css/foundation.css">
<link rel="stylesheet" href="include/javascript/foundation/css/app.css">
<script src="include/javascript/foundation/js/lib/what-input.js"></script>
<script src="include/javascript/foundation/js/lib/foundation.js"></script>
<!-- end of foundation links -->

<table class="filterItems">
	<thead>
	<tr>

		<th>Filter Area</th>
		<th>Filter Value</th>
		<th>Order By</th>
		<th>Sort Order</th>
	</tr>
	</thead>
	<tbody>


	<div class="newFilterItems">
		<fieldset class="fieldset">
			<legend>Filter Areas</legend>
			{{foreach name=colIteration from=$formData key=col item=colData}}
			{{if isset($colData.field.label)}}
			<input id='checkbox_{{$colData.field.name}}' type="checkbox" class="filterAreaToggle"><label for="checkbox_{{$colData.field.name}}">{sugar_translate label='{{$colData.field.label}}' module='{{$module}}'}</label>
			{{elseif isset($fields[$colData.field.name])}}
			<input id='checkbox_{{$fields[$colData.field.name].name}}' type="checkbox" class="filterAreaToggle"><label for="checkbox_{{$fields[$colData.field.name].name}}">{sugar_translate label='{{$fields[$colData.field.name].vname}}' module='{{$module}}'}</label>
			{{/if}}
			{{/foreach}}
		</fieldset>


	{{foreach name=colIteration from=$formData key=col item=colData}}
	<tr class="filterArea {{$colData.field.name}}" style="display:none;">

		<td scope="row" nowrap="nowrap" width='{{$templateMeta.widths.label}}%' >
			{{if isset($colData.field.label)}}
			<label for='{{$colData.field.name}}'>{sugar_translate label='{{$colData.field.label}}' module='{{$module}}'}</label>
			{{elseif isset($fields[$colData.field.name])}}
			<label for='{{$fields[$colData.field.name].name}}'>{sugar_translate label='{{$fields[$colData.field.name].vname}}' module='{{$module}}'}</label>
			{{/if}}
		</td>
		<td  nowrap="nowrap" width='{{$templateMeta.widths.field}}%' >
			{{if $fields[$colData.field.name]}}
			{{sugar_field parentFieldArray='fields' accesskey=$ACCKEY vardef=$fields[$colData.field.name] displayType=$displayType displayParams=$colData.field.displayParams typeOverride=$colData.field.type formName=$form_name}}
			{{/if}}
		</td>
		<td>
			<div class="switch">
				{{if isset($colData.field.label)}}
				<input class="switch-input orderToggle" id="rs{{$colData.field.name}}" type="radio" checked name="testGroup">
				<label class="switch-paddle" for="rs{{$colData.field.name}}">
					<span class="show-for-sr">Bulbasaur</span>
				</label>
				{{elseif isset($fields[$colData.field.name])}}
				<input class="switch-input orderToggle" id="rs{{$fields[$colData.field.name].name}}" type="radio" checked name="testGroup">
				<label class="switch-paddle" for="rs{{$fields[$colData.field.name].name}}">
					<span class="show-for-sr">Bulbasaur</span>
				</label>
				{{/if}}
			</div>
		</td>
		<td>
			<div class="orderDiv" style="display:none;">
				{{if isset($colData.field.label)}}
				<input class="orderItem" type="radio" name="pockets" value="Red" id="orderAsc{{$colData.field.name}}"><label for="orderAsc{{$colData.field.name}}"><i class="fa fa-sort-alpha-asc" aria-hidden="true"></i></label>
				<input class="orderItem" type="radio" name="pockets" value="Blue" id="orderDesc{{$colData.field.name}}"><label for="orderDesc{{$colData.field.name}}"><i class="fa fa-sort-alpha-desc" aria-hidden="true"></i></label>
				{{elseif isset($fields[$colData.field.name])}}
				<input class="orderItem" type="radio" name="pockets" value="Red" id="orderAsc{{$fields[$colData.field.name].name}}"><label for="orderAsc{{$fields[$colData.field.name].name}}"><i class="fa fa-sort-alpha-asc" aria-hidden="true"></i></label>
				<input class="orderItem" type="radio" name="pockets" value="Blue" id="orderDesc{{$fields[$colData.field.name].name}}"><label for="orderDesc{{$fields[$colData.field.name].name}}"><i class="fa fa-sort-alpha-desc" aria-hidden="true"></i></label>
				{{/if}}
			</div>
		</td>

	</tr>
	{{/foreach}}
	</tbody>
</table>


<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
{{assign var='accesskeycount' value=0}}  {{assign var='ACCKEY' value=''}}
{{foreach name=colIteration from=$formData key=col item=colData}}
    {{math assign="accesskeycount" equation="$accesskeycount + 1"}}
    {{if $accesskeycount==1}} {{assign var='ACCKEY' value=$APP.LBL_FIRST_INPUT_SEARCH_KEY}} {{else}} {{assign var='ACCKEY' value=''}} {{/if}}

	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
        {if $isHelperShown==0}
            {assign var="isHelperShown" value="1"}
            <td class="helpIcon" width="*">
                <img alt="{$APP.LBL_SEARCH_HELP_TITLE}" id="helper_popup_image" border="0" src='{sugar_getimagepath file="help-dashlet.gif"}' class="help-search">
            </td>
        {else}
            <td>&nbsp;</td>
        {/if}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='{{$templateMeta.widths.label}}%' >
	{{if isset($colData.field.label)}}	
		<label for='{{$colData.field.name}}'>{sugar_translate label='{{$colData.field.label}}' module='{{$module}}'}</label>
    {{elseif isset($fields[$colData.field.name])}}
		<label for='{{$fields[$colData.field.name].name}}'>{sugar_translate label='{{$fields[$colData.field.name].vname}}' module='{{$module}}'}</label>
	{{/if}}
	</td>
	<td  nowrap="nowrap" width='{{$templateMeta.widths.field}}%'>
	{{if $fields[$colData.field.name]}}
		{{sugar_field parentFieldArray='fields' accesskey=$ACCKEY vardef=$fields[$colData.field.name] displayType=$displayType displayParams=$colData.field.displayParams typeOverride=$colData.field.type formName=$form_name}}
   	{{/if}}
   	</td>
{{/foreach}}
	</tr>
<tr>
	<td colspan='20'>
		&nbsp;
	</td>
</tr>	
{if $DISPLAY_SAVED_SEARCH}
<tr>
	<td colspan='2'>
		<a class='tabFormAdvLink' onhover href='javascript:toggleInlineSearch()'>
            {capture assign="alt_show_hide"}{sugar_translate label='LBL_ALT_SHOW_OPTIONS'}{/capture}
		{sugar_getimage alt=$alt_show_hide name="advanced_search" ext=".gif" other_attributes='border="0" id="up_down_img" '}&nbsp;{$APP.LNK_SAVED_VIEWS}
		</a><br>
		<input type='hidden' id='showSSDIV' name='showSSDIV' value='{$SHOWSSDIV}'><p>
	</td>
	<td scope='row' width='10%' nowrap="nowrap">
		{sugar_translate label='LBL_SAVE_SEARCH_AS' module='SavedSearch'}:
	</td>
	<td width='30%' nowrap>
		<input type='text' name='saved_search_name'>
		<input type='hidden' name='search_module' value=''>
		<input type='hidden' name='saved_search_action' value=''>
		<input title='{$APP.LBL_SAVE_BUTTON_LABEL}' value='{$APP.LBL_SAVE_BUTTON_LABEL}' class='button' type='button' name='saved_search_submit' onclick='SUGAR.savedViews.setChooser(); return SUGAR.savedViews.saved_search_action("save");'>
	</td>
	<td scope='row' width='10%' nowrap="nowrap">
	    {sugar_translate label='LBL_MODIFY_CURRENT_SEARCH' module='SavedSearch'}:
	</td>
	<td width='30%' nowrap>
        <input class='button' onclick='SUGAR.savedViews.setChooser(); return SUGAR.savedViews.saved_search_action("update")' value='{$APP.LBL_UPDATE}' title='{$APP.LBL_UPDATE}' name='ss_update' id='ss_update' type='button' >
		<input class='button' onclick='return SUGAR.savedViews.saved_search_action("delete", "{sugar_translate label='LBL_DELETE_CONFIRM' module='SavedSearch'}")' value='{$APP.LBL_DELETE}' title='{$APP.LBL_DELETE}' name='ss_delete' id='ss_delete' type='button'>
		<br><span id='curr_search_name'></span>
	</td>
</tr>

<tr>
<td colspan='6'>
<div style='{$DISPLAYSS}' id='inlineSavedSearch' >
	{$SAVED_SEARCH}
</div>
</td>
</tr>

{/if}
{if $displayType != 'popupView'}
<tr>
	<td colspan='5'>
        <input tabindex='2' title='{$APP.LBL_SEARCH_BUTTON_TITLE}' onclick='SUGAR.savedViews.setChooser()' class='button' type='submit' name='button' value='{$APP.LBL_SEARCH_BUTTON_LABEL}' id='search_form_submit_advanced'/>&nbsp;
        <input tabindex='2' title='{$APP.LBL_CLEAR_BUTTON_TITLE}'  onclick='SUGAR.searchForm.clear_form(this.form); document.getElementById("saved_search_select").options[0].selected=true; return false;' class='button' type='button' name='clear' id='search_form_clear_advanced' value='{$APP.LBL_CLEAR_BUTTON_LABEL}'/>
        {if $DOCUMENTS_MODULE}
        &nbsp;<input title="{$APP.LBL_BROWSE_DOCUMENTS_BUTTON_TITLE}" type="button" class="button" value="{$APP.LBL_BROWSE_DOCUMENTS_BUTTON_LABEL}" onclick='open_popup("Documents", 600, 400, "&caller=Documents", true, false, "");' />
        {/if}
        <a id="basic_search_link" href="javascript:void(0)" accesskey="{$APP.LBL_ADV_SEARCH_LNK_KEY}" >{$APP.LNK_BASIC_SEARCH}</a>
        <span class='white-space'>
            &nbsp;&nbsp;&nbsp;{if $SAVED_SEARCHES_OPTIONS}|&nbsp;&nbsp;&nbsp;<b>{$APP.LBL_SAVED_SEARCH_SHORTCUT}</b>&nbsp;
            {$SAVED_SEARCHES_OPTIONS} {/if}
            <span id='go_btn_span' style='display:none'><input tabindex='2' title='go_select' id='go_select'  onclick='SUGAR.searchForm.clear_form(this.form);' class='button' type='button' name='go_select' value=' {$APP.LBL_GO_BUTTON_LABEL} '/></span>	
        </span>
	</td>
	<td class="help">
	    {if $DISPLAY_SEARCH_HELP}
	    <img  border='0' src='{sugar_getimagepath file="help-dashlet.gif"}' class="help-search">
	    {/if}
    </td>
</tr>
{/if}
</table>

<script>
{literal}
	if(typeof(loadSSL_Scripts)=='function'){
		loadSSL_Scripts();
	}
{/literal}	
</script>
<script>
	{literal}
	$(document).ready(function () {
		$( '#basic_search_link' ).one( "click", function() {
			//alert( "This will be displayed only once." );
			SUGAR.searchForm.searchFormSelect('{/literal}{$module}{literal}|basic_search','{/literal}{$module}{literal}|advanced_search');
		});
	});
	{/literal}
</script>
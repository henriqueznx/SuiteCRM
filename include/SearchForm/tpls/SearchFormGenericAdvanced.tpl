
<script>
{literal}
	$(function() {

		$(document).foundation();



		{{foreach from=$setFilters key=col item=colData}}
		$('#checkbox_{{$colData}}').click();
		$('.filterArea.{{$colData}}').show();
		{{/foreach}}

		if({{$setFilters|@count}} > 0)
		{
			//$("#showFilter").prop("checked",true)
			$("#showFilter").click();
			$(".filterSection").show();
		}


		$("#addField").on("click",function(){
			var id = $("#filterSelect").val();
			$('.filterArea.'+id).show();
		});

		$('.removeFilter').on('click',function(){
			$("tr.filterArea").has($(this)).hide();
			var $inputContainer = $(this).parent().prev();
			//console.log($inp);
			clearFilterValue($inputContainer);
		});


		//This takes in the container element that you want to clear out (both input and select options)
		function clearFilterValue(container)
		{
			$(container).find("input").val("");
			$(container).find("option:selected").prop("selected", false)
		}

		function clearAllFilterValues()
		{
			$('.filterArea:visible .removeFilter').click();
		}

		$('#searchFormClear').on('click',function(){
			clearAllFilterValues();
		});


		//$("#search_form_clear_advanced").on("click",function(){
		//	$(".filterAreaToggle:checked").click();
		//});

//		function updateCheckedFilters()
//		{
//			var selectedFilters = [];
//			$('.filterAreaToggle:checked').each(function(){
//				selectedFilters.push($(this).attr('id'));
//			});
//			$("#checkedFilterItems").val(selectedFilters.toString());
//			console.log(selectedFilters);
//		}

		$("#showFilter").on('change',function(){
			var selected = $("#showFilter:checked").val();
			if(selected === undefined)
			{
				//$("#isFilterLive").val('false');

				//The call to clearAllFilterValues must come before $(".filterSection").hide() as it uses visibility
				clearAllFilterValues();
				$(".filterSection").hide();
				//Reload all items
				$("#searchFormSubmit").click();
			}
			else
			{
				//$("#isFilterLive").val('true');
				$(".filterSection").show();

			}
		});

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

</script>

<style>
	table.filterItems tr:nth-of-type(even) {
		background-color: transparent !important;
	}
	table.filterItems tr {
		border-style: solid;
	}
	td.callout
	{
		border:none;
	}
</style>

{/literal}

<!-- include the foundation links -->
<link rel="stylesheet" href="include/javascript/foundation/css/foundation.css">
<link rel="stylesheet" href="include/javascript/foundation/css/app.css">
<script src="include/javascript/foundation/js/lib/what-input.js"></script>
<script src="include/javascript/foundation/js/lib/foundation.js"></script>
<!-- end of foundation links -->

<!--<input type="hidden" id="checkedFilterItems" name="checkedFilterItems">-->
<!--<input type="hidden" id="isFilterLive" name="isFilterLive" value="false">-->

<!--I have added the basic_search_link below as a quick fix as it was required by some of the grouping js files-->
<input id="basic_search_link" type="hidden">

<p>Filter:</p>
<div class="switch small">
	<input class="switch-input" id="showFilter" type="checkbox" name="exampleSwitch">
	<label class="switch-paddle" for="showFilter">
		<span class="show-for-sr">Filter</span>
		<span class="switch-active" aria-hidden="true">Yes</span>
		<span class="switch-inactive" aria-hidden="true">No</span>
	</label>
</div>

<div class="filterSection callout" style="display:none;">
	<input title='{$APP.LBL_SEARCH_BUTTON_TITLE}' onclick='SUGAR.savedViews.setChooser()' class='button' type='submit' name='button' value='{$APP.LBL_SEARCH_BUTTON_LABEL}' id='searchFormSubmit'/>&nbsp;
	<input title='{$APP.LBL_CLEAR_BUTTON_TITLE}'  class='button' type='button' id='searchFormClear' value='{$APP.LBL_CLEAR_BUTTON_LABEL}'/>
	<input title='{$APP.LBL_SAVE_BUTTON_TITLE}'  class='button' type='button' id='search_form_save_advanced' value='{$APP.LBL_SAVE_BUTTON_LABEL}'/>
	<input title='{$APP.LBL_DELETE_BUTTON_TITLE}'  class='button' type='button' id='search_form_delete_advanced' value='{$APP.LBL_DELETE_BUTTON_LABEL}'/>
	<input title='{$APP.LBL_UPDATE_BUTTON_TITLE}'  class='button' type='button' id='search_form_update_advanced' value='{$APP.LBL_UPDATE_BUTTON_LABEL}'/>
	<input title='{$APP.LBL_LOAD_BUTTON_TITLE}'  class='button' type='button' id='search_form_load_advanced' value='{$APP.LBL_LOAD_BUTTON_LABEL}'/>
<table class="filterItems">
	<thead>
	<tr>
		<th>Filter Area</th>
		<th>Filter Value</th>
		<th></th>
	</tr>
	</thead>
	<tbody>


	<div class="newFilterItems">
		<fieldset class="fieldset">
			<legend>Filter Areas</legend>
			<select id="filterSelect">
			{{foreach name=colIteration from=$formData key=col item=colData}}
			{{if isset($colData.field.label)}}
			<option value='{{$colData.field.name}}' class="filterAreaToggle">{sugar_translate label='{{$colData.field.label}}' module='{{$module}}'}</option>
			{{elseif isset($fields[$colData.field.name])}}
			<option value='{{$fields[$colData.field.name].name}}' class="filterAreaToggle">{sugar_translate label='{{$fields[$colData.field.name].vname}}' module='{{$module}}'}</option>
			{{/if}}
			{{/foreach}}
			</select>
			<input title='{$APP.LBL_ADD_FILTER}'  class='button' type='button' id='addField' value='{$APP.LBL_ADD_FILTER}'/>
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
		<td class="callout">
			<input class='button removeFilter' type='button' value='X'/>
		</td>
	</tr>

	{{/foreach}}
	</tbody>
</table>


</div>


<!--<p>Layout Options:</p>
<div class="switch small">
	<input class="switch-input" id="showLayoutOptions" type="checkbox" name="showLayoutOptions">
	<label class="switch-paddle" for="showLayoutOptions">
		<span class="show-for-sr">Filter</span>
		<span class="switch-active" aria-hidden="true">Yes</span>
		<span class="switch-inactive" aria-hidden="true">No</span>
	</label>
</div>-->






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
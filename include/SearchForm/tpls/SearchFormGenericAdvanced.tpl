
<script>
{literal}
var formdata, fields,customFields, filterComponents, module, filterLabels, lineOptions;


	$(function() {

		//$(document).foundation();

        formdata = {{$formData|@json_encode}};
        fields = {{$fields|@json_encode}};
        customFields = {{$customFields|@json_encode}};
        module = '{{$module}}';

        lineOptions = "<option value='blank'></option>";
        //build an array of the drop down label values
        filterComponents = {};
        filterLabels = [];
        $.each(formdata,function(i,v){
            var line = {};
            line.name = v.field.name;
            line.details = fields[v.field.name];

            if(line.details.vname !== undefined)
            {
                line.label = SUGAR.language.get(module,line.details.vname).replace(":","");
            }
            else
            {
                line.label = SUGAR.language.get(module, v.field.label).replace(":","");
            }
            filterLabels.push(line.label);
            lineOptions += "<option value='"+line.name+"'>"+line.label+"</option>"
            filterComponents[v.field.name] = line;
        });





        $('.addFilterLine').on('click',function()
        {

            //TODO Refactor to handlebar'esque template after prototype completion
            var item = "";
            item+=      '<div class="filterLine row">';
            item+=          '<div class="small-3 columns">';
            item+=              '<select class="filterAreaChoice">'+lineOptions+'</select>';
            item+=          '</div>';
            item+=          '<div class="small-4 columns filterArea1 filterArea">';
            item+=          '</div>';
            item+=          '<div class="small-2 columns filterArea2 filterArea">';
            item+=          '</div>';
            item+=          '<div class="small-2 columns filterArea3 filterArea">';
            item+=          '</div>';
            item+=          '<div class="small-1 columns">';
            item+=              '<button class="button removeFilter" type="button" >';
            item+=                  '<img src="themes/default/images/id-ff-remove-nobg.png">';
            item+=              '</button>';
            item+=          '</div>';
            item+=      '</div>';

            $(item).appendTo('.filterLineItems');
        });


        $('.filterPage').on('change','.filterAreaChoice',function(){
            var item = $(this).val();
            var input = getInputForType(item);
            var $this = $(this);
            $this.parent().parent().find('.filterArea').empty();
            $.each(input,function(i,v){
                $this.parent().parent().find('.filterArea'+(i+1)).append(v);
            });

            //TODO Need a less intensive way of doing this if prototype approved
            $('.date').fdatepicker({
                format: 'dd-mm-yyyy',
                disableDblClickSelection: true
            });
        });
//
//        $('.filterPage').on('change','select.containsRange',function(){
//            if($(this).val() === "between")
//            {
//                $(this).parent().find('.filterArea3').hide();
//            }
//        });

        function getInputForType(item)
        {
            if(filterComponents[item]!== undefined && filterComponents[item].details !== undefined && (filterComponents[item].details.type === "enum" || filterComponents[item].details.type === "multienum"))
            {
                return(getEnumList(item));
            }
            else if(filterComponents[item]!== undefined && filterComponents[item].details !== undefined && (filterComponents[item].details.type === "name" || filterComponents[item].details.type === "url" || filterComponents[item].details.type === "varchar"))
            {
                return(getTextItem(item));
            }
            else if(filterComponents[item]!== undefined && filterComponents[item].details !== undefined && filterComponents[item].details.type === "date")
            {
                return(getDateItem(item));
            }
            else if(filterComponents[item]!== undefined && filterComponents[item].details !== undefined && filterComponents[item].details.type === "currency")
            {
                return(getCurrencyItem(item));
            }
            else if(filterComponents[item]!== undefined && filterComponents[item].details !== undefined && filterComponents[item].details.type === "relate")
            {
                return(getRelateItem(item));
            }
        }

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

/*
		$("#addField").on("click",function(){
			var id = $("#filterSelect").val();
			$('.filterArea.'+id).show();
		});
*/
		$('.filterLineItems').on('click','button.removeFilter',function(){
            $('.filterLine').has($(this)).hide();
            //console.log($this);
            //alert("here");
			//$(".filterArea").has($(this)).hide();
			//var $inputContainer = $(this).parent().prev();
			//console.log($inp);
			//clearFilterValue($inputContainer);
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

		$('#searchFormSave').on('click',function(){
			//SUGAR.savedViews.saved_search_action('Save');
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


        $('#addSelectedFilters').on('click',function(){
            $.each($('#filterSelect option:selected'),function(i,v){
                //$(v).val()
                $('.filterArea.'+$(v).val()).show();
            })
        });



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
				$('#filterSelect option:eq(0)').prop('selected', true);
				//$("#addField").click();

			}
		});


		$("#showSaveLoad").on('change',function(){
			var selected = $("#showSaveLoad:checked").val();
			if(selected === undefined)
			{
				$(".advancedOptions").hide();
			}
			else
			{
				$(".advancedOptions").show();
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

    function getEnumList(item)
    {
        var list = "";
        if(filterComponents[item].details !== undefined && filterComponents[item].details.options !== undefined)
        {
            $.each(filterComponents[item].details.options,function(i,v){
                list+= '<option value="'+i+'">'+v+'</option>';
            });
        }

        var items = [];
        items.push("<select multiple>"+list+"</select>");
        return items;
    }

    function getTextItem(item)
    {
        var items = [];
        items.push("<input type='text'>");
        return items;
    }
    function getDateItem(item)
    {
        var list = "";
        if(filterComponents[item].details !== undefined && filterComponents[item].details.options !== undefined)
        {
            $.each(filterComponents[item].details.options,function(i,v){
                list+= '<option value="'+i+'">'+v+'</option>';
            });
        }

        var items = [];
        items.push("<select class='containsRange'>"+list+"</select>");

        var dateItem = '<input type="text" class="date">';

        items.push(dateItem);

        if(filterComponents[item].details !== undefined && filterComponents[item].details.enable_range_search !== undefined && filterComponents[item].details.enable_range_search === true)
        {
            items.push(dateItem);
        }
        return items;
    }

    function getCurrencyItem(item)
    {
        var list = "";
        if(filterComponents[item].details !== undefined && filterComponents[item].details.options !== undefined)
        {
            $.each(filterComponents[item].details.options,function(i,v){
                list+= '<option value="'+i+'">'+v+'</option>';
            });
        }

        var items = [];
        items.push("<select class='containsRange'>"+list+"</select>");

        var currencyItem = '<input type="number">';
        var currencyItemReadOnly = '<input type="number" readonly="readonly">'

        items.push(currencyItem);
        items.push(currencyItem);

        return items;
    }

    function getRelateItem(item)
    {
        var items = [];
        items.push("<input type='text' value='relate'>");
        return items;
    }
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
	.switch.small .switch-paddle {
		width: 7rem !important;
		height: 1.75rem;
		font-size: 0.75rem;
	}
	.switch.small input:checked ~ .switch-paddle::after {
		left: 5.5rem !important;
	}
</style>

{/literal}

<!-- include the foundation links -->
<link rel="stylesheet" href="include/javascript/foundation/css/foundation.css">
<link rel="stylesheet" href="include/javascript/foundation/css/app.css">
<link rel="stylesheet" href="include/javascript/foundation-datepicker/css/foundation-datepicker.min.css">
<script src="include/javascript/foundation/js/lib/what-input.js"></script>
<script src="include/javascript/foundation/js/lib/foundation.js"></script>
<script src="include/javascript/foundation-datepicker/js/foundation-datepicker.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css" rel="stylesheet">
<!-- end of foundation links -->

<!--<input type="hidden" id="checkedFilterItems" name="checkedFilterItems">-->
<!--<input type="hidden" id="isFilterLive" name="isFilterLive" value="false">-->
<div class="filterPage">


<!--I have added the basic_search_link below as a quick fix as it was required by some of the grouping js files-->
<input id="basic_search_link" type="hidden">

<!--<div class="switch small">
	<input class="switch-input" id="showFilter" type="checkbox" name="exampleSwitch">
	<label class="switch-paddle" for="showFilter">
		<span class="show-for-sr">Filter</span>
		<span class="switch-active" aria-hidden="true">Filter</span>
		<span class="switch-inactive" aria-hidden="true">No Filter</span>
	</label>
</div>-->
        <input type="button" class="addFilterLine" value="Add filter item">
        <input type="button" class="filterData" value="Filter">
        <input type="button" class="filterLoad" value="Load">
        <input type="button" class="filterSave" value="Save">

    <div class="filterLineItems"></div>



<div class="filterSection callout secondary" style="display:none;">
	<div class="reveal" id="saveFilterModal" data-reveal>
		<h4>Please enter a name for the filter</h4>
		<input type="text" name="saved_search_name" id="saved_search_name">
		<input type="hidden" name="search_module" value="">
		<input type="hidden" name="saved_search_action" value="">
		<input title="Save" value="Save" class="button" type="button" name="saved_search_submit" onclick="SUGAR.savedViews.setChooser(); return SUGAR.savedViews.saved_search_action(&quot;save&quot;);">
		<button class="close-button" data-close aria-label="Close reveal" type="button">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<div class="reveal" id="loadFilterModal" data-reveal>
		<h4>Please choose filter to load</h4>
		<select name="saved_search_select" id="saved_search_select" onchange="SUGAR.savedViews.shortcut_select(this, '{{$module}}');">
			<option selected="" value="_none">--None--</option>
			<option  value="2543d893-b046-6626-5b6a-57304ac551d1">Hardcoded Avery</option>
		</select>
		<button class="close-button" data-close aria-label="Close reveal" type="button">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

<!--	<p>Save / Load:</p>
	<div class="switch small">
		<input class="switch-input" id="showSaveLoad" type="checkbox" name="showSaveLoad">
		<label class="switch-paddle" for="showSaveLoad">
			<span class="show-for-sr">Advanced Options</span>
			<span class="switch-active" aria-hidden="true">Yes</span>
			<span class="switch-inactive" aria-hidden="true">No</span>
		</label>
	</div>


<div class="callout warning">
	<fieldset class="advancedOptions" style="display:none;">

		<select name="saved_search_select" id="saved_search_select" onchange="SUGAR.savedViews.shortcut_select(this, '{{$module}}');">
			<option selected="" value="_none">--None--</option>
			<option  value="2543d893-b046-6626-5b6a-57304ac551d1">Hardcoded Avery</option>
		</select>
	</fieldset>
	</div>-->

	<input title='{$APP.LBL_SEARCH_BUTTON_TITLE}' onclick='SUGAR.savedViews.setChooser()' class='button' type='submit' name='button' value='{$APP.LBL_SEARCH_BUTTON_LABEL}' id='searchFormSubmit'/>&nbsp;
	<input title='{$APP.LBL_CLEAR_BUTTON_TITLE}'  class='button' type='button' id='searchFormClear' value='{$APP.LBL_CLEAR_BUTTON_LABEL}'/>
	<input title='{$APP.LBL_SAVE_BUTTON_TITLE}'  class='button' type='button' id='searchFormSave' value='{$APP.LBL_SAVE_BUTTON_LABEL}' data-open="saveFilterModal"/>
	<input title='{$APP.LBL_LOAD_BUTTON_TITLE}'  class='button' type='button' id='search_form_delete_advanced' value='{$APP.LBL_LOAD_BUTTON_LABEL}' data-open="loadFilterModal" />
	<input title='{$APP.LBL_DELETE_BUTTON_TITLE}'  class='button' type='button' id='search_form_delete_advanced' value='{$APP.LBL_DELETE_BUTTON_LABEL}'/>

    <div class="reveal" id="addFilterModal" data-reveal>
        <!--<fieldset class="fieldset">
            <legend>Filter Areas</legend>-->
        <h4>Please choose filter areas</h4>
            <select id="filterSelect" multiple>
                {{foreach name=colIteration from=$formData key=col item=colData}}
                {{if isset($colData.field.label)}}
                <option value='{{$colData.field.name}}' class="filterAreaToggle">{sugar_translate label='{{$colData.field.label}}' module='{{$module}}'}</option>
                {{elseif isset($fields[$colData.field.name])}}
                <option value='{{$fields[$colData.field.name].name}}' class="filterAreaToggle">{sugar_translate label='{{$fields[$colData.field.name].vname}}' module='{{$module}}'}</option>
                {{/if}}
                {{/foreach}}
            </select>
        <button class="close-button" data-close aria-label="Close reveal" type="button">
            <span aria-hidden="true">&times;</span>
        </button>
        <a class="button" id="addSelectedFilters" data-close="addFilterModal">Add Filter(s)</a>
        <!--</fieldset>-->
    </div>
    <input title='{$APP.LBL_ADD_FILTER}'  class='button' type='button' id='addField' value='{$APP.LBL_ADD_FILTER}' data-open="addFilterModal"/>

<!--<table class="filterItems">
	<thead>
	<tr>
		<th>Filter Area</th>
		<th>Filter Value</th>
		<th></th>
	</tr>
	</thead>
	<tbody>



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
			<button class='button removeFilter' type='button' ><img src="themes/default/images/id-ff-remove-nobg.png"></button>
		</td>
	</tr>

	{{/foreach}}
	</tbody>
</table>-->


        {{foreach name=colIteration from=$formData key=col item=colData}}
        <div class="row filterArea {{$colData.field.name}}" style="display:none;">
            <div class="small-4 columns">
                {{if isset($colData.field.label)}}
                {sugar_translate label='{{$colData.field.label}}' module='{{$module}}'}
                {{elseif isset($fields[$colData.field.name])}}
                {sugar_translate label='{{$fields[$colData.field.name].vname}}' module='{{$module}}'}
                {{/if}}
            </div>
            <div class="small-4 columns">
                {{if $fields[$colData.field.name]}}
                {{sugar_field parentFieldArray='fields' accesskey=$ACCKEY vardef=$fields[$colData.field.name] displayType=$displayType displayParams=$colData.field.displayParams typeOverride=$colData.field.type formName=$form_name}}
                {{/if}}
            </div>
            <div class="small-4 columns">
                <button class='button removeFilter' type='button' ><img src="themes/default/images/id-ff-remove-nobg.png"></button>
            </div>
        </div>
        {{/foreach}}

    <div class="input-group">
        <span class="input-group-label">$</span>
        <input class="input-group-field" type="number">
        <div class="input-group-button">
            <input type="submit" class="" value="Submit">
        </div>
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


</div>
    </div>



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
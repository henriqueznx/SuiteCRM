<script src="https://use.fontawesome.com/205c1fda24.js"></script>
<!--<link rel="stylesheet" href="include/javascript/foundation-select/foundation-select.css">
<script src="include/javascript/foundation-select/foundation-select.js"></script>-->
<script>
{literal}
var formdata, fields,customFields, filterComponents, module, filterLabels, lineOptions, setFilters;


	$(function() {

        //$(document).foundation();
        $('#massassign_form').hide();
        formdata = {{$formData|@json_encode}};
        fields = {{$fields|@json_encode}};
        customFields = {{$customFields|@json_encode}};
        setFilters = {{$setFilters|@json_encode}};
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
            item+=          '<button type="button" class="button removeFilter" title="Remove Filter"><i class="fa fa-minus" aria-hidden="true"></i></button>'
            //item+=              '<button class="button removeFilter" type="button" >';
           // item+=                  '<img src="themes/default/images/id-ff-remove-nobg.png">';
            //item+=              '</button>';
            item+=          '</div>';
            item+=      '</div>';

            $(item).appendTo('.filterLineItems');
        });

        $('.filterPage').on('click','.filterClear',function(){
            $('.filterLine button.removeFilter').click();
            $('.filterPerform').click();
        });

        $('.filterPage').on('click','.toggleSecurityGroups',function(){
            $('#massassign_form').toggle()
        });

        $('.filterPage').on('click','.resetRelate',function(){
            $(this).parent().prev().val('');
        })

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
            $('.relate').autocomplete({
                serviceUrl: '/filter/testSearch.php',
                groupBy:'category',
                params:{
                    module:module
                },
                minChars:2,
                onSelect: function (suggestion) {
                   // alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
                }
            });


        });

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

		$('.filterLineItems').on('click','button.removeFilter',function(){
            $('.filterLine').has($(this)).remove();
		});

        populateFilterItems();


        function populateFilterItems()
        {

            if(setFilters !== undefined && setFilters.length > 0)
            {
                $.each(setFilters,function(i,v){
                    $('.addFilterLine').click();
                    $('.filterLine').last();
                    $('.filterLine').last().find('.filterAreaChoice').val(v.key).change();

                    if(v.value !== undefined && Array.isArray(v.value))
                    {
                        $.each(v.value,function(arrayI,arrayV){
                            //http://stackoverflow.com/a/3644500
                            $('.filterLine').last().find('.'+ v.key+ ' option').filter(function(){
                                return $(this).val() == arrayV;
                            }).attr('selected',true);
                        });

                    }
                    else
                    {
                        $('.filterLine').last().find('[name="'+ v.key+'"]').val(v.value);
                    }


                });
            }
        }


        $('.filterPage').hide();

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
        items.push("<select multiple class='"+item+"' name='"+item+"[]'>"+list+"</select>");
        return items;
    }

    function getTextItem(item)
    {
        var items = [];
        items.push("<input type='text' name='"+item+"'>");
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

        var dateItem = '<input type="text" class="date" name="'+item+'">';

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

        var currencyItem = '<input type="number" name="'+item+'[]">';
        //var currencyItemReadOnly = '<input type="number" readonly="readonly">'

        items.push(currencyItem);
        items.push(currencyItem);

        return items;
    }

    function getRelateItem(item)
    {
        var items = [];
        //items.push("<input type='text' class='relate'>");

        var i =     '<div class="input-group">';
            i+=         '<input class="input-group-field relate" type="text" name="'+item+'">';
            //i+=         '<div class="input-group-button">';
            //i+=             '<input type="button" class="button resetRelate" value="X">';
            //i+=                '<button type="button" class="button resetRelate" title="Clear field"><i class="fa fa-ban" aria-hidden="true"></i></button>'
            //i+=         '</div>';
            i+=     '</div>';

        items.push(i);

        return items;
    }
</script>
<style>
    .autocomplete-suggestions { border: 1px solid #999; background: #FFF; overflow: auto; }
    .autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
    .autocomplete-selected { background: #F0F0F0; }
    .autocomplete-suggestions strong { font-weight: normal; color: #3399FF; }
    .autocomplete-group { padding: 2px 5px; }
    .autocomplete-group strong { display: block; border-bottom: 1px solid #000; }

    .filterLineItems {
        margin-top: 10px;
    }
</style>

{/literal}

<!-- include the foundation links -->
<!--<link rel="stylesheet" href="include/javascript/foundation/css/foundation.css">
<link rel="stylesheet" href="include/javascript/foundation/css/app.css">
<link rel="stylesheet" href="include/javascript/foundation-datepicker/css/foundation-datepicker.min.css">
<script src="include/javascript/foundation/js/lib/what-input.js"></script>
<script src="include/javascript/foundation/js/lib/foundation.js"></script>
<script src="include/javascript/foundation-datepicker/js/foundation-datepicker.min.js"></script>
<script src="include/javascript/jQuery-Autocomplete/dist/jquery.autocomplete.min.js"></script><!--https://github.com/devbridge/jQuery-Autocomplete-->
<link href="//cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css" rel="stylesheet">


<!-- end of foundation links -->
<!--
<div class="reveal" id="loadModal" data-reveal>
    <h4>Please choose filter to load</h4>
    <select>
        <option>New customers needing follow-up</option>
        <option>Unpaid bills</option>
        <option>High-value losses</option>
    </select>

    <button class="close-button" data-close aria-label="Close reveal" type="button">
        <span aria-hidden="true">&times;</span>
    </button>
    <button type="button" class="success button">Load</button>
</div>

<div class="reveal" id="saveModal" data-reveal>
    <h4>Please choose a save name</h4>
    <input type="text">

    <button class="close-button" data-close aria-label="Close reveal" type="button">
        <span aria-hidden="true">&times;</span>
    </button>
    <button type="button" class="success button">Save</button>
</div>

<div class="filterPage">
<!--I have added the basic_search_link below as a quick fix as it was required by some of the grouping js files-->
    <!--<input id="basic_search_link" type="hidden">

    <button type="button" class="button addFilterLine"  title="Add Filter Line"><i class="fa fa-plus" aria-hidden="true"></i><i class="fa fa-filter" aria-hidden="true"></i></button>
    <button type="submit" class="button filterPerform" onclick="SUGAR.savedViews.setChooser()"  title="Filter"><i class="fa fa-filter" aria-hidden="true"></i></button>
    <button type="submit" class="button filterClear" title="Clear Filter"><i class="fa fa-ban" aria-hidden="true"></i><i class="fa fa-filter" aria-hidden="true"></i></button>
    <button type="button" class="button" data-open="loadModal" title="Load Filter"><i class="fa fa-download" aria-hidden="true"></i></button>
    <button type="button" class="button" data-open="saveModal" title="Save Filter"><i class="fa fa-upload" aria-hidden="true"></i></button>
    <button type="button" class="button toggleSecurityGroups float-right"  title="Security Groups"><i class="fa fa-key" aria-hidden="true"></i><i class="fa fa-users" aria-hidden="true"></i></button>

    <div class="filterLineItems">
    </div>
</div>-->


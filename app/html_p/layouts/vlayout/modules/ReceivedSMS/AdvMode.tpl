{include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<div class="container-fluid">
	<div class="contents">
								<table class="table table-bordered table-condensed themeTableColor">
				<thead>
					<tr class="blockHeader"><th colspan="4" class="medium">{vtranslate('Receive SMS Settings', $MODULE)}</th></tr>
				</thead>
				<tbody>
<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Assigned To', $MODULE)} ({vtranslate('Leads', $MODULE)})</label></td>
<td class="fieldValue medium"><span class="span10">
<select data-link="true" class="inputbox chzn-select"><option></option>
<optgroup label="{vtranslate('Users', $MODULE)}">{$ListUsers}</optgroup>
<optgroup label="{vtranslate('Groups', $MODULE)}">{$ListGroups}</optgroup>
</select>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Assigned To', $MODULE)} ({vtranslate('HelpDesk', $MODULE)})</label></td>
<td class="fieldValue medium"><span class="span10">
<select data-link="true" class="inputbox chzn-select"><option></option>
<optgroup label="{vtranslate('Users', $MODULE)}">{str_replace("assignto","tassignto",$ListUsers)}</optgroup>
<optgroup label="{vtranslate('Groups', $MODULE)}">{str_replace("assignto","tassignto",$ListGroups)}</optgroup>
</select>
</span></td>
</tr>
            <tr><td colspan="4"><textarea id="myCode" name="update" cols="85" rows="4" STYLE="direction:ltr;" READONLY>{vglobal('site_URL')}modules/ReceivedSMS/capture.php?type=advmode&amp;key={$sms_key}&amp;separate=(startwith)&amp;mob=(mobilenumber)&amp;to=(TO)&amp;msg=(smsmessage)</textarea>
            <br /><input value="{vglobal('site_URL')}modules/ReceivedSMS/capture.php?type=advmode&amp;key={$sms_key}&amp;separate=(startwith)&amp;mob=(mobilenumber)&amp;to=(TO)&amp;msg=(smsmessage)" type="hidden" id="createlink">
            </td></tr>
            <tr><td colspan="4"><BR /><div class="alert alert-warning">
            {vtranslate('Replace text within parenthesis with your desire value.', $MODULE)}<br />
            {vtranslate('also type, key, mob and msg parameters are required', $MODULE)}<br />
            {vtranslate("if message start with separate value then message save into leads otherwise save into tickets", $MODULE)}
            </div></td></tr>
									</tbody>
			</table>
	</div>
</div>
<script type="text/javascript">//<![CDATA[ 
$(window).load(function(){
function updateTextArea() {
    var text = "";

    $('#createlink').each( function() {
        text += $(this).val();
    });
        $('input[data-link=true]:checked').each( function() {
        text += $(this).val();
    });
        $('select[data-link=true] option:selected').each( function() {
        text += $(this).val();
    });

    $('#myCode').val( text );
}

$('input[data-link=true]').change(function () {
    updateTextArea();
});

$('select[data-link=true]').change(function () {
    updateTextArea();
});


});//]]>  



$(function () {
       $('#select-all').click(function (event) {

           var selected = this.checked;
           // Iterate each checkbox
           $(':checkbox').each(function () {   
            this.checked = selected;
            });
          
       });
    });


/* hamid */

</script>
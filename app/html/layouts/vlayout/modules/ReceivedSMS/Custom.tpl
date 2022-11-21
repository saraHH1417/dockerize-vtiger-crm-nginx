{include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<div class="container-fluid">
	<div class="contents">


		<form class="form-horizontal" action = 'index.php?module=ReceivedSMS&parent=Settings&view=Custom&action=Custom' method = 'POST'>


								<table class="table table-bordered table-condensed themeTableColor">
				<thead>
					<tr class="blockHeader"><th colspan="4" class="medium">{vtranslate('Required Paramerters', $MODULE)}</th></tr>
				</thead>
				<tbody>

<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('From', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="mob" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="mob" value="{$mob}" required="required"></span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('To', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="to" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="to" value="{$to}" required="required"></span></td>
</span></td>
</tr>
<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Message', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="msg" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="msg" value="{$msg}" required="required"></span></td>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Mode', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<select id="type" class="inputbox chzn-select" name="type"><option value=""> --- </option>{$ListMode}</select>
</span></td>
</tr>
<tr id='advmodekey' {if $type neq 'advmode'}style="display:none"{/if}>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Separate', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="separate" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="separate" value="{$separate}"></span></td>
</span></td>
<td class="fieldLabel medium" colspan="2">            {vtranslate("if message start with separate value then message save into leads otherwise save into tickets", $MODULE)}
</td>
</tr>
									</tbody>
			</table>



{if $accept_lead || $advanced_mode}
<table class="table table-bordered table-condensed themeTableColor" id="lead"  {if $type neq 'lead' && $type neq 'advmode'}style="display:none"{/if}>
				<thead>
					<tr class="blockHeader"><th colspan="4" class="medium">{vtranslate('Lead Paramerters', $MODULE)}</th></tr>
				</thead>
				<tbody>


<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('First Name', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="nam" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="nam" value="{$nam}"></span></td>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Last Name', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="lnam" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="lnam" value="{$lnam}"></span></td>
</span></td>
</tr>
<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Email', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="mail" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="mail" value="{$mail}"></span></td>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Website', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="web" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="web" value="{$web}"></span></td>
</span></td>
</tr>
<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Phone', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="phone" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="phone" value="{$phone}"></span></td>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Fax', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="fax" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="fax" value="{$fax}"></span></td>
</span></td>
</tr>
<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Company', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="com" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="com" value="{$com}"></span></td>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Lead Source', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<select name="source" class="inputbox chzn-select"><option></option>{$Listleadsource}</select>
</span></td>
</tr>
<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Industry', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<select name="industry" class="inputbox chzn-select"><option></option>{$ListIndustry}</select>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Assigned To', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<select name="assignto"  class="inputbox chzn-select"><option></option>
<optgroup label="{vtranslate('Users', $MODULE)}">{$ListUsers}</optgroup>
<optgroup label="{vtranslate('Groups', $MODULE)}">{$ListGroups}</optgroup>
</select>
</span></td>
</tr>
									</tbody>
			</table>
{/if}
{if $accept_helpdesk || $advanced_mode}
<table class="table table-bordered table-condensed themeTableColor"  id="helpdesk" {if $type neq 'helpdesk' && $type neq 'advmode'}style="display:none"{/if}>
				<thead>
					<tr class="blockHeader"><th colspan="4" class="medium">{vtranslate('HelpDesk Paramerters', $MODULE)}</th></tr>
				</thead>
				<tbody>


<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Subject', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<input id="sub" type="text" class="input-large nameField" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" name="sub" value="{$sub}"></span></td>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Status', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<select name="status" class="inputbox chzn-select"><option></option>{$Listticketstatus}</select>
</span></td>
</tr>
<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Category', 'HelpDesk')}</label></td>
<td class="fieldValue medium"><span class="span10">
<select name="cat" class="inputbox chzn-select"><option></option>{$Listcategories}</select>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Priority', 'HelpDesk')}</label></td>
<td class="fieldValue medium"><span class="span10">
<select name="priority" class="inputbox chzn-select"><option></option>{$Listpriorities}</select>
</span></td>
</tr>
<tr>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_SEVERITY', 'HelpDesk')}</label></td>
<td class="fieldValue medium"><span class="span10">
<select name="severities"  class="inputbox chzn-select"><option></option>{$Listseverities}</select>
</span></td>
<td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('Assigned To', $MODULE)}</label></td>
<td class="fieldValue medium"><span class="span10">
<select name="tassignto" data-link="true" class="inputbox chzn-select"><option></option>
<optgroup label="{vtranslate('Users', $MODULE)}">{str_replace("assignto","tassignto",$TListUsers)}</optgroup>
<optgroup label="{vtranslate('Groups', $MODULE)}">{str_replace("assignto","tassignto",$TListGroups)}</optgroup>
</select>
</span></td>
</tr>
									</tbody>
			</table>
								<table class="table table-bordered table-condensed themeTableColor">
				<thead>
					<tr class="blockHeader"><th colspan="4" class="medium">{vtranslate('Receive SMS URL', $MODULE)}</th></tr>
				</thead>
				<tbody>

            <tr><td colspan="4">
<textarea id="myCode" cols="85" rows="4" STYLE="direction:ltr;" READONLY>{vglobal('site_URL')}modules/ReceivedSMS/custom.php</textarea></td></tr>
            <tr><td colspan="4"><BR /><div class="alert alert-warning">
            {vtranslate('If you can not set the receiving parameters in your sms panel, you can set your own custom parameters from this section', $MODULE)}<br />
            {vtranslate('Replace text input with your desire webservice parameters.', $MODULE)}<br />
            {vtranslate("if you don't choose other inputs they fill with default system value", $MODULE)}
            </div></td></tr>
									</tbody>
			</table>
{/if}

			<div class="widget_header row-fluid">
				<div class="span4 btn-toolbar">
					<div>
						<button class="btn btn-success saveButton" type="submit" title="{vtranslate("Save")}"><strong>{vtranslate("Save", $MODULE)}</strong></button>
					</div>
				</div>
			</div>
		</form>
				</div>
			</div>
    {if $accept_sms eq '1'}
<script>
$(function() {
    $('#type').on('change',function(){
        if($('#type').val() == 'advmode') {
            $('#advmodekey').show(); 
            $('#lead').show(); 
            $('#helpdesk').show(); 
        } else if($('#type').val() == 'lead') {
            $('#advmodekey').hide();
            $('#lead').show(); 
            $('#helpdesk').hide(); 
        } else if($('#type').val() == 'helpdesk') {
            $('#advmodekey').hide();
            $('#lead').hide(); 
            $('#helpdesk').show(); 
        } else {
            $('#advmodekey').hide();
            $('#lead').hide(); 
            $('#helpdesk').hide();
         } 
    });

});
</script>
{/if}
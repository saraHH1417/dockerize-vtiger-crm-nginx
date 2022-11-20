{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
<div id="VtEmailTaskContainer">
    {assign var=AVALIABLEPROVIDERS value=ParsFax_Provider_Helper::AvaliableProviders()}

    <div class="row-fluid">
        <span></span>{vtranslate('Select Fax Provider',$MODULE)}<span class="redColor">*</span>
        <select class="chzn-select" name="provider" id="providerName"
                data-validation-engine='validate[required]'>
            {foreach from=$AVALIABLEPROVIDERS item=label key=key}
                <option value="{$label}" {if $TASK_OBJECT->provider eq $label}selected{/if}>{vtranslate($label, $MODULE)}</option>
            {/foreach}
        </select>
    </div>
	<div class="row-fluid">
		<div class="span2">{vtranslate('LBL_RECEPIENTS',$QUALIFIED_MODULE)}<span class="redColor">*</span></div>
		<div class="span8 row-fluid">
			<input type="text" class="span5 fields" data-validation-engine='validate[required]' name="fax_recepient" value="{$TASK_OBJECT->fax_recepient}" />
			<span class="span6">
				<select class="chzn-select task-fields">
                    {foreach from=$RECORD_STRUCTURE_MODEL->getFieldsByType('phone') item=FIELD key=FIELD_VALUE}
						<option value=",${$FIELD_VALUE}">({vtranslate($FIELD->getModule()->get('name'),$FIELD->getModule()->get('name'))})  {vtranslate($FIELD->get('label'),$FIELD->getModule()->get('name'))}</option>
					{/foreach}
				</select>	
			</span>
		</div>
	</div>
	<div class="row-fluid padding-bottom1per">
				<span class="span7 row-fluid">
					<span style="margin-top: 7px" class="span2">{vtranslate('LBL_ADD_FIELD',$QUALIFIED_MODULE)}</span>&nbsp;&nbsp;
					<span class="span8">
						<select style="min-width: 250px" id="task-fieldnames" class="chzn-select" data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
							<option></option>
                            {$ALL_FIELD_OPTIONS}
						</select>
					</span>
				</span>
		<span class="span5 row-fluid">
					<span style="margin-top: 7px" class="span3">{vtranslate('LBL_ADD_TIME',$QUALIFIED_MODULE)}</span>&nbsp;&nbsp;
					<span class="span8">
						<select style="width: 215px" id="task_timefields" class="chzn-select" data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
							<option></option>
                            {foreach from=$META_VARIABLES item=META_VARIABLE_KEY key=META_VARIABLE_VALUE}
								<option value="${$META_VARIABLE_KEY}">{vtranslate($META_VARIABLE_VALUE,$QUALIFIED_MODULE)}</option>
                            {/foreach}
						</select>
					</span>
				</span>
	</div>
	<div class="row-fluid padding-bottom1per">
		<textarea id="content" name="content">{$TASK_OBJECT->content}</textarea>
	</div>

	{*<div class="row-fluid">*}
		{*<div class="span2">{vtranslate('LBL_FAX_TEXT',$QUALIFIED_MODULE)}</div>*}
		{*<div class="row-fluid padding-bottom1per">*}
			{*<textarea id="content" name="content">{$TASK_OBJECT->content}</textarea>*}
		{*</div>*}
	{*</div>*}
</div>
    {*<script src="layouts/vlayout/modules/Vtiger/resources/CkEditor.js" type="text/javascript" charset="utf-8"></script>*}
	<script src="modules/ParsFax/resources/ParsFaxTask.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
        Settings_Workflows_Edit_Js.prototype.registerParsFaxTaskEvents = function () {
            if (jQuery('#content').length) {
                var textAreaElement = jQuery('#content');
                var ckEditorInstance = new Vtiger_CkEditor_Js();
                ckEditorInstance.loadCkEditor(textAreaElement);
                this.registerFillMailContentEvent();
                this.registerFillTaskFromEmailFieldEvent();
                this.registerCcAndBccEvents();

            } else {
                setTimeout(function () {
                    ParsFax.registerPicklist2();
                }, 3000);
            }


        };
	</script>
{/strip}
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

        <div class="row form-group">
            <div class="col-sm-6 col-xs-6">
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <label>{vtranslate('Select Fax Provider',$MODULE)}:<span class="redColor">*</span></label>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <select class="select2 col-md-12" name="provider" id="providerName"
                                data-validation-engine='validate[required]'>
                            {foreach from=$AVALIABLEPROVIDERS item=label key=key}
                                <option value="{$label}"
                                        {if $TASK_OBJECT->provider eq $label}selected{/if}>{vtranslate($label, $MODULE)}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-sm-9 col-xs-9">
                <div class="row">
                    <div class="col-sm-2 col-xs-2">
                        <label>{vtranslate('LBL_RECEPIENTS',$QUALIFIED_MODULE)}: <span class="redColor">*</span></label>
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <div class="span8 col-md-8">
                            <input type="text" class="span10 col-md-12 fields inputElement" data-validation-engine='validate[required]' name="fax_recepient" value="{$TASK_OBJECT->fax_recepient}"/>
                        </div>
                        <div class="span4 col-md-4">
                            <select class="select2 col-md-12 task-fields">
                                {foreach from=$RECORD_STRUCTURE_MODEL->getFieldsByType('phone') item=FIELD key=FIELD_VALUE}
                                    <option value=",${$FIELD_VALUE}">({vtranslate($FIELD->getModule()->get('name'),$FIELD->getModule()->get('name'))})  {vtranslate($FIELD->get('label'),$FIELD->getModule()->get('name'))}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-sm-6 col-xs-6">
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <label style="margin-top: 7px" class="span10 col-md-12">{vtranslate('LBL_ADD_FIELD',$QUALIFIED_MODULE)}: </label>&nbsp;&nbsp;
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <select style="min-width: 250px" id="task-fieldnames" class="select2 col-md-12" data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
                            <option></option>
                            {$ALL_FIELD_OPTIONS}
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-xs-6">
                <div class="row">
                    <div class="col-sm-3 col-xs-3">
                        <label style="margin-top: 7px" class="span10 col-md-12">{vtranslate('LBL_ADD_TIME',$QUALIFIED_MODULE)}</label>&nbsp;&nbsp;
                    </div>
                    <div class="col-sm-9 col-xs-9">
                        <select style="width: 215px" id="task_timefields" class="select2 col-md-12"
                                data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
                            <option></option>
                            {foreach from=$META_VARIABLES item=META_VARIABLE_KEY key=META_VARIABLE_VALUE}
                                <option value="${$META_VARIABLE_KEY}">{vtranslate($META_VARIABLE_VALUE,$QUALIFIED_MODULE)}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-sm-12 col-xs-12">
                <div class="row">
                    <div class="col-sm-12 col-xs-12">
                        <textarea id="content" name="content">{$TASK_OBJECT->content}</textarea>
                    </div>
                </div>
            </div>
        </div>
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
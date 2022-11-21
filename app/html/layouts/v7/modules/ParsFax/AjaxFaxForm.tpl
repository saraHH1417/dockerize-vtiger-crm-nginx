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

<div class='fc-overlay-modal'>
    <div class = "modal-content">
        <div class="overlayHeader">
            {assign var=TITLE value="{'Send Fax'|@vtranslate:$MODULE}"}
            {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$TITLE}
        </div>
        <div class='modal-body' style="margin-bottom:100%;overflow:auto;" id ="landingPageDiv">
            <hr>
            <div class="landingPage container-fluid importServiceSelectionContainer" id ="sendfaxContainer"  data-max="{$MAXPDF}">
                <form class="form-horizontal" id="SendFax" method="post" action="index.php" enctype="multipart/form-data">
                    <input type="hidden" name="module" value="{$MODULE}"/>
                    <input type="hidden" name="source_module" value="{$SOURCE_MODULE}"/>
                    <input type="hidden" name="action" value="SendFax"/>
                    <input type="hidden" name="viewname" value="{$VIEWNAME}"/>
                    <input type="hidden" name="selected_ids" value={ZEND_JSON::encode($SELECTED_IDS)}>
                    <input type="hidden" name="excluded_ids" value={ZEND_JSON::encode($EXCLUDED_IDS)}>
                    <input type="hidden" name="search_key" value="{$SEARCH_KEY}"/>
                    <input type="hidden" name="operator" value="{$OPERATOR}"/>
                    <input type="hidden" name="search_value" value="{$ALPHABET_VALUE}"/>
                    <input type="hidden" name="search_params" value='{ZEND_JSON::encode($SEARCH_PARAMS)}'/>
                    <input type="hidden" name="content_type" value='text'/>
                    <input type="hidden" name="relatedContactInfo" data-value='[]'/>

                    <table class="massEditTable table table-bordered">
                        <tbody>
                        <tr>
                            <td class="fieldLabel">
                                <span><strong>{vtranslate('Step 1',$MODULE)}</strong></span>
                                &nbsp;:&nbsp;
                                {vtranslate('Select Fax Provider',$MODULE)}<span class="redColor">*</span>
                            </td>
                            <td class="fieldValue">
                                <div class="col-md-4">
                                    <select class="inputElement select2 select2-offscreen" name="provider"
                                            id="providerName"
                                            data-validation-engine='validate[required]'>
                                        {foreach from=$AVALIABLEPROVIDERS item=label key=key}
                                            <option value="{$label}">{vtranslate($label, $MODULE)}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="fieldLabel" rowspan="2">
                                <span><strong>{vtranslate('Step 2',$MODULE)}</strong></span>
                                &nbsp;:&nbsp;
                                {vtranslate('Select the phone number fields to send',$MODULE)}<span
                                        class="redColor">*</span>
                            </td>
                            <td class="fieldValue">
                                <input type="text" id="faxPicklistUi" value=""
                                       class="row-fluid autoComplete sourceField span7 select2 col-md-8" name="numbers"
                                       placeholder="{vtranslate('Enter Fax Number', 'ParsFax')}"
                                       data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                       data-validator={Zend_Json::encode([['name'=>'PicklistFieldValues']])}/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldValue">
                                <select id="availablefaxphones" data-placeholder="{vtranslate('Select the phone number fields to send',$MODULE)}" class="select2" style="min-width: 50%">
                                    <option value="" selected>{vtranslate('Select the phone number fields to send',$MODULE)}</option>
                                    {foreach item=PHONE_FIELD from=$PHONE_FIELDS}
                                        {assign var=PHONE_FIELD_NAME value=$PHONE_FIELD->get('name')}
                                        {if !empty($SINGLE_RECORD)}
                                            {assign var=FIELD_VALUE value=$SINGLE_RECORD->get($PHONE_FIELD_NAME)}
                                        {/if}
                                        {if !empty($SINGLE_RECORD)}
                                            {if !empty($FIELD_VALUE)}
                                                <option value="{$FIELD_VALUE}">
                                                    {vtranslate($PHONE_FIELD->get('label'), $SOURCE_MODULE)} ({$FIELD_VALUE})
                                                </option>
                                            {/if}
                                        {else}
                                            <option value="Field:{$PHONE_FIELD_NAME}">
                                                {vtranslate($PHONE_FIELD->get('label'), $SOURCE_MODULE)}{if !empty($FIELD_VALUE)} ({$FIELD_VALUE}){/if}
                                            </option>
                                        {/if}
                                    {/foreach}
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td class="fieldLabel">
                                <span><strong>{vtranslate('Step 3',$MODULE)}</strong></span>
                                &nbsp;:&nbsp;
                                {vtranslate('Select file(s) if necessary',$MODULE)}
                            </td>
                            <td class="fieldValue">

                                <label class="input-group-btn">
                        <span id="uploadfaxfiles" class="btn btn-block btn-info"
                              style="width:98%;    padding-left: 0; padding-right: 0;">
                            {vtranslate('Browse',$MODULE)}… <input id="FaxFiles" type="file" name="file[]" accept=".pdf"
                                                                   {if $MAXPDF gt 1}multiple{/if} style="display: none;">
                        </span>
                                </label>

                                <div id="attachments" class="row-fluid">
                                    {foreach item=ATTACHMENT from=$ATTACHMENTS}
                                        <input type="hidden" name="inventory_file[]" value="{$ATTACHMENT['path']}">
                                        {if ('docid'|array_key_exists:$ATTACHMENT)}
                                            {assign var=DOCUMENT_ID value=$ATTACHMENT['docid']}
                                            {assign var=FILE_TYPE value="document"}
                                        {else}
                                            {assign var=FILE_TYPE value="file"}
                                        {/if}
                                        <div class="MultiFile-label customAttachment"
                                             data-file-id="{$ATTACHMENT['fileid']}"
                                             data-file-type="{$FILE_TYPE}"
                                             data-file-size="{$ATTACHMENT['size']}" {if $FILE_TYPE eq "document"} data-document-id="{$DOCUMENT_ID}"{/if}>
                                            {if $ATTACHMENT['nondeletable'] neq true}
                                                <a name="removeAttachment" class="cursorPointer">x </a>
                                            {/if}
                                            <span>{$ATTACHMENT['attachment']}</span>
                                        </div>
                                    {/foreach}
                                </div>
                                <div class="filenames"></div>
                            </td>
                        </tr>

                        <tr>
                            <td class="fieldLabel">
                                <span><strong>{vtranslate('Step 4',$MODULE)}</strong></span>
                                &nbsp;:&nbsp;
                                {vtranslate('Type the message',$MODULE)}

                            </td>
                            <td class="fieldValue">
                                {if $MODULE_IS_ACTIVE && $USEEMAILTEMPLATES}
                                    <span style="float: left !important;">
                            <button type="button" class="btn" id="selectEmailTemplate"
                                    onclick="javascript:ParsFax.registerSelectTemplate();" data-url="module=EmailTemplates&view=Popup"
                                    title="{vtranslate('LBL_SELECT_EMAIL_TEMPLATE',$MODULE)}"><strong>{vtranslate('Select Template',$MODULE)}</strong></button>
                        </span>
                                    <div style="clear:both"></div>
                                    <div class="container-fluid hide" id='emailTemplateWarning' style="margin-top: 10px">
                                        <div class="alert alert-warning fade in">
                                            <a href="#" class="close" data-dismiss="alert">&times;</a>
                                            <p>{vtranslate('LBL_EMAILTEMPLATE_WARNING_CONTENT','Emails')}</p>
                                        </div>
                                    </div>
                                {/if}
                                <textarea id="faxdescription" name="description" rows="8">{$DESCRIPTION}</textarea>

                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="modal-overlay-footer clearfix">
                        <div class="row clearfix">
                            <div class="textAlignCenter col-lg-12 col-md-12 col-sm-12 ">
                                <button class="btn btn-success saveButton" type="submit"><strong>{vtranslate('Send', $MODULE)}</strong>
                                </button>&nbsp;&nbsp
                                <button type="button" class="btn btn-danger" aria-label="Close" data-dismiss="modal"><strong>{vtranslate('Cancel', $MODULE)}</strong></button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

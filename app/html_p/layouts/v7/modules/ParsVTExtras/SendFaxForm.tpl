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
<div class="main-container clearfix">
    <div id="modnavigator" class="module-nav editViewModNavigator">
        <div class="hidden-xs hidden-sm mod-switcher-container">
            {include file="partials/Menubar.tpl"|vtemplate_path:$MODULE}
        </div>
    </div>
    <div class="editViewPageDiv viewContent" id ="sendfaxContainer"  data-max="{$MAXPDF}">
        <div class="col-sm-12 col-xs-12 content-area {if $LEFTPANELHIDE eq '1'} full-width {/if}">
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
                        <td class="fieldLabel">
                            <span><strong>{vtranslate('Step 2',$MODULE)}</strong></span>
                            &nbsp;:&nbsp;
                            {vtranslate('Select the phone number fields to send',$MODULE)}<span
                                    class="redColor">*</span>
                        </td>
                        <td class="fieldValue">
                            <div class="col-md-5">

                            <input type="text" id="faxPicklistUi" value=""
                                   class="inputElement row-fluid autoComplete sourceField span7 select2" name="numbers"
                                   placeholder="{vtranslate('Enter Fax Number', 'ParsFax')}"
                                   data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                   data-validator={Zend_Json::encode([['name'=>'PicklistFieldValues']])}/>
                            </div>
                            <div class="showavailablefaxes col-md-3 hide">
                            <select id="availablefaxphones" data-placeholder="{vtranslate('Select the phone number fields to send',$MODULE)}" class="select2" style="min-width: 150px">
                                <option value="" selected>{vtranslate('Select the phone number fields to send',$MODULE)}</option>
                            </select>
                            </div>
                            <div class="col-md-4 input-group  pull-right">
                                <select style="width: 140px;" class="select2 faxModulesList pull-right">
                                    {foreach item=MODULE_NAME from=$RELATED_MODULES}
                                        <option value="{$MODULE_NAME}" {if $MODULE_NAME eq $FIELD_MODULE} selected {/if}>{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
                                    {/foreach}
                                </select>
                                <a href="#" class="clearReferenceSelection cursorPointer" name="clearToFaxField" id="clearToFaxField"> X </a>
                                <span class="input-group-addon">
                                    <span class="selectFax cursorPointer">
                                        <i class="fa fa-search" title="{vtranslate('LBL_SELECT', $MODULE)}"></i>
                                    </span>
                                </span>
                            </div>

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
                            {if $MODULE_IS_ACTIVE}
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
                            </button>&nbsp;&nbsp;
                            <a class="cancelLink" type="reset"
                               onclick="javascript:window.history.back();">{vtranslate('Cancel', $MODULE)}</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<script>
    jQuery(document).ready(function() {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
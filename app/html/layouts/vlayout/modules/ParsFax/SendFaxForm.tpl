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
    <div class="contents">
        <div class="row">
            <div id="sendfaxContainer" class='modelContainer' data-max="{$MAXPDF}">
                <form class="form-horizontal" id="SendFax" method="post" action="index.php"
                      enctype="multipart/form-data">
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

                    <div class="modal-body tabbable slimScrollDiv">
                        <table class="massEditTable table table-bordered">
                            <tbody>
                            <tr>
                                <td class="fieldLabel">
                                    <span><strong>{vtranslate('Step 1',$MODULE)}</strong></span>
                                    &nbsp;:&nbsp;
                                    {vtranslate('Select Fax Provider',$MODULE)}<span class="redColor">*</span>
                                </td>
                                <td class="fieldValue">
                                    <select class="chzn-select" name="provider" id="providerName"
                                            data-validation-engine='validate[required]'>
                                        {foreach from=$AVALIABLEPROVIDERS item=label key=key}
                                            <option value="{vtranslate($label, $MODULE)}">{vtranslate($label, $MODULE)}</option>
                                        {/foreach}
                                    </select>
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
                                    <input type="text" id="picklistUi" value="09131271535,09138086200"
                                           class="row-fluid autoComplete sourceField span7 select2" name="numbers"
                                           placeholder="{vtranslate('Enter Fax Number', 'ParsFax')}"
                                           data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                           data-validator={Zend_Json::encode([['name'=>'PicklistFieldValues']])}/>

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
                                onclick="javascript:ParsFax.registerSelectTemplate();" data-url="{$EMAIL_TEMPLATE_URL}"
                                title="{vtranslate('LBL_SELECT_EMAIL_TEMPLATE',$MODULE)}"><strong>{vtranslate('Select Template',$MODULE)}</strong></button>
					</span>
                                        <div style="clear:both"></div>
                                    {/if}
                                    <textarea id="faxdescription" name="description" rows="8">{$DESCRIPTION}</textarea>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="row-fluid">
                        <div class="pull-right">
                            <button class="btn btn-success" type="submit"><strong>{vtranslate('Send', $MODULE)}</strong></button><a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('Cancel', $MODULE)}</a></div>
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    {/strip}

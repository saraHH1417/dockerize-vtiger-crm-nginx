{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{strip}
    <div id="googleapiModalContainer" class="modal-dialog" style="#min-width: 800px">
        {if $CLIENTID && $CLIENTSECRET}
            {assign var=HEADER_TITLE value={vtranslate('Edit Google API Settings', $QUALIFIED_MODULE)}}
        {else}
            {assign var=HEADER_TITLE value={vtranslate('Add New Google API Settings', $QUALIFIED_MODULE)}}
        {/if}
        {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
        <div class="modal-content">
            <div class="form-horizontal">
                <div class="modal-body">

                    <div class="form-group">
                        <div class="controls col-xs-1"></div>
                        <div class="controls col-xs-10">
                            <p class="alert alert-warning blink_me" style="font-size: 80%">
                                <strong>{vtranslate('Warning:', $QUALIFIED_MODULE)}</strong><br>
                                {vtranslate("CRM url can't contain a wildcard (https://*.example.com) or a path (https://example.com/subdir)", $QUALIFIED_MODULE)}
                                <br/>
                                {vtranslate("Google's authorization server is only accessible over SSL, and it refuses HTTP (non-SSL) connections", $QUALIFIED_MODULE)}
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label fieldLabel col-sm-5">
                            {vtranslate('Client ID', $QUALIFIED_MODULE)}&nbsp;
                            <span class="redColor">*</span>
                        </label>
                        <div class="controls col-sm-6">
                            <input type="text" name="clientid" class="span8 inputElement" maxlength="100"
                                   value="{$CLIENTID}"
                                   data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                   data-validator={Zend_Json::encode([['name'=>'clientid']])}>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label fieldLabel col-sm-5">
                            {vtranslate('Client Secret', $QUALIFIED_MODULE)}&nbsp;
                            <span class="redColor">*</span>
                        </label>
                        <div class="controls col-xs-6">
                            <input type="text" name="clientsecret" class="span8 inputElement" maxlength="50"
                                   value="{$CLIENTSECRET}"
                                   data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                   data-validator={Zend_Json::encode([['name'=>'clientsecret']])}>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label fieldLabel col-sm-5">
                            {vtranslate('Authorized redirect URIs', $QUALIFIED_MODULE)}&nbsp;
                        </label>
                    </div>
                    <div class="form-group">
                        <div class="controls col-xs-1"></div>
                        <div class="controls col-xs-10" style="margin: 0 auto">
    <textarea style="font-size: 10px;width: 100%; direction: ltr; text-align: left" rows="2">
        {$MODULE_MODEL->getGoogleRedirectURI()}index.php?module=Google&view=Authenticate&service=Google
        {*{$MODULE_MODEL->getGoogleRedirectURI()}
        index.php?module=Google&view=List&operation=sync&sourcemodule=Calendar&service=GoogleCalendar
        &#13;&#10;{$MODULE_MODEL->getGoogleRedirectURI()}
        index.php?module=Google&view=List&operation=sync&sourcemodule=Contacts&service=GoogleContacts*}
    </textarea>

                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="row-fluid">
                    <div class="pull-right">
                        <button class="btn btn-success"
                                id="SaveGoogleAPI">{vtranslate('Save', $QUALIFIED_MODULE)}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/strip}

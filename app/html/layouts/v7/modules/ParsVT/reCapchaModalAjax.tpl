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
        {if $reCAPTCAHPUBLICKEY && $reCAPTCAHPUBLICKEY neq 'RECAPTCHA PUBLIC KEY FOR THIS DOMAIN' && $reCAPTCAHSECRETKEY && $reCAPTCAHSECRETKEY neq 'RECAPTCHA PRIVATE KEY FOR THIS DOMAIN'}
            {assign var=HEADER_TITLE value={vtranslate('Edit Google reChapcha API Settings', $QUALIFIED_MODULE)}}
        {else}
            {assign var=HEADER_TITLE value={vtranslate('Add New Google reChapcha API Settings', $QUALIFIED_MODULE)}}
        {/if}
        {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
        <div class="modal-content">
            <div class="form-horizontal">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label fieldLabel col-sm-5">
                            {vtranslate('Public Key', $QUALIFIED_MODULE)}&nbsp;
                            <span class="redColor">*</span>
                        </label>
                        <div class="controls col-sm-6">
                            <input type="text" name="publickey" class="span8 inputElement" maxlength="100"
                                   value="{$reCAPTCAHPUBLICKEY}"
                                   data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                   data-validator={Zend_Json::encode([['name'=>'publickey']])}>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label fieldLabel col-sm-5">
                            {vtranslate('Secret Key', $QUALIFIED_MODULE)}&nbsp;
                            <span class="redColor">*</span>
                        </label>
                        <div class="controls col-xs-6">
                            <input type="text" name="secretkey" class="span8 inputElement" maxlength="100"
                                   value="{$reCAPTCAHSECRETKEY}"
                                   data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                   data-validator={Zend_Json::encode([['name'=>'secretkey']])}>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="row-fluid">
                    <div class="pull-right">
                        <button class="btn btn-success"
                                id="SavereCapchaAPI">{vtranslate('Save', $QUALIFIED_MODULE)}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/strip}

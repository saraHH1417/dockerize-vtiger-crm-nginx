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
    <div id="createLanguageModalContainer" class="modal-dialog createLanguageModal">
    <div class="modal-header">
        <div class="clearfix">
            <div class="pull-right " >
                <button type="button" class="close" aria-label="Close" data-dismiss="modal">
                    <span aria-hidden="true" class='fa fa-close'></span>
                </button>
            </div>
            <h4 class="pull-left">
              {if $HEADER_TITLE}{$HEADER_TITLE}{else}{vtranslate('Create new language', $QUALIFIED_MODULE)}{/if}
            </h4>
        </div>
    </div>
        <div class="modal-content">
            <form class="form-horizontal newLanguageForm" id="newLanguageForm">
                <div name='createLanguageModalContent'>
                    <div class="modal-body ">
                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Language', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-sm-6">
                                <input type="text" name="newLanguage" id="newLanguage" class="span8 inputElement"
                                       maxlength="50" value=""
                                       data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                       data-validator={Zend_Json::encode([['name'=>'newLanguage']])}>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Name', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-xs-6">
                                <input type="text" name="langName" id="langName" class="span8 inputElement"
                                       maxlength="30" value=""
                                       data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                       data-validator={Zend_Json::encode([['name'=>'langName']])}>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Code', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-xs-6">
                                <input type="text" name="langCode" id="langCode" class="span8 inputElement"
                                       minlength="5" maxlength="5"
                                       data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                       data-validator={Zend_Json::encode([['name'=>'langCode']])} placeholder="fa_af">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Copy language files from', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-xs-6">
                                <select class="inputElement typeSelect span8 inputElement" id="selectCopyLang"
                                        name="selectCopyLang">
                                    {foreach item=LANG_INFO key=KEY from=$LANGUAGES}
                                        <option value="{$LANG_INFO['prefix']}">{vtranslate($LANG_INFO['label'], $QUALIFIED_MODULE)}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <center>
                        {if $BUTTON_NAME neq null}
                            {assign var=BUTTON_LABEL value=$BUTTON_NAME}
                        {else}
                            {assign var=BUTTON_LABEL value={vtranslate('LBL_SAVE', $MODULE)}}
                        {/if}
                        <button {if $BUTTON_ID neq null} id="{$BUTTON_ID}" {/if} class="btn btn-success modalSaveButton" type="button" name="saveButton">
                            <strong>{$BUTTON_LABEL}</strong></button>
                        <a href="#" class="cancelLink" type="reset"
                           data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
                    </center>
                </div>
            </form>
        </div>
    </div>
{/strip}

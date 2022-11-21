{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
{strip}
    {assign var=USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
    {strip}
    {literal}
        <style>
            .parsvideoimage:hover {cursor: help; background: -moz-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(255,255,255,1)), color-stop(51%, rgba(0,0,0,1)), color-stop(100%, rgba(0,0,0,1)));background:-webkit-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);background: -o-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);background: -ms-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);background:radial-gradient(ellipse at center, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#000000',GradientType=1 );opacity:0.5;}.parspresent {min-height: 400px;min-width: 600px }#helperContainer .showaboutus {width: 40em;height: 18em;margin: 1em auto;overflow: hidden;background: white;position: relative;box-sizing: border-box }#helperContainer .marquee {top: 6em;position: relative;box-sizing: border-box;animation: marquee 15s linear infinite }#helperContainer .marquee:hover {animation-play-state: paused }@keyframes marquee {0% {top: 8em }100% {top: -31em }}#helperContainer .showaboutus .marquee {margin: 0;padding: 0 1em;line-height: 1.5em;font: 1em Tahoma, Helvetica, Sans-Serif }#helperContainer .showaboutus:before, #helperContainer .showaboutus::before, #helperContainer .showaboutus:after, #helperContainer .showaboutus::after {left: 0;z-index: 1;content: '';position: absolute;pointer-events: none;width: 100%;height: 2em;background-image: linear-gradient(180deg, #FFF, rgba(255, 255, 255, 0)) }#helperContainer showaboutus:after, #helperContainer .showaboutus::after {bottom: 0;transform: rotate(180deg) }#helperContainer .showaboutus:before, #helperContainer .showaboutus::before {top: 0 }#helperContainer .modal-body {max-height: unset !important;}#helperContainer .nav {padding-left: 0 !important;padding-right: 0 !important;}#helperContainer .active a {display: block;width: 100%;}#helperContainer li a {text-indent: 10px;}#helperContainer .panel-body {padding: 0;}#helperContainer .title {width: 91%;float: left;}#helperContainer .other-video {background: #efefef;padding: 10px;border-radius: 3px;}#helperContainer .nav-pills > li + li {margin-left: 0px;}.tree, .tree ul {margin: 0;padding: 0;list-style: none;direction: ltr;font-size: 15px;background-color: #f8f8f8;}.tree ul {margin-left: 1em;position: relative }.tree ul ul {margin-left: .5em }.tree ul:before {content: "";display: block;width: 0;position: absolute;top: 0;bottom: 0;right: 0;border-left: 1px solid;color: rgba(0, 0, 0, 0.51);}.tree li {margin: 0;padding: 0 1em;line-height: 2em;color: #369;font-weight: 700;position: relative }.tree ul li:before {content: "";display: block;width: 10px;height: 0;border-top: 1px solid;margin-top: -1px;position: absolute;top: 1em;right: 0;color: rgba(0, 0, 0, 0.51);}.tree ul li:last-child:before {background: #f8f8f8;height: auto;top: 1em;bottom: 0 }.indicator {margin-right: 5px;float: right;padding-left: 6px;margin-top: 7px;color: rgba(0, 0, 0, 0.51);}.tree li a {text-decoration: none;color: #369;}.tree li button, .tree li button:active, .tree li button:focus {text-decoration: none;color: #369;border: none;background: transparent;margin: 0px 0px 0px 0px;padding: 0px 0px 0px 0px;outline: 0;}.bg-gray {background-color: #cccccc75;}.oStyle {padding: 20px;border-top: 1px solid #adada5ab;border-right: 1px solid #adada5ab;border-radius: 2px;border-left: 1px solid #d2d2d1;border-bottom: 1px solid #d2d2d1;box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.2), 0 1px 0px 0 rgba(0, 0, 0, 0.19);}.vtitle {padding: 10px 0;font-size: 20px;}.cvideo {padding: 10px 0;font-size: 13px;}.indicator-text {color: #000;}
        </style>
    {/literal}
        <div id="helperContainer" class='fc-overlay-modal modal-content' style="height:100%;">
            <div class="overlayHeader">
                {assign var=HEADER_TITLE value="ParsVT Helper"}
                {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
            </div>
            <hr style="margin:0px;">
            <div class='modal-body overflowYAuto'>
                <div class='datacontent'>
                    <div class="row">
                        <div class="col-lg-12">

                            <table class="massEditTable table table-bordered" style="width: 100%">
                                <tbody>
                                <tr>
                                    <td class="fieldLabel">
                                        <span><strong>{vtranslate('Step 2',$MODULE)}</strong></span>
                                        &nbsp;:&nbsp;
                                        {vtranslate('Select the phone number fields to send',$MODULE)}<span
                                                class="redColor">*</span>
                                    </td>
                                    <td class="fieldValue">
                                        <div class="col-md-5">

                                            <input type="text" id="faxPicklistUis" value=""
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

                        </div>
                    </div>
                </div>
                <div style="min-height: 50px"></div>
            </div>
        </div>
        </div>
        <script>
            var PVTHelpers = {
                tr1: "{vtranslate('Related Videos', $MODULE)}",
                tr2: "{vtranslate('Ticket was successfully sent', $MODULE)}",
                tr3: "{vtranslate('Send new ticket failed', $MODULE)}",
                tr4: "{vtranslate('View ticket', $MODULE)}",
                tr5: "{vtranslate('Main Menu', $MODULE)}",
                tr6: "{vtranslate('Video Tutorials', $MODULE)}",
                tr7: "{vtranslate('Submit Support Ticket', $MODULE)}",
                tr8: "{vtranslate('Update videos', $MODULE)}",
                tr9: "{vtranslate('Other videos of this section', $MODULE)}",
            };
        </script>
    {/strip}
{*
<div id="sendfaxContainer" class='modelContainer col-sm-12 col-xs-12 content-area ' data-max="{$MAXPDF}">
    <div id="FaxModalContainer" class="modal-dialog FaxModal" style="min-width:900px">
        {assign var=HEADER_TITLE value={vtranslate('Send Fax', $QUALIFIED_MODULE)}}
        {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
        <div class="modal-content">
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
                                <div class="col-md-4">
                                    <select class="inputElement select2 select2-offscreen" name="provider"
                                            id="providerName"
                                            data-validation-engine='validate[required]'>
                                        {foreach from=$AVALIABLEPROVIDERS item=label key=key}
                                            <option value="{vtranslate($label, $MODULE)}">{vtranslate($label, $MODULE)}</option>
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
                                <input type="text" id="picklistUi" value="{$NUMS}"
                                       class="row-fluid autoComplete sourceField span7 select2 col-md-8" name="numbers"
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
                                onclick="javascript:ParsFax.registerSelectTemplate();" data-url="module=EmailTemplates&view=Popup"
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
                <div class="modal-overlay-footer clearfix">
                    <div class="row clearfix">
                        <div class="textAlignCenter col-lg-12 col-md-12 col-sm-12 ">
                            <button class="btn btn-success saveButton" type="submit"><strong>{vtranslate('Send', $MODULE)}</strong>
                            </button>&nbsp;&nbsp;
                            <a class="cancelLink" type="reset"
                               onclick="javascript:jQuery('.modal').modal('hide');">{vtranslate('Cancel', $MODULE)}</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
*}
{/strip}

{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='SettingsHeader.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<style>
    .modal-content {
        direction: rtl !important;
    }

    code, pre {
        direction: ltr;
        text-align: left;
        background-color: #f7f7f9;
        word-wrap: break-word;
    }

    .formatted code {
        color: #d14;
        padding: 2px 4px;
        font-family: monospace;
        font-size: small;
    }

    .afterlink:after {
        content: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAQElEQVR42qXKwQkAIAxDUUdxtO6/RBQkQZvSi8I/pL4BoGw/XPkh4XigPmsUgh0626AjRsgxHTkUThsG2T/sIlzdTsp52kSS1wAAAABJRU5ErkJggg==);
        margin: 0 5px 0 3px;
        position: relative;
        bottom: -2px;
    }
    ul.moreinfo  {
        list-style-image: url('{vglobal('site_URL')}layouts/v7/skins/images/Circle.png');
    }
    ul.moreinfo li  {
        padding: 3px 0;
    }
</style>
<div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="MiscGereral">
    <div>
        <div>
            <div class="container-fluid">
                <div class="contents">
                    <br>
                </div>
                <div class="container-fluid">
                    <div class="related-tabs">
                        <div class="row form-group">
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>{vtranslate('Settings',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('Custom Handlers Manual',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showMarkDown('CustomHandlers');">
                                            </div>
                                            <input style="opacity: 0;" {if $HANDLERS} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="HANDLERS"/>
                                            {vtranslate('Register Custom Handlers',$QUALIFIED_MODULE)}
                                        </li>
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('Expressions Manual',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showMarkDown('Expressions');">
                                            </div>
                                            <input style="opacity: 0;" {if $VTExpressionEvaluater eq 0 } value='0' {else} value='1' checked{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="VTExpressionEvaluater"/>
                                            {vtranslate('Extra Vtiger Expressions',$QUALIFIED_MODULE)}
                                        </li>
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('ParsVT Restful API',$QUALIFIED_MODULE)}{/if}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showHelp('{vtranslate('ParsVT Restful API',$QUALIFIED_MODULE)}','{if $RESTAPI}index.php?module=ParsVT&view=RestAPI&parent=Settings{else}https://parsvt.com/rest-api-v2-guide/{/if}');">
                                            </div>
                                            <input style="opacity: 0;" {if $RESTAPI eq 0 } value='0' {else} value='1' checked{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="RESTAPI"/>
                                            {vtranslate('ParsVT Restful API',$QUALIFIED_MODULE)}
                                        </li>
                                        {if $SQLREPORT}
                                            <li>
                                                <div class="cursorPointer"
                                                     style="display: inline-block; vertical-align: middle;">
                                                    <img class="alignMiddle" data-toggle="tooltip"
                                                         title="{vtranslate('SQL Reports Module',$QUALIFIED_MODULE)}"
                                                         src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                         onclick="ParsVTMisc.showMarkDown('SQLReports');">
                                                </div>
                                                <input style="opacity: 0;" {if $SQLREPORT2} value='1'  checked{else} value='0'{/if}
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                       data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                       data-on-color="primary" data-toggle="toggle" data-type="SQLREPORT"/>
                                                {vtranslate('SQL Reports Module',$QUALIFIED_MODULE)}
                                            </li>
                                        {/if}
                                    </ul>
                                    <dl class="pvtdash">
                                        {if !$SQLREPORT}
                                        <dt>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('SQL Reports Module',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showMarkDown('SQLReports');">
                                            </div>
                                            <button class="btn btn-info" type="button" onclick="ParsVTMisc.showSQLReports();">{vtranslate('Install SQL Reports Module', $QUALIFIED_MODULE)}</button>
                                        </dt>
                                        <dd>
                                            {vtranslate('SQL Reports allows a user to create completely custom reports using native SQL',$QUALIFIED_MODULE)}
                                        </dd>
                                        {/if}
                                        {if $RESTAPI neq 0 }
                                        <dt>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('Custom APIs Manual',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showMarkDown('CustomAPIs');">
                                            </div>
                                            <button class="btn btn-info"
                                                    type="button" {$MODULE_MODEL->getCAPIsUrl()}>{vtranslate('Register Custom WebService APIs', $QUALIFIED_MODULE)}</button>
                                        </dt>
                                        <dd>
                                            {vtranslate('Register your custom APIs to use at webservice',$QUALIFIED_MODULE)}
                                        </dd>
                                        {/if}
                                        <dt>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('Custom Functions Manual',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showMarkDown('CustomFunctions');">
                                            </div>
                                            <button class="btn btn-info"
                                                    type="button" {$MODULE_MODEL->getCFUrl()}>{vtranslate('Register Custom Functions', $QUALIFIED_MODULE)}</button>
                                        </dt>
                                        <dd>
                                            {vtranslate('Register your custom functions to invoke at workflow',$QUALIFIED_MODULE)}
                                        </dd>
                                        <dt>
                                            <button class="btn btn-info" onclick="ParsVTMisc.showHelp('{vtranslate('LBL_MAIL_SERVER_SMTP',"Settings:Vtiger")}','modules/ParsVT/resources/Mailserver/outgoingserver.php');" type="button" >{vtranslate('LBL_MAIL_SERVER_SMTP', "Settings:Vtiger")}</button>
                                        </dt>
                                        <dd>
                                            {vtranslate('LBL_MAIL_SERVER_DESCRIPTION','Settings:Vtiger')}
                                        </dd>
                                    </dl>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('Console Tool Manual',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showMarkDown('ConsoleTool');">
                                            </div>
                                            <input style="opacity: 0;" value='1' checked disabled readonly
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary"/>
                                            {vtranslate('Console Tool',$QUALIFIED_MODULE)}
                                        </li>
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('ModuleLinkCreator',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showHelp('{vtranslate('ModuleLinkCreator',$QUALIFIED_MODULE)}','https://www.aparat.com/video/video/embed/videohash/E8tig/vt/frame');">

                                            </div>
                                            <input style="opacity: 0;" {if $MODULELINKCREATER}value='1'  checked{else}value='0'{/if} disabled readonly
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary"/>
                                            <a href="{if $MODULELINKCREATER}index.php?module=ModuleLinkCreator&view=List{else}https://vtfarsi.ir/product/%D9%85%D8%A7%DA%98%D9%88%D9%84-%D8%B3%D8%A7%D8%B2-%D9%88%DB%8C%D8%AA%D8%A7%DB%8C%DA%AF%D8%B1/{/if}" target="_blank">{vtranslate('ModuleLinkCreator',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('WebHook',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showHelp('{vtranslate('WebHook',$QUALIFIED_MODULE)}','{if $WEBHOOK}index.php?module=WebHook&parent=Settings&view=Development{else}https://vtfarsi.ir/product/vtiger-webhook/{/if}');">
                                            </div>
                                            <input style="opacity: 0;" {if $WEBHOOK}value='1'  checked{else}value='0'{/if} disabled readonly
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary"/>
                                            <a href="{if $WEBHOOK}index.php?module=WebHook&parent=Settings&view=Settings{else}https://vtfarsi.ir/product/vtiger-webhook/{/if}" target="_blank">{vtranslate('WebHook',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('Language Editor',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showHelp('{vtranslate('Language Editor',$QUALIFIED_MODULE)}','https://www.aparat.com/video/video/embed/videohash/GtCea/vt/frame');">
                                            </div>
                                            <input style="opacity: 0;" value='1' checked disabled readonly
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary"/>
                                            <a href="index.php?module=ParsVT&view=LanguageEditor&parent=Settings" target="_blank">{vtranslate('Language Editor',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('Debugging Techniques Manual',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showMarkDown('Debug');">
                                            </div>
                                            <input style="opacity: 0;" {if $DEBUGMODE || $DEBUGMODE2}value='1'  checked{else}value='0'{/if} {if $DEBUGMODE2}disabled readonly{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary"  data-toggle="toggle" data-type="DEBUG"/>
                                            {vtranslate('Debugging techniques and tools',$QUALIFIED_MODULE)}
                                        </li>
                                        <li>
                                            <div class="cursorPointer"
                                                 style="display: inline-block; vertical-align: middle;">
                                                <img class="alignMiddle" data-toggle="tooltip"
                                                     title="{vtranslate('Other Development Guidance',$QUALIFIED_MODULE)}"
                                                     src="layouts/vlayout/skins/images/circle_question_mark.png"
                                                     onclick="ParsVTMisc.showMarkDown('Other');">
                                            </div>
                                            <input style="opacity: 0;" value='1' checked disabled readonly
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary"/>
                                            {vtranslate('Other Development Guidance',$QUALIFIED_MODULE)}
                                        </li>
                                    </ul>
                                </fieldset>
                            </div>
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;&nbsp;{vtranslate("More Information", $QUALIFIED_MODULE)}
                                    </legend>
                                    <ul style="padding: 0 20px;" class="moreinfo">
                                        <li>&nbsp;&nbsp;<a target="_blank" href="index.php?module=ParsVT&view=MoreInfo&parent=Settings">{vtranslate('VTFarsi Marketplace',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="https://marketplace.vtiger.com/">{vtranslate('LBL_EXTENSION_STORE',"Settings:ModuleManager")}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="http://forum.vtfarsi.ir/">{vtranslate('Ask the Community',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="http://vtfarsi.ir/crm-wiki/">{vtranslate('Read our Docs',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="http://vtfarsi.ir/vtiger-crm-book/">{vtranslate('Read our Book',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="https://community.vtiger.com/help/vtigercrm/developers/index.html">{vtranslate('Vtiger Developer Guide',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="https://help.vtiger.com/">{vtranslate('Vtiger Wiki',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="https://wiki.vtiger.com/vtiger6/">{vtranslate('Vtiger 6 Wiki',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="https://discussions.vtiger.com/">{vtranslate('Vtiger forum',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="http://my.vtfarsi.ir/submitticket.php">{vtranslate('Open Ticket',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a href="tel:03191007878">{vtranslate('Phone Support',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="http://vtfarsi.ir/">{vtranslate('Live Support',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li>&nbsp;&nbsp;<a target="_blank" href="index.php?parent=Settings&amp;module={$MODULE}&amp;view=Upgrade">{vtranslate('Check for Update',$QUALIFIED_MODULE)}</a>
                                        </li>
                                    </ul>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    {if $DEBUGMODE || $DEBUGMODE2}
                    <div class="row form-group">
                        <div  class="col-md-12" id="ParsVTToolsSettingsMainPanel">
                            <fieldset class="vtToolBox">
                                <legend>
                                    <i class="{$TOOL->getIcon()}"></i>&nbsp;&nbsp; {vtranslate($TOOL->getLabel(), $MODULE)}
                                </legend>
                                {if isset($ALERT)}
                                    <div class="tool-alert">{$ALERT}</div>
                                {/if}
                                <div class="tool-panel">
                                    {$TOOL->showPanel($DATA)}
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>

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
    {include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
    <div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="ParsFaxModulesContent">

        <div class="container-fluid">
            <div class="related-tabs">
                <div class="row form-group">
                    <div class="col-md-6">
                        <fieldset class="vtToolBox">
                            <legend>{vtranslate('Send Fax in Entity Modules',$QUALIFIED_MODULE)}</legend>
                            <ul class="list-unstyled pvtdash" style="line-height:200%">
                                {foreach from=$MODULE_MODEL->getModules(1) key=modulename item=module}
                                    <li data-toggle="tooltip" title="{vtranslate($modulename,$QUALIFIED_MODULE)}">
                                        <input style="opacity: 0;" {if $module['enabled']} value='1'  checked {else} value='0'{/if}
                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                               data-on-color="primary" data-toggle="toggle"
                                               data-tabid="{$module['tabid']}"/>
                                        &nbsp;&nbsp;{vtranslate($modulename,$QUALIFIED_MODULE)}</li>
                                {/foreach}
                            </ul>
                        </fieldset>
                        <fieldset class="vtToolBox">
                            <legend>{vtranslate('Send Fax in Inventory Modules',$QUALIFIED_MODULE)}</legend>
                            <ul class="list-unstyled pvtdash" style="line-height:200%">
                                {foreach from=$MODULE_MODEL->getModules(2) key=modulename item=module}
                                    <li data-toggle="tooltip" title="{vtranslate($modulename,$QUALIFIED_MODULE)}">
                                        <input style="opacity: 0;" {if $module['enabled']} value='1'  checked {else} value='0'{/if}
                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                               data-on-color="primary" data-toggle="toggle"
                                               data-tabid="{$module['tabid']}"/>
                                        &nbsp;&nbsp;{vtranslate($modulename,$QUALIFIED_MODULE)}</li>
                                {/foreach}
                            </ul>
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <fieldset class="vtToolBox">
                            <legend>
                                <i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate("Fax Modules Help", $QUALIFIED_MODULE)}
                            </legend>
                            <p>
                                {vtranslate('LBL_FAX_MODULES_HELP',$QUALIFIED_MODULE)}<br/>
                            </p>
                        </fieldset>
                    </div>
                </div>

            </div>
        </div>
    </div>
{/strip}

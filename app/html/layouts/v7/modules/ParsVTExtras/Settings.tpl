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

<div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="ParsVTExtraSettings">
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
                                        <li data-toggle="tooltip" title="{vtranslate('Mention Users',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $MENTION} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="MENTIONS"/>
                                            {vtranslate('Mention Users',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('Auto Create Comment from Activities',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $AUTOCREATECOMMENT} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="LTV"/>
                                            {vtranslate('Vtiger Comments from Activities',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('LifeTime value Calculator',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $LTV} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="LTV"/>
                                            {vtranslate('LifeTime value Calculator',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('Export To Excel',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $EXPORTTOEXCEL} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="EXPORTXLS"/>
                                            {vtranslate('Export To Excel',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('Keyboard Junkie',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $KEYBOARDJUNKIE} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="KEYBOARDJUNKIE"/>
                                            {vtranslate('Keyboard Junkie',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('Tabulation allows administrator to personalize record layout of any module by switching blocks into tabs',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;"   {if $TABULATION}value='1'  checked{else}value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="TABULATION" />
                                            <a href="index.php?module=LayoutEditor&parent=Settings&view=Index" target="_blank">{vtranslate('Tabulation',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip" title="{vtranslate('Modules Relationship',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;"   {if $SHOWRELATIONS}value='1'  checked{else}value='0'{/if} disabled readonly
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"/>
                                            <a href="index.php?module=LayoutEditor&parent=Settings&view=Index" target="_blank">{vtranslate('Modules Relationship',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Related Field Generator',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" value='1'  checked disabled readonly
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"/>
                                            <a href="index.php?parent=Settings&module={$QUALIFIED_MODULE}&view=RelatedFields">{vtranslate('Related Field Generator',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Ariana TTS',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $ARIANATTS} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"  data-type="ARIANATTS"/>
                                                   {vtranslate('Ariana TTS',$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Module Uninstaller',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $UNINSTALLER} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"  data-type="UNINSTALLER"/>
                                            <a href="index.php?module=ModuleManager&parent=Settings&view=List" target="_blank">{vtranslate('Module Uninstaller',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Enable SMS Campaign',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $SENDCAMPAIGNSMS} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"  data-type="SENDCAMPAIGNSMS"/>
                                            <a href="index.php?parent=Settings&module=Workflows&view=List&sourceModule=Campaigns" target="_blank">{vtranslate('Enable SMS Campaign',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Allow Setup Webforms for all entity modules',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $WEBFORM} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"  data-type="WEBFORMS"/>
                                            <a href="index.php?module=ModuleManager&parent=Settings&view=List" target="_blank">{vtranslate('Allow Setup Webforms for all entity modules',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip" title="{vtranslate('Funnel Extended',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $FUNNELEXTENDED} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FUNNELEXTENDED"/>
                                            {vtranslate('Funnel Extended Widget',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('Crypto Currencies',$QUALIFIED_MODULE)}">
                                        <li data-toggle="tooltip" title="{vtranslate('Gold Price',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $Gold} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="Gold"/>
                                            {vtranslate('Gold Price Widget',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('Currencies Price',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $Currency} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="Currency"/>
                                            {vtranslate('Currencies Price Widget',$QUALIFIED_MODULE)}</li>
                                        <input style="opacity: 0;" {if $CRYPTOCURRENCIES} value='1'  checked{else} value='0'{/if}
                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                               data-on-color="primary" data-toggle="toggle" data-type="CRYPTOCURRENCIES"/>
                                        {vtranslate('Crypto Currencies Widget',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Vtiger Updater',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" value='1'  checked disabled readonly
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"/>
                                            <a href="index.php?parent=Settings&module={$QUALIFIED_MODULE}&view=Upgrade">{vtranslate('Vtiger Updater',$QUALIFIED_MODULE)}</a>
                                        </li>
                                    </ul>
                                </fieldset>
                            </div>
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate("Features", $QUALIFIED_MODULE)}
                                    </legend>
                                    <p style="margin:0;">
                                        {vtranslate('Mention Users',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Enable Export To Excel in Filters',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Funnel Extended On Dashboard',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Keyboard shortcuts',$QUALIFIED_MODULE)}
                                    </p>
                                    <p   style="margin:0; padding:0 20px; font-style: italic">
                                        <strong>{vtranslate('In List view:',$QUALIFIED_MODULE)}</strong> <br />
                                        {vtranslate('Page Up/Page Down to page through the listing',$QUALIFIED_MODULE)} <br />
                                        {vtranslate('Ctrl+A to add a new item to the list',$QUALIFIED_MODULE)} <br />
                                        <strong>{vtranslate('In Detail view:',$QUALIFIED_MODULE)}</strong> <br />
                                        {vtranslate('Ctrl+E to edit',$QUALIFIED_MODULE)} <br />
                                        {vtranslate('Ctrl+D to duplicate',$QUALIFIED_MODULE)} <br />
                                        {vtranslate('Page up/Page down to navigate through the related items',$QUALIFIED_MODULE)} <br />
                                        {vtranslate('Right/Left to move to the next or previous entry',$QUALIFIED_MODULE)} <br />
                                        <strong>{vtranslate('In Edit view:',$QUALIFIED_MODULE)}</strong> <br />
                                        {vtranslate('Ctrl+S to save',$QUALIFIED_MODULE)} <br />
                                        <strong>{vtranslate('Everywhere:',$QUALIFIED_MODULE)}</strong> <br />
                                        {vtranslate('Ctrl+K to go to the list view',$QUALIFIED_MODULE)} <br />
                                        {vtranslate('Escape to go back to the previous screen',$QUALIFIED_MODULE)}
                                    </p>
                                    <p   style="margin:0;">
                                    {vtranslate('Relationships link two different modules and relate records between them.',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Create Related Field',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Advanced Module Uninstaller',$QUALIFIED_MODULE)}<br />
                                        {vtranslate('Update Vtiger And Fix Bugs',$QUALIFIED_MODULE)}<br/>
                                    </p>
                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

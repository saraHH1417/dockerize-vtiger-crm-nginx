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
    <ul class="nav nav-tabs nav-pills codecolor massEditTabs" style="margin-bottom: 0;border-bottom: 0">
        {foreach item=LANG_INFO key=ID name=LANG from=$LANGUAGES}
            {if $LANG_INFO['active'] eq 1}
                
                <li {if $smarty.foreach.LANG.first}class="active"{/if} data-toggle="tooltip" title="{vtranslate(str_replace(";amp","",html_entity_decode($LANG_INFO['label'])), $QUALIFIED_MODULE)}">
                    <a href="#{$LANG_INFO['prefix']}" data-toggle="tab">
                        <strong>{$LANG_INFO['prefix']}</strong>
                    </a>
                </li>
            {/if}
        {/foreach}
    </ul>
    <div class="tab-content layoutContent padding20 themeTableColor overflowVisible">
        <br>
        {foreach item=LANG_INFO key=ID name=LANG from=$LANGUAGES}
            {if $smarty.foreach.LANG.first}
                <div class="tab-pane active" id="{$LANG_INFO['prefix']}">
                {/if}
                {if !$smarty.foreach.LANG.first}
                    <div class="tab-pane" id="{$LANG_INFO['prefix']}">
                    {/if}
                    <div class="row-fluid">
                        <div class="col-lg-12 col-md-12 col-sm-12 marginLeftZero textOverflowEllipsis">
                            <table id="pickListValuesTable" class="table table-bordered" style="table-layout: fixed">
                                <thead>
                                    <tr class="listViewHeaders">
                                        <th style="border-right: none">{vtranslate('Values',$QUALIFIED_MODULE)}</th>
                                        <th style="border-left: none">{vtranslate('Translation', $QUALIFIED_MODULE)}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {assign var=PICKLIST_VALUES value=$SELECTED_PICKLISTFIELD_ALL_VALUES}
                                    {foreach key=PICKLIST_KEY item=PICKLIST_VALUE from=$PICKLIST_VALUES}
                                        <tr class="pickListValue" data-key-id="{$PICKLIST_KEY}" data-key="{Vtiger_Util_Helper::toSafeHTML($PICKLIST_VALUE)}" data-lang="{$LANG_INFO['prefix']}"
                                            data-langtranslate="{htmlspecialchars(Vtiger_Language_Handler::getLanguageTranslatedString($LANG_INFO['prefix'],$PICKLIST_VALUE,$SELECTED_MODULE_NAME))}">
                                            <td class="textOverflowEllipsis" style="border-right: none">{$PICKLIST_VALUE}</td>
                                            <td style="border-left: none">
                                                <input type="text" class="inputElement pickListTranslation" value="{htmlspecialchars(Vtiger_Language_Handler::getLanguageTranslatedString($LANG_INFO['prefix'],$PICKLIST_VALUE,$SELECTED_MODULE_NAME))}">
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    {/strip}
<SCRIPT>
jQuery(document).ready(function(){
	vtUtils.enableTooltips();
});
</SCRIPT>
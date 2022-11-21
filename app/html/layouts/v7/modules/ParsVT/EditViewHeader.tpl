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
{include file='SettingsHeader.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<br />
    <div class="container-fluid">
        <div class="contents row-fluid">
            <ul class="nav nav-tabs nav-pills" style="margin-bottom: 0;border-bottom: 0">
                <li class="active"><a href="index.php?module=ParsVT&parent=Settings&view=LanguageEditor#allLanguages"><strong>{vtranslate('Available Languages',$QUALIFIED_MODULE)}</strong></a></li>
                <li><a href="index.php?module=ParsVT&parent=Settings&view=LanguageEditor#picklistTranslation""><strong>{vtranslate('Picklist Translation',$QUALIFIED_MODULE)}</strong></a></li>
                <li><a href="index.php?module=ParsVT&view=LanguageEditor&parent=Settings#LabelEditor"><strong>{vtranslate('Label Editor',$QUALIFIED_MODULE)}</strong></a></li>
            </ul>
            <hr>
            <div class="widget_header row-fluid">
                <span class="widget_header row-fluid span10">
                    <div class="row-fluid"><h3>{vtranslate('Language',$QUALIFIED_MODULE)} {vtranslate($LANG_LABEL,$QUALIFIED_MODULE)}</h3></div>
                </span>                 
            </div>
            <hr>
            <form>
                <input class="inputElement" type="hidden" name="langPrefix" id="langPrefix" value="{$LANG_PREFIX}">
                <table id="selectingLanguage" class="table table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th colspan="6"><label class="pull-left"><b>{vtranslate("Language editor settings",$QUALIFIED_MODULE)}</b></label></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="medium">
                                <label class="pull-right">{vtranslate("Preview language",$QUALIFIED_MODULE)}:</label>
                            </td>
                            <td class="medium" style="border-left: none">
                                <select class="select2 inputElement typeSelect span8" id="SelectLanguage" name="SelectLanguage">
                                    <option value="none">{vtranslate("-- None --",$QUALIFIED_MODULE)}</option>
                                    {foreach item=LANG_INFO key=ID from=$LANGUAGES}
                                        {if $LANG_INFO['active'] eq 1}
                                            <option value="{$LANG_INFO['prefix']}">{vtranslate(str_replace(";amp","",html_entity_decode($LANG_INFO['name'])), $QUALIFIED_MODULE)}</option>
                                        {/if}
                                    {/foreach}
                                </select>
                            </td>
                            <td class="medium" style="border-left: none">
                                <label class="pull-right">{vtranslate("Module",$QUALIFIED_MODULE)}:</label>
                            </td>
                            <td class="medium" style="border-left: none">
                                <select class="select2 inputElement typeSelect span8" id="SelectModule" name="SelectModule">
                                    <option value="none">{vtranslate("LBL_SELECT_OPTION", $QUALIFIED_MODULE)}</option>
                                    <optgroup style="border: none" label="{vtranslate('Global language', $QUALIFIED_MODULE)}">
                                        {foreach item=NAME key=KEY from=$GLOBAL_LANG}
                                            <option value="g_{$NAME}">{vtranslate($NAME)}</option>
                                        {/foreach}
                                    </optgroup>
                                    <optgroup style="border: none" label="{vtranslate('Modules', $QUALIFIED_MODULE)}">
                                        {foreach item=MOD_NAME key=KEY from=$MODULES}
                                            <option value="m_{$MOD_NAME}">{vtranslate($MOD_NAME,$MOD_NAME)}</option>
                                        {/foreach}
                                    </optgroup>
                                    <optgroup style="border: none" label="{vtranslate('Setting', $QUALIFIED_MODULE)}">
                                        {foreach item=S_M_NAME key=KEY from=$SETTINGS_MODULES}
                                            <option value="s_{$S_M_NAME}">{vtranslate($S_M_NAME,'Settings:'|cat:$S_M_NAME)}</option>
                                        {/foreach}
                                    </optgroup>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="medium">
                                <label class="pull-right">{vtranslate("Search translation",$QUALIFIED_MODULE)}:</label>
                            </td>
                            <td class="medium" style="border-left: none"> 
                                <div class="row-fluid input-prepend input-append">
                                    <input type="text" name="transSearch" id="trans_search" class="inputElement">
                                    <span class="add-on">
                                        <i id="clear_trans_search" class="icon-remove-sign" title="Clear"></i>
                                    </span>
                                </div>
                            </td>
                            <td class="medium" style="border-left: none">
                                <label class="pull-right">{vtranslate("Only missing translation",$QUALIFIED_MODULE)}:</label>
                            </td>
                            <td class="medium" style="border-left: none">
                                <input type="checkbox" name="missingTrans" id="missingTrans" >
                            </td>
                        </tr>                        
                    </tbody>
                </table>
            </form>
        </div>
        <div class="clearfix"></div>
        <hr>        
        <div class="listViewContentDiv" id="listViewContents">
              
        {/strip}
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
            <ul class="nav nav-tabs nav-pills massEditTabs" style="margin-bottom: 0;border-bottom: 0">
                <li id="allLanguagesMenu" class="active"><a href="#allLanguages" data-toggle="tab"><strong>{vtranslate('Available Languages',$QUALIFIED_MODULE)}</strong></a></li>
                <li id="picklistTranslationMenu"><a href="#picklistTranslation" data-toggle="tab"><strong>{vtranslate('Picklist Translation',$QUALIFIED_MODULE)}</strong></a></li>
                <li id="LabelEditorMenu"><a href="#LabelEditor" data-toggle="tab"><strong>{vtranslate('Label Editor',$QUALIFIED_MODULE)}</strong></a></li>
            </ul>
            <hr>
            <div class="tab-content layoutContent padding20 themeTableColor overflowVisible">
                <div class="tab-pane active" id="allLanguages">	
                    <div class="row-fluid">
                        <div class="col-lg-12 col-md-12 col-sm-12" id="LangTab">
                            <div class="pull-left">
                                <button class="btn addButton" name="createLangButton" id="createLangButton">
                                    <i class="icon-plus"></i>&nbsp;
                                    <strong>{vtranslate('Create new language', $QUALIFIED_MODULE)}</strong>
                                </button>
                            </div>
                            <br><br>
                            <table id="AllLanguagesTable" class="table table-condensed table-hover text-center" style="table-layout: fixed">
                                <thead>
                                    <tr>
                                        <th class="text-center">{vtranslate('Language',$QUALIFIED_MODULE)}</th>
                                        <th class="text-center">{vtranslate('Name',$QUALIFIED_MODULE)}</th>
                                        <th class="text-center">{vtranslate('Code', $QUALIFIED_MODULE)}</th>
                                        <th colspan="3" class="text-center">{vtranslate('Actions', $QUALIFIED_MODULE)}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach item=LANG_INFO key=ID from=$LANGUAGES}
                                        <tr class="listViewEntries" data-prefix='{$LANG_INFO['prefix']}' 
                                            data-label='{$LANG_INFO['label']}' data-name='{$LANG_INFO['name']}' data-recordurl="index.php?module=ParsVT&parent=Settings&view=EditLanguage&langPrefix={$LANG_INFO['prefix']}">
                                            <td class="listViewEntrie medium">{vtranslate(str_replace(";amp","",html_entity_decode($LANG_INFO['name'])), $QUALIFIED_MODULE)}</td>
                                            <td class="listViewEntrie medium">{vtranslate(str_replace(";amp","",html_entity_decode($LANG_INFO['label'])), $QUALIFIED_MODULE)}</td>
                                            <td class="listViewEntrie medium">{$LANG_INFO['prefix']}</td>
                                            <td class="medium" style="border-right:none">
                                                <div class="pull-right">
                                                    {if $LANG_INFO['active'] eq 0}
                                                        <button class="btn btn-danger langButton">
                                                            {vtranslate('Inactive', $QUALIFIED_MODULE)}
                                                        </button>
                                                    {else}
                                                        {if $LANG_INFO['prefix'] eq "en_us"}
                                                            <button class="btn btn-info" >
                                                                {vtranslate('Default', $QUALIFIED_MODULE)}
                                                            </button>
                                                        {else}
                                                            <button class="btn btn-success langButton">
                                                                {vtranslate('Active', $QUALIFIED_MODULE)}
                                                            </button>
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </td>
                                            <td class="listViewEntrie medium" style="border-left:none"  colspan="2">
                                                <div class="pull-left">

                                                        <button class="btn btn-primary copyLanguage" style="width: 100px" type="button">
                                                            {vtranslate('Copy', $QUALIFIED_MODULE)}
                                                        </button>
                                                   &nbsp;
                                                        {assign var="url" value=$LANGUAGEMODEL->getEditViewUrl()}
                                                        <a href="{$url}&langPrefix={$LANG_INFO['prefix']}" class="btn btn-primary" style="width: 100px">{vtranslate('Edit', $QUALIFIED_MODULE)}</a>
                                                   &nbsp;
                                                        {if !in_array($LANG_INFO['prefix'],$LANGUAGEMODEL->getDefaultLanguages())}
                                                            <button class="btn btn-danger deleteLanguage" style="width: 100px" type="button" data-langprefix="{$LANG_INFO['prefix']}" >
                                                                {vtranslate('Delete', $QUALIFIED_MODULE)}
                                                            </button>
                                                        {/if}
                                                </div>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
                <div class="tab-pane" id="picklistTranslation">
                    <div class="row-fluid">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="row-fluid">
                                <label class="fieldLabel col-lg-3 col-md-3 col-sm-3"><strong>{vtranslate('Select Module',$QUALIFIED_MODULE)} </strong></label>
                                <div class="span6 fieldValue">
                                    <select class="inputElement" id="pickListModules">
                                        <optgroup>
                                            {foreach item=PICKLIST_MODULE from=$PICKLIST_MODULES}
                                                <option {if $SELECTED_MODULE_NAME eq $PICKLIST_MODULE->get('name')} selected="" {/if} value="{$PICKLIST_MODULE->get('name')}">{vtranslate($PICKLIST_MODULE->get('label'),$PICKLIST_MODULE->get('name'))}</option>
                                            {/foreach}	
                                        </optgroup>
                                    </select>
                                </div>
                            </div><br>
                            <div id="modulePickListContainer">
                                {include file="ModulePicklistDetail.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                            </div>
                            <div id="modulePickListValuesContainer">
                                {if empty($NO_PICKLIST_FIELDS)}
                                    {include file="PickListValueDetail.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                                {/if}
                            </div>
                        </div><br>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="tab-pane" id="LabelEditor">
                    <div class="row-fluid">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div id="moduleListLabelEditorContainer">
                                {include file="ListLabel.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                            </div>
                        </div><br>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
{/strip}
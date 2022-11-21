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
                <li><a href="index.php?module=ParsVT&parent=Settings&view=LanguageEditor#allLanguages"><strong>{vtranslate('Available Languages',$QUALIFIED_MODULE)}</strong></a></li>
                <li><a href="index.php?module=ParsVT&parent=Settings&view=LanguageEditor#picklistTranslation""><strong>{vtranslate('Picklist Translation',$QUALIFIED_MODULE)}</strong></a></li>
                <li class="active"><a href="index.php?module=ParsVT&view=LanguageEditor&parent=Settings#LabelEditor"><strong>{vtranslate('Label Editor',$QUALIFIED_MODULE)}</strong></a></li>
            </ul>
            <hr>
            <div class="widget_header row-fluid">
                <span class="widget_header row-fluid col-sm-10">
                    <div class="row-fluid"><h3>{vtranslate('Edit Label For %s in %s language',$QUALIFIED_MODULE ,vtranslate($SELECTED_MODULE_NAME,$SELECTED_MODULE_NAME),vtranslate($LANGUAGECODENAME,$SELECTED_MODULE_NAME))} </h3></div>
                </span>                 
            </div>
            <hr>
              
        <form method="post" action="index.php?module=ParsVT&parent=Settings&action=SaveLabel" id="moduleBlocksAndFields">
            <div class="widget_header row-fluid">
                <span class="col-lg-8">
                </span>

                <span class="col-lg-4">
                    <span class="pull-right">
                        <button class="btn btn-success" type="button"><strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong></button>&nbsp;
                        <a class="cancelLink" id="backLink" type="reset">{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</a>
                    </span>
                </span>
                <div class="clearfix"></div>
            </div>        
            <br>
          <div class="row col-sm-12">
            <div id="moduleBlocks">
                {foreach key=BLOCK_LABEL_KEY item=BLOCK_MODEL from=$BLOCKS}
                    {assign var=FIELDS_LIST value=$BLOCK_MODEL->getLayoutBlockActiveFields()}
                    {assign var=BLOCK_ID value=$BLOCK_MODEL->get('id')}
                    <div id="block_{$BLOCK_ID}" class="editFieldsTable block_{$BLOCK_ID} marginBottom10px border1px {if $IS_BLOCK_SORTABLE} blockSortable{/if}" data-block-id="{$BLOCK_ID}" data-sequence="{$BLOCK_MODEL->get('sequence')}" style="border-radius: 4px 4px 0px 0px;background: white;">
                        <div class="row-fluid layoutBlockHeader">
                            <div class="blockLabel col-sm-5 padding10 marginLeftZero" style="in">
                                <img class="alignMiddle" src="{vimage_path('drag.png')}" />&nbsp;&nbsp;
                                {assign var=STRING value=$BLOCK_LABEL_KEY}
                                {assign var=TRANSLATEDBLOCKSTRING value=Vtiger_Language_Handler::getLanguageTranslatedString($LANGUAGE,$STRING, $SELECTED_MODULE_NAME)}                                
                                {if $TRANSLATEDBLOCKSTRING eq ""}                                    
                                    {assign var=TRANSLATEDBLOCKSTRING value=vtranslate($BLOCK_LABEL_KEY, $SELECTED_MODULE)}
                                {/if}
                                <span><strong>{$TRANSLATEDBLOCKSTRING}</strong></span>
                            </div>
                        </div>
                        <div class="blockFieldsList {if $SELECTED_MODULE_MODEL->isFieldsSortableAllowed($BLOCK_LABEL_KEY)}blockFieldsSortable {/if} row" >
                            <ul name="sortable1" class="connectedSortable col-sm-6" style="list-style-type: none; float: left;min-height: 1px;padding:2px;  width:50%;">
                                {foreach item=FIELD_MODEL from=$FIELDS_LIST name=fieldlist}
                                    {assign var=FIELD_INFO value=$FIELD_MODEL->getFieldInfo()}
                                    {if $smarty.foreach.fieldlist.index % 2 eq 0}
                                        <li>
                                            <div class="opacity editFields marginLeftZero" data-block-id="{$BLOCK_ID}" data-field-id="{$FIELD_MODEL->get('id')}" data-sequence="{$FIELD_MODEL->get('sequence')}">
                                                <div class="row-fluid padding1per">
                                                    <div class="col-sm-11 marginLeftZero" style="word-wrap: break-word;">                                                        
                                                        {assign var=STRING value=$FIELD_MODEL->get('label')}
                                                        {assign var=FIELDID value=$FIELD_MODEL->get('id')}
                                                        {assign var=TRANSLATEDSTRING value=Vtiger_Language_Handler::getLanguageTranslatedString($LANGUAGE,$STRING, $SELECTED_MODULE_NAME)}
                                                        {assign var=FROMLANG value=Vtiger_Language_Handler::getLanguageTranslatedString($LANGUAGE,$STRING, $SELECTED_MODULE_NAME)}
                                                        {if $TRANSLATEDSTRING eq ""}
                                                            {assign var=TRANSLATEDSTRING value=vtranslate($FIELD_MODEL->get('label'), $SELECTED_MODULE)}                                                            
                                                        {/if}
                                                        {foreach foreach name=foreachname item=LABEL key=fieldid from=$FIELDS_LABELS}
                                                            {if $FIELDID eq $fieldid}
                                                                {assign var=TRANSLATEDSTRING value=$LABEL}
                                                            {/if}
                                                        {/foreach}
                                                        {if $FROMLANG eq ""}
                                                            {assign var=FROMLANG value=$TRANSLATEDSTRING}
                                                        {/if}
                                                        <table class="table table-borderless">
                                                            <tr>
                                                                <td style="width: 50%;" class="fieldLabel alignMiddle"><span class="muted pull-left" style="margin-left: 2px;">{$FROMLANG}</span></td>
                                                                <td style="width:50%;" class="fieldValue"><span class="pull-right" style="margin-right: 2px;"><input  class="inputElement" type="text" name="field_{$FIELD_MODEL->get('id')}" value="{$TRANSLATEDSTRING}"></span></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    {/if}
                                {/foreach}
                            </ul>
                            <ul {if $SELECTED_MODULE_MODEL->isFieldsSortableAllowed($BLOCK_LABEL_KEY)}name="sortable2"{/if} class="connectedSortable span6" style="list-style-type: none; margin: 0; float: left;min-height: 1px;padding:2px; width:50%;">
                                {foreach item=FIELD_MODEL from=$FIELDS_LIST name=fieldlist1}
                                    {assign var=FIELD_INFO value=$FIELD_MODEL->getFieldInfo()}
                                    {if $smarty.foreach.fieldlist1.index % 2 neq 0}
                                        <li>
                                            <div class="opacity editFields marginLeftZero" data-block-id="{$BLOCK_ID}" data-field-id="{$FIELD_MODEL->get('id')}" data-sequence="{$FIELD_MODEL->get('sequence')}">
                                                <div class="row-fluid padding1per">
                                                    <div class="col-sm-11 marginLeftZero" style="word-wrap: break-word;">                                                        
                                                        {assign var=STRING value=$FIELD_MODEL->get('label')}
                                                        {assign var=FIELDID value=$FIELD_MODEL->get('id')}
                                                        {assign var=TRANSLATEDSTRING value=Vtiger_Language_Handler::getLanguageTranslatedString($LANGUAGE,$STRING, $SELECTED_MODULE_NAME)}
                                                        {assign var=FROMLANG value=Vtiger_Language_Handler::getLanguageTranslatedString($LANGUAGE,$STRING, $SELECTED_MODULE_NAME)}
                                                        {if $TRANSLATEDSTRING eq ""}
                                                            {assign var=TRANSLATEDSTRING value=vtranslate($FIELD_MODEL->get('label'), $SELECTED_MODULE)}                                                             
                                                        {/if}
                                                        {foreach foreach name=foreachname item=LABEL key=fieldid from=$FIELDS_LABELS}
                                                            {if $FIELDID eq $fieldid}
                                                                {assign var=TRANSLATEDSTRING value=$LABEL}
                                                            {/if}
                                                        {/foreach}
                                                        <table class="table table-borderless">
                                                            <tr>
                                                                <td style="width: 50%;" class="fieldLabel alignMiddle"><span class="muted pull-left" style="margin-left: 2px;">{$FROMLANG}</span></td>
                                                                <td style="width:50%;" class="fieldValue"><span class="pull-right" style="margin-right: 2px;"><input  class="inputElement" type="text" name="field_{$FIELD_MODEL->get('id')}" value="{$TRANSLATEDSTRING}"></span></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    {/if}
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                {/foreach}
<div class="clearfix"></div>
            </div>
            </div>
            <div class="pull-right">
                <button class="btn btn-success" type="button"><strong>{vtranslate('Save', $QUALIFIED_MODULE)}</strong></button>&nbsp;
                <a class="cancelLink" id="backLink" type="reset">{vtranslate('Cancel', $QUALIFIED_MODULE)}</a>
            </div>
            <input type="hidden" name="Language" value="{$LANGUAGE}">
            <input type="hidden" name="Module" value="{$SELECTED_MODULE_NAME}">
            <input type="hidden" name="settings_block" value="{$SETTINGS_BLOCK}">
            <input type="hidden" name="settings_fieldid" value="{$SETTINGS_FIELDID}">
            <input type="hidden" name="Parent" value="{$PARENT}">
        </form>
    </div>
{/strip}

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
    <input type="hidden" name="for_module_name" id="for_module_name" value="{$FOR_MODULE}">
    <input type="hidden" name="finally_prefix" id="finally_prefix" value="{$FINALLY_PREFIX}">
    {if $NONE_MODULE neq 'none'}
        <script>
            $( document ).ready(function() {
                var selectElement = jQuery('#langForCreateFile');
                vtUtils.showSelect2ElementView(selectElement,{})
            });
        </script>
        {if $FILE_EXIST eq "dontExist"}
            <div class="row-fluid textAlignCenter">
                <span class="lead">{vtranslate('No language file found.', $QUALIFIED_MODULE)}</span>&nbsp;
            </div>
            <br>
            <br>
            <div class="container textAlignCenter">
                <div class="row">
                    <div class="col-sm-12">
                        {if $FILE_WRITEABLE eq 'false'}
                            <span class=" lead alert-danger"
                                  style="padding: 10px">{vtranslate('If you want to create language file you have to change permission for "%s" directory', $QUALIFIED_MODULE, $DIRFILENAME)}
                                &nbsp;</span>
                        {else}
                            <span class="medium">{vtranslate('Create language file from', $QUALIFIED_MODULE)}</span>
                            &nbsp;
                            <select class="select2" id="langForCreateFile" name="langForCreateFile" style="min-width: 300px">
                                {foreach item=LANG_INFO key=ID from=$LANGUAGES}
                                    {if $LANG_INFO['active'] eq 1}
                                        <option value="{$LANG_INFO['prefix']}">{vtranslate(str_replace(";amp","",html_entity_decode($LANG_INFO['name'])), $QUALIFIED_MODULE)}</option>
                                    {/if}
                                {/foreach}
                            </select>
                            &nbsp;&nbsp;
                            <button class="btn btn-primary" id="createLangFile">
                                {vtranslate('Create file', $QUALIFIED_MODULE)}
                            </button>
                        {/if}
                    </div>
                </div>
            </div>
        {else}
            {if $FILE_WRITEABLE eq 'false'}
                <br>
                <br>
                <div class="row-fluid textAlignCenter">
                    <span class=" lead alert-danger"
                          style="padding: 10px">{vtranslate('Wrong file permission. You have to change permission for directory', $QUALIFIED_MODULE)}
                        &nbsp;"{$DIRFILENAME}"</span>
                </div>
            {else}
                <div class="row-fluid">
                    <span class="pull-left">                
                        <button class="btn addNewTranslation addButton" type="button">
                            <i class="icon-plus"></i>&nbsp;
                            <strong>{vtranslate('Add new translation', $QUALIFIED_MODULE)}</strong>
                        </button>
                    </span>
                    <br><br>
                </div>
                {if $NONE neq 'none'}
                    {assign var=LANGTABLEWIDTH value='3'}
                {else}
                    {assign var=LANGTABLEWIDTH value='2'}
                {/if}
                <table class="table table-bordered table-condensed" id="lngeditor">
                    <thead>
                    <tr>
                        <th class="col-lg-{$LANGTABLEWIDTH} col-md-{$LANGTABLEWIDTH} col-sm-{$LANGTABLEWIDTH}"
                            style="border-right: none">
                            <label><b>{vtranslate('Language variable', $QUALIFIED_MODULE)}</b></label></th>
                        <th class="col-lg-2 col-md-2 col-sm-2">
                            <label><b>{vtranslate('English language', $QUALIFIED_MODULE)}</b></label></th>
                        {if $NONE neq 'none'}
                            <th class="col-lg-{$LANGTABLEWIDTH} col-md-{$LANGTABLEWIDTH} col-sm-{$LANGTABLEWIDTH}">
                                <label><b>{vtranslate('Preview language', $QUALIFIED_MODULE)} ({$PREVIEW_LANG_PREF})</b></label>
                            </th>
                        {/if}
                        <th class="col-lg-{$LANGTABLEWIDTH} col-md-{$LANGTABLEWIDTH} col-sm-{$LANGTABLEWIDTH}">
                            <label><b>{vtranslate('Current translation', $QUALIFIED_MODULE)} ({$LANG_PREF})</b></label>
                        </th>
                        <th class="col-lg-3 col-md-3 col-sm-3">
                            <label><b>{vtranslate('New translation', $QUALIFIED_MODULE)} ({$LANG_PREF})</b></label></th>
                    </tr>
                    </thead>
                    <tbody>
                    {if $MODE eq 'Edit'}
                        {if empty($SEARCH_ARRAYS)}
                            {if $SEARCH_VALUE eq ""}
                                {foreach item=TRANSLATE key=LANGKEY from=$ALL_LANG_KEYS}
                                    {include file="LangTableContent.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                                {/foreach}
                                {foreach item=JSTRANSLATE key=JSLANGKEY from=$ALL_JSLANG_KEYS}
                                    {include file="JsLangTableContent.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                                {/foreach}
                            {else}
                                <tr class="listViewEntries">
                                    <td class="listViewEntryValue medium" colspan="{if $NONE neq 'none'}5{else}4{/if}"
                                        style="text-align: center">{vtranslate('No found translations', $QUALIFIED_MODULE)}</td>
                                </tr>
                            {/if}
                        {else}
                            {foreach item=TRANSLATE key=LANGKEY from=$SEARCH_ARRAYS['languageStrings']}
                                {include file="LangTableContent.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                            {/foreach}
                            {foreach item=JSTRANSLATE key=JSLANGKEY from=$SEARCH_ARRAYS['jsLanguageStrings']}
                                {include file="JsLangTableContent.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                            {/foreach}
                        {/if}
                    {/if}
                    {if $MODE eq 'missingTranslation'}
                        {if empty($SEARCH_ARRAYS)}
                            {if $SEARCH_VALUE eq ""}
                                {if empty($LANG_DIFF) and empty($JS_LANG_DIFF)}
                                    <tr class="listViewEntries">
                                        <td class="listViewEntryValue medium"
                                            colspan="{if $NONE neq 'none'}5{else}4{/if}"
                                            style="text-align: center">{vtranslate('No missing translations', $QUALIFIED_MODULE)}</td>
                                    </tr>
                                {else}
                                    {foreach item=TRANSLATE key=LANGKEY from=$LANG_DIFF}
                                        {include file="LangTableContent.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                                    {/foreach}
                                    {foreach item=JSTRANSLATE key=JSLANGKEY from=$JS_LANG_DIFF}
                                        {include file="JsLangTableContent.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                                    {/foreach}
                                {/if}
                            {else}
                                <tr class="listViewEntries">
                                    <td class="listViewEntryValue medium" colspan="{if $NONE neq 'none'}5{else}4{/if}"
                                        style="text-align: center">{vtranslate('No found translations', $QUALIFIED_MODULE)}</td>
                                </tr>
                            {/if}
                        {else}
                            {if empty($LANG_DIFF) and empty($JS_LANG_DIFF)}
                                <tr class="listViewEntries">
                                    <td class="listViewEntryValue medium" colspan="{if $NONE neq 'none'}5{else}4{/if}"
                                        style="text-align: center">{vtranslate('No missing translations', $QUALIFIED_MODULE)}</td>
                                </tr>
                            {else}
                                {foreach item=TRANSLATE key=LANGKEY from=$SEARCH_ARRAYS['languageStrings']}
                                    {include file="LangTableContent.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                                {/foreach}
                                {foreach item=JSTRANSLATE key=JSLANGKEY from=$SEARCH_ARRAYS['jsLanguageStrings']}
                                    {include file="JsLangTableContent.tpl"|vtemplate_path:$QUALIFIED_MODULE}
                                {/foreach}
                            {/if}
                        {/if}
                    {/if}
                    </tbody>
                </table>
            {/if}
            </div>
        {/if}
    {else}
        <div class="row-fluid textAlignCenter">
            <span class="lead">{vtranslate('Module is not selected.', $QUALIFIED_MODULE)}</span>&nbsp;
        </div>
    {/if}
    </div>
{/strip}
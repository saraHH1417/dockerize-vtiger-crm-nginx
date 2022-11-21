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
    <div class="contentsDiv marginLeftZero" >
        <div class="padding1per">
                <hr>  
                <div class="padding1per">
                    <div class="controls">
                        <div>
                            <label><strong>{vtranslate('Label Editor', $QUALIFIED_MODULE)}</strong></label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                    <br>
                    <form name="languageAndModul" id="langAndModulForm" method="POST"  class="form-horizontal">
                        <input type="hidden" name="sourceModule" value="{$MODULE}">
                        <input type="hidden" name="settings_block" value="{$SETTINGS_BLOCK}">
                        <input type="hidden" name="settings_fieldid" value="{$SETTINGS_FIELDID}">
                        <table style="width:100%;"><tr><td>
                                    <span class="pull-right">{vtranslate('Choose your language', $QUALIFIED_MODULE)}:&nbsp;</span>
                                </td><td>
                                    <select name="language" class="inputElement select2 select2-offscreen form-control">
                                            {foreach item=LANG_INFO key=ID name=LANG from=$LANGUAGES}
                                                {if $LANG_INFO['active'] eq 1}
                                                    <option value="{$LANG_INFO['prefix']}">{vtranslate($LANG_INFO['label'],$QUALIFIED_MODULE)}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                </td><td>
                                    <span class="pull-right">{vtranslate('Choose your module', $QUALIFIED_MODULE)}:&nbsp;</span>
                                </td><td>
                                    <span class="pull-left">
                                        <select name="module" class="inputElement select2 select2-offscreen form-control">
                                            {foreach item=PICKLIST_MODULE from=$PICKLIST_MODULES}
                                                <option {if $SELECTED_MODULE_NAME eq $PICKLIST_MODULE->get('name')} selected="" {/if} value="{$PICKLIST_MODULE->get('name')}">{vtranslate($PICKLIST_MODULE->get('label'),$QUALIFIED_MODULE)}</option>
                                            {/foreach}
                                        </select>
                                    </span>
                                </td>
                            </tr>
                            <tr><td colspan="10">
                                    <span class="pull-right">
                                        <br /><br />
                                        <button type="button" class="btn btn-success lblLangEdit"><strong>{vtranslate('Next Step', $QUALIFIED_MODULE)}</strong></button>
                                    </span>
                                </td></tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
{/strip}


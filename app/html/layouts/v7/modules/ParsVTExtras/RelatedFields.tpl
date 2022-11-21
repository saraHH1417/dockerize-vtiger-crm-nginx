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

<div class="col-lg-1 col-md-1 col-sm-1">
</div>
<div class="col-lg-10 col-md-10 col-sm-10"  id="ParsVTExtraFields">
    <div style="margin-top: 1em;">
        <p>{vtranslate('add_new_related_field_explain', $MODULE)}</p>
        <div class="alert alert-warning">
            {vtranslate('notice', $MODULE)}
        </div>
        <table class="table table-condensed" style="margin-top: 1em;">
            <thead>
            <tr class="blockHeader">
                <th colspan="4" class="mediumWidthType"><span
                            class="alignMiddle">{vtranslate('add_new_related_field', $MODULE)}</span></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td width="50%" colspan="2"><label
                            class="muted pull-right marginRight10px">{vtranslate('module1', $MODULE)}</label></td>
                <td colspan="2" style="border-left: none;">
                    <select name="module1" id="module1" class="select2" style="min-width: 200px !important;">
                        <option value="-">--</option>
                        {foreach from=$ENTITY_MODULES item=MODULE1}
                            <option value="{$MODULE1}">{vtranslate($MODULE1)}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr>
                <td width="50%" colspan="2"><label
                            class="muted pull-right marginRight10px">{vtranslate('block', $MODULE)}</label></td>
                <td colspan="2" style="border-left: none;">
                    <select name="block" id="block" class="select2" style="min-width: 200px !important;">
                        <option value="-">--</option>

                    </select>
                </td>
            </tr>
            <tr>
                <td width="50%" colspan="2"><label
                            class="muted pull-right marginRight10px"> {vtranslate('fields_label', $MODULE)}</label></td>
                <td colspan="2" style="border-left: none;">
                    <input type="text" id="field_label"  class="inputElement" style="max-width: 200px;">
                </td>
            </tr>
            <tr>
                <td width="50%" colspan="2"><label
                            class="muted pull-right marginRight10px">{vtranslate('module2', $MODULE)}</label></td>
                <td colspan="2" style="border-left: none;">
                    <select name="module2" id="module2"  class="select2" style="min-width: 200px !important;">
                        <option value="-">--</option>
                        {foreach from=$ENTITY_MODULES item=MODULE1}
                            <option value="{$MODULE1}">{vtranslate($MODULE1)}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>

            <tr>
                <td width="25%"><label
                            class="muted pull-right marginRight10px">{vtranslate('add_related_list', $MODULE)}</label>
                </td>
                <td style="border-left: none;">
                    <select name="add_related_list" id="add_related" class="select2" style="min-width: 200px !important;">
                        <option value="-">--</option>
                        <option value="yes">{vtranslate('LBL_YES', $MODULE)}</option>
                        <option value="no">{vtranslate('LBL_NO', $MODULE)}</option>
                    </select>
                </td>
                <td width="25%"><label
                            class="muted pull-right marginRight10px">{vtranslate('related_list_label', $MODULE)}</label>
                </td>
                <td style="border-left: none;">
                    <input type="text" id="related_list_label" class="inputElement" style="max-width: 200px;">
                </td>
            </tr>

            </tbody>
        </table>
        <br><br>
        <div class="alert alert-danger notices" id="error_notice"
             style="display:none;">
            {vtranslate('fail', $MODULE)}
        </div>
        <div class="alert alert-success notices" id="success_message"
             style="display:none;">
            {vtranslate('works', $MODULE)}
        </div>
        <div class="alert alert-danger notices" id="duplicate_error"
             style="display:none;">
            {vtranslate('duplicated-error', $MODULE)}
        </div>
        <div class="alert alert-danger notices" id="field-already-there" style="display:none;">
            {vtranslate('field-already-there', $MODULE)}
        </div>
        <div class="clearfix"></div>
        <button class="btn btn-primary pull-right" style="margin-bottom: 0.5em;"
                id="add_related_field">{vtranslate('LBL_SAVE', $MODULE)}</button>

    </div>
</div>
<div class="col-lg-1 col-md-1 col-sm-1">
</div>

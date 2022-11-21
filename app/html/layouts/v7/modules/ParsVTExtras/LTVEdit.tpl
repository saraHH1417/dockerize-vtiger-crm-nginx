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
    select.inputElement, .inputElement.select2-container {
        width: 200px !important;
        max-width: 200px !important;
    }
</style>
<div style="width: 96%;margin: auto;padding: 10px;">
    <h3 style="padding-bottom: 1em;text-align: center">{vtranslate('LTV Calculator Settings', $MODULE)}</h3>
    <div class="row" style="margin: 8px;">
        {if vtranslate('LBL_EDIT_NOTICE', $MODULE) neq ''}
            <div class="alert alert-info" style=" margin-bottom: 0px !important;margin-top: 0px !important;">
                {vtranslate('LBL_EDIT_NOTICE', $MODULE)}
            </div>
        {/if}
    </div>
    <form class="form-horizontal" id="ParsVTLTVCalculator" name="ParsVTLTVCalculator" method="post" action="index.php">
        <input type="hidden" name="module" value="ParsVTExtras"/>
        <input type="hidden" name="action" value="LTVSave"/>
        <input type="hidden" id="status_values" name="status_values" value=""/>
        <div>
            <table class="table table-bordered table-condensed themeTableColor" style="margin-top: 1em;">
                <thead>
                <tr class="blockHeader">
                    <th colspan="2" class="mediumWidthType"><span class="alignMiddle">{vtranslate('SETTINGS_HEADER', $MODULE)}</span></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td width="25%"><label class="muted pull-right marginRight10px">{vtranslate('LBL_TARGET_MODULE_NAME', $MODULE)}</label>
                    </td>
                    <td style="border-left: none;">
                        <select name="modulename" class="select2 inputElement" id="modulename">
                            <option value="-">--</option>
                            {foreach from=$ENTITY_MODULES item=MODULE1}
                                <option value="{$MODULE1}"
                                        {if $PVTLTV_SETTINGS['modulename'] eq $MODULE1}selected{/if}>{vtranslate($MODULE1, $MODULE1)}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label class="muted pull-right marginRight10px">{vtranslate('LBL_STATUS', $MODULE)}</label></td>
                    <td style="border-left: none;">
                        <select name="statusfield" id="statusfield" class="select2 inputElement" multiple>
                            {if !empty($PVTLTV_FIELDS['statusfield'])}
                                {assign var=ACTIVESTATUS value=","|explode:$PVTLTV_SETTINGS['statusfield']}
                                {foreach key=_OPTION item=_VALUE from=$PVTLTV_FIELDS['statusfield']}
                                    <option value="{$_OPTION}" {if in_array($_OPTION,$ACTIVESTATUS)} selected{/if}>{vtranslate($_VALUE, $PVTLTV_SETTINGS['modulename'])}</option>
                                {/foreach}
                            {/if}
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label class="muted pull-right marginRight10px">{vtranslate('LBL_CURRENCY_FIELD', $MODULE)}</label>
                    </td>
                    <td style="border-left: none;">
                        <select name="currencyfield" class="select2 inputElement" id="currencyfield">
                            {if !empty($PVTLTV_FIELDS['currencyfield'])}
                                {foreach key=_OPTION item=_VALUE from=$PVTLTV_FIELDS['currencyfield']}
                                    <option value="{$_OPTION}"
                                            {if $PVTLTV_SETTINGS['currencyfield'] eq $_OPTION}selected{/if}>{vtranslate($_VALUE, $PVTLTV_SETTINGS['modulename'])}</option>
                                {/foreach}
                            {else}
                                <option value="-">--</option>
                            {/if}
                        </select>
                    </td>
                </tr>
                <tr class="blockHeader">
                    <th colspan="2" class="mediumWidthType"><span
                                class="alignMiddle">{vtranslate('LTV_DATE_SETTINGS', $MODULE)}</span></th>
                </tr>
                <tr>
                    <td><label class="muted pull-right marginRight10px">{vtranslate('LBL_DATE_FIELD', $MODULE)}</label>
                    </td>
                    <td style="border-left: none;">
                        <select name="datefield" class="select2 inputElement" id="datefield">
                            {if !empty($PVTLTV_FIELDS['datefield'])}
                                {foreach key=_OPTION item=_VALUE from=$PVTLTV_FIELDS['datefield']}
                                    <option value="{$_OPTION}"
                                            {if $PVTLTV_SETTINGS['datefield'] eq $_OPTION}selected{/if}>{vtranslate($_VALUE, $PVTLTV_SETTINGS['modulename'])}</option>
                                {/foreach}
                            {else}
                                <option value="-">--</option>
                            {/if}

                        </select>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <a class="cancelLink pull-right padding1per" type="reset"
           onClick="javascript:window.history.back()">{vtranslate('LBL_CANCEL', $MODULE)}</a>
        <button class="btn btn-success pull-right" id="customViewSubmit" type="submit">
            <strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
    </form>
</div>
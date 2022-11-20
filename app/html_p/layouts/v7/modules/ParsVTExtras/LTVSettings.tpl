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

<div style="width: 96%;margin: auto;padding: 10px;">
    <h3 style="padding-bottom: 1em;text-align: center">{vtranslate('LTV Calculator Settings', $MODULE)}</h3>
    <div>
        <button class="btn btn-danger pull-right" id="Contacts_detailView_basicAction_LBL_EDIT" onclick="window.location.href = 'index.php?module=ParsVTExtras&amp;view=LTVEdit&parent=Settings'">{vtranslate('LBL_EDIT', $MODULE)}</button>

        <table class="table table-bordered table-condensed themeTableColor" style="">
            <thead>
                <tr class="blockHeader">
                    <th colspan="2" class="mediumWidthType"><span class="alignMiddle">{vtranslate('LTV Calculator Settings', $MODULE)}</span></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <td width="25%"><label class="muted pull-right marginRight10px">{vtranslate('LBL_TARGET_MODULE_NAME', $MODULE)}</label></td>
                <td style="border-left: none;">{vtranslate($PVTLTV_SETTINGS.modulename)}</td></tr>
                <tr>
                <td><label class="muted pull-right marginRight10px">{vtranslate('LBL_STATUS', $MODULE)}</label></td>
                <td style="border-left: none;">{vtranslate($PVTLTV_SETTINGS.statusfield,$PVTLTV_SETTINGS.modulename)}</td>
                </tr>
                                <tr>
                <td><label class="muted pull-right marginRight10px">{vtranslate('LBL_DATE_FIELD', $MODULE)}</label></td>
                <td style="border-left: none;">{vtranslate($PVTLTV_SETTINGS.datefield, $PVTLTV_SETTINGS.modulename)}</td>
                </tr>
                                <tr>
                <td><label class="muted pull-right marginRight10px">{vtranslate('LBL_CURRENCY_FIELD', $MODULE)}</label></td>
                <td style="border-left: none;">{vtranslate($PVTLTV_SETTINGS.currencyfield, $PVTLTV_SETTINGS.modulename)}</td>
                </tr>
               
            </tbody>
        </table>
                <button class="btn btn-primary pull-right" style="margin-top: 0.5em;" id="updateLTV" >{vtranslate('Recalculate Contacts & Accounts LTV', $MODULE)}</button>

    </div>

</div>



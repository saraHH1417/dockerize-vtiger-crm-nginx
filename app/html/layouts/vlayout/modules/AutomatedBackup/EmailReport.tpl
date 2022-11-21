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
    <form id="formEmailReport">
    <table class="table table-bordered blockContainer showInlineTable equalSplit">
        <thead>
        <tr>
            <th class="blockHeader" colspan="4">{vtranslate('LBL_BASIC_INFORMATION', $QUALIFIED_MODULE)}</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_STATUS', $QUALIFIED_MODULE)}</label></td>
            <td class="fieldValue medium">
                <div class="row-fluid">
                    <span class="span10">
                        <select class="chzn-select" name="emailreport_status">
                            <option value="">--{vtranslate('LBL_SELECT', $QUALIFIED_MODULE)}--</option>
                            <option value="Active" {if $SETTINGS.emailreport_status eq 'Active'}selected="" {/if}>{vtranslate('LBL_ACTIVE', $QUALIFIED_MODULE)}</option>
                            <option value="Inactive" {if $SETTINGS.emailreport_status eq 'Inactive'}selected="" {/if}>{vtranslate('LBL_INACTIVE', $QUALIFIED_MODULE)}</option>
                        </select>
                    </span>
                </div>
            </td>
            <td class="fieldLabel medium">
                <label class="muted pull-right marginRight10px">{vtranslate('LBL_EMAIL_ADDRESS', $QUALIFIED_MODULE)}</label>
            </td>
            <td class="fieldValue medium">
                <div class="row-fluid">
                    <span class="span10">
                        <input type="text" class="input-large" name="emailreport_email" value="{$SETTINGS.emailreport_email}" />
                    </span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_SEND_EMAIL', $QUALIFIED_MODULE)}</label></td>
            <td class="fieldValue medium">
                <div class="row-fluid">
                    <span class="span10">
                        {assign var=EMAILREPORT_BACKUPTYPE value="|##|"|explode:$SETTINGS.emailreport_backuptype}
                        <select class="chzn-select" name="emailreport_backuptype" multiple>
                            <option value="localbackup" {if in_array('localbackup',$EMAILREPORT_BACKUPTYPE)}selected="" {/if}>{vtranslate('LBL_LOCAL', $QUALIFIED_MODULE)}</option>
                            <option value="ftpbackup" {if in_array('ftpbackup',$EMAILREPORT_BACKUPTYPE)}selected="" {/if}>{vtranslate('LBL_FTP', $QUALIFIED_MODULE)}</option>
                        </select>
                    </span>
                </div>
            </td>
            <td class="fieldLabel medium">
                <label class="muted pull-right marginRight10px">{vtranslate('LBL_EMAIL_SUBJECT', $QUALIFIED_MODULE)}</label>
            </td>
            <td class="fieldValue medium">
                <div class="row-fluid">
                    <span class="span10">
                        <input type="text" class="input-large" name="emailreport_subject" value="{$SETTINGS.emailreport_subject}"/>
                    </span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="fieldLabel medium">
                <label class="muted pull-right marginRight10px">{vtranslate('LBL_BODY', $QUALIFIED_MODULE)}</label>
                <span class="pull-right">{vtranslate('LBL_BODY_DESCRIPTION',$QUALIFIED_MODULE)}</span>
            </td>
            <td class="fieldValue medium" colspan="3">
                <div class="row-fluid">
                    <span class="span12">
                        <textarea name="emailreport_body" id="emailreport_body">{$SETTINGS.emailreport_body}</textarea>
                    </span>
                </div>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="clearfix" style="padding-bottom: 15px; padding-top: 15px;">
        <button type="button" class="btn btn-success" name="saveEmailReport">{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</button>
    </div>
    </form>
{/strip}
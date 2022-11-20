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
    <form id="formLocalBackup">
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
                                <select name="localbackup_status" class="chzn-select">
                                    <option value="">--{vtranslate('LBL_SELECT', $QUALIFIED_MODULE)}--</option>
                                    <option value="Active" {if $SETTINGS.localbackup_status eq 'Active'}selected="selected"{/if}>{vtranslate('LBL_ACTIVE', $QUALIFIED_MODULE)}</option>
                                    <option value="Inactive" {if $SETTINGS.localbackup_status eq 'Inactive'}selected="selected"{/if}>{vtranslate('LBL_INACTIVE', $QUALIFIED_MODULE)}</option>
                                </select>
                            </span>
                        </div>
                    </td>
                    <td class="fieldLabel medium">
                        <label class="muted pull-right marginRight10px">{vtranslate('LBL_BACKUP_DATABASE', $QUALIFIED_MODULE)}</label>
                    </td>
                    <td class="fieldValue medium">
                        <div class="row-fluid"><span class="span10">
                                <input type="checkbox" name="localbackup_database" {if $SETTINGS.localbackup_database neq ""}checked{/if} />
                            </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_BACKUP_FILES', $QUALIFIED_MODULE)}</label></td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                            <span class="span10">
                                <input type="checkbox" name="localbackup_files" {if $SETTINGS.localbackup_files neq ""}checked{/if} />
                            </span>
                        </div>
                    </td>
                    <td class="fieldLabel medium">
                        <label class="muted pull-right marginRight10px">{vtranslate('LBL_BACKUP_FREQUENCY', $QUALIFIED_MODULE)}</label>
                    </td>
                    <td class="fieldValue medium">
                        <div class="row-fluid"><span class="span10">
                                <input type="text" class="input-large" value="{$SETTINGS.localbackup_frequency}" name="localbackup_frequency" />
                            </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_NUMBER_OF_BACKUPS_TO_KEEP', $QUALIFIED_MODULE)}</label></td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                            <span class="span10">
                                <input type="text" class="input-large" value="{$SETTINGS.localbackup_number}" name="localbackup_number" />
                            </span>
                        </div>
                    </td>
                    <td class="fieldLabel medium">
                        <label class="muted pull-right marginRight10px">{vtranslate('LBL_BACKUP_DIRECTORY', $QUALIFIED_MODULE)}</label>
                    </td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                            <span class="span10">
                                <input type="text" class="input-large" value="{if $SETTINGS.localbackup_directory eq ""}{$BACKUP_DIRECTORY}{else}{$SETTINGS.localbackup_directory}{/if}" name="localbackup_directory" />
                            </span>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    <div class="clearfix localBackupAction" style="padding-bottom: 15px; padding-top: 15px;">
        <button name="testPermissions" type="button" class="btn btn-success">{vtranslate('LBL_TEST_PERMISSIONS', $QUALIFIED_MODULE)}</button>
        <button name="runLocalBackup" type="button" class="btn btn-success">{vtranslate('LBL_RUN_BACKUP', $QUALIFIED_MODULE)}</button>
        <button name="saveLocalBackup" type="button" class="btn btn-success">{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</button>
    </div>

    <hr>
    <table class="table table-bordered listViewEntriesTable" id="localbackupLogFiles">
        <thead>
            <tr class="listViewHeaders">
                <th nowrap="" class="listViewHeaderValues">{vtranslate('LBL_DATE', $QUALIFIED_MODULE)}</th>
                <th nowrap="" class="listViewHeaderValues">{vtranslate('LBL_TYPE', $QUALIFIED_MODULE)}</th>
                <th nowrap="" class="listViewHeaderValues">{vtranslate('LBL_FILESIZE', $QUALIFIED_MODULE)}</th>
                <th nowrap="" class="listViewHeaderValues">{vtranslate('LBL_STATUS', $QUALIFIED_MODULE)}</th>
                <th width="5%" nowrap="" class="listViewHeaderValues">{vtranslate('LBL_DOWNLOAD', $QUALIFIED_MODULE)}</th>
            </tr>
        </thead>
        <tbody>
            {include file='ListFileBackup.tpl'|@vtemplate_path:$QUALIFIED_MODULE LISTBACKUPLOG = $LIST_BACKUP_LOG['localbackup'] LOG_TYPE='localbackup'}
        </tbody>
    </table>
    {if $LIST_BACKUP_LOG['localbackup']|count eq 10}
        <button style="margin: 10px 0px;" data-type="localbackup" type="button" data-page="0" class="btn btn-default showMoreFile">{vtranslate('LBL_SHOW_MORE',$QUALIFIED_MODULE)}</button>
    {/if}
{/strip}
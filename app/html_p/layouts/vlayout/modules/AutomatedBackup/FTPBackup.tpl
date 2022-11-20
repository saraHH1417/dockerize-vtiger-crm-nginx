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
    <form id="formFTPBackup">
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
                                <select name="ftpbackup_status" class="chzn-select">
                                    <option value="">--{vtranslate('LBL_SELECT', $QUALIFIED_MODULE)}--</option>
                                    <option value="Active" {if $SETTINGS.ftpbackup_status eq 'Active'}selected="selected"{/if}>{vtranslate('LBL_ACTIVE', $QUALIFIED_MODULE)}</option>
                                    <option value="Inactive" {if $SETTINGS.ftpbackup_status eq 'Inactive'}selected="selected"{/if}>{vtranslate('LBL_INACTIVE', $QUALIFIED_MODULE)}</option>
                                </select>
                            </span>
                        </div>
                    </td>
                    <td class="fieldLabel medium">
                        <label class="muted pull-right marginRight10px">{vtranslate('LBL_BACKUP_DATABASE', $QUALIFIED_MODULE)}</label>
                    </td>
                    <td class="fieldValue medium">
                        <div class="row-fluid"><span class="span10">
                                    <input type="checkbox" name="ftpbackup_database" {if $SETTINGS.ftpbackup_database neq ""}checked{/if} />
                                </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_BACKUP_FILES', $QUALIFIED_MODULE)}</label></td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                                <span class="span10">
                                    <input type="checkbox" name="ftpbackup_files" {if $SETTINGS.ftpbackup_files neq ""}checked{/if} />
                                </span>
                        </div>
                    </td>
                    <td class="fieldLabel medium">
                        <label class="muted pull-right marginRight10px">{vtranslate('LBL_BACKUP_FREQUENCY', $QUALIFIED_MODULE)}</label>
                    </td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                            <span class="span10">
                                <input value="{$SETTINGS.ftpbackup_frequency}" type="text" class="input-large" name="ftpbackup_frequency" />
                            </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_FTP_SERVER', $QUALIFIED_MODULE)}</label></td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                                <span class="span10">
                                    <input type="text" value="{$SETTINGS.ftpbackup_server}" name="ftpbackup_server" class="input-large" />
                                </span>
                        </div>
                    </td>
                    <td class="fieldLabel medium">
                        <label class="muted pull-right marginRight10px">{vtranslate('LBL_BACKUP_DIRECTORY', $QUALIFIED_MODULE)}</label>
                    </td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                                <span class="span10">
                                    <input type="text" value="{if $SETTINGS.ftpbackup_directory eq ""}/{else}{$SETTINGS.ftpbackup_directory}{/if}" name="ftpbackup_directory" class="input-large" />
                                </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldLabel medium">
                        <label class="muted pull-right marginRight10px">{vtranslate('LBL_FTP_USERNAME', $QUALIFIED_MODULE)}</label>
                    </td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                                <span class="span10">
                                    <input type="text" class="input-large" value="{$SETTINGS.ftpbackup_user}" name="ftpbackup_user" />
                                </span>
                        </div>
                    </td>
                    <td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_FTP_PASSWORD', $QUALIFIED_MODULE)}</label></td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                                <span class="span10">
                                    <input type="password" class="input-large" value="{$SETTINGS.ftpbackup_password}" name="ftpbackup_password" />
                                </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldLabel medium"><label class="muted pull-right marginRight10px">{vtranslate('LBL_NUMBER_OF_BACKUPS_TO_KEEP', $QUALIFIED_MODULE)}</label></td>
                    <td class="fieldValue medium">
                        <div class="row-fluid">
                                <span class="span10">
                                    <input type="text" class="input-large" value="{$SETTINGS.ftpbackup_number}" name="ftpbackup_number" />
                                </span>
                        </div>
                    </td>
                    <td class="fieldLabel medium" colspan="2">
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </form>

    <div class="clearfix FTPBackupAction" style="padding-bottom: 15px; padding-top: 15px;">
        <button type="button" class="btn btn-success" name="testConnection">{vtranslate('LBL_TEST_CONNECTION', $QUALIFIED_MODULE)}</button>
        <button type="button" class="btn btn-success" name="runFTPBackup">{vtranslate('LBL_RUN_BACKUP', $QUALIFIED_MODULE)}</button>
        <button type="button" class="btn btn-success" name="saveFTPBackup">{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</button>
    </div>

    <table class="table table-bordered listViewEntriesTable" id="ftpbackupLogFiles">
        <thead>
            <tr class="listViewHeaders">
                <th nowrap=""><a href="javascript:void(0);" class="listViewHeaderValues">{vtranslate('LBL_DATE', $QUALIFIED_MODULE)} {$LIST_BACKUP_LOG['ftpbackup']|count}</a></th>
                <th nowrap=""><a href="javascript:void(0);" class="listViewHeaderValues">{vtranslate('LBL_TYPE', $QUALIFIED_MODULE)}</a></th>
                <th nowrap=""><a href="javascript:void(0);" class="listViewHeaderValues">{vtranslate('LBL_FILESIZE', $QUALIFIED_MODULE)}</a></th>
                <th nowrap=""><a href="javascript:void(0);" class="listViewHeaderValues">{vtranslate('LBL_STATUS', $QUALIFIED_MODULE)}</a></th>
                <th width="5%" nowrap=""><a href="javascript:void(0);" class="listViewHeaderValues">{vtranslate('LBL_DOWNLOAD', $QUALIFIED_MODULE)}</a></th>
            </tr>
        </thead>
        <tbody>
            {include file='ListFileBackup.tpl'|@vtemplate_path:$QUALIFIED_MODULE LISTBACKUPLOG = $LIST_BACKUP_LOG['ftpbackup'] LOG_TYPE='ftpbackup'}
        </tbody>
    </table>
    {if $LIST_BACKUP_LOG['ftpbackup']|count eq 10}
        <button style="margin: 10px 0px;" data-type="ftpbackup" data-page="0" type="button" class="btn btn-default showMoreFile">{vtranslate('LBL_SHOW_MORE',$QUALIFIED_MODULE)}</button>
    {/if}
{/strip}
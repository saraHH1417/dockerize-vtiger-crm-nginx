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
    <div class="container-fluid">
    <div class="contents row-fluid">


        <form method="post" name="module_ParsVT_Backup" id="module_ParsVT_Backup">
            <input type="hidden" name="startBackup" value="start">
            <div class="widget_header row-fluid">
                <span class="span4">
                    <h4>{vtranslate('LBL_CREATE_BACKUP',$QUALIFIED_MODULE)}</h4>
                </span>
            </div>
            <hr>
        </form>
        <div class="modal-footer">
            <button class="btn btn-primary btn-backup" type="submit">
                <strong>{vtranslate('LBL_BACKUP', $QUALIFIED_MODULE)}</strong></button>
        </div>

        <br>
        <br>
        <br>
        <br>

        <form id="backupListAction" action="index.php" target="_blank" method="post">
            <div class="widget_header row-fluid">
                <span class="span4">
                    <h4>{vtranslate('LBL_RESTORE_BACKUP',$QUALIFIED_MODULE)}</h4>
                </span>
            </div>
            <hr>
            <h6>{vtranslate('LBL_BACKUP_FILE_LIST',$QUALIFIED_MODULE)}</h6>

            <div class="modal-body">
                <table id="AllLanguagesTable" class="table table-bordered table-condensed" style="table-layout: fixed">
                    <thead>
                    <tr>
                        {*<th style="border-right: none;width: 100px;">{vtranslate('LBL_SELECT_FILE',$QUALIFIED_MODULE)}</th>*}
                        <th style="border-right: none;border-left: none">{vtranslate('LBL_FILE_NAME',$QUALIFIED_MODULE)}</th>
                        <th style="border-right: none;border-left: none">{vtranslate('LBL_DATE', $QUALIFIED_MODULE)}</th>
                        <th style="border-right: none;border-left: none">{vtranslate('LBL_SIZE', $QUALIFIED_MODULE)}</th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach item=S_FILE key=ID from=$FILELIST}
                        <tr class="listViewEntries" data-recordurl="{$ID}">
                            {*<td style="width: 100px"><label for="{$ID}">Select </label> </td>*}
                            <td class="listViewEntrie medium"><input type="radio" name="rbSelect" value="{$ID}" id="{$ID}"><label for="{$ID}">{$ID}</label></td>
                            <td class="listViewEntrie medium"><label for="{$ID}">{$S_FILE[0]}</label></td>
                            <td class="listViewEntrie medium"><label for="{$ID}">{$S_FILE[1]}</label></td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
                <div class="col-md-9"></div>
                <div class="col-md-3" style="padding: 10px 0">
                    {vtranslate('LBL_PASSWORD', $QUALIFIED_MODULE)}
                    <input type="password" class="inputElement" name="pass" id="pass">
                    <input type="hidden" class="inputElement" name="module" value="ParsVT">
                    <input type="hidden" class="inputElement" name="action" value="BackupOperation">
                    <input type="hidden" class="inputElement" name="parent" value="Settings">
                    <input type="hidden" class="inputElement" name="mode" value="get_file">
                </div>
            </div>
            <div class="pull-right padding10">
                <button class="btn btn-primary btn_backupAction" id="">
                    {vtranslate('LBL_DOWNLOAD', $QUALIFIED_MODULE)}
                </button>
            </div>
        </form>
    </div>
    <div class="row">
        <div class="pull-right padding10">
            <button class="btn btn-primary btn_backupAction" id="btn_restore">
                {vtranslate('LBL_RESTORE_BACKUP', $QUALIFIED_MODULE)}
            </button>
        </div>
        <div class="pull-right padding10">
            <button class="btn btn-danger btn_backupAction" id="btn_delete">
                {vtranslate('LBL_DELETE_BACKUP', $QUALIFIED_MODULE)}
            </button>
        </div>
    </div>
    <br>

    <div align="center" class="small"
         style="color: rgb(153, 153, 153);">{vtranslate("LBL_MODULE_NAME",$QUALIFIED_MODULE)} {$VERSION} :: <a
                href="http://www.parsvt.com/" target="_new">{vtranslate("COPYRIGHT",$QUALIFIED_MODULE)}</a></div>
    <br>
{/strip}
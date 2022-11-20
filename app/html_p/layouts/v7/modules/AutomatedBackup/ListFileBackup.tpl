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
    {*<input type="hidden" id="{$LOG_TYPE}NUM" data-number="{$LISTBACKUPLOG|count}" data-page="{$PAGE}"/>*}
    {foreach item=LISTVIEW_ENTRY from=$LISTBACKUPLOG}
        <tr class="listViewEntries">
            <td class="listViewEntryValue medium" nowrap="">{DateTimeField::convertToUserFormat($LISTVIEW_ENTRY.createdtime)}</td>
            <td class="listViewEntryValue medium" nowrap="">{$LISTVIEW_ENTRY.filetype}</td>
            <td class="listViewEntryValue medium" nowrap="">{$LISTVIEW_ENTRY.filesize}</td>
            <td class="listViewEntryValue medium" nowrap="">{if $LISTVIEW_ENTRY.deleted eq 0}Active{else}Deleted{/if}</td>
            <td style="text-align: center;" class="listViewEntryValue medium" nowrap="">
                {if $LISTVIEW_ENTRY.deleted eq 0}
                    {if $LOG_TYPE eq 'ftpbackup'}
                        <a class="fa fa-download alignMiddle downloadRecordButton" title="Download" data-file="{$FTP_DOWNLOAD_LINK}/{$LISTVIEW_ENTRY.path}/{$LISTVIEW_ENTRY.filename}"><i title="Download" class="icon-download alignMiddle"></i></a>
                    {else}
                        <a class="fa fa-download alignMiddle downloadRecordButton" title="Download" data-file="{$SITE_URL}/{$LISTVIEW_ENTRY.path}/automatedbackup_{$LISTVIEW_ENTRY.filename}"><i title="Download" class="icon-download alignMiddle"></i></a>
                    {/if}
                {/if}
            </td>
        </tr>
    {/foreach}
{/strip}
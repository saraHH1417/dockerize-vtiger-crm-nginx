{*
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
 *}

{strip}
<div class="listViewEntriesDiv" style='overflow-x:auto;'>
    {foreach item=LISTVIEW_ENTRY key=RECORDID from=$LISTVIEW_ENTRIES}
        <div style="margin-bottom:20px;" class="blockSortable" data-id="{$RECORDID}" data-sequence="{$LISTVIEW_ENTRY['sequence']}">
            <table class="table table-bordered table-condensed listViewEntriesTable">
                <thead>
                    <tr class="listViewHeaders">
                        <th width="1%" class="medium"><img src="{vimage_path('drag.png')}" class="alignTop" title="{vtranslate('LBL_DRAG',$QUALIFIED_MODULE)}" /></th>
                        <th width="24%" class="medium">{vtranslate('LBL_MODULE',$QUALIFIED_MODULE)}</th>
                        <th width="20%" class="medium">{vtranslate('LBL_SOURCE_FIELD',$QUALIFIED_MODULE)}</th>
                        <th width="20%" class="medium">{vtranslate('LBL_VALUES',$QUALIFIED_MODULE)}</th>
                        <th width="25%" class="medium">{vtranslate('LBL_BLOCKS',$QUALIFIED_MODULE)}</th>
                        <th width="10%" class="medium">
                            <span class="btn-group actions">
                                <a class="editBlockDetails" href="index.php?module=DynamicBlocks&parent=Settings&view=EditView&record={$RECORDID}">
                                    <i title="{vtranslate('LBL_EDIT','DynamicBlocks')}" class="glyphicon glyphicon-pencil alignMiddle"></i>
                                </a>
                                &nbsp;&nbsp;
                                <a class="deleteBlock" href="javascript:void(0)" data-id="{$RECORDID}">
                                    <i title="{vtranslate('LBL_DELETE','DynamicBlocks')}" class="glyphicon glyphicon-trash alignMiddle"></i>
                                </a>
                            </span>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="listViewEntries">
                        <td width="30%" style="vertical-align:top !important;" colspan="2" nowrap class="medium">{vtranslate($LISTVIEW_ENTRY['module'], $LISTVIEW_ENTRY['module'])}</td>
                        <td width="20%" style="vertical-align:top !important;" nowrap class="medium">{vtranslate($LISTVIEW_ENTRY['fieldlable'],$LISTVIEW_ENTRY['module'])}</td>
                        <td width="20%" style="vertical-align:top !important;" nowrap class="medium">
                            {foreach item=VALUE from=$LISTVIEW_ENTRY['picklist_values']}
                                <div class="row-fluid">
                                    <span> {if $VALUE eq '__blank__'}{vtranslate('Blank','DynamicBlocks')}{else}{vtranslate($VALUE,$LISTVIEW_ENTRY['module'])}{/if}</span>
                                </div>
                            {/foreach}
                        </td>
                        <td width="30%" colspan="2" style="vertical-align:top !important;" nowrap class="medium">
                            {foreach item=BLOCK from=$LISTVIEW_ENTRY['blocks']}
                                <div class="row-fluid">
                                    <span>{if $BLOCK['show'] eq '1'}{vtranslate('LBL_SHOW', 'DynamicBlocks')} - {vtranslate($BLOCK['label'], $LISTVIEW_ENTRY['module'])}
                                        {elseif $BLOCK['show'] eq '0'}{vtranslate('LBL_HIDE', 'DynamicBlocks')} - {vtranslate($BLOCK['label'], $LISTVIEW_ENTRY['module'])}
                                        {elseif $BLOCK['show'] eq '2'}{vtranslate('LEAVE_AS_IS', 'DynamicBlocks')} - {vtranslate($BLOCK['label'], $LISTVIEW_ENTRY['module'])}{/if} </span>
                                </div>
                            {/foreach}
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    {/foreach}

	<!--added this div for Temporarily -->
	{if $LISTVIEW_ENTRIES_COUNT eq '0'}
	<table class="emptyRecordsDiv">
		<tbody>
			<tr>
				<td>
					{vtranslate('No records found','DynamicBlocks')}
				</td>
			</tr>
		</tbody>
	</table>
	{/if}
</div>
{/strip}
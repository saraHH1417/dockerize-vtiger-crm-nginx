{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
{strip}
<input type="hidden" id="pageStartRange" value="{$PAGING_MODEL->getRecordStartRange()}" />
<input type="hidden" id="pageEndRange" value="{$PAGING_MODEL->getRecordEndRange()}" />
<input type="hidden" id="previousPageExist" value="{$PAGING_MODEL->isPrevPageExists()}" />
<input type="hidden" id="nextPageExist" value="{$PAGING_MODEL->isNextPageExists()}" />
<input type="hidden" id="totalCount" value="{$LISTVIEW_COUNT}" />
<input type="hidden" value="{$ORDER_BY}" id="orderBy">
<input type="hidden" value="{$SORT_ORDER}" id="sortOrder">
<input type="hidden" id="totalCount" value="{$LISTVIEW_COUNT}" />
<input type='hidden' value="{$PAGE_NUMBER}" id='pageNumber'>
<input type='hidden' value="{$PAGING_MODEL->getPageLimit()}" id='pageLimit'>
<input type="hidden" value="{$LISTVIEW_ENTRIES_COUNT}" id="noOfEntries">

<div class="listViewEntriesDiv" style='overflow-x:auto;'>
	<span class="listViewLoadingImageBlock hide modal" id="loadingListViewModal">
		<img class="listViewLoadingImage" src="{vimage_path('loading.gif')}" alt="no-image" title="{vtranslate('LBL_LOADING', $MODULE)}"/>
		<p class="listViewLoadingMsg">{vtranslate('LBL_LOADING_LISTVIEW_CONTENTS', $MODULE)}........</p>
	</span>
	{assign var="NAME_FIELDS" value=$MODULE_MODEL->getNameFields()}
	{assign var=WIDTHTYPE value=$CURRENT_USER_MODEL->get('rowheight')}
	<table class="table table-bordered table-condensed listViewEntriesTable">
		<thead>
			<tr class="listViewHeaders">
				<th width="1%" class="{$WIDTHTYPE}"></th>
				{assign var=WIDTH value={99/(count($LISTVIEW_HEADERS))}}
				{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
				<th width="{$WIDTH}%" nowrap {if $LISTVIEW_HEADER@last}colspan="2" {/if} class="{$WIDTHTYPE}">
					<a  {if !($LISTVIEW_HEADER->has('sort'))} class="listViewHeaderValues cursorPointer" data-nextsortorderval="{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-columnname="{$LISTVIEW_HEADER->get('name')}" {/if}>{vtranslate($LISTVIEW_HEADER->get('label'), 'PushNotification')}
						{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}<img class="{$SORT_IMAGE} icon-white">{/if}</a>
				</th>
				{/foreach}
			</tr>
		</thead>
		<tbody>
		{foreach item=LISTVIEW_ENTRY from=$LISTVIEW_ENTRIES}
			<tr class="listViewEntries" data-id="{$LISTVIEW_ENTRY->getId()}"
					{if method_exists($LISTVIEW_ENTRY,'getDetailViewUrl')}data-recordurl="{$LISTVIEW_ENTRY->getDetailViewUrl()}"{/if}
			 >
			<td width="1%" nowrap class="{$WIDTHTYPE}">
				{if $MODULE eq 'CronTasks'}
					<img src="{vimage_path('drag.png')}" class="alignTop" title="{vtranslate('LBL_DRAG','PushNotification')}" />
				{/if}
			</td>
				{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
					{assign var=LISTVIEW_HEADERNAME value=$LISTVIEW_HEADER->get('name')}
					{assign var=LAST_COLUMN value=$LISTVIEW_HEADER@last}
					<td class="listViewEntryValue {$WIDTHTYPE}"  width="{$WIDTH}%" nowrap>
                                               {if $LISTVIEW_HEADER->get('name') eq 'id'}{assign var=id value=$LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME)}{/if}
                                               {if $LAST_COLUMN}
						&nbsp;
						<div class="actions pull-right">
 						  <span class="actionImages">
 						  <a href="#" id="{$id}" class="logcounter">
 						  <i title="{vtranslate('View','PushNotification')}" class="icon-eye-open alignMiddle">
 						  </i>
 						  </a>&nbsp;<a class="deleteRecordButton" href="index.php?module=PushNotification&parent=Settings&view=List&action=Delete&id={$id}">
						   <i title="{vtranslate('Delete','PushNotification')}" class="icon-trash alignMiddle">
 						  </i>
 						  </a>
 						  </span>
						</div>
                                                {else}
						&nbsp;{vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME),'PushNotification')}
                                                {/if}
					</td>
                                         {if $LAST_COLUMN}
                                         </tr><tr class="resultlog" style='display:none; direction:ltr;'  id="result_log{$id}">
                                         <td class="listViewEntryValue {$WIDTHTYPE} alert-info"  width="{$WIDTH}%" nowrap style='cursor:text; text-align:center;' colspan="8">
                                         <span>{vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME), 'PushNotification')}</span></td></tr>
                                         {/if}
				{/foreach}
			</tr>
		{/foreach}
		</tbody>
	</table>

	<!--added this div for Temporarily -->
	{if $LISTVIEW_ENTRIES_COUNT eq '0'}
	<table class="emptyRecordsDiv">
		<tbody>
			<tr>
				<td>
				{vtranslate('No record found', 'PushNotification')}
				</td>
			</tr>
		</tbody>
	</table>
	{/if}
</div>
<script>
$(document).ready(function(){

  $(".logcounter").click(function() {
  var ClickId = $(this).attr('id');
  $(".resultlog").hide();
  $("#result_log"+ClickId).show();
});
});

</script>
{/strip}

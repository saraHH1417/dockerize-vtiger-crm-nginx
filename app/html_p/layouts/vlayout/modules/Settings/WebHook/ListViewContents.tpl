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
					{if $LISTVIEW_HEADER->get('name') neq 'request' && $LISTVIEW_HEADER->get('name') neq 'logs'  && $LISTVIEW_HEADER->get('name') neq 'response'}
						<th width="{$WIDTH}%" nowrap {if $LISTVIEW_HEADER@last}colspan="2" {/if} class="{$WIDTHTYPE}">
							<a  {if !($LISTVIEW_HEADER->has('sort'))} class="listViewHeaderValues cursorPointer" data-nextsortorderval="{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-columnname="{$LISTVIEW_HEADER->get('name')}" {/if}>{vtranslate($LISTVIEW_HEADER->get('label'), 'WebHook')}
								{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}<img class="{$SORT_IMAGE} icon-white">{/if}</a>
						</th>
					{/if}
				{/foreach}
			</tr>
			</thead>
			<tbody>
			{assign var="RESPONSECLASS" value="alert alert-info"}
			{foreach item=LISTVIEW_ENTRY from=$LISTVIEW_ENTRIES}
			<tr class="listViewEntries" data-id="{$LISTVIEW_ENTRY->getId()}"
				{if method_exists($LISTVIEW_ENTRY,'getDetailViewUrl')}data-recordurl="{$LISTVIEW_ENTRY->getDetailViewUrl()}"{/if}
			>
				<td width="1%" nowrap class="{$WIDTHTYPE}">
					{if $MODULE eq 'CronTasks'}
						<img src="{vimage_path('drag.png')}" class="alignTop" title="{vtranslate('LBL_DRAG','WebHook')}" />
					{/if}
				</td>
				{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
					{assign var=LISTVIEW_HEADERNAME value=$LISTVIEW_HEADER->get('name')}
					{assign var=LAST_COLUMN value=$LISTVIEW_HEADER@last}
					{if $LISTVIEW_HEADER->get('name') eq 'logs'}
						{assign var=LOGS value=ZEND_JSON::decode(htmlspecialchars_decode($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME)))}
					{/if}
					{if $LISTVIEW_HEADER->get('name') neq 'request' && $LISTVIEW_HEADER->get('name') neq 'logs'  && $LISTVIEW_HEADER->get('name') neq 'response'}
						<td class="listViewEntryValue {$WIDTHTYPE}"  width="{$WIDTH}%" {if $LISTVIEW_HEADER->
						get('name') neq 'request' && $LISTVIEW_HEADER->get('name') neq 'response'}nowrap{else}style="direction:ltr;text-align:left"{/if}>
							{if $LISTVIEW_HEADER->get('name') eq 'id'}{assign var=id value=$LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME)}{/if}
							{if $LAST_COLUMN}
							&nbsp;
							<div class="actions pull-right">
               <span class="actionImages">
               <a href="#" id="{$id}" class="logcounter">
               <i title="{vtranslate('View','WebHook')}" class="icon-eye-open alignMiddle">
               </i></a>
               &nbsp;
               {if $LOGS['module'] neq '' && $LOGS['record'] neq ''} <a href="index.php?module={$LOGS['module']}&view=Detail&record={$LOGS['record']}">
				   <i title="{vtranslate('View Record','WebHook')}" class="icon-th-list alignMiddle">
               </i></a>{/if}
               &nbsp;
               {if $LOGS['module'] neq '' && $LOGS['record'] neq '' && ($FIREWOOK || $run_manually)}
				   <a href="index.php?module=WebHook&parent=Settings&view=List&action=Fire&id={$id}">
               <i title="{vtranslate('Fire WebHook','WebHook')}" class="icon-play alignMiddle">
               </i></a>
				   &nbsp;{/if}
               <a class="deleteRecordButton" href="index.php?module=WebHook&parent=Settings&view=List&action=Delete&id={$id}">
               <i title="{vtranslate('Delete','WebHook')}" class="icon-trash alignMiddle">
               </i></a>
               </span>
							</div>
							{else}
							&nbsp;
							{if $LISTVIEW_HEADER->get('name') eq 'type' || $LISTVIEW_HEADER->get('name') eq 'method'}
							{vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME),'WebHook')|upper}
							{elseif $LISTVIEW_HEADER->get('name') eq 'status'}
							{assign var="FIREWOOK" value=false}
							{if $LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME) eq "Success"}
							{assign var="RESPONSECLASS" value="alert alert-success"}
							<font color="green">
								{elseif $LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME) eq "Queued"}
								{assign var="RESPONSECLASS" value="alert alert-warning"}
								{assign var="FIREWOOK" value=true}
								<font color="darkblue">
									{else}
									{assign var="RESPONSECLASS" value="alert alert-danger"}
									<font color="red">
										{/if}
										{vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME),'WebHook')}
									</font>
									{else}
									{vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME),'WebHook')}
									{/if}
									{/if}
						</td>
					{/if}
					{if $LISTVIEW_HEADER->get('name') eq 'request'}
						{assign var=REQUEST_TITLE value=vtranslate($LISTVIEW_HEADER->get('label'), 'WebHook')}
						{assign var=REQUEST_VALUE value=vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME), 'WebHook')}
					{elseif $LISTVIEW_HEADER->get('name') eq 'response'}
						{assign var=RESPONSE_TITLE value=vtranslate($LISTVIEW_HEADER->get('label'), 'WebHook')}
						{assign var=RESPONSE_VALUE value=vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME), 'WebHook')}
					{/if}
					{if $LAST_COLUMN}
						</tr>
						<tr class="resultlog" style='display:none; direction:ltr;'  id="result_log{$id}">
							<td class="listViewEntryValue {$WIDTHTYPE} alert alert-info"  width="50%" style='cursor:text; text-align:center;' colspan="4">
								{$REQUEST_TITLE}<br /><span>{$REQUEST_VALUE}</span>
							</td>
							<td class="listViewEntryValue {$WIDTHTYPE} {$RESPONSECLASS}"  width="{$WIDTH}%" style='cursor:text; text-align:center;' colspan="4">
								{$RESPONSE_TITLE}<br />
								<span>
                  <pre style="direction:ltr;text-align:left;background-color:unset;border:unset;"><code>{Zend_Json::decode($RESPONSE_VALUE)|@print_r:true}</code></pre>
               </span>
							</td>
						</tr>
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
						{vtranslate('No record found', 'WebHook')}
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
				$("#result_log"+ClickId).toggle();
			});
		});

	</script>
{/strip}
{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}
{include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
{assign var=SelectName value='List'}
{assign var=SelectOptions value=$USERSLIST}
{assign var=SearchName value='bruteforcelist'}
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
	<div class="col-sm-12 col-xs-12 ">
		<div id="listview-actions" class="listview-actions-container">
			<div class = "row">
				<div class='col-md-6 usersListDiv'>
					{if $smarty.request.view eq 'List'}
						<select class="select2 col-md-4" id="UserLists" style="min-width: 150px;">
							<option value="">{vtranslate('LBL_ALL', $QUALIFIED_MODULE)}</option>
							<option value="Success" name="Success" {if "Success" eq $status} selected {/if}>{vtranslate('Success', 'WebHook')}</option>
							<option value="Queued" name="Queued" {if "Queued" eq $status} selected {/if}>{vtranslate('Queued', 'WebHook')}</option>
							<option value="Failed" name="Failed" {if "Failed" eq $status} selected {/if}>{vtranslate('Failed', 'WebHook')}</option>
						</select>
					{/if}
					&nbsp;
				</div>
				<div class="col-md-6 pull-right">
					{assign var=RECORD_COUNT value=$LISTVIEW_ENTRIES_COUNT}
					{include file="Pagination.tpl"|vtemplate_path:$MODULE SHOWPAGEJUMP=true}
				</div>
			</div>
			<div class="list-content row">
				<div class="col-sm-12 col-xs-12 ">
					<div id="table-content" class="table-container" style="padding-top:0px !important;">
						<table id="listview-table" class="table listview-table">
							{assign var="NAME_FIELDS" value=$MODULE_MODEL->getNameFields()}
							{assign var=WIDTHTYPE value=$CURRENT_USER_MODEL->get('rowheight')}
							<thead>
							<tr class="listViewContentHeader">
								{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
									{if $LISTVIEW_HEADER->get('name') neq 'logs'}
										<th nowrap>
											<a {if !($LISTVIEW_HEADER->has('sort'))} class="listViewHeaderValues cursorPointer" data-nextsortorderval="{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-columnname="{$LISTVIEW_HEADER->get('name')}" {/if}>{vtranslate($LISTVIEW_HEADER->get('label'), $QUALIFIED_MODULE)}
												&nbsp;{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}<img class="{$SORT_IMAGE} icon-white">{/if}</a>&nbsp;
										</th>
									{/if}
								{/foreach}
								<th style="width:100px  !important;">
									{vtranslate('LBL_ACTIONS', $QUALIFIED_MODULE)}
								</th>
							</tr>
							</thead>
							<tbody class="overflow-y">
							{foreach item=LISTVIEW_ENTRY from=$LISTVIEW_ENTRIES}
								<tr class="listViewEntries" data-id="{$LISTVIEW_ENTRY->getId()}"
									{if method_exists($LISTVIEW_ENTRY,'getDetailViewUrl')}data-recordurl="{$LISTVIEW_ENTRY->getDetailViewUrl()}"{/if}
										{if method_exists($LISTVIEW_ENTRY,'getRowInfo')}data-info="{Vtiger_Util_Helper::toSafeHTML(ZEND_JSON::Encode($LISTVIEW_ENTRY->getRowInfo()))}"{/if}>
									{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
										{assign var=LISTVIEW_HEADERNAME value=$LISTVIEW_HEADER->get('name')}
										{assign var=LAST_COLUMN value=$LISTVIEW_HEADER@last}
										{if $LISTVIEW_HEADER->get('name') eq 'logs'}
											{assign var=LOGS value=ZEND_JSON::decode(htmlspecialchars_decode($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME)))}
										{else}
										<td class="listViewEntryValue {$WIDTHTYPE}" style="word-wrap: break-word">
											{vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME) , $QUALIFIED_MODULE)}
											{if $LAST_COLUMN && $LISTVIEW_ENTRY->getRecordLinks()}
												</td>
											{/if}
											</td>
										{/if}
									{/foreach}
									<td style="width:130px  !important; text-align:center">
										<div class="actions">
                           <span class="actionImages" style="text-align:center">
                           <a id="{$LISTVIEW_ENTRY->getId()}" class="logcounter" style="padding:0 5px">
                           <i title="{vtranslate('View','WebHook')}" class="fa fa-eye alignMiddle">
                           </i></a>
                           &nbsp;
                           {if $LOGS['module'] neq '' && $LOGS['record'] neq ''}
							   <a href="index.php?module={$LOGS['module']}&view=Detail&record={$LOGS['record']}" style="padding:0 5px" target="_blank"><i title="{vtranslate('View Record','WebHook')}" class="fa fa-list alignMiddle"></i></a>
						   {/if}
                           &nbsp;
                           {if $LOGS['module'] neq '' && $LOGS['record'] neq '' && ($FIREWOOK || $run_manually)}
							   <a href="index.php?module=WebHook&parent=Settings&view=List&action=Fire&id={$LISTVIEW_ENTRY->getId()}" style="padding:0 5px">
                           <i title="{vtranslate('Fire WebHook','WebHook')}" class="fa fa-play alignMiddle">
                           </i></a>
							   &nbsp;{/if}
                           <a class="deleteRecordButton" href="index.php?module=WebHook&parent=Settings&view=List&action=Delete&id={$LISTVIEW_ENTRY->getId()}" style="padding:0 5px">
                           <i title="{vtranslate('Delete','WebHook')}" class="fa fa-trash alignMiddle">
                           </i></a>
                           </span>
										</div>
									</td>
								</tr>
							{/foreach}
							{if $LISTVIEW_ENTRIES_COUNT eq '0'}
								<tr class="emptyRecordsDiv">
									{assign var=COLSPAN_WIDTH value={count($LISTVIEW_HEADERS)+1}}
									<td colspan="{$COLSPAN_WIDTH}" style="vertical-align:inherit !important;">
										<center>
											{vtranslate('No record found', 'WebHook')}
										</center>
									</td>
								</tr>
							{/if}
							</tbody>
						</table>
					</div>
					<div id="scroller_wrapper" class="bottom-fixed-scroll">
						<div id="scroller" class="scroller-div"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/strip}
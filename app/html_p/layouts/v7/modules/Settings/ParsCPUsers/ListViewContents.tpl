{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}

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
                <div class='col-md-3 usersListDiv'>
                    <select class="select2 col-md-4" id="cpstatus" style="min-width: 150px;">
                            <option value="">{vtranslate('LBL_ALL', $QUALIFIED_MODULE)}</option>
                            <option value="1"  name="cpstatus" {if $cpstatus eq 1} selected {/if}>{vtranslate('Active', $QUALIFIED_MODULE)}</option>
                            <option value="2"  name="cpstatus" {if $cpstatus eq 2} selected {/if}>{vtranslate('Expired', $QUALIFIED_MODULE)}</option>
                    </select>
                </div>
                <div class='col-md-4'>
                    <input class="search-list col-lg-4" id="cpusername" type="text" placeholder="{vtranslate('User Name', $QUALIFIED_MODULE)}" value="{$cpusername}">
                </div>
                <div class='col-md-1' style='padding-top: 5px;'>
		    <button id="searchusername" class="btn btn-success btn-sm">{vtranslate('LBL_SEARCH', $QUALIFIED_MODULE)}</button>
                </div>
                <div class="col-md-4 pull-right">
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
										<th style="width:100px  !important;">
											{vtranslate('LBL_ACTIONS', $QUALIFIED_MODULE)}
										</th>
									{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
										<th nowrap>
											<a {if !($LISTVIEW_HEADER->has('sort'))} class="listViewHeaderValues cursorPointer" data-nextsortorderval="{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-columnname="{$LISTVIEW_HEADER->get('name')}" {/if}>{vtranslate($LISTVIEW_HEADER->get('label'), $QUALIFIED_MODULE)}
												&nbsp;{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}<img class="{$SORT_IMAGE} icon-white">{/if}</a>&nbsp;
										</th>
									{/foreach}
								</tr>
							</thead>
							<tbody class="overflow-y">
								{foreach item=LISTVIEW_ENTRY from=$LISTVIEW_ENTRIES}
									<tr class="listViewEntries" data-id="{$LISTVIEW_ENTRY->getId()}"
										{if method_exists($LISTVIEW_ENTRY,'getDetailViewUrl')}data-recordurl="{$LISTVIEW_ENTRY->getDetailViewUrl()}"{/if}
										{if method_exists($LISTVIEW_ENTRY,'getRowInfo')}data-info="{Vtiger_Util_Helper::toSafeHTML(ZEND_JSON::Encode($LISTVIEW_ENTRY->getRowInfo()))}"{/if}>
										<td style="width:100px  !important;">
											{include file="ListViewRecordActions.tpl"|vtemplate_path:$QUALIFIED_MODULE}
										</td>
										{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
											{assign var=LISTVIEW_HEADERNAME value=$LISTVIEW_HEADER->get('name')}
											{assign var=LAST_COLUMN value=$LISTVIEW_HEADER@last}
											<td class="listViewEntryValue textOverflowEllipsis {$WIDTHTYPE}" nowrap>
												{vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME) , $QUALIFIED_MODULE)}
												{if $LAST_COLUMN && $LISTVIEW_ENTRY->getRecordLinks()}
													</td>
												{/if}
											</td>
										{/foreach}
									</tr>
								{/foreach}
								{if $LISTVIEW_ENTRIES_COUNT eq '0'}
									<tr class="emptyRecordsDiv">
										{assign var=COLSPAN_WIDTH value={count($LISTVIEW_HEADERS)+1}}
										<td colspan="{$COLSPAN_WIDTH}" style="vertical-align:inherit !important;">
											<center>
												{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
                                                                				{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
													{vtranslate('LBL_NO_RECORDS_FOUND', 'ParsVT')}
												{else}
													{vtranslate('LBL_NO')} {vtranslate($MODULE, $QUALIFIED_MODULE)} {vtranslate('LBL_FOUND')}.
												{/if}
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
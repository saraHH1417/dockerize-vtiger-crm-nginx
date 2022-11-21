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
	<div class="col-sm-12 col-xs-12 ">
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
		
		<div class="list-content row">
			<div class="col-sm-12 col-xs-12 ">
				<div id="table-content" class="table-container" style="padding-top:0px !important;">
					<table id="listview-table" class="table listview-table">
						{assign var="NAME_FIELDS" value=$MODULE_MODEL->getNameFields()}
						{assign var=WIDTHTYPE value=$CURRENT_USER_MODEL->get('rowheight')}
						<thead>
							<tr class="listViewHeaders">
									
									{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
										{assign var="HEADER_NAME" value="{$LISTVIEW_HEADER->get('name')}"}
										{*Showing all columns except description column*}
										{if $HEADER_NAME neq 'summary' && $HEADER_NAME neq 'module_name'}
											<th >
												<a {if !($LISTVIEW_HEADER->has('sort'))} class="listViewHeaderValues cursorPointer" data-nextsortorderval="{if $COLUMN_NAME eq $HEADER_NAME}{$NEXT_SORT_ORDER}{else}ASC{/if}"  data-columnname="{$HEADER_NAME}" {/if}>{vtranslate($LISTVIEW_HEADER->get('label'), $QUALIFIED_MODULE)}
													&nbsp;{if $COLUMN_NAME eq $HEADER_NAME}<img class="{$SORT_IMAGE} icon-white">{/if}</a>&nbsp;
											</th>
										{/if}
								{/foreach}
								<th class="listViewHeaders">{vtranslate('Action', $QUALIFIED_MODULE)}</th>
								
							</tr>
						</thead>
					<tbody>
							{foreach item=LISTVIEW_ENTRY from=$LISTVIEW_ENTRIES}
								<tr class="listViewEntries" data-id="{$LISTVIEW_ENTRY->getId()}"
									data-recordurl="{$LISTVIEW_ENTRY->getEditViewUrl()}" style="height: 30px">
									<td class="listViewEntryValue" style="width: 350px"><a href="{$LISTVIEW_ENTRY->getEditViewUrl()}">{vtranslate($LISTVIEW_ENTRY->get('primary_module_name'), $LISTVIEW_ENTRY->get('primary_module_name'))}</a></td>
									<td class="listViewEntryValue"><a href="{$LISTVIEW_ENTRY->getEditViewUrl()}">{vtranslate($LISTVIEW_ENTRY->get('target_module_name'), $LISTVIEW_ENTRY->get('target_module_name'))}</a></td>
									<td class="listViewEntryValue"><a href="{$LISTVIEW_ENTRY->getEditViewUrl()}">{vtranslate($LISTVIEW_ENTRY->get('displaytext'), $QUALIFIED_MODULE)}</a></td>
									<td class="listViewEntryValue"><a href="{$LISTVIEW_ENTRY->getEditViewUrl()}">{vtranslate($LISTVIEW_ENTRY->get('target_module_view'), $QUALIFIED_MODULE)}</a></td>
									<td class="listViewEntryValue">
		                                <div class="pull-left actions">
		                                   <span class="actionImages">
		                                        {foreach item=RECORD_LINK from=$LISTVIEW_ENTRY->getRecordLinks()}
		                                            {assign var="RECORD_LINK_URL" value=$RECORD_LINK->getUrl()}
		                                            <a {if stripos($RECORD_LINK_URL, 'javascript:')===0} onclick="{$RECORD_LINK_URL|substr:strlen("javascript:")};if(event.stopPropagation){ldelim}event.stopPropagation();{rdelim}else{ldelim}event.cancelBubble=true;{rdelim}" {else} href='{$RECORD_LINK_URL}' {/if}>
		                                                <i class="{$RECORD_LINK->getIcon()} alignMiddle" title="{vtranslate($RECORD_LINK->getLabel(), $QUALIFIED_MODULE)}"></i>
		                                            </a>
		                                            {if !$RECORD_LINK@last}
		                                                &nbsp;&nbsp;
		                                            {/if}
		                                        {/foreach}
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
											{vtranslate('LBL_NO_RECORDS_FOUND', $QUALIFIED_MODULE)}
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
{/strip}

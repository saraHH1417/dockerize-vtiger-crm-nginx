{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}

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
		<div class = "row">
			<div class='col-md-5'>
				<div class="foldersContainer hidden-xs pull-left">
					<select class="select2" style="width: 300px;" id="moduleFilter">
						<option value="" data-count='{$MODULES_COUNT['All']}'>{vtranslate('LBL_ALL', $QUALIFIED_MODULE)}&nbsp;{vtranslate('LBL_WORKFLOWS')}
						</option>
						{foreach item=MODULE_MODEL key=TAB_ID from=$SUPPORTED_MODULE_MODELS}
							<option {if $SOURCE_MODULE eq $MODULE_MODEL->getName()} selected="" {/if} value="{$MODULE_MODEL->getName()}" data-count='{if $MODULES_COUNT[$TAB_ID]}{$MODULES_COUNT[$TAB_ID]}{else}0{/if}'>
								{if $MODULE_MODEL->getName() eq 'Calendar'}
									{**PVTPATCHER-76CF2729B5AA2B818B0F909042F820C8-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}{vtranslate('WorkFlows','ParsVT')}&nbsp;{vtranslate('LBL_TASK', $MODULE_MODEL->getName())}{else}{vtranslate('LBL_TASK', $MODULE_MODEL->getName())}&nbsp;{vtranslate('LBL_WORKFLOWS')}{/if}
{** REPLACED-76CF2729B5AA2B818B0F909042F820C8// {vtranslate('LBL_TASK', $MODULE_MODEL->getName())}&nbsp;{vtranslate('LBL_WORKFLOWS')}**}
{**PVTPATCHER-76CF2729B5AA2B818B0F909042F820C8-FINISH**}
								{else}
									{**PVTPATCHER-4D96162A78CDB057AA1B40B8F41CFD4D-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}{vtranslate('WorkFlows','ParsVT')}&nbsp;{vtranslate($MODULE_MODEL->getName(),$MODULE_MODEL->getName())}{else}{vtranslate($MODULE_MODEL->getName(),$MODULE_MODEL->getName())}&nbsp;{vtranslate('LBL_WORKFLOWS')}{/if}
{** REPLACED-4D96162A78CDB057AA1B40B8F41CFD4D// {vtranslate($MODULE_MODEL->getName(),$MODULE_MODEL->getName())}&nbsp;{vtranslate('LBL_WORKFLOWS')}**}
{**PVTPATCHER-4D96162A78CDB057AA1B40B8F41CFD4D-FINISH**}
								{/if}
							</option>
						{/foreach}
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<div class="search-link hidden-xs" style="margin-top: 0px;">
					<span aria-hidden="true" class="fa fa-search"></span>
					<input class="searchWorkflows" type="text" value="{decode_html($SEARCH_VALUE)|htmlentities}" placeholder="{vtranslate('LBL_WORKFLOW_SEARCH', $QUALIFIED_MODULE)}">
				</div> 
			</div>
			<div class="col-md-3">
				{assign var=RECORD_COUNT value=$LISTVIEW_ENTRIES_COUNT}
				{include file="Pagination.tpl"|vtemplate_path:$MODULE SHOWPAGEJUMP=true}
			</div>
		</div>
		<div class="list-content row">
			<div class="col-sm-12 col-xs-12 ">
				<div id="table-content" class="table-container" style="padding-top:0px !important;">
					<table id="listview-table" class="workflow-table table listview-table">
						{assign var="NAME_FIELDS" value=$MODULE_MODEL->getNameFields()}
						{assign var=WIDTHTYPE value=$CURRENT_USER_MODEL->get('rowheight')}
						<thead>
							<tr class="listViewContentHeader">
								<th style="width: 100px;"></th>
									{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
										{assign var="HEADER_NAME" value="{$LISTVIEW_HEADER->get('name')}"}
										{*Showing all columns except description column*}
										{if $HEADER_NAME neq 'summary' && $HEADER_NAME neq 'module_name'}
											<th nowrap>
												<a {if !($LISTVIEW_HEADER->has('sort'))} class="listViewHeaderValues cursorPointer" data-nextsortorderval="{if $COLUMN_NAME eq $HEADER_NAME}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-columnname="{$HEADER_NAME}" {/if}>{vtranslate($LISTVIEW_HEADER->get('label'), $QUALIFIED_MODULE)}
													&nbsp;{if $COLUMN_NAME eq $HEADER_NAME}<img class="{$SORT_IMAGE} icon-white">{/if}</a>&nbsp;
											</th>
										{elseif $HEADER_NAME eq 'module_name' && empty($SOURCE_MODULE)}
											<th nowrap>
												<a {if !($LISTVIEW_HEADER->has('sort'))} class="listViewHeaderValues cursorPointer" data-nextsortorderval="{if $COLUMN_NAME eq $HEADER_NAME}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-columnname="{$HEADER_NAME}" {/if}>{vtranslate($LISTVIEW_HEADER->get('label'), $QUALIFIED_MODULE)}
													&nbsp;{if $COLUMN_NAME eq $HEADER_NAME}<img class="{$SORT_IMAGE} icon-white">{/if}</a>&nbsp;
											</th>
										{else}
										{/if}
								{/foreach}
								<th nowrap>{vtranslate('LBL_ACTIONS', $QUALIFIED_MODULE)}</th>
							</tr>
						</thead>
						<tbody>
							{foreach item=LISTVIEW_ENTRY from=$LISTVIEW_ENTRIES}
								<tr class="listViewEntries" data-id="{$LISTVIEW_ENTRY->getId()}"
									data-recordurl="{$LISTVIEW_ENTRY->getEditViewUrl()}&mode=V7Edit">
									<td>
										{include file="ListViewRecordActions.tpl"|vtemplate_path:$QUALIFIED_MODULE}
									</td>
									{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
										{assign var=LISTVIEW_HEADERNAME value=$LISTVIEW_HEADER->get('name')}
										{assign var=LAST_COLUMN value=$LISTVIEW_HEADER@last}
										{if $LISTVIEW_HEADERNAME neq 'summary' && $LISTVIEW_HEADERNAME neq 'module_name'}
											<td class="listViewEntryValue {$WIDTHTYPE}" width="{$WIDTH}%" nowrap>
												{if $LISTVIEW_HEADERNAME eq 'test'}
													{assign var=WORKFLOW_CONDITION value=$LISTVIEW_ENTRY->getConditonDisplayValue()}
													{assign var=ALL_CONDITIONS value=$WORKFLOW_CONDITION['All']}
													{assign var=ANY_CONDITIONS value=$WORKFLOW_CONDITION['Any']}
													<span><strong>{vtranslate('All')}&nbsp;:&nbsp;&nbsp;&nbsp;</strong></span>
													{if is_array($ALL_CONDITIONS) && !empty($ALL_CONDITIONS)}
														{foreach item=ALL_CONDITION from=$ALL_CONDITIONS name=allCounter}
															{if $smarty.foreach.allCounter.iteration neq 1}
																<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
															{/if}
															<span>{**PVTPATCHER-CECEDA2CB527C0BC968A23D32732E4A6-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($ALL_CONDITION)}
{** REPLACED-CECEDA2CB527C0BC968A23D32732E4A6// {$ALL_CONDITION}**}
{**PVTPATCHER-CECEDA2CB527C0BC968A23D32732E4A6-FINISH**}</span>
															<br>
														{/foreach}
													{else}
														{vtranslate('LBL_NA')}
													{/if}
													<br>
													<span><strong>{vtranslate('Any')}&nbsp;:&nbsp;</strong></span>
													{if is_array($ANY_CONDITIONS) && !empty($ANY_CONDITIONS)}
														{foreach item=ANY_CONDITION from=$ANY_CONDITIONS name=anyCounter}
															{if $smarty.foreach.anyCounter.iteration neq 1}
																<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
															{/if}
															<span>{$ANY_CONDITION}</span>
															<br>
														{/foreach}
													{else}
														{vtranslate('LBL_NA')}
													{/if}
												{elseif $LISTVIEW_HEADERNAME eq 'execution_condition'}
													{$LISTVIEW_ENTRY->getDisplayValue('v7_execution_condition')}
												{else}
													{**PVTPATCHER-9F888B2B949B1D744533E7DC3C3EABFA-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME), $QUALIFIED_MODULE)}
{** REPLACED-9F888B2B949B1D744533E7DC3C3EABFA// {$LISTVIEW_ENTRY->getDisplayValue($LISTVIEW_HEADERNAME)}**}
{**PVTPATCHER-9F888B2B949B1D744533E7DC3C3EABFA-FINISH**}
												{/if}
											</td>
										{elseif $LISTVIEW_HEADERNAME eq 'module_name' && empty($SOURCE_MODULE)}
											<td class="listViewEntryValue {$WIDTHTYPE}" width="{$WIDTH}%" nowrap>
												{assign var="MODULE_ICON_NAME" value="{strtolower($LISTVIEW_ENTRY->get('raw_module_name'))}"}
												{Vtiger_Module_Model::getModuleIconPath($LISTVIEW_ENTRY->get('raw_module_name'))}
											</td>
										{else}
										{/if}
									{/foreach}
									<td class="listViewEntryValue {$WIDTHTYPE}" width="{$WIDTH}%" nowrap>
										{assign var=ACTIONS value=$LISTVIEW_ENTRY->getActionsDisplayValue()}
										{if is_array($ACTIONS) && !empty($ACTIONS)}
											{foreach item=ACTION_COUNT key=ACTION_NAME from=$ACTIONS}
												{vtranslate("LBL_$ACTION_NAME", $QUALIFIED_MODULE)}&nbsp;({$ACTION_COUNT})
											{/foreach}
										{/if}
									</td>
								</tr>
							{/foreach}
							{if $LISTVIEW_ENTRIES_COUNT eq '0'}
								<tr class="emptyRecordsDiv">
									{assign var=COLSPAN_WIDTH value={count($LISTVIEW_HEADERS)+1}}
									<td colspan="{$COLSPAN_WIDTH}" style="vertical-align:inherit !important;">
										<center>{**PVTPATCHER-92040D4C539545966B55AC42D6F65183-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
                                                                {if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
								{vtranslate('LBL_NO_RECORDS_FOUND', 'ParsVT')}
								{else}
								{vtranslate('LBL_NO')} {vtranslate($MODULE, $QUALIFIED_MODULE)} {vtranslate('LBL_FOUND')}.
								{/if}
{** REPLACED-92040D4C539545966B55AC42D6F65183// {vtranslate('LBL_NO')} {vtranslate($MODULE, $QUALIFIED_MODULE)} {vtranslate('LBL_FOUND')}**}
{**PVTPATCHER-92040D4C539545966B55AC42D6F65183-FINISH**}</center>
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

{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
{* modules/Vtiger/views/Detail.php *}

{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
{strip}
	<input type="hidden" name="page" value="{$PAGING_MODEL->get('page')}" />
	<input type="hidden" name="pageLimit" value="{$PAGING_MODEL->get('limit')}" />
	{if $RELATED_MODULE && $RELATED_RECORDS}
		{assign var=FILENAME value=$RELATED_MODULE|cat:"SummaryWidgetContents.tpl"}
		{include file=$FILENAME|vtemplate_path:$MODULE RELATED_RECORDS=$RELATED_RECORDS}
    {else}
		<div class="summaryWidgetContainer noContent">
			<p class="textAlignCenter">{**PVTPATCHER-EE83337C5955687A5682F2A73AEA4E85-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
                                                   {if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
							  {vtranslate('No related record found in %s', 'ParsVT',vtranslate($RELATED_MODULE, $RELATED_MODULE))}
                                                   {else}
							  {vtranslate('LBL_NO_RELATED',$MODULE)} {$RELATED_MODULE}
                                                   {/if}
{** REPLACED-EE83337C5955687A5682F2A73AEA4E85// {vtranslate('LBL_NO_RELATED',$MODULE)} {$RELATED_MODULE}**}
{**PVTPATCHER-EE83337C5955687A5682F2A73AEA4E85-FINISH**}</p>
		</div>
	{/if}
{/strip}
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
{include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
{if $smarty.get.view eq 'List'}
<div class="container-fluid">
	<div class="row-fluid">
		<span class="span8 btn-toolbar">
				<select class="chzn-select" id="usersFilter" >
		 			<option value="">{vtranslate('LBL_ALL', $QUALIFIED_MODULE)}</option>
                                        <option value="Success" name="Success" {if "Success" eq $status} selected {/if}>{vtranslate('Success', 'WebHook')}</option>
                                        <option value="Queued" name="Queued" {if "Queued" eq $status} selected {/if}>{vtranslate('Queued', 'WebHook')}</option>
                                        <option value="Failed" name="Failed" {if "Failed" eq $status} selected {/if}>{vtranslate('Failed', 'WebHook')}</option>
				</select>
		</span>
		<span class="span4 btn-toolbar">
			{include file='ListViewActions.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
		</span>
	</div>
	<div class="clearfix"></div>
	<div class="listViewContentDiv" id="listViewContents">
{/if}
{/strip}
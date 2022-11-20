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
{*/Please Don't Change Below Line/*}
{assign var="_ThemeNumber" value='5'}
{assign var="_DefaultTwoStepTemplate" value=vtemplate_path('TwoStep.Default.tpl', 'Users')}
{assign var="_CustomTwoStepTemplate" value=vtemplate_path('TwoStep.Custom5.tpl', 'Users')}
{assign var="_CustomTwoStepTemplateFullPath" value="layouts/vlayout/$_CustomTwoStepTemplate"}

{if file_exists($_CustomTwoStepTemplateFullPath)}
	{include file=$_CustomTwoStepTemplate}
{else}
	{include file=$_DefaultTwoStepTemplate}
{/if}

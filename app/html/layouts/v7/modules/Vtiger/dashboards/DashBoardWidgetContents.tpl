{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
    {if count($DATA) gt 0 }
        <input class="widgetData" type=hidden value='{Vtiger_Util_Helper::toSafeHTML(ZEND_JSON::encode($DATA))}' />
        <input class="yAxisFieldType" type="hidden" value="{$YAXIS_FIELD_TYPE}" />
        <div class="row" style="margin:0px 10px;">
            <div class="col-lg-11">
                <div class="widgetChartContainer" name='chartcontent' style="height:220px;min-width:300px; margin: 0 auto"></div>
                <br>
            </div>
			<div class="col-lg-1"></div>
        </div>
    {else}
        <span class="noDataMsg">
            {**PVTPATCHER-F8C5BC885836D360E2F931DD344F49A5-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
		{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
		      {vtranslate('No %s records matched this criteria to view', 'ParsVT',vtranslate($MODULE_NAME, $MODULE_NAME))}
		{else}
		      {vtranslate('LBL_NO')} {vtranslate($MODULE_NAME, $MODULE_NAME)} {vtranslate('LBL_MATCHED_THIS_CRITERIA')}
		{/if}
{** REPLACED-F8C5BC885836D360E2F931DD344F49A5// {vtranslate('LBL_NO')} {vtranslate($MODULE_NAME, $MODULE_NAME)} {vtranslate('LBL_MATCHED_THIS_CRITERIA')}**}
{**PVTPATCHER-F8C5BC885836D360E2F931DD344F49A5-FINISH**}
        </span>
    {/if}
{/strip}
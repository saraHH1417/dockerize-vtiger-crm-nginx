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
{**PVTPATCHER-D5F72BDF08987917B86FCD12981AF699-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
<style>
div * {
    direction:rtl;
    text-align: right;
    font-family:tahoma;
    font-size: 12px;
}
.small {
    text-align: left !important;
}
</style>
{/if}
<div style="margin:0 auto;width: 50em;">
{** REPLACED-D5F72BDF08987917B86FCD12981AF699// <div style="margin:0 auto;width: 50em;">**}
{**PVTPATCHER-D5F72BDF08987917B86FCD12981AF699-FINISH**}
	<table border='0' cellpadding='5' cellspacing='0' height='600px' width="700px">
	<tr><td align='center'>
		<div style='border: 3px solid rgb(153, 153, 153); background-color: rgb(255, 255, 255); width: 80%; position: relative; z-index: 100000020;'>

		<table border='0' cellpadding='5' cellspacing='0' width='98%'>
		<tr>
			<td rowspan='2' width='11%'><img src="{vimage_path('denied.gif')}" ></td>
			<td style='border-bottom: 1px solid rgb(204, 204, 204);' nowrap='nowrap' width='70%'>
				<span class='genHeaderSmall'>{**PVTPATCHER-ED8238AB677D3A590A80E9C752E66456-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($MESSAGE , 'ParsVT')}
{** REPLACED-ED8238AB677D3A590A80E9C752E66456// {vtranslate($MESSAGE)}**}
{**PVTPATCHER-ED8238AB677D3A590A80E9C752E66456-FINISH**}</span></td>
		</tr>
		<tr>
			<td class='small' align='right' nowrap='nowrap'>
				<a href='javascript:window.history.back();'>{vtranslate('LBL_GO_BACK')}</a><br>
			</td>
		</tr>
		</table>
		</div>
	</td></tr>
	</table>
</div>
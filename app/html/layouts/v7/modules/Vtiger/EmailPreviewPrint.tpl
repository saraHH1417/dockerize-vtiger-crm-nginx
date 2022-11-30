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
<!DOCTYPE>
<html>
	<head>
		{**PVTPATCHER-E2FE777F52DC0AFB2724BAE54D0D48B7-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
              {if $CURRENT_USER_MODEL->get('language') eq 'fa_ir'}<link type="text/css" rel="stylesheet" href="modules/ParsVT/resources/styles/rtl.php" media="screen" /> {$left='right'} {$right='left'} {else} {$left='left'} {$right='right'} {/if}
{** REPLACED-E2FE777F52DC0AFB2724BAE54D0D48B7// <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">**}
{**PVTPATCHER-E2FE777F52DC0AFB2724BAE54D0D48B7-FINISH**}
	</head>
	{**PVTPATCHER-26D35E7E74F189615971C20108392B13-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<body  class='print-email'
{** REPLACED-26D35E7E74F189615971C20108392B13// <body**}
{**PVTPATCHER-26D35E7E74F189615971C20108392B13-FINISH**} onLoad="javascript:window.print()" style="padding:3% 5%;">
		{assign var="TO_EMAILS" value=$RECORD->get('saved_toid')|replace:']':''}
		{assign var="TO_EMAIL" value=$TO_EMAILS|replace:'[':''}
		{assign var="TO_EMAIL_VALUE" value=$TO_EMAIL|replace:'&quot;':''}
		<span style="position:absolute;right:6%;top:3%;font-family:'Lucida Grande';font-size:15px">
			{$USER_MODEL->get('first_name')} {$USER_MODEL->get('last_name')} &lt;{$USER_MODEL->get('email1')}&gt;
		</span><hr/>
		<span style="font-family:'Lucida Grande';font-size:15px">
			{$RECORD->get('subject')}
		</span><hr/>
		<div>
			<div style="width:100%;{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$right};
{** REPLACED-BDAC364549F53A7B9798423EA6BF720B// text-align: right;**}
{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-FINISH**}font-family:'Lucida Grande';font-size:15px">
				<span>
					{Vtiger_Util_Helper::formatDateTimeIntoDayString($RECORD->get('createdtime'))}
				</span>
			</div>
		</div>
		<div>
			<div style="{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
float:{$left};
{** REPLACED-003D57FC4B3FC105200E22ACAD9412EC// float:left;**}
{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-FINISH**}width:10%;{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$right};
{** REPLACED-BDAC364549F53A7B9798423EA6BF720B// text-align: right;**}
{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-FINISH**}font-family:'Lucida Grande';font-size:15px">
				{vtranslate('LBL_FROM',$MODULE)}
			</div>
			<div style="width:90%;{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$left};
{** REPLACED-3B3331CD3A01BA757C191958D318F197// text-align: left;**}
{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-FINISH**}font-family:'Lucida Grande';font-size:15px">
				<span style="{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
margin-{$left}:7%;
{** REPLACED-421887843D9DFA15B0D7178E5DF71893// margin-left:7%;**}
{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-FINISH**}">
					{$FROM}
				</span>
			</div>
			<div class="clear-both"></div>
		</div>
		<div>
			<div style="{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
float:{$left};
{** REPLACED-003D57FC4B3FC105200E22ACAD9412EC// float:left;**}
{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-FINISH**}width:10%;{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$right};
{** REPLACED-BDAC364549F53A7B9798423EA6BF720B// text-align: right;**}
{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-FINISH**}font-family:'Lucida Grande';font-size:15px">
				{vtranslate('LBL_TO',$MODULE)}
			</div>
			<div style="width:90%;{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$left};
{** REPLACED-3B3331CD3A01BA757C191958D318F197// text-align: left;**}
{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-FINISH**}font-family:'Lucida Grande';font-size:15px">
				<span style="{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
margin-{$left}:7%;
{** REPLACED-421887843D9DFA15B0D7178E5DF71893// margin-left:7%;**}
{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-FINISH**}font-family:'Lucida Grande';font-size:15px">
					{assign var=TO_EMAILS value=","|implode:$TO}
					{$TO_EMAILS}
				</span>
			</div>
			<div class="clear-both"></div>
		</div>
		{if !empty($CC)}
			<div>
				<div style="{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
float:{$left};
{** REPLACED-003D57FC4B3FC105200E22ACAD9412EC// float:left;**}
{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-FINISH**}width:10%;{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$right};
{** REPLACED-BDAC364549F53A7B9798423EA6BF720B// text-align: right;**}
{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-FINISH**}font-family:'Lucida Grande';font-size:15px">
					{vtranslate('LBL_CC',$MODULE)}
				</div>
				<div style="width:90%;{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$left};
{** REPLACED-3B3331CD3A01BA757C191958D318F197// text-align: left;**}
{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-FINISH**}font-family:'Lucida Grande';font-size:15px">
					<span style="{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
margin-{$left}:7%;
{** REPLACED-421887843D9DFA15B0D7178E5DF71893// margin-left:7%;**}
{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-FINISH**}">
						{if !empty($CC)}
							{$CC}
						{/if}
					</span>
				</div>
				<div class="clear-both"></div>
			</div>
		{/if}
		{if !empty($BCC)}
			<div>
				<div style="{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
float:{$left};
{** REPLACED-003D57FC4B3FC105200E22ACAD9412EC// float:left;**}
{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-FINISH**}width:10%;{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$right};
{** REPLACED-BDAC364549F53A7B9798423EA6BF720B// text-align: right;**}
{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-FINISH**}font-family:'Lucida Grande';font-size:15px">
					{vtranslate('LBL_BCC',$MODULE)}
				</div>
				<div style="width:90%;{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$left};
{** REPLACED-3B3331CD3A01BA757C191958D318F197// text-align: left;**}
{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-FINISH**}font-family:'Lucida Grande';font-size:15px">
					<span style="{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
margin-{$left}:7%;
{** REPLACED-421887843D9DFA15B0D7178E5DF71893// margin-left:7%;**}
{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-FINISH**}">
						{if !empty($BCC)}
							{$BCC}
						{/if}
					</span>
				</div>
				<div class="clear-both"></div>
			</div>
		{/if}
		<div>
			<div style="{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
float:{$left};
{** REPLACED-003D57FC4B3FC105200E22ACAD9412EC// float:left;**}
{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-FINISH**}width:10%;{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$right};
{** REPLACED-BDAC364549F53A7B9798423EA6BF720B// text-align: right;**}
{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-FINISH**}font-family:'Lucida Grande';font-size:15px">
				{vtranslate('LBL_SUBJECT',$MODULE)}
			</div>
			<div style="width:90%;{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$left};
{** REPLACED-3B3331CD3A01BA757C191958D318F197// text-align: left;**}
{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-FINISH**}font-family:'Lucida Grande';font-size:15px">
				<span style="{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
margin-{$left}:7%;
{** REPLACED-421887843D9DFA15B0D7178E5DF71893// margin-left:7%;**}
{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-FINISH**}">
					{$RECORD->get('subject')}
				</span>
			</div>
			<div class="clear-both"></div>
		</div>
		{assign var="ATTACHMENT_DETAILS" value=$RECORD->getAttachmentDetails()}
		{if !empty($ATTACHMENT_DETAILS)}
			<div>
				<div style="{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
float:{$left};
{** REPLACED-003D57FC4B3FC105200E22ACAD9412EC// float:left;**}
{**PVTPATCHER-003D57FC4B3FC105200E22ACAD9412EC-FINISH**}width:10%;{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$right};
{** REPLACED-BDAC364549F53A7B9798423EA6BF720B// text-align: right;**}
{**PVTPATCHER-BDAC364549F53A7B9798423EA6BF720B-FINISH**}font-family:'Lucida Grande';font-size:15px">
					{vtranslate('LBL_ATTACHMENT',$MODULE)}
				</div>
				<div style="width:90%;{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$left};
{** REPLACED-3B3331CD3A01BA757C191958D318F197// text-align: left;**}
{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-FINISH**}font-family:'Lucida Grande';font-size:15px">
					<span style="{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
margin-{$left}:7%;
{** REPLACED-421887843D9DFA15B0D7178E5DF71893// margin-left:7%;**}
{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-FINISH**}">
						{foreach item=ATTACHMENT_DETAIL  from=$ATTACHMENT_DETAILS}
							<a href="javascript:void(0)">{$ATTACHMENT_DETAIL['attachment']}</a>&nbsp;&nbsp;
						{/foreach}
					</span>
				</div>
				<div class="clear-both"></div>
			</div>
		{/if}
		<div>
			<div style="width:90%;{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
text-align: {$left};
{** REPLACED-3B3331CD3A01BA757C191958D318F197// text-align: left;**}
{**PVTPATCHER-3B3331CD3A01BA757C191958D318F197-FINISH**}{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
margin-{$left}:7%;
{** REPLACED-421887843D9DFA15B0D7178E5DF71893// margin-left:7%;**}
{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-FINISH**}font-family:'Lucida Grande';font-size:15px">
				<span style="{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
margin-{$left}:7%;
{** REPLACED-421887843D9DFA15B0D7178E5DF71893// margin-left:7%;**}
{**PVTPATCHER-421887843D9DFA15B0D7178E5DF71893-FINISH**}">
					{decode_html($RECORD->get('description'))}
				</span>
			</div>
			<div class="clear-both"></div>
		</div>
	</body>
</html>
{/strip}

{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Settings/Groups/views/Detail.php *}

{strip}
	<div class="detailViewContainer full-height">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 main-scroll">
			<div class="detailViewInfo" >
				<form id="detailView" class="form-horizontal" method="POST">
					<div class="clearfix">
						<h4 class="pull-left">
							{**PVTPATCHER-0BBB9097A156DEA824F4F210F9C7B190-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($RECORD_MODEL->get('groupname'))}
{** REPLACED-0BBB9097A156DEA824F4F210F9C7B190// {$RECORD_MODEL->get('groupname')}**}
{**PVTPATCHER-0BBB9097A156DEA824F4F210F9C7B190-FINISH**}
						</h4>
						<div class="btn-group pull-right" >
							<button class="btn btn-default" onclick="window.location.href='{$RECORD_MODEL->getEditViewUrl()}'" type="button">
								<strong>{vtranslate('LBL_EDIT_RECORD', $MODULE)}</strong>
							</button>
						</div>
					</div>
					<hr>
					<div class="form-group">
						<span class="fieldLabel col-lg-3 col-md-3 col-sm-3">
							{vtranslate('LBL_GROUP_NAME', $QUALIFIED_MODULE)}&nbsp;<span class="redColor">*</span>
						</span>
						<div class="fieldValue">
							<b>{**PVTPATCHER-5AFBE89055A656644FED3E0E0ED14078-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($RECORD_MODEL->getName())}
{** REPLACED-5AFBE89055A656644FED3E0E0ED14078// {$RECORD_MODEL->getName()}**}
{**PVTPATCHER-5AFBE89055A656644FED3E0E0ED14078-FINISH**}</b>
						</div>
					</div>
					<div class="form-group">
						<span class="fieldLabel col-lg-3 col-md-3 col-sm-3">
							{vtranslate('LBL_DESCRIPTION', $QUALIFIED_MODULE)}
						</span>
						<div class="fieldValue">
							<b>{**PVTPATCHER-3F7A9EFFDDBB1F24F1F26805B43E74C3-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($RECORD_MODEL->getDescription())}
{** REPLACED-3F7A9EFFDDBB1F24F1F26805B43E74C3// {$RECORD_MODEL->getDescription()}**}
{**PVTPATCHER-3F7A9EFFDDBB1F24F1F26805B43E74C3-FINISH**}</b>
						</div>
					</div>
					<div class="form-group ">
						<span class="fieldLabel col-lg-3 col-md-3 col-sm-3 ">
							{vtranslate('LBL_GROUP_MEMBERS', $QUALIFIED_MODULE)}&nbsp;<span class="redColor">*</span>
						</span>
						<div class="fieldValue">
							<span class="col-lg-6 col-md-6 col-sm-6 collectiveGroupMembers" style="width:auto;min-width:300px">
								<ul class="nav">
									{assign var="GROUPS" value=$RECORD_MODEL->getMembers()}
									{foreach key=GROUP_LABEL item=GROUP_MEMBERS from=$GROUPS}
										{if !empty($GROUP_MEMBERS)}
											<li class="groupLabel">
												{vtranslate($GROUP_LABEL,$QUALIFIED_MODULE)}
											</li>
											{foreach item=GROUP_MEMBER_INFO from=$GROUP_MEMBERS}
												<li>
													<a href="{$GROUP_MEMBER_INFO->getDetailViewUrl()}">{$GROUP_MEMBER_INFO->get('name')}</a>
												</li>
											{/foreach}
										{/if}
									{/foreach}
								</ul>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
{strip}
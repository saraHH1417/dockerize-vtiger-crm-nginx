{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<style>
	.advpvt ul, .advpvt li, .advpvt ul li .select2-input {
		width: unset !important;
	}

</style>
<script type="text/javascript">
	Vtiger_Funnel_Widget_Js('Vtiger_Groupedbysalesstage_Widget_Js',{},{});
</script>
{foreach key=index item=cssModel from=$STYLES}
	<link rel="{$cssModel->getRel()}" href="{$cssModel->getHref()}" type="{$cssModel->getType()}" media="{$cssModel->getMedia()}" />
{/foreach}
{foreach key=index item=jsModel from=$SCRIPTS}
	<script type="{$jsModel->getType()}" src="{$jsModel->getSrc()}"></script>
{/foreach}

<div class="dashboardWidgetHeader">
	{include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME}
</div>


<div class="dashboardWidgetContent">
	{include file="dashboards/DashBoardGroupBySalesStageNew.tpl"|@vtemplate_path:$MODULE_NAME}
</div>

<div class="widgeticons dashBoardWidgetFooter">
	<div class="filterContainer advpvt">
		{*<div class="row">
			<span class="col-lg-5">
				<span class="pull-right">
					{vtranslate('Assigned To', $MODULE_NAME)}
				</span>
			</span>
			<span class="col-lg-4">
				<select class="select2 widgetFilter" id="owner" multiple="multiple" name="owner" style='width:160px;margin-bottom:0px'>
					<option value="{$CURRENTUSER->getId()}" >{vtranslate('LBL_MINE')}</option>
					<option value="all">{vtranslate('LBL_ALL')}</option>
					{assign var=ALL_ACTIVEUSER_LIST value=$CURRENTUSER->getAccessibleUsers()}
					{if count($ALL_ACTIVEUSER_LIST) gt 1}
						<optgroup label="{vtranslate('LBL_USERS')}">
							{foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEUSER_LIST}
								{if $OWNER_ID neq {$CURRENTUSER->getId()}}
									<option value="{$OWNER_ID}">{vtranslate($OWNER_NAME)}</option>
								{/if}
							{/foreach}
						</optgroup>
					{/if}
					{assign var=ALL_ACTIVEGROUP_LIST value=$CURRENTUSER->getAccessibleGroups()}
					{if !empty($ALL_ACTIVEGROUP_LIST)}
						<optgroup label="{vtranslate('LBL_GROUPS')}">
							{foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEGROUP_LIST}
								<option value="{$OWNER_ID}">{vtranslate($OWNER_NAME)}</option>
							{/foreach}
						</optgroup>
					{/if}
				</select>
			</span>
		</div>
		<div class="row">
			<span class="col-lg-5">
				<span class="pull-right">
					{vtranslate('LBL_USERS_WITH_SAME_OR_LOWER_LEVEL', $MODULE_NAME)}
				</span>
			</span>
			<span class="col-lg-4">
				<select class="select2 widgetFilter reloadOnChange" id="allusers" name="allusers" style='width:160px;margin-bottom:0px'>
					<option value="No" >{vtranslate('LBL_NO')}</option>
					<option value="Yes">{vtranslate('LBL_YES')}</option>
				</select>
			</span>
		</div>
		<div class="row">
			<span class="col-lg-5">
				<span class="pull-right">
					{vtranslate('Sales Stage', $MODULE_NAME)}
				</span>
			</span>
			<span class="col-lg-4">
				<select class="select2 widgetFilter" id="sales_stage" multiple="multiple" name="sales_stage" style='width:160px;margin-bottom:0px'>
				<option value="all">{vtranslate('LBL_ALL')}</option>
					{foreach item=SALES_STAGE from=$ALL_SALES_STAGE}
						<option value="{$SALES_STAGE}">{vtranslate({$SALES_STAGE}, 'Potentials')}</option>
					{/foreach}
				</select>
			</span>
		</div>*}
		{*<div class="row">
			<span class="col-lg-5">
				<span class="pull-right">
					{vtranslate('Expected Close Date', $MODULE_NAME)}
				</span>
			</span>
			<span class="col-lg-4">
				<input type="text" name="expectedclosedate" class="dateRange widgetFilter" />
			</span>
		</div>*}

	</div>
	<div class="footerIcons pull-right">

			{*<a name="dfilter">
				<i class='fa fa-cog' border='0' align="absmiddle" title="{vtranslate('LBL_FILTER')}" alt="{vtranslate('LBL_FILTER')}"/>
			</a>*}
		{if !empty($CHART_TYPE)}
			{assign var=CHART_DATA value=ZEND_JSON::decode($DATA)}
			{assign var=CHART_VALUES value=$CHART_DATA['values']}
		{/if}
		{if !empty($CHART_TYPE) && $REPORT_MODEL->isEditable() eq true}
			<a href="{$REPORT_MODEL->getEditViewUrl()}" name="customizeChartReportWidget">
				<i class="fa fa-edit" hspace="2" border="0" align="absmiddle" title="{vtranslate('LBL_CUSTOMIZE',$MODULE)}" alt="{vtranslate('LBL_CUSTOMIZE',$MODULE)}"></i>
			</a>
		{/if}
		{if !$WIDGET->isDefault()}
			<a name="dclose" class="widget" data-url="{$WIDGET->getDeleteUrl()}">
				<i class="fa fa-remove" hspace="2" border="0" align="absmiddle" title="{vtranslate('LBL_REMOVE')}" alt="{vtranslate('LBL_REMOVE')}"></i>
			</a>
		{/if}
	</div>
</div>

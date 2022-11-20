{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}

{include file="modules/Vtiger/partials/Topbar.tpl"}

<div class="container-fluid app-nav">
	<div class="row">
		{include file="partials/SidebarHeader.tpl"|vtemplate_path:$MODULE}
		<div class="col-sm-12 col-xs-12 module-action-bar clearfix coloredBorderTop" style="border-bottom: 1px solid #DDDDDD;">
			<div class="module-action-content clearfix">
				{assign var=MODULE_MODEL value=Vtiger_Module_Model::getInstance($PARSVT_PARENT_MODULE)}
				{if $smarty.request.ll || $MODULE_MODEL->getDefaultViewName() neq 'List'}
					{assign var=DEFAULT_FILTER_URL value=$MODULE_MODEL->getDefaultUrl()}
				{else}
					{assign var=DEFAULT_FILTER_ID value=$MODULE_MODEL->getDefaultCustomFilter()}
					{if $DEFAULT_FILTER_ID}
						{assign var=CVURL value="&viewname="|cat:$DEFAULT_FILTER_ID}
						{assign var=DEFAULT_FILTER_URL value=$MODULE_MODEL->getListViewUrl()|cat:$CVURL}
					{else}
						{assign var=DEFAULT_FILTER_URL value=$MODULE_MODEL->getListViewUrlWithAllFilter()}
					{/if}
				{/if}
				<a title="{vtranslate($PARSVT_PARENT_MODULE, $PARSVT_PARENT_MODULE)}" href='{$DEFAULT_FILTER_URL}&app={$SELECTED_MENU_CATEGORY}'><h4 class="module-title pull-left text-uppercase"> {vtranslate($PARSVT_PARENT_MODULE, $PARSVT_PARENT_MODULE)} </h4>&nbsp;&nbsp;</a>
				{if $smarty.session.lvs.$MODULE.viewname}
					{assign var=VIEWID value=$smarty.session.lvs.$MODULE.viewname}
				{/if}
				{if $VIEWID}
					{foreach item=FILTER_TYPES from=$CUSTOM_VIEWS}
						{foreach item=FILTERS from=$FILTER_TYPES}
							{if $FILTERS->get('cvid') eq $VIEWID}
								{assign var=CVNAME value=$FILTERS->get('viewname')}
								{break}
							{/if}
						{/foreach}
					{/foreach}

					<p class="current-filter-name filter-name pull-left cursorPointer" title="{vtranslate($CVNAME,$MODULE)}">&nbsp;<span class="fa fa-angle-right pull-left" aria-hidden="true"></span><a href='{$MODULE_MODEL->getListViewUrl()}&viewname={$VIEWID}&app={$SELECTED_MENU_CATEGORY}&goback=1'  style="max-width:unset !important;">&nbsp;&nbsp;{vtranslate('LBL_GO_BACK_TO_LISTVIEW', 'ParsVT')}&nbsp;-&nbsp;{vtranslate($CVNAME,$MODULE)}&nbsp;&nbsp;</a> </p>

				{/if}

				<div class="col-lg-5 col-md-5 pull-right">
					<div id="appnav" class="navbar-right">
						<ul class="nav navbar-nav">
							{foreach item=BASIC_ACTION from=$MODULE_BASIC_ACTIONS}
								{if $BASIC_ACTION->getLabel() == 'LBL_IMPORT'}
									<li>
										<button id="{$MODULE}_basicAction_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($BASIC_ACTION->getLabel())}" type="button" class="btn addButton btn-default module-buttons"
												{if stripos($BASIC_ACTION->getUrl(), 'javascript:')===0}
											onclick='{$BASIC_ACTION->getUrl()|substr:strlen("javascript:")};'
												{else}
											onclick="Vtiger_Import_Js.triggerImportAction('{$BASIC_ACTION->getUrl()}')"
												{/if}>
											<div class="fa {$BASIC_ACTION->getIcon()}" aria-hidden="true"></div>&nbsp;&nbsp;
											{vtranslate($BASIC_ACTION->getLabel(), $MODULE)}
										</button>
									</li>
								{else}
									<li>
										<button id="{$MODULE}_listView_basicAction_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($BASIC_ACTION->getLabel())}" type="button" class="btn addButton btn-default module-buttons"
												{if stripos($BASIC_ACTION->getUrl(), 'javascript:')===0}
											onclick='{$BASIC_ACTION->getUrl()|substr:strlen("javascript:")};'
												{else}
											onclick='window.location.href = "{$BASIC_ACTION->getUrl()}&app={$SELECTED_MENU_CATEGORY}"'
												{/if}>
											<div class="fa {$BASIC_ACTION->getIcon()}" aria-hidden="true"></div>&nbsp;&nbsp;
											{vtranslate($BASIC_ACTION->getLabel(), $MODULE)}
										</button>
									</li>
								{/if}
							{/foreach}
							{if $MODULE_SETTING_ACTIONS|@count gt 0}
								<li>
									<div class="settingsIcon">
										<button type="button" class="btn btn-default module-buttons dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<span class="fa fa-wrench" aria-hidden="true" title="{vtranslate('LBL_SETTINGS', $MODULE)}"></span>&nbsp;{vtranslate('LBL_CUSTOMIZE', 'Reports')}&nbsp; <span class="caret"></span>
										</button>
										<ul class="detailViewSetting dropdown-menu">
											{foreach item=SETTING from=$MODULE_SETTING_ACTIONS}
												<li id="{$MODULE_NAME}_listview_advancedAction_{$SETTING->getLabel()}"><a href={$SETTING->getUrl()}>{vtranslate($SETTING->getLabel(), $MODULE_NAME ,vtranslate($MODULE_NAME, $MODULE_NAME))}</a></li>
											{/foreach}
										</ul>
									</div>
								</li>
							{/if}
						</ul>
					</div>

				</div>
			</div>
		</div>
		{if $FIELDS_INFO neq null}
			<script type="text/javascript">
				var uimeta = (function () {
					var fieldInfo = {$FIELDS_INFO};
					return {
						field: {
							get: function (name, property) {
								if (name && property === undefined) {
									return fieldInfo[name];
								}
								if (name && property) {
									return fieldInfo[name][property]
								}
							},
							isMandatory: function (name) {
								if (fieldInfo[name]) {
									return fieldInfo[name].mandatory;
								}
								return false;
							},
							getType: function (name) {
								if (fieldInfo[name]) {
									return fieldInfo[name].type
								}
								return false;
							}
						},
					};
				})();
			</script>
		{/if}
	</div>
</div>
</nav>
<div id='overlayPageContent' class='fade modal overlayPageContent content-area overlay-container-60' tabindex='-1' role='dialog' aria-hidden='true'>
	<div class="data">
	</div>
	<div class="modal-dialog">
	</div>
</div>  
<div class="main-container main-container-{$MODULE}">
		{assign var=LEFTPANELHIDE value=$CURRENT_USER_MODEL->get('leftpanelhide')}
		<div id="modnavigator" class="module-nav">
			<div class="hidden-xs hidden-sm mod-switcher-container">
				{include file="partials/Menubar.tpl"|vtemplate_path:$MODULE}
			</div>
		</div>
		{*<div id="sidebar-essentials" class="sidebar-essentials {if $LEFTPANELHIDE eq '1'} hide {/if}">
			{include file="partials/SidebarEssentials.tpl"|vtemplate_path:$MODULE}
		</div>*}
		<div class="listViewPageDiv content-area full-width" id="listViewContent">


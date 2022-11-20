{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{assign var=LEFTPANELHIDE value=1}

{include file="modules/Vtiger/partials/Topbar.tpl"}
{assign var=VTIGERMODULE value='Vtiger'}
<div class="container-fluid app-nav">
	<div class="row">
		{include file="modules/Vtiger/partials/SidebarHeader.tpl"}
		{include file="KanbanHeader.tpl"|vtemplate_path:$MODULE}
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
		<div id="modnavigator" class="module-nav">
			<div class="hidden-xs hidden-sm mod-switcher-container">
				{include file="partials/Menubar.tpl"|vtemplate_path:$MODULE}
			</div>
		</div>
		<div id="sidebar-essentials" class="sidebar-essentials {if $LEFTPANELHIDE eq '1'} hide {/if}">
			{include file="partials/SidebarEssentials.tpl"|vtemplate_path:$VTIGERMODULE}
		</div>
		<div class="listViewPageDiv content-area {if $LEFTPANELHIDE eq '1'} full-width {/if}" id="listViewContent">

			<div class="module-action-content clearfix">
				<div class="col-lg-7 col-md-7">
				</div>
				<div class="col-lg-5 col-md-5 pull-right" style="margin-top: -{$MARGIN-TOP}px; z-index: 99999999999">
					{assign var=RECORD_COUNT value=$LISTVIEW_ENTRIES_COUNT}
					{include file="Pagination.tpl"|vtemplate_path:$MODULE SHOWPAGEJUMP=true}
				</div>
			</div>

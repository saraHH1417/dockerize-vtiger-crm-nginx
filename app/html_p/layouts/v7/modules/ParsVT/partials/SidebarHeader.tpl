{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}


<div class="col-sm-12 col-xs-12 app-indicator-icon-container app-{$SELECTED_MENU_CATEGORY}">
	<div class="row" title="{vtranslate($MODULE, $MODULE)}" data-toggle="tooltip">
		<span class="app-indicator-icon fa {if $smarty.get.view eq 'Settings'}fa-gears{elseif  !empty($smarty.get.source_module) or !empty($smarty.get.navigate)}fa-map-marker{else}fa-connectdevelop{/if}"></span>
	</div>
</div>

{include file="modules/Vtiger/partials/SidebarAppMenu.tpl"}
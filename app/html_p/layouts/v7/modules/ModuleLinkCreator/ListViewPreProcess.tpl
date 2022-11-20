{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}


{include file="modules/Vtiger/partials/Topbar.tpl"}

<div class="container-fluid app-nav">
    <div class="row">
        {include file="partials/SidebarHeader.tpl"|vtemplate_path:$MODULE}
        {*{include file="ModuleHeader.tpl"|vtemplate_path:$MODULE}*}
        <div class="col-sm-12 col-xs-12 module-action-bar clearfix coloredBorderTop">
            <div class="module-action-content clearfix {$MODULE}-module-action-content">
                <div class="col-lg-7 col-md-7 module-breadcrumb module-breadcrumb-{$smarty.request.view} transitionsAllHalfSecond">
                    {assign var=MODULE_MODEL value=Vtiger_Module_Model::getInstance($MODULE)}
                    {if $MODULE_MODEL->getDefaultViewName() neq 'List'}
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
                    <a title="{vtranslate($MODULE, $MODULE)}" href='{$DEFAULT_FILTER_URL}&app={$SELECTED_MENU_CATEGORY}'><h4 class="module-title pull-left text-uppercase"> {vtranslate($MODULE, $MODULE)} </h4>&nbsp;&nbsp;</a>
                </div>
            </div>
        </div>
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
    <div class="listViewPageDiv content-area  full-width" id="listViewContent">


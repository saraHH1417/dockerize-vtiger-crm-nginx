{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Vtiger/views/List.php *}
<style>
    .GridImage {
        min-width: 96px;
        max-width: 96px;
        min-height: 96px;
        max-height: 96px;
        border-radius: 50%;
        filter: drop-shadow(5px 5px 5px #222);
    }
    .grid-element {
        border: 1px solid lightgray;
        padding: 10px;
        box-shadow: 0 3px 1px -2px rgba(0, 0, 0, .14), 0 2px 2px 0 rgba(0, 0, 0, .098), 0 1px 5px 0 rgba(0, 0, 0, .084);
    }
    .grid-detail-btn {
        height: 33%;
        background-color: green;
        color: white;
    }
    .grid-edit-btn {
        height: 33%;
        background-color: yellow;
        color: white;
    }
    .grid-delete-btn {
        height: 33%;
        background-color: red;
        color: white;
    }
    .listViewEntryValue {
        padding: 0px !important;
    }
    .gridRow {
        margin-bottom: 15px;
    }
    .gridViewEntries {
        margin: 0px !important;
        vertical-align: top;
        width: 32.5%;
        height: 100%;
        display: inline-block;
    }
    @media (min-width: 1440px) {
        .gridViewEntries {
            width: 24.5%;
        }
    }
    @media (min-width: 1920px) {
        .gridViewEntries {
            width: 19.5%;
        }
    }
    @media (max-width: 800px) {
        .gridViewEntries {
            width: 49%;
        }
    }
    @media (max-width: 500px) {
        .gridViewEntries {
            display: block;
            width: 100%;
        }
    }
    .gridViewEntriesTable {
        max-width: 100% !important;
    }
</style>
{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
{include file="PicklistColorMap.tpl"|vtemplate_path:$MODULE}
{if $MODULE eq 'Contacts' ||  $MODULE eq 'Leads' || $MODULE eq 'Employees'}
    {assign var=GRIDIMAGENAME value="User"}
{elseif $MODULE eq 'Accounts'}
    {assign var=GRIDIMAGENAME value="Company"}
{elseif $MODULE eq 'Vendors'}
    {assign var=GRIDIMAGENAME value="Vendor"}
{elseif $MODULE eq 'Products' ||  $MODULE eq 'Services' }
    {assign var=GRIDIMAGENAME value="Product"}
{else}
    {assign var=GRIDIMAGENAME value="Record"}
{/if}
<div class="col-sm-12 col-xs-12 ">
    {if $MODULE neq 'EmailTemplates' && $SEARCH_MODE_RESULTS neq true}
        {assign var=LEFTPANELHIDE value=$CURRENT_USER_MODEL->get('leftpanelhide')}
        <div class="essentials-toggle" title="{vtranslate('LBL_LEFT_PANEL_SHOW_HIDE', 'Vtiger')}">
            <span class="essentials-toggle-marker fa {if $LEFTPANELHIDE eq '1'}fa-chevron-right{else}fa-chevron-left{/if} cursorPointer"></span>
        </div>
    {/if}
    <input type="hidden" name="view" id="view" value="{$VIEW}"/>
    <input type="hidden" name="cvid" value="{$VIEWID}"/>
    <input type="hidden" name="pageStartRange" id="pageStartRange" value="{$PAGING_MODEL->getRecordStartRange()}"/>
    <input type="hidden" name="pageEndRange" id="pageEndRange" value="{$PAGING_MODEL->getRecordEndRange()}"/>
    <input type="hidden" name="previousPageExist" id="previousPageExist" value="{$PAGING_MODEL->isPrevPageExists()}"/>
    <input type="hidden" name="nextPageExist" id="nextPageExist" value="{$PAGING_MODEL->isNextPageExists()}"/>
    <input type="hidden" name="alphabetSearchKey" id="alphabetSearchKey"
           value="{$MODULE_MODEL->getAlphabetSearchField()}"/>
    <input type="hidden" name="Operator" id="Operator" value="{$OPERATOR}"/>
    <input type="hidden" name="totalCount" id="totalCount" value="{$LISTVIEW_COUNT}"/>
    <input type='hidden' name="pageNumber" value="{$PAGE_NUMBER}" id='pageNumber'>
    <input type='hidden' name="pageLimit" value="{$PAGING_MODEL->getPageLimit()}" id='pageLimit'>
    <input type="hidden" name="noOfEntries" value="{$LISTVIEW_ENTRIES_COUNT}" id="noOfEntries">
    <input type="hidden" name="currentSearchParams"
           value="{Vtiger_Util_Helper::toSafeHTML(Zend_JSON::encode($SEARCH_DETAILS))}" id="currentSearchParams"/>
    <input type="hidden" name="currentTagParams"
           value="{Vtiger_Util_Helper::toSafeHTML(Zend_JSON::encode($TAG_DETAILS))}" id="currentTagParams"/>
    <input type="hidden" name="noFilterCache" value="{$NO_SEARCH_PARAMS_CACHE}" id="noFilterCache">
    <input type="hidden" name="orderBy" value="{$ORDER_BY}" id="orderBy">
    <input type="hidden" name="sortOrder" value="{$SORT_ORDER}" id="sortOrder">
    <input type="hidden" name="list_headers" value='{$LIST_HEADER_FIELDS}'/>
    <input type="hidden" name="tag" value="{$CURRENT_TAG}"/>
    <input type="hidden" name="folder_id" value="{$FOLDER_ID}"/>
    <input type="hidden" name="folder_value" value="{$FOLDER_VALUE}"/>
    <input type="hidden" name="viewType" value="{$VIEWTYPE}"/>
    <input type="hidden" name="app" id="appName" value="{$SELECTED_MENU_CATEGORY}">
    <input type="hidden" id="isExcelEditSupported" value="{if $MODULE_MODEL->isExcelEditAllowed()}yes{else}no{/if}"/>
    {if !empty($PICKIST_DEPENDENCY_DATASOURCE)}
        <input type="hidden" name="picklistDependency"
               value='{Vtiger_Util_Helper::toSafeHTML($PICKIST_DEPENDENCY_DATASOURCE)}'/>
    {/if}
    {if !$SEARCH_MODE_RESULTS}
        {include file="ListViewActions.tpl"|vtemplate_path:$MODULE}
    {/if}
    {assign var=HEADERFIELDS value=[]}
    {assign var=counter value=0}
    {foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
        {if $LISTVIEW_HEADER->isNameField() neq true}
            {$HEADERFIELDS.$counter['name'] = $LISTVIEW_HEADER->get('name')}
            {$HEADERFIELDS.$counter['type'] = $LISTVIEW_HEADER->getFieldDataType()}
            {$HEADERFIELDS.$counter['label'] = vtranslate($LISTVIEW_HEADER->get('label'), $MODULE)}
            {$HEADERFIELDS.$counter['uitype'] = $LISTVIEW_HEADER->get('uitype')}
            {$HEADERFIELDS.$counter['namefield'] = $LISTVIEW_HEADER->isNameField()}
            {assign var=counter value={$counter}+1}
        {/if}
    {/foreach}
    <div id="table-content" class="table-container">
        <form name='list' id='listedit' action='' onsubmit="return false;">
            <table id="listview-table"  class="table {if $LISTVIEW_ENTRIES_COUNT eq '0'}listview-table-norecords {/if} listview-table " style="height: 1000px !important;">
                <thead>
                <tr class="listViewContentHeader">
                    <th>
                        {if !$SEARCH_MODE_RESULTS}
                            <div class="table-actions">
                                <div class="dropdown" style="float:left;">
							<span class="input dropdown-toggle" data-toggle="dropdown"
                                  title="{vtranslate('LBL_CLICK_HERE_TO_SELECT_ALL_RECORDS',$MODULE)}">
								<input class="listViewEntriesMainCheckBox" type="checkbox">
							</span>
                                </div>
                                {if $MODULE_MODEL->isFilterColumnEnabled()}
                                    <div id="listColumnFilterContainer">
                                        <div class="listColumnFilter {if $CURRENT_CV_MODEL and !($CURRENT_CV_MODEL->isCvEditable())}disabled{/if}"
                                                {if $CURRENT_CV_MODEL->isCvEditable()}
                                                    title="{vtranslate('LBL_CLICK_HERE_TO_MANAGE_LIST_COLUMNS',$MODULE)}"
                                                {else}
                                                    {if $CURRENT_CV_MODEL->get('viewname') eq 'All' and !$CURRENT_USER_MODEL->isAdminUser()}
                                                        title="{vtranslate('LBL_SHARED_LIST_NON_ADMIN_MESSAGE',$MODULE)}"
                                                    {elseif !$CURRENT_CV_MODEL->isMine()}
                                                        {assign var=CURRENT_CV_USER_ID value=$CURRENT_CV_MODEL->get('userid')}
                                                        {if !Vtiger_Functions::isUserExist($CURRENT_CV_USER_ID)}
                                                            {assign var=CURRENT_CV_USER_ID value=Users::getActiveAdminId()}
                                                        {/if}
                                                        title="{vtranslate('LBL_SHARED_LIST_OWNER_MESSAGE',$MODULE, getUserFullName($CURRENT_CV_USER_ID))}"
                                                    {/if}
                                                {/if}
                                                {if $MODULE eq 'Documents'}style="width: 10%;"{/if}
                                             data-toggle="tooltip" data-placement="bottom" data-container="body">
                                            <i class="fa fa-th-large"></i>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        {elseif $SEARCH_MODE_RESULTS}
                            {vtranslate('LBL_ACTIONS',$MODULE)}
                        {/if}
                    </th>
                    {foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
                        {if $SEARCH_MODE_RESULTS || ($LISTVIEW_HEADER->getFieldDataType() eq 'multipicklist')}
                            {assign var=NO_SORTING value=1}
                        {else}
                            {assign var=NO_SORTING value=0}
                        {/if}
                        <th {if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')} nowrap="nowrap" {/if}>
                            <a href="#" class="{if $NO_SORTING}noSorting{else}listViewContentHeaderValues{/if}"
                               {if !$NO_SORTING}data-nextsortorderval="{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}{$NEXT_SORT_ORDER}{else}ASC{/if}"
                               data-columnname="{$LISTVIEW_HEADER->get('name')}"{/if}
                               data-field-id='{$LISTVIEW_HEADER->getId()}'>
                                {if !$NO_SORTING}
                                    {if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}
                                        <i class="fa fa-sort {$FASORT_IMAGE}"></i>
                                    {else}
                                        <i class="fa fa-sort customsort"></i>
                                    {/if}
                                {/if}
                                &nbsp;{vtranslate($LISTVIEW_HEADER->get('label'), $LISTVIEW_HEADER->getModuleName())}
                                &nbsp;
                            </a>
                            {if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}
                                <a href="#" class="removeSorting"><i class="fa fa-remove"></i></a>
                            {/if}
                        </th>
                    {/foreach}
                </tr>
                {if $MODULE_MODEL->isQuickSearchEnabled() && !$SEARCH_MODE_RESULTS}
                    <tr class="searchRow listViewSearchContainer">
                        <th class="inline-search-btn">
                            <div class="table-actions">
                                <button class="btn btn-success btn-sm {if count($SEARCH_DETAILS) gt 0}hide{/if}"
                                        data-trigger="listSearch">
                                    <i class="fa fa-search"></i> &nbsp;
                                    <span class="s2-btn-text">{vtranslate("LBL_SEARCH",$MODULE)}</span>
                                </button>
                                <button class="searchAndClearButton t-btn-sm btn btn-danger {if count($SEARCH_DETAILS) eq 0}hide{/if}"
                                        data-trigger="clearListSearch"><i
                                            class="fa fa-close"></i>&nbsp;{vtranslate("LBL_CLEAR",$MODULE)}</button>
                            </div>
                        </th>
                        {foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
                            <th>
                                {assign var=FIELD_UI_TYPE_MODEL value=$LISTVIEW_HEADER->getUITypeModel()}
                                {include file=vtemplate_path($FIELD_UI_TYPE_MODEL->getListSearchTemplateName(),$MODULE) FIELD_MODEL= $LISTVIEW_HEADER SEARCH_INFO=$SEARCH_DETAILS[$LISTVIEW_HEADER->getName()] USER_MODEL=$CURRENT_USER_MODEL}
                                <input type="hidden" class="operatorValue"
                                       value="{$SEARCH_DETAILS[$LISTVIEW_HEADER->getName()]['comparator']}">
                            </th>
                        {/foreach}
                    </tr>
                {/if}
                </thead>
                <tbody class="overflow-y">
                <tr class="gridViewEntriesTable" style="width: 100%">
                    <td colspan="{count($LISTVIEW_HEADERS)+1}">
                        <div class="row-fluid gridRow">
                            {foreach item=LISTVIEW_ENTRY from=$LISTVIEW_ENTRIES name=listview}
                                {assign var=DATA_ID value=$LISTVIEW_ENTRY->getId()}
                                {assign var=DATA_URL value=$LISTVIEW_ENTRY->getDetailViewUrl()}
                                {if $SEARCH_MODE_RESULTS && $LISTVIEW_ENTRY->getModuleName() == "ModComments"}
                                    {assign var=RELATED_TO value=$LISTVIEW_ENTRY->get('related_to_model')}
                                    {assign var=DATA_ID value=$RELATED_TO->getId()}
                                    {assign var=DATA_URL value=$RELATED_TO->getDetailViewUrl()}
                                {/if}
                                <div class="gridViewEntries listViewEntries" data-id='{$DATA_ID}'
                                     data-recordUrl='{$DATA_URL}&app={$SELECTED_MENU_CATEGORY}'
                                     id="{$MODULE}_listView_row_{$smarty.foreach.listview.index+1}"
                                     {if $MODULE eq 'Calendar'}data-recurring-enabled='{$LISTVIEW_ENTRY->isRecurringEnabled()}'{/if}>
                                    <div class="grid-element">
                                        <div class="row-fluid">
                                            <div class="pull-right listViewRecordActions">
                                                {if !$SEARCH_MODE_RESULTS}
                                                    <span class="input"><input type="checkbox" value="{$LISTVIEW_ENTRY->getId()}" class="listViewEntriesCheckBox"/></span>
                                                {/if}
                                            </div>
                                            <div class="">
                                                <div class="imageContainer"
                                                     style="width:100%; margin-top:5px; text-align: center;">
                                                    {assign var=IMAGE_DETAILS value=$LISTVIEW_ENTRY->getImageDetails()}
                                                    <a href="{$LISTVIEW_ENTRY->getDetailViewUrl()}">
                                                        {if empty($IMAGE_DETAILS)}
                                                            <img src="layouts/v7/modules/ParsVT/images/Default{$GRIDIMAGENAME}Icon.png"  class="GridImage" />
                                                        {else}
                                                            {foreach key=ITER item=IMAGE_INFO from=$IMAGE_DETAILS}
                                                                {if !empty($IMAGE_INFO.path) && !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname}) && file_exists("{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}")}
                                                                    <img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}"
                                                                         alt="{$LISTVIEW_ENTRY->get($NAME_FIELD)}"
                                                                         title="{$LISTVIEW_ENTRY->get($NAME_FIELD)}"  width="100%" height="100%"  class="GridImage" >
                                                                    <br>
                                                                {else}
                                                                    <img src="layouts/v7/modules/ParsVT/images/Default{$GRIDIMAGENAME}Icon.png" class="GridImage"/>
                                                                {/if}
                                                            {/foreach}
                                                        {/if}
                                                    </a>
                                                </div>


                                                {assign var=NAME_FIELDS value=$MODULE_MODEL->getNameFields()}
                                                <a href="{$LISTVIEW_ENTRY->getDetailViewUrl()}">
                                                    <h3 class="listViewEntriesTitle">
                                                        {foreach item=NAME_FIELD from=$NAME_FIELDS}
                                                            <small>{vtranslate($LISTVIEW_HEADERS[$NAME_FIELD]->get('label'))}
                                                            : </small>{$LISTVIEW_ENTRY->get($NAME_FIELD)}
                                                            <br>
                                                        {/foreach}
                                                    </h3></a>


                                                <div style="text-align:center" class="btn-toolbar">
                                                    <div class="actions btn-group" id="mycactions">
                                                                <span class="actionImages">
                                                                        {if $LISTVIEW_ENTRY->get('starred') eq 'Yes'}
                                                                            {assign var=STARRED value=true}
                                                                        {else}
                                                                            {assign var=STARRED value=false}
                                                                        {/if}
                                                                    {if $QUICK_PREVIEW_ENABLED eq 'true'}
                                                                        <span class="btn btn-xs btn-cyan tooltips "
                                                                              data-app="{$SELECTED_MENU_CATEGORY}"
                                                                              data-toggle="tooltip" data-placement="bottom"
                                                                              title="{vtranslate('LBL_QUICK_VIEW', $MODULE)}"><i class="quickView fa fa-eye icon action"></i></span>
                                                                    {/if}
                                                                    {if  $MODULE_MODEL->isStarredEnabled()}
                                                                        <span class="btn btn-xs btn-cyan tooltips"
                                                                              data-toggle="tooltip"
                                                                              title="{if $STARRED} {vtranslate('LBL_STARRED', $MODULE)} {else} {vtranslate('LBL_NOT_STARRED', $MODULE)}{/if}"><i
                                                                                    class="markStar fa icon action {if $STARRED} fa-star active {else} fa-star-o{/if}"></i></span>
                                                                    {/if}
                                                                    <a class="btn btn-xs btn-black tooltips"
                                                                       data-toggle="tooltip" data-placement="bottom"
                                                                       title="{vtranslate('LBL_SHOW_FULL_DETAILS')}"
                                                                       href="{$LISTVIEW_ENTRY->getFullDetailViewUrl()}"><i class="fa fa-list"></i></a>
                                                                    {if $MODULE_MODEL->isCommentEnabled()}
                                                                        <a class="btn btn-xs btn-cyan tooltips"
                                                                           data-toggle="tooltip" data-placement="bottom"
                                                                           title="{vtranslate('ModComments')}"
                                                                           href="{$LISTVIEW_ENTRY->getDetailViewUrl()}&relationId={$RELATION_LINKS['ModComments']['relation_id']}&relatedModule=ModComments&mode=showRelatedList&relationId=165&tab_label=ModComments"><i
                                                                                    class="fa fa-comments"></i></a>
                                                                    {/if}
                                                                    {if $MODULE_MODEL->isTrackingEnabled()}
                                                                        <a class="btn btn-xs btn-peas tooltips"
                                                                           data-toggle="tooltip" data-placement="bottom"
                                                                           title="{vtranslate('LBL_UPDATES')}"
                                                                           href="{$LISTVIEW_ENTRY->getFullDetailViewUrl()}&mode=showRecentActivities&page=1&tab_label=LBL_UPDATES"><i
                                                                                    class="fa fa-refresh"></i></a>
                                                                    {/if}
                                                                    {if $IS_MODULE_EDITABLE}
                                                                        <a class="btn btn-xs btn-yellow tooltips"
                                                                           data-toggle="tooltip" data-placement="bottom"
                                                                           title="{vtranslate('LBL_EDIT')}"
                                                                           href='{$LISTVIEW_ENTRY->getEditViewUrl()}'><i
                                                                                    class="fa fa-pencil"></i></a>
                                                                    {/if}
                                                                    {if $IS_MODULE_DELETABLE}
                                                                        <span class="btn btn-xs btn-cyan tooltips "
                                                                              data-app="{$SELECTED_MENU_CATEGORY}"
                                                                              data-toggle="tooltip" data-placement="bottom"
                                                                              title="{vtranslate('LBL_DELETE', $MODULE)}"><i
                                                                                    class="fa fa-trash deleteRecordButton icon action"></i></span>
                                                                    {/if}
                                                                </span>
                                                    </div>
                                                    <div class="btn-group">
                                                        <button type="button"
                                                                class="btn btn-mazzy btn-xs dropdown-toggle gridrelated"
                                                                style="width:100%;" data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">
                                                            <i class="fa fa-paperclip"></i>
                                                        </button>
                                                        <ul class="dropdown-menu related gridrelatedul"
                                                            {if $smarty.foreach.listview.iteration is div by 3}style="right:0;left:auto;"{/if}>
                                                            {assign var="SELECTED_TAB_LABEL" value=$smarty.get.tab_label}
                                                            {foreach key=RELATED_MODULE item=RELATED_LINK from=$RELATION_LINKS}
                                                                {* Assuming most of the related link label would be module name - we perform dual translation *}
                                                                {assign var="DETAILVIEWRELATEDLINKLBL" value= vtranslate($RELATED_LINK['linklabel'], $RELATED_LINK['relatedModuleName'])}
                                                                <li>
                                                                    <a href="index.php?module={$MODULE}&relatedModule={$RELATED_LINK['relatedModuleName']}&view=Detail&record={$LISTVIEW_ENTRY->getId()}&relationId={$RELATED_LINK['relation_id']}&mode=showRelatedList&tab_label={$RELATED_LINK['linklabel']}"
                                                                       class="mycrelatedtab {if $RELATED_LINK['linklabel']==$SELECTED_TAB_LABEL}active{/if} label-mazzy"
                                                                       data-url="module={$MODULE}&relatedModule={$RELATED_LINK['relatedModuleName']}&view=Detail&record={$LISTVIEW_ENTRY->getId()}&mode=showRelatedList&tab_label={$RELATED_LINK['linklabel']}"
                                                                       class="mycrelatedtab {if $RELATED_LINK['linklabel']==$SELECTED_TAB_LABEL}active{/if}"
                                                                       data-recordid="{$LISTVIEW_ENTRY->getId()}"
                                                                       data-label-key="{$RELATED_LINK['linklabel']}"
                                                                       style="width:auto"
                                                                       title="{$DETAILVIEWRELATEDLINKLBL}"><strong>
                                                                            {if vimage_path($RELATED_LINK['relatedModuleName']|cat:'.png') != false}
                                                                                <img class="alignMiddle"
                                                                                     src="{vimage_path($RELATED_LINK['relatedModuleName']|cat:'.png')}"
                                                                                     alt="{vtranslate($RELATED_LINK['linklabel'], $RELATED_LINK['linklabel'])}"
                                                                                     title="{vtranslate($RELATED_LINK['linklabel'], $RELATED_LINK['linklabel'])}"/>
                                                                            {else}
                                                                                <img class="alignMiddle"
                                                                                     src="{vimage_path('DefaultModule.png')}"
                                                                                     alt="{vtranslate($RELATED_LINK['linklabel'], $RELATED_LINK['linklabel'])}"
                                                                                     title="{vtranslate($RELATED_LINK['linklabel'], $RELATED_LINK['linklabel'])}"/>
                                                                            {/if}
                                                                            {$DETAILVIEWRELATEDLINKLBL}</strong></a>
                                                                </li>
                                                            {/foreach}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <hr>
                                                {assign var=counter value=0}
                                                {foreach item=HEADERFIELD from=$HEADERFIELDS}
                                                    {if $HEADERFIELD['namefield'] neq true}
                                                        <div class="listViewEntryValue {$WIDTHTYPE}"
                                                             data-field-type="{$HEADERFIELD.$type}" nowrap>
                                                            {if $HEADERFIELD.$namefield neq true}
                                                                <b>{vtranslate($HEADERFIELD['label'], $MODULE)}: </b>
                                                                &nbsp;
                                                            {/if}
                                                            {if ($HEADERFIELD['namefield'] eq true or $HEADERFIELD['uitype'] eq '4') and $MODULE_MODEL->isListViewNameFieldNavigationEnabled() eq true }
                                                                <a href="{$LISTVIEW_ENTRY->getDetailViewUrl()}">{$LISTVIEW_ENTRY->get($HEADERFIELDS.$counter)}</a>
                                                            {elseif $HEADERFIELD['uitype'] eq '72'}
                                                                {assign var=CURRENCY_SYMBOL_PLACEMENT value={$CURRENT_USER_MODEL->get('currency_symbol_placement')}}
                                                                {if $CURRENCY_SYMBOL_PLACEMENT eq '1.0$'}
                                                                    {$LISTVIEW_ENTRY->get($HEADERFIELD['name'] )}{$LISTVIEW_ENTRY->get('currencySymbol')}
                                                                {else}
                                                                    {$LISTVIEW_ENTRY->get('currencySymbol')}{$LISTVIEW_ENTRY->get($HEADERFIELD['name'])}
                                                                {/if}
                                                            {elseif $HEADERFIELD['uitype'] eq '11'}
                                                                {assign var=PBXMANAGER_MODULE value='PBXManager'}
                                                                {assign var=MODULEMODEL value=Vtiger_Module_Model::getInstance($PBXMANAGER_MODULE)}
                                                                {if $MODULEMODEL}
                                                                    {assign var=PERMISSION value=PBXManager_Server_Model::checkPermissionForOutgoingCall()}
                                                                    {if $PERMISSION}
                                                                        {assign var=PHONE_FIELD_VALUE value=$LISTVIEW_ENTRY->get($HEADERFIELD['name'])}
                                                                        {assign var=PHONE_NUMBER value=$PHONE_FIELD_VALUE|regex_replace:"/[-()\s]/":""}
                                                                        <a class="phoneField"
                                                                           data-value="{$PHONE_NUMBER}"
                                                                           record="{$LISTVIEW_ENTRY->getId()}"
                                                                           onclick="Vtiger_PBXManager_Js.registerPBXOutboundCall('{$PHONE_NUMBER}',{$LISTVIEW_ENTRY->getId()})">{$LISTVIEW_ENTRY->get($LISTVIEW_HEADERNAME)}</a>
                                                                    {else}
                                                                        {$LISTVIEW_ENTRY->get($HEADERFIELD['name'])}
                                                                    {/if}
                                                                {else}
                                                                    {$LISTVIEW_ENTRY->get($HEADERFIELD['name'])}
                                                                {/if}
                                                            {else}
                                                                {if $HEADERFIELD['type'] eq 'double'}
                                                                    {decimalFormat($LISTVIEW_ENTRY->get($HEADERFIELD['name']))}
                                                                {elseif $HEADERFIELD['uitype'] eq '9'}
                                                                    {assign var=PROGRESS value=$LISTVIEW_ENTRY->get($HEADERFIELD['name'])|replace:"<span align='right'>":''|replace:'</div>':''}

                                                                    {if $PROGRESS eq ""}0{else}{$PROGRESS}{/if}%

                                                                    {if $PROGRESS eq ""}
                                                                        {assign var=PROGRESS value=0}
                                                                    {elseif $PROGRESS >= 100}
                                                                        {assign var=PROGRESS value=100}
                                                                        {assign var=PROGRESSCOLOR value="green"}
                                                                    {elseif $PROGRESS > 60}
                                                                        {assign var=PROGRESSCOLOR value="blue"}
                                                                    {elseif $PROGRESS > 30}
                                                                        {assign var=PROGRESSCOLOR value="orange"}
                                                                    {else}
                                                                        {assign var=PROGRESSCOLOR value="red"}
                                                                    {/if}
                                                                    <div class="myc-progressbar myc-progressbar-{$PROGRESSCOLOR}">
                                                                        <span style="width: {$PROGRESS}%"></span>
                                                                    </div>
                                                                    <p style="height: 5px">&nbsp;</p>
                                                                {else}
                                                                    {$LISTVIEW_ENTRY->get($HEADERFIELD['name'])|replace:"<span align='right'>":''|replace:'</div>':''}
                                                                {/if}
                                                            {/if}
                                                        </div>
                                                        {assign var=counter value={$counter}+1}
                                                    {/if}
                                                {/foreach}


                                            </div>
                                        </div>
                                    </div>

                                </div>
                            {/foreach}
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    <div id="scroller_wrapper" class="bottom-fixed-scroll">
        <div id="scroller" class="scroller-div"></div>
    </div>
</div>
<script>
    var CONVERTLINKSMSG = {
        CONVERTLINKS: "{vtranslate('Convert sidebar links', 'ParsVT')}",
    };
    setTimeout(function(){
        $('a[href*="initData_GridView"]').each(function() {
            $(this).parent().remove();
        });
        }, 3000);

</script>
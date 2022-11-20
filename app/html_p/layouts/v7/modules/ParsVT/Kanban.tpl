{*<!--
   /* ********************************************************************************
    * The content of this file is subject to the VTFarsi.ir Modules License("License");
    * You may not use this file except in compliance with the License
    * The Initial Developer of the Original Code is VTFarsi.ir
    * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
    * All Rights Reserved.
    * ****************************************************************************** */
   -->*}
{strip}
<input type="hidden" id="pageStartRange" value="{$PAGING_MODEL->getRecordStartRange()}" />
    <input type="hidden" id="pageEndRange" value="{$PAGING_MODEL->getRecordEndRange()}" />
    <input type="hidden" id="previousPageExist" value="{$PAGING_MODEL->isPrevPageExists()}" />
    <input type="hidden" id="nextPageExist" value="{$PAGING_MODEL->isNextPageExists()}" />
    <input type="hidden" id="noOfEntries" value="{$LISTVIEW_COUNT}" />
    <input type="hidden" id="totalCount" value="{$LISTVIEW_COUNT}" />
    <input type='hidden' value="{$PAGE_NUMBER}" id='pageNumber'>
    <input type='hidden' value="{$PAGING_MODEL->getPageLimit()}" id='pageLimit'>
    <input type="hidden" id="view" value="{if $VIEW}{$VIEW}{else}{$smarty.get.viewname}{/if}" />
    <input type="hidden" id="search_key" value="{$smarty.get.search_key}"/>
    <input type="hidden" id="search_value" value="{$smarty.get.search_value}"/>
    <input type="hidden" id="search_params" value="{$smarty.get.search_params}"/>

    <input type="hidden" id="orderBy" value="{if $ORDER_BY}{$ORDER_BY}{else}{$smarty.get.orderby}{/if}" >
    <input type="hidden"  id="sortOrder" value="{if $SORT_ORDER}{$SORT_ORDER}{else}{$smarty.get.sortorder}{/if}">
    <input type="hidden" id="appName" value="{if SELECTED_MENU_CATEGORY}{$SELECTED_MENU_CATEGORY}{else}{$smarty.get.app}{/if}">

{assign var=CALENDAR_MODEL value = Vtiger_Module_Model::getInstance('Calendar')}
<form id="detailView">
    {assign var=LEFTPANELHIDE value=1}
    <div class="essentials-toggle" title="{vtranslate('LBL_LEFT_PANEL_SHOW_HIDE', 'Vtiger')}">
        <span class="essentials-toggle-marker fa {if $LEFTPANELHIDE eq '1'}fa-chevron-right{else}fa-chevron-left{/if} cursorPointer"></span>
    </div>
    {if $FIELD_SETTING['primary_value_setting']}
        <style>
            .kbParentContainer{
                width: 100%;
                overflow-x:scroll;
               margin-right: 10px;
            }
            .kbContainer{
                margin-left: 20px;
            }
            .profileimage{
                border-radius: 50%;
                border: 0;
                width: 50px;
                max-width: 50px;
                height: 50px;
                max-height: 50px;
                margin: 0 5px;
            }
            .kanban_activity_status {
                border-radius: 50%;
                width: 18px;
                max-width: 18px;
                height: 18px;
                max-height: 18px;
                margin: 0 5px;
            }
            .wmd-view-topscroll {
                width: 100%;
                overflow-x:scroll;
                margin-right: 10px;
            }
            .wmd-view-topscroll { height: 20px; }
            .btn-mazzy { background-color: unset !important; }
            .scroll-div1 {
                overflow-x:scroll;
                height:20px;
            }
        </style>
        <div class="wmd-view-topscroll">
            <div class="scroll-div1">
            </div>
        </div>
        <div class="kbParentContainer wmd-view" >
            <div class="kbContainer scroll-div2">
            <input id="kbSourceModule" type="hidden" value="{$KANBAN_SOURCE_MODULE}">
            <input type="hidden" id="primaryFieldName" value="{$PRIMARY_FIELD_SELECT}">
            <input type="hidden" id="primaryFieldId" value="{$FIELD_SETTING['primary_field']}">
            {if !empty($PICKIST_DEPENDENCY_DATASOURCE)}
                <input type="hidden" name="picklistDependency" value='{Vtiger_Util_Helper::toSafeHTML($PICKIST_DEPENDENCY_DATASOURCE)}' />
            {/if}
                {foreach item=PRIMARY_FIELD_BLOCK  from=$FIELD_SETTING['primary_value_setting']}
                    <div class="kanbanBox">
                        <input type="hidden" name="primaryValue" value="{$PRIMARY_FIELD_BLOCK}"  >
                        <div class="kbBoxHeader">
                            <span class="kbBoxTitle">{vtranslate($PRIMARY_FIELD_BLOCK,$KANBAN_SOURCE_MODULE)}</span>
                            <span class="kbBoxIconTop"></span>
                        </div>
                        <div class="kbBoxContent">
                            {foreach item=RECORD_MODEL from=$LIST_RECORDS[$PRIMARY_FIELD_BLOCK]}
                                {assign var=BACKGROUND_CARD value= $RECORD_MODEL['RECORD']->get('kanban_color')}
                                {assign var=FONT_COLOR value= $RECORD_MODEL['RECORD']->get('font_color')}
                                {assign var=ACTIVITIES value=ParsVT_KanbanView_View::getLastActivity( $RECORD_MODEL['RECORD']->getId(), $SOURCEMODULEMODEL)}
                                {assign var=SHOWCALENDAR value=ParsVT_KanbanView_View::checkShowCalendar()}

                                <div class="kbBoxTask" {if !empty($BACKGROUND_CARD)}style="background:{$BACKGROUND_CARD} "{/if}>
                                    <input type="hidden" name="recordId" value="{$RECORD_MODEL['RECORD']->getId()}">
                                    <input type="hidden" name="sequence" value="{$RECORD_MODEL['sequence']}">
                                    <div class="kbTaskHeader">
                                        <span class="kbEyeIcon pull-left" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}>
                                            <img  class="profileimage" src="{$RECORD_MODEL['OWNERIMAGE']}">
                                        </span>
                                        <span class="kbTaskTitle pull-left" style="max-width: 60%;">
                                            <a href="index.php?module={$KANBAN_SOURCE_MODULE}&view=Detail&record={$RECORD_MODEL['RECORD']->getId()}&cvid={$CV_ID}" title="{$RECORD_MODEL['RECORD']->get($NAME_FIELD)}" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}>
                                                {assign var=MODULE_MODEL value=$RECORD_MODEL['RECORD']->getModule()}
                                                {foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
                                                    {assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
                                                    {if $FIELD_MODEL->getPermissions()}
                                                            {ParsVT_KanbanGrid_Helper::fixTitle($RECORD_MODEL['RECORD']->get($NAME_FIELD))}&nbsp;
                                                    {/if}
                                                {/foreach}
                                            </a>
                                        </span>
                                        <span class="kbEyeIcon pull-right" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}>
                                            <img class="kanban_activity_status tooltips" data-toggle="tooltip" title="{$ACTIVITIES[3]}"   data-placement="bottom" style="-webkit-box-shadow: 0px 0px 1px 1px {$FONT_COLOR};  box-shadow: 0px 0px 1px 1px {$FONT_COLOR};" src="layouts/v7/modules/ParsVT/resources/Kanban/img/{$ACTIVITIES[2]}">
                                        </span>
                                        <span class="clearfix"></span>
                                    </div>
                                    <div class="kbTaskContent">
                                        {foreach item=FIELD_MODEL from=$ARR_SELECTED_FIELD_MODELS}
                                            {assign var=FIELD_MODEL value=$FIELD_MODEL->set('fieldvalue',$RECORD_MODEL['RECORD']->get($FIELD_MODEL->get('name')))}
                                            {assign var=FIELD_VALUE value=$FIELD_MODEL->get('fieldvalue')}
                                            {if $fieldDataType eq 'multipicklist'}
                                                {assign var=FIELD_DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'))}
                                            {else}
                                                {assign var=FIELD_DISPLAY_VALUE value=Vtiger_Util_Helper::toSafeHTML($FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue')))}
                                            {/if}

                                            {if $FIELD_MODEL->get('uitype') neq "83" }
                                                <div class="kbTaskSection1 fieldValue" data-field-name="{$FIELD_MODEL->getFieldName()}{if $FIELD_MODEL->get('uitype') eq '33'}[]{/if}" data-uitype = "{$FIELD_MODEL->get('uitype')}" data-record-id="{$RECORD_MODEL['RECORD']->getId()}" >
                                                    {if $FIELD_MODEL->get('uitype') eq '19' or $FIELD_MODEL->get('uitype') eq '21'}
                                                        <div class="kbLabelContainer" style="width: 100%;text-align: center;">
                                                            <span class="kbLabel" title="{vtranslate($FIELD_MODEL->get('label'),$KANBAN_SOURCE_MODULE)}" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}>
                                                                {vtranslate($FIELD_MODEL->get('label'),$KANBAN_SOURCE_MODULE)}
                                                            </span>
                                                        </div>
                                                        <div class="kbValueContainer" id="{$KANBAN_SOURCE_MODULE}_detailView_fieldValue_{$FIELD_MODEL->getName()}" style="width: 100%; border: none; border-top: 1px solid #eaeaea;">
                                                            <span class="value pull-left" data-field-type="{$FIELD_MODEL->getFieldDataType()}" style="max-width: 95%;max-height: 60px; line-height: 20px;{if !empty($FONT_COLOR)}color:{$FONT_COLOR} !important; {/if}" title="{$FIELD_MODEL->getDisplayValue($RECORD_MODEL['RECORD']->get($FIELD_MODEL->get('name')))|strip_tags}">
                                                                {$FIELD_MODEL->getDisplayValue($RECORD_MODEL['RECORD']->get($FIELD_MODEL->get('name')))}
                                                            </span>
                                                            {if $FIELD_MODEL->isEditable() eq 'true' && ($FIELD_MODEL->getFieldDataType()!=Vtiger_Field_Model::REFERENCE_TYPE)}
                                                                <span class="hide edit pull-left">
                                                                    {if $fieldDataType eq 'multipicklist'}
                                                                        <input type="hidden" class="fieldBasicData" data-name='{$FIELD_MODEL->get('name')}[]' data-type="{$FIELD_MODEL->getFieldDataType()}" data-displayvalue='{$FIELD_DISPLAY_VALUE}' data-value="{$FIELD_VALUE}" />
                                                                    {else}
                                                                        <input type="hidden" class="fieldBasicData" data-name='{$FIELD_MODEL->get('name')}' data-type="{$FIELD_MODEL->getFieldDataType()}" data-displayvalue='{$FIELD_DISPLAY_VALUE}' data-value="{$FIELD_VALUE}" />
                                                                    {/if}
                                                                </span>
                                                                <span class="action pull-left"><a href="#" onclick="return false;" class="editAction fa fa-pencil" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></a></span>
                                                            {/if}
                                                        </div>
                                                    {else}
                                                        <div class="kbLabelContainer">
                                                            <span class="kbLabel" title="{vtranslate($FIELD_MODEL->get('label'),$KANBAN_SOURCE_MODULE)}" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important;"  {/if}>
                                                                {vtranslate($FIELD_MODEL->get('label'),$KANBAN_SOURCE_MODULE)}
                                                            </span>
                                                        </div>
                                                        <div class="kbValueContainer" id="{$KANBAN_SOURCE_MODULE}_detailView_fieldValue_{$FIELD_MODEL->getName()}">
                                                            <span class="value pull-left" data-field-type="{$FIELD_MODEL->getFieldDataType()}" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important;" {/if} title="{$FIELD_MODEL->getDisplayValue($RECORD_MODEL['RECORD']->get($FIELD_MODEL->get('name')))|strip_tags}" >
                                                                {$FIELD_MODEL->getDisplayValue($RECORD_MODEL['RECORD']->get($FIELD_MODEL->get('name')))}
                                                            </span>
                                                            {if $FIELD_MODEL->isEditable() eq 'true' && ($FIELD_MODEL->getFieldDataType()!=Vtiger_Field_Model::REFERENCE_TYPE)}
                                                                <span class="hide edit pull-left">
                                                                    {if $fieldDataType eq 'multipicklist'}
                                                                        <input type="hidden" class="fieldBasicData" data-name='{$FIELD_MODEL->get('name')}[]' data-type="{$FIELD_MODEL->getFieldDataType()}" data-displayvalue='{$FIELD_DISPLAY_VALUE}' data-value="{$FIELD_VALUE}" />
                                                                    {else}
                                                                        <input type="hidden" class="fieldBasicData" data-name='{$FIELD_MODEL->get('name')}' data-type="{$FIELD_MODEL->getFieldDataType()}" data-displayvalue='{$FIELD_DISPLAY_VALUE}' data-value="{$FIELD_VALUE}" />
                                                                    {/if}
                                                                </span>
                                                                <span class="actionImages">
                                                                </span>
                                                                <span class="action pull-left"><a href="#" onclick="return false;" class="editAction fa fa-pencil" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></a></span>
                                                            {/if}
                                                        </div>
                                                    {/if}
                                                    <div class="clearfix"></div>
                                                </div>
                                            {/if}
                                        {/foreach}

                                    </div>
                                    <div class="container-fluid kbTaskFooter" style="padding-top: 5px;">
                                        {if !in_array($KANBAN_SOURCE_MODULE,array('Calendar','Events')) && !empty($RELATION_LINKS['Calendar'])}
                                        <div class="row">
                                            <div class="col-sm-12 col-xs-12">
                                                {if $SHOWCALENDAR && $ACTIVITIES[0] neq '0'}
                                                    {foreach item=RECORD key=KEY from=$ACTIVITIES[1]}
                                                        {assign var=START_DATE value=$RECORD->get('date_start')}
                                                        {assign var=START_TIME value=$RECORD->get('time_start')}
                                                        {assign var=EDITVIEW_PERMITTED value=isPermitted('Calendar', 'EditView', $RECORD->get('crmid'))}
                                                        {assign var=DETAILVIEW_PERMITTED value=isPermitted('Calendar', 'DetailView', $RECORD->get('crmid'))}
                                                        {assign var=DELETE_PERMITTED value=isPermitted('Calendar', 'Delete', $RECORD->get('crmid'))}
                                                        <div class="activityEntries kanbanactivityid{$RECORD->get('activityid')}">
                                                            <div class='media'>
                                                                <div class='row'>
                                                                    <div class='media-left module-icon col-lg-1 col-md-1 col-sm-1 textAlignCenter'>
                                                                        <span class='vicon-{strtolower($RECORD->get('activitytype'))}' {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></span>
                                                                    </div>
                                                                    <div class='media-body col-lg-7 col-md-7 col-sm-7'>
                                                                        <div class="summaryViewEntries" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}>
                                                                            {if $DETAILVIEW_PERMITTED == 'yes'}<a href="{$RECORD->getDetailViewUrl()}" target="_blank" title="{$RECORD->get('subject')}">{$RECORD->get('subject')}</a>{else}{$RECORD->get('subject')}{/if}&nbsp;&nbsp;
                                                                            {if $EDITVIEW_PERMITTED == 'yes'}<a href="{$RECORD->getEditViewUrl()}" target="_blank" class="fieldValue"><i class="summaryViewEdit fa fa-pencil tooltips" data-toggle="tooltip" title="{vtranslate('LBL_EDIT',$MODULE_NAME)}"></i></a>{/if}&nbsp;
                                                                            <a onclick="ParsVT_KanbanView_Js.markAsHeld('{$RECORD->get('activityid')}', '{$KANBAN_SOURCE_MODULE}' , '{$RECORD_MODEL['RECORD']->getId()}',  this);"><i class="summaryViewEdit fa fa-check icon tooltips" data-toggle="tooltip" title="{vtranslate('Mark as held','ParsVT')}"></i></a>
                                                                        </div>
                                                                        <span {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}><strong title="{Vtiger_Util_Helper::formatDateTimeIntoDayString("$START_DATE $START_TIME")}">{Vtiger_Util_Helper::formatDateIntoStrings($START_DATE, $START_TIME)}</strong></span>
                                                                    </div>

                                                                    <div class='col-lg-4 col-md-4 col-sm-4 activityStatus' style='margin-top:10px;'>
                                                                        <div class="row">
                                                                            {if $RECORD->get('activitytype') eq 'Task'}
                                                                                {assign var=MODULE_NAME value=$RECORD->getModuleName()}
                                                                                <input type="hidden" class="activityModule" value="{$RECORD->getModuleName()}"/>
                                                                                <input type="hidden" class="activityType" value="{$RECORD->get('activitytype')}"/>
                                                                                <div class="pull-right">
                                                                                    <span style="{if !empty($FONT_COLOR)}color:{$FONT_COLOR} !important;{/if}white-space: nowrap; " class="value">{vtranslate($RECORD->get('status'),$MODULE_NAME)}</span>
                                                                                </div>
                                                                            {else}
                                                                                {assign var=MODULE_NAME value="Events"}
                                                                                <input type="hidden" class="activityModule" value="Events"/>
                                                                                <input type="hidden" class="activityType" value="{$RECORD->get('activitytype')}"/>
                                                                                <div class="pull-right">
                                                                                        <span style="{if !empty($FONT_COLOR)}color:{$FONT_COLOR} !important;{/if}white-space: nowrap; " class="value">{vtranslate($RECORD->get('eventstatus'),$MODULE_NAME)}</span>
                                                                                </div>
                                                                            {/if}
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                        </div>
                                                    {/foreach}
                                                {else}
                                                    <div {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}>
                                                        <p class="textAlignCenter">{vtranslate('LBL_NO_PENDING_ACTIVITIES',$MODULE_NAME)}</p>
                                                    </div>
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
                                        <div class="row">
                                            {if $RECORD_MODEL['RECORD']->get('starred') eq 'Yes'}
                                            {assign var=STARRED value=true}
                                        {else}
                                            {assign var=STARRED value=false}
                                        {/if}
                                        {if $IS_MODULE_DELETABLE}
                                            <span class="pull-right btn btn-xs btn-cyan tooltips " data-app="{$SELECTED_MENU_CATEGORY}" data-toggle="tooltip" title="{vtranslate('LBL_DELETE', $MODULE)}"><i data-app="{$SELECTED_MENU_CATEGORY}" data-module="{$KANBAN_SOURCE_MODULE}" data-id="{$RECORD_MODEL['RECORD']->getId()}"  data-viewname="{$smarty.request.viewname}" {if $MODULE eq 'Calendar'}data-recurring-enabled='{$LISTVIEW_ENTRY->isRecurringEnabled()}'{/if} class="fa fa-trash deleteKanbanRecordButton icon action" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if} ></i></span>
                                        {/if}
                                            <span class="btn-group pull-right">
                                                <button type="button" class="btn btn-mazzy btn-xs dropdown-toggle pull-right"
                                                        style="width:100%;" data-toggle="dropdown"
                                                        aria-haspopup="true" aria-expanded="false" >
                                                    <i class="fa fa-paperclip  tooltips" data-toggle="tooltip" title="{vtranslate('LBL_RELATIONSHIPS', 'Settings::Vtiger')}" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></i>
                                                </button>
                                                <ul class="dropdown-menu related gridrelatedul"
                                                    {if $smarty.foreach.listview.iteration is div by 3}style="right:0;left:auto;"{/if}>
                                                    {assign var="SELECTED_TAB_LABEL" value=$smarty.get.tab_label}
                                                    {foreach key=RELATED_MODULE item=RELATED_LINK from=$RELATION_LINKS}
                                                        {* Assuming most of the related link label would be module name - we perform dual translation *}
                                                        {assign var="DETAILVIEWRELATEDLINKLBL" value= vtranslate($RELATED_LINK['linklabel'], $RELATED_LINK['relatedModuleName'])}
                                                        <li>
                                                            <a href="index.php?module={$KANBAN_SOURCE_MODULE}&relatedModule={$RELATED_LINK['relatedModuleName']}&view=Detail&record={$RECORD_MODEL['RECORD']->getId()}&relationId={$RELATED_LINK['relation_id']}&mode=showRelatedList&tab_label={$RELATED_LINK['linklabel']}"
                                                               class="mycrelatedtab {if $RELATED_LINK['linklabel']==$SELECTED_TAB_LABEL}active{/if} label-mazzy"
                                                               data-url="module={$KANBAN_SOURCE_MODULE}&relatedModule={$RELATED_LINK['relatedModuleName']}&view=Detail&record={$RECORD_MODEL['RECORD']->getId()}&mode=showRelatedList&tab_label={$RELATED_LINK['linklabel']}"
                                                               class="mycrelatedtab {if $RELATED_LINK['linklabel']==$SELECTED_TAB_LABEL}active{/if}"
                                                               data-recordid="{$RECORD_MODEL['RECORD']->getId()}"
                                                               data-label-key="{$RELATED_LINK['linklabel']}"
                                                               style="width:auto"
                                                               title="{$DETAILVIEWRELATEDLINKLBL}" target="_blank">
                                                                    <span class="vicon-{$RELATED_LINK['relatedModuleName']|lower} module-icon" style="font-size: 12px; margin: 0 3px;"></span>
										                            <span class="module-name textOverflowEllipsis">{$DETAILVIEWRELATEDLINKLBL}</span>
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            </span>

                                            {if $SOURCEMODULEMODEL->isTrackingEnabled()}
                                            <a class="pull-right btn btn-xs btn-peas tooltips" data-toggle="tooltip" title="{vtranslate('LBL_UPDATES')}" href="{$RECORD_MODEL['RECORD']->getFullDetailViewUrl()}&mode=showRecentActivities&page=1&tab_label=LBL_UPDATES"><i class="fa fa-refresh" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if} ></i></a>
                                        {/if}
                                        {if $SOURCEMODULEMODEL->isCommentEnabled()}
                                            <a class="pull-right btn btn-xs btn-cyan tooltips" data-toggle="tooltip" title="{vtranslate('ModComments')}" href="{$RECORD_MODEL['RECORD']->getDetailViewUrl()}&relationId={$RELATION_LINKS['ModComments']['relation_id']}&relatedModule=ModComments&mode=showRelatedList&relationId=165&tab_label=ModComments"><i class="fa fa-comments" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if} ></i></a>
                                        {/if}
                                        {if $IS_MODULE_EDITABLE}
                                            <span class="pull-right btn btn-xs btn-cyan tooltips " data-toggle="tooltip" title="{vtranslate("LBL_QUICK_EDIT",$KANBAN_SOURCE_MODULE)}"><i  href="javascript:void(0)" data-url="index.php?module=ParsVT&view=KanbanViewAjax&mode=QuickEditAjax&record={$RECORD_MODEL['RECORD']->getId()}&source_module={$KANBAN_SOURCE_MODULE}" data-app="{$SELECTED_MENU_CATEGORY}" data-module="{$KANBAN_SOURCE_MODULE}" data-id="{$RECORD_MODEL['RECORD']->getId()}" class="fa fa-pencil-square-o alignMiddle kbQuickEdit" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></i></span>
                                            <a class="pull-right btn btn-xs btn-yellow tooltips" data-toggle="tooltip" title="{vtranslate('LBL_EDIT')}" href='{$RECORD_MODEL['RECORD']->getEditViewUrl()}'><i class="fa fa-pencil" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></i></a>
                                        {/if}
                                        {if  $SOURCEMODULEMODEL->isStarredEnabled()}
                                            <span class="pull-right btn btn-xs btn-cyan tooltips" data-toggle="tooltip"  title="{if $STARRED} {vtranslate('LBL_STARRED', $MODULE)} {else} {vtranslate('LBL_NOT_STARRED', $MODULE)}{/if}"><i data-app="{$SELECTED_MENU_CATEGORY}" data-module="{$KANBAN_SOURCE_MODULE}" data-id="{$RECORD_MODEL['RECORD']->getId()}"  data-viewname="{$smarty.request.viewname}" {if $MODULE eq 'Calendar'}data-recurring-enabled='{$LISTVIEW_ENTRY->isRecurringEnabled()}'{/if} class="markKanbanStar fa icon action {if $STARRED} fa-star active {else} fa-star-o{/if}" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></i></span>
                                        {/if}

                                        {if !in_array($KANBAN_SOURCE_MODULE,array('Calendar','Events')) && !empty($RELATION_LINKS['Calendar']) &&$CALENDAR_MODEL->isPermitted('CreateView')}
                                            <span class="pull-right btn btn-xs btn-yellow tooltips createActivity toDotask"   data-id="{$RECORD_MODEL['RECORD']->getId()}" data-module="{$KANBAN_SOURCE_MODULE}" data-url="sourceModule={$KANBAN_SOURCE_MODULE}&sourceRecord={$RECORD_MODEL['RECORD']->getId()}&relationOperation=true"  href="javascript:void(0)"  data-toggle="tooltip" title="{vtranslate('LBL_ADD_TASK',$MODULE_NAME)}"  ><i class="fa fa-calendar" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></i></span>
                                            <span class="pull-right btn btn-xs btn-yellow tooltips createActivity"  data-id="{$RECORD_MODEL['RECORD']->getId()}" data-module="{$KANBAN_SOURCE_MODULE}" data-url="index.php?module=Events&view=QuickCreateAjax"  href="javascript:void(0)" data-toggle="tooltip"  title="{vtranslate('LBL_ADD_EVENT',$MODULE_NAME)}"  ><i class="fa fa-calendar-check-o" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></i></span>
                                        {/if}
                                        <a  class="pull-right btn btn-xs btn-cyan tooltips"  href="index.php?module={$KANBAN_SOURCE_MODULE}&view=Detail&record={$RECORD_MODEL['RECORD']->getId()}&cvid={$CV_ID}" data-toggle="tooltip"  title="{vtranslate('LBL_VIEW_DETAILS', 'ParsVT')}" target="_blank"><i class="fa fa-list" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></i></a>&nbsp;

                                        {if  $QUICK_PREVIEW_ENABLED eq 'true'}
                                            <span class="pull-right btn btn-xs btn-cyan tooltips " data-toggle="tooltip" title="{vtranslate('LBL_QUICK_VIEW', $MODULE)}"><i data-app="{$SELECTED_MENU_CATEGORY}" data-module="{$KANBAN_SOURCE_MODULE}" data-id="{$RECORD_MODEL['RECORD']->getId()}" class="quickKanbanView fa fa-eye icon action" {if !empty($FONT_COLOR)}style="color:{$FONT_COLOR} !important; "{/if}></i></span>
                                        {/if}

                                        </div>
                                        <span class="clearfix"></span>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    {/if}
</form>
    <script>
        var CONVERTLINKSMSG = {
            CONVERTLINKS: "{vtranslate('Convert sidebar links', 'ParsVT')}",
        };
    </script>
{/strip}

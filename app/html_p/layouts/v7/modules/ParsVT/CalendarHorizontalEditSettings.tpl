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
    <div class="main-container clearfix" id="calendar-horizontal-settings-edit-container">
        <div class="editViewPageDiv full-width">
            <div class="col-sm-12 col-xs-12 ">
                <form id="EditView" class="form-horizontal recordEditView"  name="EditView" method="post" action="index.php">
                    <input type="hidden" name="allFields" data-value='{ZEND_JSON::encode($ALL_FIELDS)|escape}' />
                    <input type="hidden" name="module" value="{$QUALIFIED_MODULE}" />
                    <input type="hidden" name="action" value="CalendarHorizontalSave" />
                    <input type="hidden" name="mode" value="CustomTitle" />
                    {assign var=EVENT_FIELDS value=$ALL_FIELDS.Events}
                    {assign var=CALENDAR_FIELDS value=$ALL_FIELDS.Calendar}
                    <div class="editViewHeader">
                        <div class='row'>
                            <div class="col-lg-12 col-md-12 col-lg-pull-0">
                                <h4 class="editHeader" title="{vtranslate('LBL_SETTINGS_CUSTOM_TITLE', $QUALIFIED_MODULE)}">{vtranslate('LBL_SETTINGS_CUSTOM_TITLE', $QUALIFIED_MODULE)}</h4>
                            </div>
                        </div>
                    </div>
                    <div class="editViewBody">
                        <div class="editViewContents">

                            <div class="editContent">
                                <div class="fieldBlockContainer">
                                    <span><h4 class="fieldBlockHeader">{vtranslate('Events', 'Events')}</h4></span>
                                    <hr />
                                    <div class="row form-group">
                                        <div class="col-sm-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-sm-3 col-xs-3">
                                                    {vtranslate('LBL_USE_EVENTS_CUSTOM_TITLE', $QUALIFIED_MODULE)}
                                                </div>
                                                <div class="col-sm-9 col-xs-9">
                                                    <select name="use_events_custom_title" class="inputElement select2 col-sm-2 col-xs-2">
                                                        <option value="0" {if $CUSTOM_TITLE_SETTINGS.use_events_custom_title neq 1} selected{/if}>{vtranslate('LBL_NO', $QUALIFIED_MODULE)}</option>
                                                        <option value="1" {if $CUSTOM_TITLE_SETTINGS.use_events_custom_title eq 1} selected{/if}>{vtranslate('LBL_YES', $QUALIFIED_MODULE)}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {*<div class="row form-group">
                                        <div class="col-sm-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-sm-3 col-xs-3">
                                                    {vtranslate('LBL_EVENTS_CUSTOM_TITLE_REGULAR_VIEW', $QUALIFIED_MODULE)}
                                                </div>
                                                <div class="col-sm-9 col-xs-9">
                                                    <select name="events_custom_title_regular_view" class="inputElement select2 col-sm-2 col-xs-2">
                                                        <option value="0" {if $CUSTOM_TITLE_SETTINGS.events_custom_title_regular_view neq 1} selected{/if}>{vtranslate('LBL_NO', $QUALIFIED_MODULE)}</option>
                                                        <option value="1" {if $CUSTOM_TITLE_SETTINGS.events_custom_title_regular_view eq 1} selected{/if}>{vtranslate('LBL_YES', $QUALIFIED_MODULE)}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>*}
                                    <div class="row form-group">
                                        <div class="col-sm-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-sm-3 col-xs-3">
                                                    {vtranslate('LBL_SELECT_FIELDS', $QUALIFIED_MODULE)}
                                                </div>
                                                <div class="col-sm-9 col-xs-9">
                                                    <select id="events_fields" name="events_fields" class="inputElement select2 col-sm-5 col-xs-5" style="min-width: 350px;">
                                                        <option value="" selected>{vtranslate('LBL_SELECT_FIELD', $QUALIFIED_MODULE)}</option>
                                                        {foreach item=EVENT_FIELD from=$EVENT_FIELDS}
                                                            <option value="{$EVENT_FIELD[1]}">{$EVENT_FIELD[0]}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="row">
                                            <div class="col-sm-12 col-xs-12">
                                                <textarea id="events_custom_title" name="events_custom_title">{$CUSTOM_TITLE_SETTINGS.events_custom_title}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="fieldBlockContainer">
                                    <span><h4 class="fieldBlockHeader">{vtranslate('LBL_CALENDAR', $QUALIFIED_MODULE)}</h4></span>
                                    <hr />
                                    <div class="row form-group">
                                        <div class="col-sm-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-sm-3 col-xs-3">
                                                    {vtranslate('LBL_USE_CALENDAR_CUSTOM_TITLE', $QUALIFIED_MODULE)}
                                                </div>
                                                <div class="col-sm-9 col-xs-9">
                                                    <select name="use_calendar_custom_title" class="inputElement select2 col-sm-2 col-xs-2">
                                                        <option value="0" {if $CUSTOM_TITLE_SETTINGS.use_calendar_custom_title neq 1} selected{/if}>{vtranslate('LBL_NO', $QUALIFIED_MODULE)}</option>
                                                        <option value="1" {if $CUSTOM_TITLE_SETTINGS.use_calendar_custom_title eq 1} selected{/if}>{vtranslate('LBL_YES', $QUALIFIED_MODULE)}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {*<div class="row form-group">
                                        <div class="col-sm-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-sm-3 col-xs-3">
                                                    {vtranslate('LBL_CALENDAR_CUSTOM_TITLE_REGULAR_VIEW', $QUALIFIED_MODULE)}
                                                </div>
                                                <div class="col-sm-9 col-xs-9">
                                                    <select name="calendar_custom_title_regular_view" class="inputElement select2 col-sm-2 col-xs-2">
                                                        <option value="0" {if $CUSTOM_TITLE_SETTINGS.calendar_custom_title_regular_view neq 1} selected{/if}>{vtranslate('LBL_NO', $QUALIFIED_MODULE)}</option>
                                                        <option value="1" {if $CUSTOM_TITLE_SETTINGS.calendar_custom_title_regular_view eq 1} selected{/if}>{vtranslate('LBL_YES', $QUALIFIED_MODULE)}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>*}
                                    <div class="row form-group">
                                        <div class="col-sm-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-sm-3 col-xs-3">
                                                    {vtranslate('LBL_SELECT_FIELDS', $QUALIFIED_MODULE)}
                                                </div>
                                                <div class="col-sm-9 col-xs-9">
                                                    <select id="calendar_fields" name="calendar_fields" class="inputElement select2 col-sm-5 col-xs-5" style="min-width: 350px;">
                                                        <option value="">{vtranslate('LBL_SELECT_FIELD', $QUALIFIED_MODULE)}</option>
                                                        {foreach item=CALENDAR_FIELD from=$CALENDAR_FIELDS}
                                                            <option value="{$CALENDAR_FIELD[1]}">{$CALENDAR_FIELD[0]}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="row">
                                            <div class="col-sm-12 col-xs-12">
                                                <textarea id="calendar_custom_title" name="calendar_custom_title">{$CUSTOM_TITLE_SETTINGS.calendar_custom_title}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="modal-overlay-footer clearfix" style="border-left-width: 0px;">
                            <div class="row clearfix">
                                <div class=' textAlignCenter col-lg-12 col-md-12 col-sm-12 '>
                                    <button type='submit' class='btn btn-success saveButton'>{vtranslate('LBL_SAVE', $MODULE)}</button>&nbsp;&nbsp;
                                    <a class='cancelLink' href="javascript:history.back()" type="reset">{vtranslate('LBL_CANCEL', $MODULE)}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
{/strip}
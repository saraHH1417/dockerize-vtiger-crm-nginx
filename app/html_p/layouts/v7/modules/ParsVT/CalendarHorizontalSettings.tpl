{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}

<div class="container-fluid listViewPageDiv detailViewContainer" id="calendar-horizontal-settings">
    <div class=" vt-default-callout vt-info-callout">
        <h4 class="vt-callout-header"><span class="fa fa-info-circle"></span>{vtranslate('More Information', $QUALIFIED_MODULE)}</h4>
        <p>{vtranslate('LBL_SETTINGS_INFO', $QUALIFIED_MODULE)}</p>
    </div>

    <div class="full-width">
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
                            <h4 class="editHeader" title="{vtranslate('LBL_SETTINGS_CUSTOM_TITLE', $QUALIFIED_MODULE)}">
                                {vtranslate('LBL_SETTINGS_CUSTOM_TITLE', $QUALIFIED_MODULE)}
                                <a class="btn btn-default pull-right" href="index.php?module=ParsVT&view=CalendarHorizontalSettings&parent=Settings&mode=EditSettings"><span class="fa fa-pencil" aria-hidden="true" title="{vtranslate('LBL_EDIT', $QUALIFIED_MODULE)}"></span>&nbsp;{vtranslate('LBL_EDIT', $QUALIFIED_MODULE)}</a>
                            </h4>
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
                                                {if $CUSTOM_TITLE_SETTINGS.use_events_custom_title neq 1}
                                                    {vtranslate('LBL_NO', $QUALIFIED_MODULE)}
                                                {else}
                                                    {vtranslate('LBL_YES', $QUALIFIED_MODULE)}
                                                {/if}
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
                                                {if $CUSTOM_TITLE_SETTINGS.events_custom_title_regular_view neq 1}
                                                    {vtranslate('LBL_NO', $QUALIFIED_MODULE)}
                                                {else}
                                                    {vtranslate('LBL_YES', $QUALIFIED_MODULE)}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </div>*}
                                <div class="row form-group">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-sm-3 col-xs-3">
                                                {vtranslate('LBL_CUSTOM_TITLE', $QUALIFIED_MODULE)}
                                            </div>
                                            <div class="col-sm-9 col-xs-9">
                                                {$CUSTOM_TITLE_SETTINGS.events_custom_title}
                                            </div>
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
                                                {if $CUSTOM_TITLE_SETTINGS.use_calendar_custom_title neq 1}
                                                    {vtranslate('LBL_NO', $QUALIFIED_MODULE)}
                                                {else}
                                                    {vtranslate('LBL_YES', $QUALIFIED_MODULE)}
                                                {/if}
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
                                                {if $CUSTOM_TITLE_SETTINGS.calendar_custom_title_regular_view neq 1}
                                                    {vtranslate('LBL_NO', $QUALIFIED_MODULE)}
                                                {else}
                                                    {vtranslate('LBL_YES', $QUALIFIED_MODULE)}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </div>*}
                                <div class="row form-group">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-sm-3 col-xs-3">
                                                {vtranslate('LBL_CUSTOM_TITLE', $QUALIFIED_MODULE)}
                                            </div>
                                            <div class="col-sm-9 col-xs-9">
                                                {$CUSTOM_TITLE_SETTINGS.calendar_custom_title}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

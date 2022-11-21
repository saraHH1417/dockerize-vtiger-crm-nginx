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
<div class="fc-view fc-horizontal-view">
	<link href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/CalendarHorizontal/css/timelineScheduler.css" rel="stylesheet" />
	<link href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/CalendarHorizontal/css/timelineScheduler.styling.css" rel="stylesheet" />
	<link href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/CalendarHorizontal/css/calendar.css" rel="stylesheet" />

	<div class="fc-toolbar container-fluid" style="padding: 0;">
		<div class="row">
			{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
			{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
				<div class="col-lg-4" style="float: right !important;">
					<button type="button" class="btn btn-default pull-left calendar-horizontal-user-profiles" >
						<span class="fa fa-wrench" aria-hidden="true" title="Settings"></span>&nbsp;{vtranslate('LBL_CALENDAR_BUTTON_SETTING',$MODULE)}
					</button>
					<input type="hidden" id="calendar_horizontal_start_hour" value="{$CALENDAR_SETTINGS.start_hour}" />
					<input type="hidden" id="calendar_horizontal_end_hour" value="{$CALENDAR_SETTINGS.end_hour}" />
					<input type="hidden" id="calendar_horizontal_time_duration" value="{$CALENDAR_SETTINGS.time_duration}" />
					<input type="hidden" id="calendar_horizontal_hour_format" value="{$CURRENT_USER->get('hour_format')}" />
					<input type="hidden" id="calendar_horizontal_default_view_type" value="{$CALENDAR_SETTINGS.default_view_type}" />
					<input type="hidden" id="calendar_horizontal_title_font_size" value="{$CALENDAR_SETTINGS.title_font_size}" />
					<input type="hidden" id="calendar_horizontal_title_font_size_unit" value="{$CALENDAR_SETTINGS.title_font_size_unit}" />
				</div>
				<div class="time-sch-period-container-top col-lg-4">

				</div>
				<div class="fc-button-group col-lg-4">
					<button type="button" class="fc-horizontal-button fc-button fc-state-default fc-state-active">{vtranslate('LBL_CALENDAR_BUTTON_HORIZONTAL',$MODULE)}</button>
					<button type="button" class="fc-vtAgendaList-button fc-button fc-state-default fc-corner-right">{vtranslate('LBL_CALENDAR_BUTTON_AGENDA',$MODULE)}</button>
					<button type="button" class="fc-agendaDay-button fc-button fc-state-default">{vtranslate('LBL_CALENDAR_BUTTON_DAY',$MODULE)}</button>
					<button type="button" class="fc-agendaWeek-button fc-button fc-state-default">{vtranslate('LBL_CALENDAR_BUTTON_WEEK',$MODULE)}</button>
					<button type="button" class="fc-month-button fc-button fc-state-default fc-corner-left">{vtranslate('LBL_CALENDAR_BUTTON_MONTH',$MODULE)}</button>
				</div>
			{else}
				<div class="fc-button-group col-lg-4">
					<button type="button" class="fc-month-button fc-button fc-state-default fc-corner-left">{vtranslate('LBL_CALENDAR_BUTTON_MONTH',$MODULE)}</button>
					<button type="button" class="fc-agendaWeek-button fc-button fc-state-default">{vtranslate('LBL_CALENDAR_BUTTON_WEEK',$MODULE)}</button>
					<button type="button" class="fc-agendaDay-button fc-button fc-state-default">{vtranslate('LBL_CALENDAR_BUTTON_DAY',$MODULE)}</button>
					<button type="button" class="fc-vtAgendaList-button fc-button fc-state-default fc-corner-right">{vtranslate('LBL_CALENDAR_BUTTON_AGENDA',$MODULE)}</button>
					<button type="button" class="fc-horizontal-button fc-button fc-state-default fc-state-active">{vtranslate('LBL_CALENDAR_BUTTON_HORIZONTAL',$MODULE)}</button>
				</div>
				<div class="time-sch-period-container-top col-lg-4">

				</div>
				<div class="col-lg-4">
					<button type="button" class="btn btn-default pull-right calendar-horizontal-user-profiles">
						<span class="fa fa-wrench" aria-hidden="true" title="Settings"></span>&nbsp;{vtranslate('LBL_CALENDAR_BUTTON_SETTING',$MODULE)}
					</button>
					<input type="hidden" id="calendar_horizontal_start_hour" value="{$CALENDAR_SETTINGS.start_hour}" />
					<input type="hidden" id="calendar_horizontal_end_hour" value="{$CALENDAR_SETTINGS.end_hour}" />
					<input type="hidden" id="calendar_horizontal_time_duration" value="{$CALENDAR_SETTINGS.time_duration}" />
					<input type="hidden" id="calendar_horizontal_hour_format" value="{$CURRENT_USER->get('hour_format')}" />
					<input type="hidden" id="calendar_horizontal_default_view_type" value="{$CALENDAR_SETTINGS.default_view_type}" />
					<input type="hidden" id="calendar_horizontal_title_font_size" value="{$CALENDAR_SETTINGS.title_font_size}" />
					<input type="hidden" id="calendar_horizontal_title_font_size_unit" value="{$CALENDAR_SETTINGS.title_font_size_unit}" />
				</div>
			{/if}
		</div>
	</div>


	<div class="listViewEntriesDiv contents-bottomscroll">
	    <div class="calendar">

	    </div>
	    <div class="realtime-info">

	    </div>
	</div>



	<script type="application/javascript" src="layouts/v7/modules/Vtiger/resources/Detail.js"></script>
	{*<script type="application/javascript" src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/CalendarHorizontal/moment.js"></script>*}
	<script type="application/javascript" src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/CalendarHorizontal/timelineScheduler.js"></script>
	<script type="application/javascript" src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/CalendarHorizontal/Calendar.js"></script>
	<script type="application/javascript" src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/CalendarHorizontal/jquery.freezeheader.js"></script>
</div>

{/strip}




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
	<div class="modal-dialog modal-lg calendarSettingsContainer">
		<div class="modal-content">
            {assign var=HEADER_TITLE value={vtranslate('LBL_CALENDAR_SETTINGS', $MODULE)}}
            {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
            {assign var=DECODED_DAYS_STARTS value=ZEND_JSON::decode($DAY_STARTS)}
            {assign var=PICKLIST_VALUES value=$DECODED_DAYS_STARTS['hour_format'][{$CURRENTUSER_MODEL->get('hour_format')}]['start_hour']}
			<div class="modal-body">
				<form class="form-horizontal" id="CalendarHorizontalSettings" name="CalendarHorizontalSettings" method="post" action="index.php">
					<input type="hidden" name="module" value="ParsVT" />
					<input type="hidden" name="action" value="HorizontalAjax" />
					<input type="hidden" name="mode" value="SaveCalendarSettings" />
					<input type=hidden name="timeFormatOptions" data-value='{$DAY_STARTS}' />
					<div>
						<div style="margin-left: 20px;">
							<div class="form-group">
								<label class="fieldLabel col-lg-4 col-sm-4 col-xs-4">{vtranslate('LBL_START_HOUR',$MODULE)}</label>
								<div class="fieldValue col-lg-8 col-sm-8 col-xs-8">
									<select class="select2 calendar_horizontal_settings_start_hour" style="min-width: 150px;" name="calendar_settings[start_hour]" >
                                        {foreach key=ID item=LABEL from=$PICKLIST_VALUES}
											<option value="{$ID}" {if $CALENDAR_SETTINGS.start_hour eq $ID} selected="" {/if}>{vtranslate($LABEL,$MODULE)}</option>
                                        {/foreach}
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="fieldLabel col-lg-4 col-sm-4 col-xs-4">{vtranslate('LBL_END_HOUR',$MODULE)}</label>
								<div class="fieldValue col-lg-8 col-sm-8 col-xs-8">
									<select class="select2 calendar_horizontal_settings_end_hour" style="min-width: 150px;" name="calendar_settings[end_hour]" >
                                        {foreach key=ID item=LABEL from=$PICKLIST_VALUES}
											<option value="{$ID}" {if $CALENDAR_SETTINGS.end_hour eq $ID} selected="" {/if}>{vtranslate($LABEL,$MODULE)}</option>
                                        {/foreach}
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="fieldLabel col-lg-4 col-sm-4 col-xs-4">{vtranslate('LBL_TIME_DURATION',$MODULE)}</label>
								<div class="fieldValue col-lg-8 col-sm-8 col-xs-8">
									<select class="select2" style="min-width: 150px;" name="calendar_settings[time_duration]">
										<option value="5" {if $CALENDAR_SETTINGS.time_duration neq 5} selected="" {/if}>{vtranslate('LBL_TIME_DURATION_5',$MODULE)}</option>
										<option value="10" {if $CALENDAR_SETTINGS.time_duration eq 10} selected="" {/if}>{vtranslate('LBL_TIME_DURATION_10',$MODULE)}</option>
										<option value="30" {if $CALENDAR_SETTINGS.time_duration eq 30} selected="" {/if}>{vtranslate('LBL_TIME_DURATION_30',$MODULE)}</option>
										<option value="60" {if $CALENDAR_SETTINGS.time_duration eq 60} selected="" {/if}>{vtranslate('LBL_TIME_DURATION_60',$MODULE)}</option>
										<option value="120" {if $CALENDAR_SETTINGS.time_duration eq 120} selected="" {/if}>{vtranslate('LBL_TIME_DURATION_120',$MODULE)}</option>
										<option value="240" {if $CALENDAR_SETTINGS.time_duration eq 240} selected="" {/if}>{vtranslate('LBL_TIME_DURATION_240',$MODULE)}</option>
										<option value="360" {if $CALENDAR_SETTINGS.time_duration eq 360} selected="" {/if}>{vtranslate('LBL_TIME_DURATION_360',$MODULE)}</option>
										<option value="720" {if $CALENDAR_SETTINGS.time_duration eq 720} selected="" {/if}>{vtranslate('LBL_TIME_DURATION_720',$MODULE)}</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="fieldLabel col-lg-4 col-sm-4 col-xs-4">{vtranslate('LBL_SET_IS_DEFAULT_VIEW',$MODULE)}</label>
								<div class="fieldValue col-lg-8 col-sm-8 col-xs-8">
									<select class="select2" style="min-width: 150px;" name="calendar_settings[default_view]">
										<option value="0" {if $CALENDAR_SETTINGS.default_view neq 1} selected="" {/if}>{vtranslate('LBL_IS_DEFAULT_VIEW_NO',$MODULE)}</option>
										<option value="1" {if $CALENDAR_SETTINGS.default_view eq 1} selected="" {/if}>{vtranslate('LBL_IS_DEFAULT_VIEW_YES',$MODULE)}</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="fieldLabel col-lg-4 col-sm-4 col-xs-4">{vtranslate('LBL_USE_STATUS_COLORS',$MODULE)}</label>
								<div class="fieldValue col-lg-8 col-sm-8 col-xs-8">
									<select class="select2" style="min-width: 150px;" name="calendar_settings[use_status_colors]">
										<option value="0" {if $CALENDAR_SETTINGS.use_status_colors neq 1} selected="" {/if}>{vtranslate('LBL_USE_STATUS_COLORS_NO',$MODULE)}</option>
										<option value="1" {if $CALENDAR_SETTINGS.use_status_colors eq 1} selected="" {/if}>{vtranslate('LBL_USE_STATUS_COLORS_YES',$MODULE)}</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="fieldLabel col-lg-4 col-sm-4 col-xs-4">{vtranslate('LBL_DEFAULT_VIEW_TYPE',$MODULE)}</label>
								<div class="fieldValue col-lg-8 col-sm-8 col-xs-8">
									<select class="select2" style="min-width: 150px;" name="calendar_settings[default_view_type]">
										<option value="1 days" {if $CALENDAR_SETTINGS.default_view_type neq '1 days'} selected="" {/if}>{vtranslate('LBL_DEFAULT_VIEW_TYPE_DAY',$MODULE)}</option>
										<option value="1 week" {if $CALENDAR_SETTINGS.default_view_type eq '1 week'} selected="" {/if}>{vtranslate('LBL_DEFAULT_VIEW_TYPE_WEEK',$MODULE)}</option>
										<option value="1 month" {if $CALENDAR_SETTINGS.default_view_type eq '1 month'} selected="" {/if}>{vtranslate('LBL_DEFAULT_VIEW_TYPE_MONTH',$MODULE)}</option>
									</select>
								</div>
							</div>
							<div class="form-group title-font-size-container">
								<label class="fieldLabel col-lg-4 col-sm-4 col-xs-4">{vtranslate('LBL_TITLE_FONT_SIZE',$MODULE)}</label>
								<div class="fieldValue col-lg-8 col-sm-8 col-xs-8">
									<input type="number" value="{$CALENDAR_SETTINGS.title_font_size}" min="0" class="inputElement" name="calendar_settings[title_font_size]" style="width: 25%;"/>&nbsp;
									<select class="select2" style="min-width: 150px;" name="calendar_settings[title_font_size_unit]">
										<option value="percent" {if $CALENDAR_SETTINGS.title_font_size_unit eq 'percent'} selected="" {/if}>{vtranslate('LBL_TITLE_FONT_SIZE_PERCENT',$MODULE)}</option>
										<option value="pixel" {if $CALENDAR_SETTINGS.title_font_size_unit eq 'pixel'} selected="" {/if}>{vtranslate('LBL_TITLE_FONT_SIZE_PIXEL',$MODULE)}</option>
									</select>
								</div>
							</div>
							{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
							{if $CURRENT_USER_MODEL->isAdminUser()}
							<div class="form-group">
								<label class="fieldLabel col-lg-4 col-sm-4 col-xs-4">&nbsp;</label>
								<div class="fieldValue col-lg-8 col-sm-8 col-xs-8">
									<a href="index.php?module=ParsVT&view=CalendarHorizontalSettings&parent=Settings" target="_blank" style="color: #15c;">{vtranslate('LBL_CONFIG_CUSTOM_TITLE_LINK',$MODULE)}</a>
								</div>
							</div>
							{/if}
						</div>
					</div>
				</form>
			</div>
            {include file="ModalFooter.tpl"|vtemplate_path:$MODULE}
		</div>
	</div>
{/strip}
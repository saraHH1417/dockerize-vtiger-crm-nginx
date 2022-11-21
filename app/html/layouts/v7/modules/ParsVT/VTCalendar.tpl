{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='SettingsHeader.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
{assign var=FEATUREMESSAGE  value=vtranslate('This feature is currently not available in current package!',$QUALIFIED_MODULE)}
<div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="PersianPack">
    <div>
        <div>
            <div class="container-fluid">
                <div class="contents">
                    <br>
                </div>
                <div class="container-fluid">
                    <div class="related-tabs">
                        <div class="row form-group">
                            <div class="col-md-6">
                                <fieldset class="vtToolBox  {if $FULLMODULE}parsvtfeatures{/if}">
                                    <legend {if $FULLMODULE}class="text-danger"{/if}>{vtranslate('Calendar Package Options',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Multiple Calendar Support (Solar,Hijri,Gregorian)',$QUALIFIED_MODULE)}{/if}">
                                                <input style="opacity: 0;" {if $MultiCalendar} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                       data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                       data-on-color="primary" data-toggle="toggle"  data-type="MultiCalendar"/>
                                                {vtranslate('Multiple Calendar Support (Solar,Hijri,Gregorian)',$QUALIFIED_MODULE)}
                                        </li>
                                        {if !$FULLMODULE}
                                        <li {if !$FULLMODULE}id='checkhealth'{/if} data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Check health of calendar module',$QUALIFIED_MODULE)}{/if}" style="cursor: pointer">
                                            <span class="fa fa-heartbeat blink_me text-danger"
                                                  style="font-size:24px;position: relative;bottom: -4px;"></span>
                                                {vtranslate('Check health of calendar module',$QUALIFIED_MODULE)}
                                        </li>
                                        {/if}
                                        {if $MultiCalendar}
                                            <li data-toggle="tooltip"
                                                title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Default System Calendar',$QUALIFIED_MODULE)}{/if}">
                                                <select class="select2 row"
                                                        id="defaultcalendar"  data-language="{vtranslate('Default System Calendar',$QUALIFIED_MODULE)}" {$FULLMODULE}>{$DEFAULTCALENDARS}</select>
                                                {vtranslate('Default System Calendar',$QUALIFIED_MODULE)}

                                            </li>
                                        {/if}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Default Time Zone',$QUALIFIED_MODULE)}{/if}">
                                            <select class="select2 row" id="defaulttimezone"  data-language="{vtranslate('Default Time Zone',$QUALIFIED_MODULE)}" {$FULLMODULE}>{$TIMEZONES}</select>
                                            {vtranslate('Default Time Zone',$QUALIFIED_MODULE)}

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Job Scheduler (Calendar)',$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $CALENDARHORIZONTAL} value='1'  checked{else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="CalendarHorizontal"/>
                                            {vtranslate('Job Scheduler (Calendar)',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Prayer Times Calculation',$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PRAYERTIMES} value='1'  checked{else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PrayerTimes"/>
                                            {vtranslate('Prayer Times Calculation',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Iranian National Holidays and Events on Calendar',$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $IRANIANEVENTS} value='1'  checked{else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="IranianEvents"/>
                                            {if $IRANIANEVENTS}<a href="index.php?parent=Settings&module=ParsVT&view=ManageOccasions" target="_blank">{/if} {vtranslate('Iranian National Holidays and Events on Calendar',$QUALIFIED_MODULE)}  {if $IRANIANEVENTS}</a>{/if}</li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Date Converter Widget',$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $DATECONVERTER} value='1'  checked{else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"
                                                   data-type="DATECONVERTER"/>
                                            {vtranslate('Date Converter Widget',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Iranian Calendar Widget',$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $TODAYEVENTS} value='1'  checked{else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="CWIDGET"/>
                                            {vtranslate('Iranian Calendar Widget',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Other Date Formats',$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $DATEFORMATS} value='1'  checked{else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="DATEFORMATS"/>
                                            {vtranslate('Other Date Formats',$QUALIFIED_MODULE)}</li>
                                        {if !$WHITELABEL}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Transform Persian Packages by Other Developers',$QUALIFIED_MODULE)}{/if}">
                                            <a href="index.php?module={$QUALIFIED_MODULE}&view=Database&parent=Settings#DataTransformation"
                                               target="_blank">
                                                <span class="fa fa-ambulance blink_me"
                                                      style="color:#005fcc; font-size:24px;position: relative;bottom: -4px;"></span>
                                                {vtranslate('Transform Persian Packages by Other Developers',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        {/if}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Automate Google Calendar/Contact Sync',$QUALIFIED_MODULE)}{/if}">
                                        <input style="opacity: 0;" {if $AUTOGSYNC} value='1'  checked{else} value='0'{/if} {$FULLMODULE}
                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                               data-on-color="primary" data-toggle="toggle" data-type="AUTOGSYNC"/>
                                            <a href="index.php?module={$QUALIFIED_MODULE}&view=Misc&parent=Settings"  target="_blank">
                                                {vtranslate('Automate Google Calendar/Contact Sync',$QUALIFIED_MODULE)}</a></li>
                                    </ul>
                                </fieldset>
                            </div>
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend {if $FULLMODULE}class="text-danger"{/if}>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate("Calendar Package Features", $QUALIFIED_MODULE)}
                                    </legend>
                                    <p>
                                       {vtranslate('All Features of Pro Version',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Add Solar, Gregorian and Lunar calendars without changing Vtiger core',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Simultaneous and independent calendar selection for each user, based on Solar, Gregorian or Lunar dates',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate("Support the selected calendar independent from user's selected language",$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Defining default calendar (Solar/ Gregorian/ Lunar) to use in other parts, such as Workflows, etc.',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Supports Solar dates in getting Excel exports and reports',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Solar Hijri dates support in imports from Excel',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Solar Hijri dates support in Webforms',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Supports all standard Vtiger datepickers in all parts of the system, such as events, reports, workflows, etc.',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Supports calendar for newly bought modules or those developed with Vtiger calendar standard',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate("Vtiger CRM sync, integration with other software such as mobile apps, Google Calendar and Outlook, and proper data exchange",$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Add Iranian and global events and official holidays in calendar and widgets',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Date converter tool',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Iranian Calendar Widget',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Add prayer times to Vtiger for users',$QUALIFIED_MODULE)}<br/>
                                       {vtranslate('Add Iranian Standard date format and formats used in other countries',$QUALIFIED_MODULE)}<br/>
</p>
                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

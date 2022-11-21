{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{assign var=ALLOW_IPS value=str_replace('::',"\n",$ALLOW_IPS)}
{assign var=BLOCKED_IP value=str_replace('::',"\n",$BLOCKED_IP)}
{assign var=SelectedWeekdays value=explode(',',$WEEKDAYS)}
{include file='SettingsHeader.tpl'|@vtemplate_path:$MODULE}
<div class="container-fluid" style="margin-top:10px;">
    <div class="contents">
        {if $ISINSTALLED}
        <div id="my-tab-content" class="tab-content">
            <div class='editViewContainer tab-panel' id="brutalforce_tab_1">
                <form id="parssecureloginForm" name="brutalforce_tab_1">
                    <table class="table table-condensed">
                        <thead>
                        <tr class="blockHeader">
                            <th colspan="2" class="mediumWidthType">
                                <span class="alignMiddle">{vtranslate('BruteForce settings', $MODULE)}</span>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr style="height:46px;">
                            <td width="30%"><label
                                        class="muted pull-right marginRight10px">{vtranslate('LBL_ACTIVE', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;">
                                <div class="col-md-3">
                                    <input type="checkbox" name="active" {if $ACTIVE} checked {/if} />
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td width="30%"><label
                                        class="muted pull-right marginRight10px">{vtranslate('Number of attempts', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;">
                                <div class="col-md-2">
                                    <input type="text" class="form-control" name="attempsnumber" id="min_length"
                                           value="{$ATTEMPSNUMBER}"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%"><label
                                        class="muted pull-right marginRight10px">{vtranslate('Time lock', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;">
                                <div class="col-md-2">
                                    <input type="text" class="form-control" name="timelock" id="min_length"
                                           value="{$TIMELOCK}"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%"><label
                                        class="muted pull-right marginRight10px">{vtranslate('Users for notifications', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;">
                                <div class="col-md-8">
                                    <select multiple class="select2 inputElement" name="selectedUsers" multiple>
                                        {foreach key=KEY  item=USER from=$ADMINUSERS}
                                            <option value="{$KEY}" {if $USERFORNOTIFICATIONS } {if array_key_exists($KEY, $USERFORNOTIFICATIONS)}  selected {/if} {/if}>{$USER}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="muted pull-right marginRight10px"> {vtranslate('List of Allowed IP', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;"><textarea  style="direction: ltr; text-align: left" class="col-lg-8 col-md-8 col-sm-8" col="1" rows="10"
                                                                     name="allow_ips" placeholder="192.168.1.10&#10;172.16.1.0/24">{$ALLOW_IPS}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="muted pull-right marginRight10px"> {vtranslate('List of Blocked IP', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;"><textarea  style="direction: ltr; text-align: left" class="col-lg-8 col-md-8 col-sm-8" col="1" rows="10"
                                                                     name="blocked_ip"  placeholder="192.168.1.10&#10;172.16.1.0/24">{$BLOCKED_IP}</textarea>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <table class="table table-bordered table-condensed themeTableColor" style="margin-top: 1em;">
                        <thead>
                        <tr class="blockHeader">
                            <th colspan="4" class="mediumWidthType"><span
                                        class="alignMiddle">{vtranslate('Working Days', $MODULE)}</span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <label class="muted pull-right marginRight10px"> {vtranslate('Disable Logins on Weekends', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;"><input type="checkbox" name="login_disable"
                                                                  {if $LOGIN_DISABLE eq 1}checked{/if}></td>
                        </tr>
                        <tr>
                            <td width="30%"><label
                                        class="muted pull-right marginRight10px">{vtranslate('Weekend Days', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;">
                                <div class="col-md-8">
                                    <select multiple class="select2 inputElement" name="weekdays" multiple>
                                        {foreach key=KEY  item=DAY from=$ALLWEEKDAYS}
                                            <option value="{$KEY}" {if $SelectedWeekdays} {if in_array($KEY, $SelectedWeekdays)}  selected {/if} {/if}>{vtranslate($DAY, $MODULE)}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td>
                                <label class="muted pull-right marginRight10px"> {vtranslate('Disable Logins after working hours', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;"><input type="checkbox" name="working_disable"
                                                                  {if $WORKING_DISABLE eq 1}checked{/if}></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="muted pull-right marginRight10px"> {vtranslate('Workday Start hour', $MODULE)}</label>
                            </td>r
                            <td style="border-left: none;">
                                <div class="input-group inputElement time" style="max-width: 120px">
                                    <input id="time_starts" type="text" data-format="24"
                                           class="timepicker-default form-control" value="{$TIME_STARTS}"
                                           name="time_starts"/>
                                    <span class="input-group-addon" style="width: 30px;">
			<i class="fa fa-clock-o"></i>
		</span>
                                </div>
                        <tr>
                            <td>
                                <label class="muted pull-right marginRight10px"> {vtranslate('Workday End hour', $MODULE)}</label>
                            </td>
                            <td style="border-left: none;">
                                <div class="input-group inputElement time"  style="max-width: 120px">
                                    <input id="time_ends" type="text" data-format="24"
                                           class="timepicker-default form-control" value="{$TIME_ENDS}"
                                           name="time_ends"/>
                                    <span class="input-group-addon" style="width: 30px;">
			<i class="fa fa-clock-o"></i>
		</span>
                                </div>

                        </tbody>
                    </table>


                    <div class="pull-right" style="margin: 10px;">
                        <button class="btn btn-success saveButton" type="submit" id='saveConfig'
                                title="{vtranslate('LBL_SAVE', $MODULE)}">
                            <strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
                    </div>
                </form>
            </div>
        </div>
        {else}
            <div class="row-fluid">
                <p class="col-lg-12 alert alert-warning text-center">
                    {vtranslate("Secure Login is not installed on the CRM software",$QUALIFIED_MODULE)}<br />
                    <a onclick="ParsSecureLogin_Actions_Js.Install();;if (event.stopPropagation){ event.stopPropagation(); } else { event.cancelBubble = true; }"><strong>{vtranslate("Click here to install the Secure Login",$QUALIFIED_MODULE)}</strong></a><br />
                </p>
            </div>
        {/if}
    </div>
</div>
<script>
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
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

<div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="ParsVTExtraSettings">
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
                                <fieldset class="vtToolBox">
                                    <legend>{vtranslate('Settings',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li data-toggle="tooltip" title="{vtranslate('Send Email',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $send_email && $ISEMAILENABLED} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="SENDEMAIL"/>
                                            {vtranslate('Send Email',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('Send SMS',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $send_sms && $ISSMSENABLED} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="SENDSMS"/>
                                            {vtranslate('Send SMS',$QUALIFIED_MODULE)}</li>
                                        {if $ISNOTIFENABLED}
                                        <li data-toggle="tooltip" title="{vtranslate('Create Notification',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $send_notification} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="SENDNOTIFICATION"/>
                                            {vtranslate('Create Notification',$QUALIFIED_MODULE)}</li>
                                        {/if}
                                        <li data-toggle="tooltip" title="{vtranslate('Send Telegram Notification',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $send_telegram} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="SENDTELEGRAM"/>
                                            {vtranslate('Send Telegram Notification',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip" title="{vtranslate('Send Output Messenger Notification',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $send_output} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="SENDOUTPUT"/>
                                            {vtranslate('Send Output Messenger Notification',$QUALIFIED_MODULE)}</li>
                                    </ul>
                                </fieldset>
                                {if $send_output}
                                    <br />
                                <fieldset class="vtToolBox">
                                    <legend>{vtranslate('Output Messenger Settings',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%;">
                                        <li data-toggle="tooltip" title="{vtranslate('Output Server IP/Address',$QUALIFIED_MODULE)}" style="display: flex">
                                            <span style="min-width: 150px;">{vtranslate('Output Server IP/Address',$QUALIFIED_MODULE)}:</span>
                                            <span class="edit pull-left">
                                            <div class="input-group editElement"  style="display: flex">
                                                <input class="inputElement form-control" type="text" name="send_outputserver" value="{$send_outputserver}">
                                                <div class="input-save-wrap saveoutput" data-target="send_outputserver"><span class="pointerCursorOnHover input-group-addon input-group-addon-save" data-target="send_outputserver"><i class="fa fa-check"  data-target="send_outputserver"></i></span></div>
                                            </div>
                                            </span>
                                        </li>
                                        <li data-toggle="tooltip" title="{vtranslate('Output Server Port',$QUALIFIED_MODULE)}" style="display: flex">
                                            <span style="min-width: 150px;">{vtranslate('Output Server Port',$QUALIFIED_MODULE)}:</span>
                                            <span class="edit pull-left">
                                            <div class="input-group editElement"  style="display: flex">
                                                <input class="inputElement form-control" type="number" name="send_outputport" value="{if $send_outputport}{$send_outputport}{else}14125{/if}">
                                                <div class="input-save-wrap saveoutput" data-target="send_outputport"><span class="pointerCursorOnHover input-group-addon input-group-addon-save" data-target="send_outputport"><i class="fa fa-check"  data-target="send_outputport"></i></span></div>
                                            </div>
                                            </span>
                                        </li>
                                        <li data-toggle="tooltip" title="{vtranslate('Output Server API Key',$QUALIFIED_MODULE)}" style="display: flex">
                                            <span style="min-width: 150px;">{vtranslate('Output Server API Key',$QUALIFIED_MODULE)}:</span>
                                            <span class="edit pull-left">
                                            <div class="input-group editElement"  style="display: flex">
                                                <input class="inputElement form-control" type="text" name="send_outputapikey"  value="{$send_outputapikey}">
                                                <div class="input-save-wrap saveoutput" data-target="send_outputapikey"><span class="pointerCursorOnHover input-group-addon input-group-addon-save"  data-target="send_outputapikey"><i class="fa fa-check"  data-target="send_outputapikey"></i></span></div>
                                            </div>
                                            </span>
                                        </li>
                                        <li data-toggle="tooltip" title="{vtranslate('Sender User Name',$QUALIFIED_MODULE)}" style="display: flex">
                                            <span style="min-width: 150px;">{vtranslate('Sender User Name',$QUALIFIED_MODULE)}:</span>
                                            <span class="edit pull-left">
                                            <div class="input-group editElement"  style="display: flex">
                                                <input class="inputElement form-control" type="text" name="send_outputuser"  value="{$send_outputuser}">
                                                <div class="input-save-wrap saveoutput" data-target="send_outputuser"><span class="pointerCursorOnHover input-group-addon input-group-addon-save"  data-target="send_outputuser"><i class="fa fa-check"  data-target="send_outputuser"></i></span></div>
                                            </div>
                                            </span>
                                        </li>
                                        <li style="display: flex">
                                            <button class="btn btn-info checkconnection" type="button">{vtranslate('Check Server Connection', $QUALIFIED_MODULE)}</button>
                                        </li>
                                    </ul>
                                </fieldset>
                                {/if}
                            </div>
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;&nbsp;{vtranslate("Vtiger Mention Features", $QUALIFIED_MODULE)}
                                    </legend>
                                    <p>
                                        {vtranslate('LBL_MENTION_DESC',$QUALIFIED_MODULE)}<br/></p>
                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

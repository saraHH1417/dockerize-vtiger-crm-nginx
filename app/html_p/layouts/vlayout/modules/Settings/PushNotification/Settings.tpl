{*
<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*} 
<div class="container-fluid">
    <div class="contents">
        <form class="form-horizontal" action='index.php?module=PushNotification&parent=Settings&view=Settings&action=SaveSettings' method='POST'>
            <table class="table table-bordered table-condensed themeTableColor">
                <thead>
                    <tr class="blockHeader">
                        <th colspan="2" class="medium">{vtranslate('WebPush Settings', 'PushNotification')}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('Web Push','PushNotification')}</td>
                        <td class="row-fluid medium">
                            <select id="status" class="inputbox chzn-select" name="status">{$WEBPUSHSTATUS}</select>
                        </td>
                    </tr>
                    {if $enable_webpush eq '1'}
                    <tr id="show1">
                        <td width="25%" class="medium">{vtranslate('Show Push Icon on CRM','PushNotification')}</td>
                        <td class="row-fluid medium">
                            <select id="showicon" class="inputbox chzn-select" name="showicon">{$ListWEBPUSH}</select>
                        </td>
                    </tr>
                    {/if}
                </tbody>
            </table>
           {if $enable_webpush eq '1'}
            <table id="show2" class="table table-bordered table-condensed themeTableColor">
                <thead>
                    <tr class="blockHeader">
                        <th colspan="2" class="medium">{vtranslate('FoxPush Settings', 'PushNotification')}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('Domain', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" name="foxpush_domain" value="{$foxpush_domain}"  style="direction:ltr; text-align:left">
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('Key', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" name="foxpush_key" value="{$foxpush_key}"  style="direction:ltr; text-align:left">
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('Sub Domain', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" value="{if ! isset($smarty.get.foxmsg)}{$foxpush_subdomain}{else}{$smarty.get.foxmsg}{/if}" style="direction:ltr; text-align:left" readonly disabled>
                        </td>
                    </tr>
                </tbody>
            </table>
            </tbody>
            </table>
            <table id="show3" class="table table-bordered table-condensed themeTableColor">
                <thead>
                    <tr class="blockHeader">
                        <th colspan="2" class="medium">{vtranslate('PushAssist Settings', 'PushNotification')}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('API Key', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" name="pushassist_api" value="{$pushassist_api}"  style="direction:ltr; text-align:left">
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('Secret Key', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" name="pushassist_key" value="{$pushassist_key}"  style="direction:ltr; text-align:left">
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('Script Code', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" value="{if ! isset($smarty.get.psmsg)}{$pushassist_code}{else}{$smarty.get.psmsg}{/if}"  style="direction:ltr; text-align:left" readonly disabled>
                        </td>
                    </tr>
                </tbody>
            </table>
            </tbody>
            </table>
            <table id="show4" class="table table-bordered table-condensed themeTableColor">
                <thead>
                    <tr class="blockHeader">
                        <th colspan="2" class="medium">{vtranslate('OneSignal Settings', 'PushNotification')}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('User Auth Key', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" name="onsignal_userkey" value="{$onsignal_userkey}"  style="direction:ltr; text-align:left">
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('App ID', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" name="onsignal_appid" value="{$onsignal_appid}"  style="direction:ltr; text-align:left">
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('REST API Key', 'PushNotification')}</td>
                        <td class="row-fluid medium">
                            <input type="text" value="{if ! isset($smarty.get.osmsg)}{$onsignal_restkey}{else}{$smarty.get.osmsg}{/if}" style="direction:ltr; text-align:left" readonly disabled>
                        </td>
                    </tr>

 
                </tbody>
            </table>
            {/if}
            </tbody>
            </table>
            <div class="widget_header row-fluid">
                <div class="span4 btn-toolbar">
                    <div>
                        <button class="btn btn-success saveButton" type="submit" title="{vtranslate("Save", "PushNotification")}"><strong>{vtranslate("Save", 'PushNotification')}</strong></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $(function() {

                {
                    if $accept_sms eq '1'
                }
                $('#SMSStatus').on('change', function() {
                    if ($('#SMSStatus').val() == '1') {
                        $('#sms_key').show();
                        $('#als').show();
                        $('#ats').show();
                        $('#aas').show();
                        $('#aac').show();
                        $('#FixSMSNumbers').show();

                    } else {
                        $('#sms_key').hide();
                        $('#als').hide();
                        $('#ats').hide();
                        $('#aas').hide();
                        $('#aac').hide();
                        $('#FixSMSNumbers').hide();
                    }
                });
                $('#fix_numbers').on('change', function() {
                    if ($('#fix_numbers').val() == '1') {
                        $('#country_code').show();
                        $('#city_code').show();
                    } else {
                        $('#country_code').hide();
                        $('#city_code').hide();
                    }
                });

                {
                    /if}

                });
</script>
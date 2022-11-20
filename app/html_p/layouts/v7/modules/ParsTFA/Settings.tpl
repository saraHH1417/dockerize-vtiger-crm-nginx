{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<div class="col-lg-12">
    <div class="editContainer container-fluid" style="padding-left: 3%;padding-right: 3%; margin-top: 20px;">

        <h3>{vtranslate('2-Step Verification', $MODULE)}</h3>&nbsp;{vtranslate('Two Step Verification Settings', $MODULE)}
        <hr>
        {if $ISINSTALLED}
            <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
                <li class="active"><a href="#Configuration" data-toggle="tab">{vtranslate('LBL_SETTINGS', $MODULE)}</a>
                </li>
                <li><a href="#moreinfo" data-toggle="tab">{vtranslate('More info', $MODULE)}</a></li>

            </ul>
            <div class="tab-content">
                <div id="Configuration" class="tab-pane fade in active">
                    <div class="contents">
                        <form class="form-horizontal" method='POST' onsubmit="return ValidateForm(this);">
                            <input type="hidden" name="module" value="ParsTFA">
                            <input type="hidden" name="parent" value="Settings">
                            <input type="hidden" name="view" value="Settings">
                            <input type="hidden" name="action" value="SaveSettings">
                            <table class="table table-condensed">
                                <thead>
                                <tr class="blockHeader">
                                    <th colspan="2" class="medium">{vtranslate('Settings', $MODULE)}</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td width="30%"
                                        class="medium">{vtranslate('Two Step Verification Status', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" id="TwoStepStatus"
                                                                         class="select2"
                                                                         name="TwoStepStatus">{$ListParsvt2Step}</select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table id="TwoStepOptions"
                                   class="table table-condensed" {$DisplayTable}>
                                <tbody>
                                <tr style="display: none;">
                                    <td width="30%" class="medium">{vtranslate('Force Users to enable', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" class="select2"
                                                                         name="TWO_STEP_FORCE">{$ListTwoStepForce}</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="medium">{vtranslate('Email Code', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" class="select2"
                                                                         name="TWO_STEP_EMAIL">{$ListTwoStepEmail}</select>
                                        <small>{vtranslate('Outgoing Server must be set.', $MODULE)}</small>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="medium">{vtranslate('SMS Code', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" class="select2"
                                                                         name="TWO_STEP_SMS">{$ListTwoStepSMS}</select>
                                        <small>{vtranslate('SMS provider must be set.', $MODULE)}</small>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="medium">{vtranslate('Backup Code', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" class="select2"
                                                                         name="TWO_STEP_BCODES">{$ListTwoStepBcodes}</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%"
                                        class="medium">{vtranslate('Allow Authenticator Software', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" class="select2"
                                                                         name="TWO_STEP_AUTHENTICATOR">{$ListTwoStepAuthenticator}</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="medium">{vtranslate('2Step Code Length', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" class="select2"
                                                                         name="STEP_CODE_LENGTH">{$ListTwoStepVerLength}</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="medium">{vtranslate('Backup Code Length', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" class="select2"
                                                                         name="BACKUPCODE_CODE_LENGTH">{$ListTwoStepBackLength}</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="medium">{vtranslate('Number of Backup Codes', $MODULE)}</td>
                                    <td class="row-fluid medium"><select style="min-width:150px" class="select2"
                                                                         name="BACKUPCODE_CODE_NUMBERS">{$ListTwoStepBackNum}</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="medium">{vtranslate('validity duration (day)', $MODULE)}</td>
                                    <td class="row-fluid medium"><input class="inputElement" style="max-width:150px"
                                                                        type="text" min="1" max="999" maxlength="3"
                                                                        size="3"
                                                                        name="VALIDTIME" value="{$VALIDTIME}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="medium">{vtranslate('Authenticator Name', $MODULE)}</td>
                                    <td class="row-fluid medium"><input class="inputElement" style="max-width:150px"
                                                                        type="text" pattern="[a-zA-Z0-9-]+" required
                                                                        name="AUTHTITLE" value="{$AUTHTITLE}" required>
                                        <small>{vtranslate('Display in Authenticator Software. Enter English alphabet only', $MODULE)}</small>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="widget_header row-fluid">
                                <div class="span4 btn-toolbar">
                                    <div>
                                        <button class="btn btn-success saveButton" type="submit"
                                                title="{vtranslate("Save")}">
                                            <strong>{vtranslate("Save")}</strong></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class='editViewContainer tab-pane' id="moreinfo">
                    <div class="alert alert-info" style=" margin:0 auto;">
                        <b>{vtranslate('Learn more', $MODULE)}</b>
                        <br>{str_replace("30",$VALIDTIME,vtranslate('LBL_2STEP_DESCRIPTION', $MODULE))}</div>
                    <br/>

                    <div class="alert alert-block" style=" margin:0 auto; height:200px;">
                        {vtranslate('2Step Autentication Software:', $MODULE)}<br/><br/>
                        <div class="span6">
                            <a href="https://cafebazaar.ir/app/com.google.android.apps.authenticator2/?l=fa"
                               target="_blank"><img src="layouts/v7/modules/ParsTFA/images/bazzar.png"></a>&nbsp;&nbsp;
                            <a href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2"
                               target="_blank"><img src="layouts/v7/modules/ParsTFA/images/google-play.png"></a>&nbsp;&nbsp;
                            <a href="http://my.sibche.ir/app/details/id/6310/name/Google-Authenticator" target="_blank"><img
                                        src="layouts/v7/modules/ParsTFA/images/sibche.png"></a>&nbsp;&nbsp;
                            <a href="https://itunes.apple.com/en/app/google-authenticator/id388497605?mt=8"
                               target="_blank"><img
                                        src="layouts/v7/modules/ParsTFA/images/appstore.png"></a>&nbsp;&nbsp;<br/></div>
                        <div class="span6">
                            <a href="https://appworld.blackberry.com/webstore/content/29401059" target="_blank"><img
                                        src="layouts/v7/modules/ParsTFA/images/blackberry.png"></a>&nbsp;&nbsp;
                            <a href="https://www.microsoft.com/en-us/store/apps/authenticator/9wzdncrfj3rj"
                               target="_blank"><img
                                        src="layouts/v7/modules/ParsTFA/images/windowsphone.png"></a>&nbsp;&nbsp;
                            <a href="https://chrome.google.com/webstore/detail/gauth-authenticator/ilgcnhelpchnceeipipijaljkblbcobl?hl=en"
                               target="_blank"><img src="layouts/v7/modules/ParsTFA/images/ChromeWebStore.png"></a>&nbsp;&nbsp;
                            <a href="https://winauth.com/download/" target="_blank"><img
                                        src="layouts/v7/modules/ParsTFA/images/windows.png"></a>&nbsp;&nbsp;
                        </div>
                        <div>

                        </div>
                    </div>

                </div>
            </div>
        {else}
            <div class="row-fluid">
                <p class="col-lg-12 alert alert-warning text-center">
                    {vtranslate("Two-factor Authentication is not installed on the CRM software",$MODULE)}<br/>
                    <a onclick="InstallTFA();;if (event.stopPropagation){ event.stopPropagation(); } else { event.cancelBubble = true; }"><strong>{vtranslate("Click here to install the Two-factor Authentication",$MODULE)}</strong></a><br/>
                </p>
            </div>
        {/if}
    </div>

</div>
<script>

    {if $ISINSTALLED}
    {literal}
    function ValidateForm(frm) {
        if (frm.TwoStepStatus.value == '1') {
            if (frm.TWO_STEP_AUTHENTICATOR.value == '0' && frm.TWO_STEP_SMS.value == '0' && frm.TWO_STEP_EMAIL.value == '0' && frm.TWO_STEP_BCODES.value == '0') {
                app.helper.showConfirmationBox({'message': app.vtranslate('One of options must be active!')}).then(
                    function () {
                        frm.submit();
                        return true;
                    },
                    function (error, err) {
                        return false
                    }
                );
                return false;
            }
        } else if (frm.TwoStepStatus.value == '0') {
            app.helper.showConfirmationBox({'message': app.vtranslate('All users data will be removed! Are you sure to disable Two step verification?')}).then(
                function () {
                    frm.submit();
                    return true;
                },
                function (error, err) {
                    return false
                }
            );
            return false;
        }
        frm.submit();
    }
    {/literal}
    {else}
    {literal}
    function InstallTFA() {
        var progressIndicatorElement = jQuery.progressIndicator({
            'message': '',
            'position': 'html',
            'blockInfo': {
                'enabled': true
            }
        });
        var params = {};
        params['module'] = 'ParsTFA';
        params['action'] = 'ActionAjax';
        params['parent'] = 'Settings';
        params['mode'] = 'Install';
        AppConnector.request(params).then(
            function (data) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
            },
            function (error) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
            }
        );
        setTimeout(function () {
            window.location.reload(1);
        }, 5000);
    }
    {/literal}
    {/if}


    $(function () {
        $('#TwoStepStatus').change(function () {
            if ($('#TwoStepStatus').val() == '1') {
                $('#TwoStepOptions').show();
            } else {
                $('#TwoStepOptions').hide();
            }
        });
    });
</script>
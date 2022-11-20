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
    <style>
        .detailViewContainer {
            padding: 0;
        }

        .TwoStepField {
            min-width: 150px !important;
            max-width: 200px !important;
        }

        ul.bcodes {
            list-style-type: square;
            padding: 0 15px;
        }
    </style>
    <div class="col-lg-12">
    <div class="listViewPageDiv">
    <div class="container-fluid">
        <div class="detailview-content userPreferences container-fluid">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="col-xs-8">
                        <div class="logo col-xs-{if empty($IMAGEDETAILS[0]['path'])}1{else}2{/if} ">
                            {assign var=NOIMAGE value=0}
                            {foreach key=ITER item=IMAGE_INFO from=$IMAGEDETAILS}
                                {if !empty($IMAGE_INFO.path) && !empty($IMAGE_INFO.orgname)}
                                    <img  height="75px" width="75px" src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}"
                                         alt="{$IMAGE_INFO.orgname}" title="{$IMAGE_INFO.orgname}"
                                         data-image-id="{$IMAGE_INFO.id}">
                                {else}
                                    {assign var=NOIMAGE value=1}
                                {/if}
                            {/foreach}
                            {if $NOIMAGE eq 1}
                                    <div class="name recordImage" style="margin-top: 20px; height: 50px; width: 50px;  text-align: center;">
                                        <span style="font-size:24px; color: #fff">
                                            <strong> {$USERINFO|substr:0:2} </strong>
                                        </span>
                                    </div>
                            {/if}
                        </div>
                        <span class="col-xs-9">
                            <span id="myPrefHeading"><h3>{vtranslate($TFATYPE, $MODULE_NAME)}</h3></span>
                            <span>{vtranslate('LBL_USERDETAIL_INFO', 'Users')}&nbsp;&nbsp;"<b>{$USERINFO}</b>"</span>
                        </span>
                    </div>
                    <div class="pull-right col-xs-4">
                        <div class="btn-group pull-right">
                            <button class="btn btn-default" onclick="window.location.href='index.php?module=Users&amp;parent=Settings&amp;view={$TFAVIEW}&amp;record={$RECORDID}'">
                                {vtranslate('View Preferences', $MODULE_NAME)}
                            </button>
                            <button class="btn btn-default" onclick="window.location.href='index.php?module=Users&amp;parent=Settings&amp;view={$TFAEDIT}&amp;record={$RECORDID}'">
                                {vtranslate('Edit Preferences', $MODULE_NAME)}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="detailViewInfo userPreferences">
                <div class="details col-xs-12"><br/>
                    {if defined("DEMO_MODE") && DEMO_MODE}
                    <div class="alert alert-warning"
                         style="width:99%; text-align: center">{vtranslate('Demo mode is enabled, some features are disabled in demo mode!', $MODULE_NAME)}</div>
                    {/if}
                    <div class="alert alert-{$USERNULL}"
                         style="width:99%; text-align: center">{vtranslate('Email and Mobile phone are required filed, please fill them via Edit button on top', $MODULE_NAME)}</div>
                    <br/>
                    <table class="table table-bordered marginLeftZero" style="width:99%; margin:0 auto;">
                        <tbody>
                        <tr class="listViewActionsDiv">
                            <th colspan="4">{vtranslate('User Mobile & Email', $MODULE_NAME)}</th>
                        </tr>
                        <tr>
                            <td class="fieldLabel medium">{vtranslate('Mobile Phone', $MODULE_NAME)}<span
                                        class="redColor">*</span></td>
                            <td class="fieldValue medium">
                                <input class="inputElement TwoStepField " name="user_name" value="{$USERMOBILE}"
                                       style="direction: ltr; text-align: left;{if !$USERMOBILE}background-color: #f2dede;border: 1px solid #a94442;{/if}"
                                       type="text" readonly>
                            </td>
                            <td class="fieldLabel medium">{vtranslate('Email', $MODULE_NAME)}<span
                                        class="redColor">*</span>
                            </td>
                            <td class="fieldValue medium">
                                <input class="inputElement TwoStepField" name="email1" value="{$USEREMAIL}"
                                       style="direction: ltr; text-align: left;{if !$USEREMAIL}background-color: #f2dede;border: 1px solid #a94442;{/if}"
                                       readonly>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <br/>
                    <form class="form-horizontal"
                          action='index.php?module=ParsTFA&parent=Settings&action=MySettings'
                          method='POST'>
                        <table class="table table-bordered marginLeftZero" style="width:99%; margin:0 auto;">
                            <tbody>
                            <tr class="listViewActionsDiv">
                                <th colspan="4">{vtranslate('Two Step Verification Settings', $MODULE_NAME)}</th>
                            </tr>
                            <tr>
                                <td class="fieldLabel medium"
                                    style="width:25%">{vtranslate('Status', $MODULE_NAME)}<span
                                            class="redColor">*</span></td>
                                <td class="fieldValue medium"
                                    {if $USERSTATUSVALUE eq '0'  || $BCODES eq '0'}colspan="3"
                                    style="width:75%" {else}style="width:25%"{/if}>
                                    <select class="select2 inputElement TwoStepField"
                                            name="TWO_STEP_STATUS">{$USERSTATUS}</select>
                                    <input name="user_id" value="{$RECORDID}" type="hidden">
                                    <input name="bcodes" value="{$BCODES}" type="hidden">
                                </td>{if $USERSTATUSVALUE eq '1' && $BCODES eq '1'}
                                <td class="fieldLabel medium" style="width:25%">
                                    {vtranslate('Backup Codes', $MODULE_NAME)}
                                </td>

                                <td class="fieldValue medium" style="width:25%;">
                                    <ul class="bcodes">
                                        {if $used_codes}{foreach item=used_code from=$used_codes}
                                            <li style="text-decoration: line-through; font-style: italic;">{$used_code}</li>
                                        {/foreach}{/if}
                                        {if $backup_codes}{foreach item=backup_code from=$backup_codes}
                                            <li style="font-weight: bold;">{$backup_code}</li>
                                        {/foreach}{/if}
                                    </ul>
                                    {if $generateon}{vtranslate('Generate on', $MODULE_NAME)} {$generateon}
                                        <br/>
                                    {/if}
                                    <center>
                                        <a onclick="window.location.href = 'index.php?module=ParsTFA&parent=Settings&action=GenerateCode&id={$RECORDID}';">
                                            <button class="btn btn-inverse" type="button"
                                                    style="margin: 0 5px;">
                                                <strong>{vtranslate('Generate New Codes', $MODULE_NAME)}</strong>
                                            </button>
                                        </a>
                                    </center>
                                    <br/></td>
                                {/if}
                            </tr>

                            {if $USERSTATUSVALUE eq '1' && $ALLOWAUTHENTICATOR eq '1'}
                                <tr>
                                    <td class="fieldLabel medium"
                                        style="width:25%">{vtranslate('Authenticator Software', $MODULE_NAME)}</td>
                                    <td class="fieldValue medium" {if $device && $secret}style="width:25%"
                                        {else}colspan="3"
                                        style="width:75%"{/if}>
                                        {if $secret}{$label = vtranslate('Active', $MODULE_NAME)}{$label2 = 'Disable'}{$class = 'danger'}{else}{$label = vtranslate('Inactive', $MODULE_NAME)}{$label2 = 'Enable'}{$class = 'success'}{/if}
                                        <span style="padding: 20px; font-weight: bold;">{$label}</span>
                                        <input name="NewSecret" id="NewSecret" value="{$NewSecret}"
                                               type="hidden">
                                        <input name="NEWURL" id="NEWURL" value="{$NEWURL}" type="hidden">
                                        <br/>
                                        <button id="btn-{$label2}" class="btn btn-{$class}" type="button"
                                                style="margin: 0 5px;{if $CHECKFORCE eq '1' && $secret}display:none;{/if}"
                                                {if $secret}onclick="javascript:window.location.assign('index.php?module=ParsTFA&parent=Settings&action=MySettings&id={$RECORDID}')"
                                                {else}onclick="javascript:Users_Detail_Js.triggerChangePassword('index.php?module=ParsTFA&view=TwoFactorAjax&mode=SetupTwoStep&recordId={$RECORDID}','Users');"{/if}>
                                            <strong>{vtranslate($label2, $MODULE_NAME)}</strong></button>
                                    </td>
                                    {if $device && $secret}
                                        <td class="fieldLabel medium" style="width:25%">
                                            {vtranslate('Device type', $MODULE_NAME)}
                                        </td>
                                        <td class="fieldValue medium" style="width:25%;">
                                            <img  src="layouts/v7/modules/ParsTFA/images/{$device}icon.png"
                                                 alt="{vtranslate($device, $MODULE_NAME)}"
                                                 title="{vtranslate($device, $MODULE_NAME)}"/><br/>
                                            <button class="btn btn-info" type="button" style="margin: 0 5px;"
                                                    onclick="javascript:Users_Detail_Js.triggerChangePassword('index.php?module=ParsTFA&view=TwoFactorAjax&mode=SetupTwoStep&recordId={$RECORDID}','Users');">
                                                <strong>{vtranslate('Change Device', $MODULE_NAME)}</strong>
                                            </button>
                                            <br/>
                                            {if $modifiedon}{vtranslate('Modified on', $MODULE_NAME)} {$modifiedon}
                                                <br/>
                                            {/if}
                                        </td>
                                    {/if}
                                </tr>
                            {/if}

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
                    {if $USERSTATUSVALUE eq '1' && $ALLOWAUTHENTICATOR eq '1'}
                    <div id="softlist" class="alert alert-block"
                         style=" margin:0 auto; height:200px; width:80%;">
                        <a class="icon-remove" data-dismiss="alert"
                           onclick="javascript:$(#softlist).hide();"></a>&nbsp;&nbsp;{vtranslate('2Step Autentication Software:', $MODULE)}
                        <br/><br/>
                        <div class="span6">
                            <a href="https://cafebazaar.ir/app/com.google.android.apps.authenticator2/?l=fa"
                               target="_blank"><img  src="layouts/v7/modules/ParsTFA/images/bazzar.png"></a>&nbsp;&nbsp;
                            <a href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2"
                               target="_blank"><img   src="layouts/v7/modules/ParsTFA/images/google-play.png"></a>&nbsp;&nbsp;
                            <a href="http://my.sibche.ir/app/details/id/6310/name/Google-Authenticator"
                               target="_blank"><img   src="layouts/v7/modules/ParsTFA/images/sibche.png"></a>&nbsp;&nbsp;
                            <a href="https://itunes.apple.com/en/app/google-authenticator/id388497605?mt=8"
                               target="_blank"><img  src="layouts/v7/modules/ParsTFA/images/appstore.png"></a>&nbsp;&nbsp;<br/>
                        </div>
                        <div class="span6">
                            <a href="https://appworld.blackberry.com/webstore/content/29401059" target="_blank"><img  src="layouts/v7/modules/ParsTFA/images/blackberry.png"></a>&nbsp;&nbsp;
                            <a href="https://www.microsoft.com/en-us/store/apps/authenticator/9wzdncrfj3rj"
                               target="_blank"><img  src="layouts/v7/modules/ParsTFA/images/windowsphone.png"></a>&nbsp;&nbsp;
                            <a href="https://chrome.google.com/webstore/detail/gauth-authenticator/ilgcnhelpchnceeipipijaljkblbcobl?hl=en"
                               target="_blank"><img  src="layouts/v7/modules/ParsTFA/images/ChromeWebStore.png"></a>&nbsp;&nbsp;
                            <a href="https://winauth.com/download/" target="_blank"><img  src="layouts/v7/modules/ParsTFA/images/windows.png"></a>&nbsp;&nbsp;
                        </div>
                        <div>
                        </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        jQuery(document).ready(function () {
            Vtiger_Index_Js.getInstance().registerEvents();
            if (jQuery('.recordImage').length !== 0) {
                var color = jQuery('.recordImage').css('background-color');
                if (color === "rgba(0, 0, 0, 0)") {
                    jQuery('.recordImage').css('background-color', app.helper.getRandomColor());
                }
            }
        });
    </script>
{/strip}
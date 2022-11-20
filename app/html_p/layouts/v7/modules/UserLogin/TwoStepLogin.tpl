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
    <!DOCTYPE html>
    <html>
    <head>
        <title>{$COMPANY_DETAILS.name}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- for Login page we are added -->
        <link href="libraries/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="libraries/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="libraries/bootstrap/css/jqueryBxslider.css" rel="stylesheet" />
        <link href="layouts/v7/modules/Settings/UserLogin/resources/UserLogin.css" rel="stylesheet" />
        <link href="layouts/v7/modules/UserLogin/resources/UserLogin.css" rel="stylesheet" />
        <style>

            .profile-img {
                width: 76px;
                height: 76px;
                margin: 0 auto;
                display: block;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
            }
            .profiledisplay {
                margin: 0 auto;
                width: 300px ;
                text-align: center;
            }
            .twostep_img {
                height: 80px;
                margin: -10px auto 10px;
                width: 100px;
                display:inline-block;
                white-space:nowrap;
            }
            #submitoption a {
                padding: 0 10px;
            }
            #trustDevice {
                display: inline-block;
                margin: 0 10px;
                cursor: pointer;
            }
            .login-box > .login-form {
                margin-top: 20px !important;
            }
            @media screen and (max-width: 580px) {
                .twostep_img {
                    height: 114px;
                    width: 137px;
                }
            }
        </style>
        {if vglobal('current_language') eq 'fa_ir'}
            {if file_exists("modules/ParsVT/resources/styles/fonts/fonts.php")}
                <link type='text/css' rel='stylesheet' href='modules/ParsVT/resources/styles/fonts/fonts.php?font=IRANSans'>
            {else}
                <link href="layouts/v7/modules/UserLogin/resources/UserLogin_rtl.css" rel="stylesheet"/>
            {/if}
            <style>
                @media (max-width: 1024px) {
                    .separatorDiv, .marketingDiv {
                        display: none !important;
                    }
                }

                * {
                    font-family: 'VtigerFont', IRANSans, Tahoma;
                }

                .vte-login-container * {
                    font-family: 'VtigerFont', IRANSans, Tahoma;
                }

                .site-info {
                    direction: rtl !important;
                }

                .rememberme * {
                    float: right;
                }
            </style>
        {/if}
        <script src="libraries/jquery/jquery.min.js"></script>
        <script src="libraries/jquery/boxslider/jqueryBxslider.js"></script>
        <script src="libraries/jquery/boxslider/respond.min.js"></script>
        <script>
            jQuery(document).ready(function(){
                scrollx = jQuery(window).outerWidth();
                window.scrollTo(scrollx,0);
                slider = jQuery('.bxslider').bxSlider({
                    mode: '$USER_LOGIN_CUSTOM_SLIDE_TYPE$',
                    auto: true,
                    randomStart : false,
                    autoHover: false,
                    controls: false,
                    pager: false,
                    speed: '$USER_LOGIN_CUSTOM_SLIDE_SPEED$',
                    easing: '$USER_LOGIN_CUSTOM_SLIDE_EASING$',
                    onSliderLoad: function() {

                    }
                });
            });
        </script>
    </head>
    <body>
    <div class="vte-login-container">
        <div class="logo">
            <img src="$USER_LOGIN_CUSTOM_LOGO$" />
        </div>
        <div style="margin-left: -10px">
            <div class="col-lg-6 col-md-6 col-sm-6 slideshow">
                <div class="carousal-container">
                    <ul class="bxslider">
                        $USER_LOGIN_CUSTOM_SLIDE_IMAGES$
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 login-area">

                <div class="col-lg-12 col-md-12 col-sm-12 site-info">
                    <h1 class="login-header">$USER_LOGIN_CUSTOM_HEADER$</h1>
                    <p>$USER_LOGIN_CUSTOM_DESCRIPTION$</p>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 login-box" id="loginDiv">
                    <div class="loginDiv widgetHeight">
                        <img id="profile-img" class="profile-img" src="{$IMGURL}" alt="">
                        <div style="margin: 0 auto 10px; width:96px; text-align:center;font-weight:bold">{$AUTHUSERNAME}</div>
                        <div class="profiledisplay">
                            <img class="twostep_img" src="layouts/v7/modules/ParsTFA/images/authenticator.png" alt="">
                            <img class="twostep_img" src="layouts/v7/modules/ParsTFA/images/email.png" alt="">
                            <img class="twostep_img" src="layouts/v7/modules/ParsTFA/images/sms.png" alt="">
                        </div>
                    </div>

                     <div class="{if !$smarty.request.status}hide{/if} failureMessage" id="validationMessage">
                        {if isset($smarty.request.status) && $smarty.request.status eq 'SOK'}
                            {sprintf(vtranslate('SMS send to %s. please check your mobile phone.',$MODULE),$USERMOBILE)}
                        {else if isset($smarty.request.status) && $smarty.request.status eq 'MOK'}
                            {sprintf(vtranslate('Mail was send to %s. please check your inbox.',$MODULE),$USEREMAIL)}
                        {else if isset($smarty.request.status) && $smarty.request.status eq 'MERR'}
                            {vtranslate('Outgoing mail server was not configured.',$MODULE)}
                        {else if isset($smarty.request.status) && $smarty.request.status eq 'CERR'}
                            {vtranslate('Please enter correct code',$MODULE)}
                        {/if}
                    </div>
                        <form class="form-horizontal login-form" id="challenge" action="index.php">
                            <input type="hidden" name="module" value="ParsTFA"/>
                            <input type="hidden" name="view" value="StepTwo"/>
                            <input type="hidden" name="parent" value="Settings"/>
                            <input type="hidden" name="action" value="StepTwo"/>
                            <input name="challengeID" value="{$USERID}" type="hidden">
                            <input name="challengeName" value="{$USERNAME}" type="hidden">

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 username">
                                    <input pattern="[0-9 ]*" id="totpPin" name="Pin" dir="ltr" autocomplete="off"
                                           placeholder="{vtranslate('Enter Security Code',$MODULE)}" autofocus=""
                                           class="Xxfqnf" type="tel">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 rememberme">
                                    <input name="TrustDevice" id="trustDevice" checked="checked" type="checkbox"
                                           value="1">
                                    <span>{str_replace("30",$TWO_STEP_DURATION,vtranslate('Remember This Computer for 30 Days?',$MODULE))}</span>
                                </div>
                            </div>
                            <div class="row control-group signin-button pull-right">
                                <div class="col-lg-12 col-md-12 col-sm-12" id="submitoption">
                                    {if $ALLOWEMAIL}<a href="index.php?module=ParsTFA&parent=Settings&view=StepTwo&Service=mail">{vtranslate('Send Code via Email',$MODULE)}</a>{/if}{if $ALLOWEMAIL && $ALLOWSMS}&nbsp;&nbsp;|{/if}
                                    {if $ALLOWSMS}<a href="index.php?module=ParsTFA&parent=Settings&view=StepTwo&Service=sms">{vtranslate('Send Code via SMS',$MODULE)}</a>{/if}
                                    | <a href="index.php?module=ParsTFA&parent=Settings&view=StepTwo&ChangeUser={$USERID}">{vtranslate('Try sign in with another user',$MODULE)}</a>
                                    <button type="submit" class="btn btn-primary sbutton">{vtranslate('Sign in', $MODULE)}</button>
                                </div>
                            </div>
                    </form>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 login-more-info vte-user-login">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 social">
                            $USER_LOGIN_CUSTOM_SOCIAL_ICONS$
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 copy-right">
                            <small>$USER_LOGIN_CUSTOM_COPYRIGHT$</small>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    </body>
    </html>
{/strip}

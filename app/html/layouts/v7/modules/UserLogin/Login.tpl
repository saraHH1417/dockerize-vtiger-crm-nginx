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
                    <form class="form-horizontal login-form" action="index.php?module=Users&action=Login" method="POST">
                        {if isset($smarty.request.error)}
                            <div class="row alert alert-error">
				<p>{vtranslate('Invalid username or password.')}</p>
                            </div>
                        {/if}
			{if isset($smarty.request.error) && $smarty.request.error eq 2}
			<div class="row alert alert-error">
				<p>{vtranslate('Too many failed login attempts.')}</p>
			</div>
			{/if}
                        {if isset($smarty.request.fpError)}
                            <div class="row alert alert-error">
	                	<p>{vtranslate('Invalid Username or Email address.')}</p>
                            </div>
                        {/if}
                        {if isset($smarty.request.status)}
                            <div class="row alert alert-success">
                                <p>{vtranslate('Mail has been sent to your inbox, please check your e-mail.')}</p>
                            </div>
                        {/if}
                        {if isset($smarty.request.statusError)}
                            <div class="row alert alert-error">
				<p>{vtranslate('Outgoing mail server was not configured.')}</p>
                            </div>
                        {/if}
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 username">
                                <input type="text" id="username" name="username" placeholder="{vtranslate('User name')}" value="">
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 password">
                                <input type="password" id="password" name="password" placeholder="{vtranslate('Password')}" value="">
                            </div>
                        </div>
                        <div class="row control-group signin-button pull-right">
                            <div class="col-lg-12 col-md-12 col-sm-12" id="forgotPassword">
                                <a>{vtranslate('Forgot Password ?')}</a>&nbsp;&nbsp;&nbsp;
                                <button type="submit" class="btn btn-primary sbutton">{vtranslate('Sign in')}</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-lg-12 col-md-12 col-sm-12 login-box hide" id="forgotPasswordDiv">
                    <form class="form-horizontal login-form" action="forgotPassword.php" method="POST">
                        <div class="row">
                            <h3 class="forgot-password">{vtranslate('Forgot Password')}</h3>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 username">
                                <input type="text" id="user_name" name="user_name" placeholder="{vtranslate('Username')}">
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 password">
                                <input type="text" id="emailId" name="emailId"  placeholder="{vtranslate('Email')}">
                            </div>
                        </div>
                        <div class="row control-group signin-button">
                            <div class="" id="backButton">
                                <input type="button" class="btn btn-back sbutton pull-left" value="{vtranslate('Back')}">
                                <input type="submit" class="btn btn-primary sbutton pull-right" value="{vtranslate('Submit')}" name="retrievePassword">
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
    <script>
        jQuery(document).ready(function(){
            jQuery("#forgotPassword a").click(function() {
                jQuery("#loginDiv").addClass('hide');
                jQuery("#forgotPasswordDiv").removeClass('hide');
            });

            jQuery("#backButton .btn-back").click(function() {
                jQuery("#loginDiv").removeClass('hide');
                jQuery("#forgotPasswordDiv").addClass('hide');
            });

            jQuery("input[name='retrievePassword']").click(function (){
                var username = jQuery('#user_name').val();
                var email = jQuery('#emailId').val();

                var email1 = email.replace(/^\s+/,'').replace(/\s+$/,'');
                var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
                var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;

                if(username == ''){
	          alert('{vtranslate('Please enter valid username')}');
                    return false;
                } else if(!emailFilter.test(email1) || email == ''){
		   alert('{vtranslate('Please enater valid email address')}');
                    return false;
                } else if(email.match(illegalChars)){
	           alert( "{vtranslate('The email address contains illegal characters.')}");
                    return false;
                } else {
                    return true;
                }

            });
        });
    </script>
    </html>
{/strip}

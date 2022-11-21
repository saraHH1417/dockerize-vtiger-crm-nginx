{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
{strip}
{if $smarty.cookies.LoginStyle != ''}{$bodystyle= $smarty.cookies.LoginStyle}{else}{$bodystyle= 'theme-8'}{/if}
    <!doctype html>
    <html>
    <head>
        <title>{vtranslate('Pars vTiger')} - {vtranslate('2-Step Verification')}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        {* Bootstrap *}
        <link rel="stylesheet" href="libraries/parsvtiger/login/login5/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="libraries/parsvtiger/login/login5/bootstrap/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="libraries/parsvtiger/login/login5/css/override.css" />
    </head>
    <body class="{$bodystyle}">

<section id="style-switcher">
  <h2>Theme options <a href="#" class="switcher-link"></a></h2>
  <div>
    <h3>choose color</h3><br />
    <ul class="colors" id="color1">
{for $foo=1 to 27}
      <li><a href="#" class="theme-{$foo}" data="changetheme" title="theme-{$foo}"></a></li>
{/for}
    </ul>
  </div>
</section>
<script>
$('a[data]').on('click',function(){
	var loginstyle = $(this).attr('class');
        $('body').attr('class',loginstyle);
        $.cookie('LoginStyle', loginstyle);
})
</script>
    <div class="container-fluid login-container">
        <div class="row">
            <div class="col-md-3">
                <div class="logo">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-push-4">


                <form class="form-horizontal login-form"  action="index.php?module=Users&action=StepTwo" method="post" id="loginDiv">
                  <input name="challengeID" value="{$USERID}" type="hidden">
                  <input name="challengeName" value="{$USERNAME}" type="hidden">
                    <div style="text-align:center">
                    <img id="profile-img" class="profile-img" src="{$IMGURL}" alt=""><div style="margin: 0 auto 10px; width:96px; text-align:center">{$AUTHUSERNAME}</div></div>


                    {if isset($smarty.request.status) && $smarty.request.status eq 'SOK'}
                        <div class="alert alert-success" style="direction:rtl; font-family:tahoma;">
                            <p style="direction:rtl; font-family:tahoma;">{sprintf(vtranslate('SMS send to %s. please check your mobile phone.','Users'),$USERMOBILE)}</p>
                        </div>
                    {/if}
                    {if isset($smarty.request.status) && $smarty.request.status eq 'MOK'}
                        <div class="alert alert-success" style="direction:rtl; font-family:tahoma;">
                            <p style="direction:rtl; font-family:tahoma;">{sprintf(vtranslate('Mail was send to %s. please check your inbox.','Users'),$USEREMAIL)}</p>
                        </div>
                    {/if}
                    {if isset($smarty.request.status) && $smarty.request.status eq 'MERR'}
                        <div class="alert alert-error" style="direction:rtl; font-family:tahoma;">
                            <p style="direction:rtl; font-family:tahoma;">{vtranslate('Outgoing mail server was not configured.','Users')}</p>
                        </div>
                    {/if}
                    {if isset($smarty.request.status) && $smarty.request.status eq 'CERR'}
                        <div class="alert alert-error" style="direction:rtl; font-family:tahoma;">
                            <p style="direction:rtl; font-family:tahoma;">{vtranslate('Please enter correct code','Users')}</p>
                        </div>
                    {/if}
                    <div>
                        <input  pattern="[0-9 ]*" id="totpPin" name="Pin" dir="ltr" autocomplete="off"  autofocus=""  type="text"  placeholder="{vtranslate('Enter Security Code','Users')}">
                    </div>
                    <div>
                       <input name="TrustDevice" id="trustDevice" class="aCOJmf" checked="checked" type="checkbox" value="1">
                        <span>{vtranslate('Remember This Computer for 30 Days?','Users')}</span><br /><br />
                     {if $ALLOWEMAIL}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=mail">{vtranslate('Send Code via Email','Users')}</a>{/if}{if $ALLOWEMAIL && $ALLOWSMS}&nbsp;&nbsp;|
                     &nbsp;&nbsp;{/if}{if $ALLOWSMS}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=sms">{vtranslate('Send Code via SMS','Users')}</a>{/if}<br />
                     <br /><a href="index.php?module=Users&parent=Settings&view=StepTwo&ChangeUser={$USERID}">{vtranslate('Try sign in with another user','Users')}</a>

                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-primary main-button signin-btn">{vtranslate('Sign in')}</button>
                        </div>
                    </div>

                    <div class="login-subscript">
                        <small> {vtranslate('POWEREDBY')} {$VTIGER_VERSION}
                                {if $ParsvtMobile}
				&nbsp;|&nbsp;
				<a href="index.php?Mode={base64_encode('MobileView')}" target="_self">{vtranslate('Mobile Site')}</a>{/if}</small>
                    </div>
                </form>


            </div>
        </div>
    </div>
    {*<script type="text/javascript" src="libraries/parsvtiger/login/login5/js/placeholders.min.js"></script>*}
    <script type="text/javascript" src="libraries/parsvtiger/login/login5/js/login.js"></script>
    <script type="text/javascript" src="libraries/parsvtiger/login/login5/js/jquery.cookie.js"></script>
    </body>
    </html>
{/strip}
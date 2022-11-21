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
        <title>{vtranslate('Pars vTiger')} - {vtranslate('login page')}</title>
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


                <form class="form-horizontal login-form" action="index.php?module=Users&action=Login" method="POST" id="loginDiv">
                    <div style="text-align:center">
                    <img src="libraries/parsvtiger/login/login5/logo.png">
                    <br />
                    <a target="_blank" href="http://{$COMPANY_DETAILSCOMPANY_DETAILS.website}">{$COMPANY_DETAILS.name}</a></div>
                    {if isset($smarty.request.error) && $smarty.request.error eq 1}
                        <div class="alert alert-error">
                            <p>{vtranslate('Invalid username or password.',$MODULE)}</p>
                        </div>
                    {/if}
                    {if isset($smarty.request.error) && $smarty.request.error eq 2}
                        <div class="alert alert-error">
                            <p>{vtranslate('Too many failed login attempts.')}</p>
                        </div>
                    {/if}

                    {if isset($smarty.request.fpError)}
                        <div class="alert alert-error">
                            <p>{vtranslate('Invalid Username or Email address.',$MODULE)}</p>
                        </div>
                    {/if}
                    {if isset($smarty.request.status)}
                        <div class="alert alert-success">
                            <p>{vtranslate('Mail was send to your inbox. please check your e-mail.',$MODULE)}</p>
                        </div>
                    {/if}
                    {if isset($smarty.request.statusError)}
                        <div class="alert alert-error">
                            <p>{vtranslate('Outgoing mail server was not configured.',$MODULE)}</p>
                        </div>
                    {/if}
                    <div>
                        <input type="text" id="username" name="username" placeholder="{vtranslate('Username')}">
                    </div>
                    <div>
                        <input type="password" id="password" name="password" placeholder="{vtranslate('Password')}">
                    </div>

                    <div class="row" id="forgotPassword">
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-primary main-button signin-btn">{vtranslate('Sign in')}</button>
                        </div>
                        <div class="col-md-6"><a class="btn-forgot pull-right">{vtranslate('Forgot Password ?')}</a></div>
                    </div>

                    <div class="login-subscript">
                        <small> {vtranslate('POWEREDBY')} {$VTIGER_VERSION}
                                {if $ParsvtMobile}
				&nbsp;|&nbsp;
				<a href="index.php?Mode={base64_encode('MobileView')}" target="_self">{vtranslate('Mobile Site')}</a>{/if}</small>
                    </div>
                </form>


                <div class="hide" id="forgotPasswordDiv">
                    <form class="form-horizontal login-form" action="forgotPassword.php" method="POST">
                        <div>
                            <input type="text" id="user_name" name="user_name" placeholder="{vtranslate('Username')}" />
                        </div>
                        <div>
                            <input type="text" id="emailId" name="emailId"  placeholder="{vtranslate('Email')}" />
                        </div>
                        <div class="row signin-button">
                            <div class="col-md-6">
                                <input type="submit" class="btn btn-primary main-button retrieveButton" value="{vtranslate('Submit')}" name="retrievePassword">
                            </div>
                            <div class="col-md-6">
                                <a class="btn back-button">{vtranslate('Back')}</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    {*<script type="text/javascript" src="libraries/parsvtiger/login/login5/js/placeholders.min.js"></script>*}
    <script type="text/javascript" src="libraries/parsvtiger/login/login5/js/login.js"></script>
    <script type="text/javascript" src="libraries/parsvtiger/login/login5/js/jquery.cookie.js"></script>
    </body>
    </html>
{/strip}
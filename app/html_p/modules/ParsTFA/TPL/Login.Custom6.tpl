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
<!DOCTYPE html>
<html>
	<head>
		<title>{vtranslate('Pars vTiger')} - {vtranslate('login page')}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- for Login page we are added -->
		<link href="libraries/parsvtiger/login/login6/login6.css" rel="stylesheet">
	</head>
	<body dir="rtl" onkeypress="onBodyKeyPress(event);" class="bg-gray">
{strip}
{assign var="CompanyDetails" value=getCompanyDetails()}
{assign var="MODULE" value='Users'}




    <div class="content">
        <div style="height: 610px;" id="large-header" class="large-header">
            <canvas height="610" width="1360" id="demo-canvas"></canvas>
        </div>
    </div>
    <section>
            <div class="login-title">
            
               {vtranslate('Login to ParsvTiger CRM')}
            </div>
            
    <div class="login-box">
        <div class="loginlogo">
           <img title="{$CompanyDetails['companyname']}" src="test/logo/{$CompanyDetails['logoname']}">
        </div>
        <div>
	
            <form class="form-horizontal row-fluid login-form" style="margin:0;" action="index.php?module=Users&action=Login" method="POST">
            <div class="isclub-login" id="loginDiv">
                <div style="color:Red; margin:10px 0; text-align:center">
						{if isset($smarty.request.error) && $smarty.request.error eq 1}
								<span>{vtranslate('Invalid username or password.')}</span>
						{/if}
						{if isset($smarty.request.error) && $smarty.request.error eq 2}
								<span>{vtranslate('Too many failed login attempts.')}</span>
						{/if}
						{if isset($smarty.request.fpError)}
								<span>{vtranslate('Invalid Username or Email address.',$MODULE)}</span>
						{/if}
						{if isset($smarty.request.status)}
								<span>{vtranslate('Mail was send to your inbox. please check your e-mail.',$MODULE)}</span>
						{/if}
						{if isset($smarty.request.statusError)}
								<span>{vtranslate('Outgoing mail server was not configured.',$MODULE)}</span>
						{/if}
                </div>
                <div class="clr">
                </div>
                <div style="height: 50px">
                    <span class="input input--makiko">
                        <input  type="text" id="username" name="username"  class="input__field input__field--makiko" enableembeddedskins="false">
                        <label class="input__label input__label--makiko user" for="input-16">
                            <span class="input__label-content input__label-content--makiko">
                                {vtranslate('LBL_USER',$MODULE)}
                            </span>
                        </label>
                    </span>
                </div>

                <div style="height: 50px">
                    <span class="input input--makiko">
                        <input  id="password" name="password"  class="input__field input__field--makiko" type="password">
                        <label class="input__label input__label--makiko pwd">
                            <span class="input__label-content input__label-content--makiko">
                               {vtranslate('Password',$MODULE)}
                            </span>
                        </label>
                    </span>
                </div>
                <a class="linkformat" href="#" id="forgotpass" >{vtranslate('Forgot Password ?')}</a>

                
                <br />
                <input value="{vtranslate('Sign in')}" class="btn-login" type="submit">
                <div class="clr">
                </div>
                <span id="ctl00_ctl00_C_C_FailureText" style="color:Red;"></span>
            </div>
        
</div>
        </form>




            <form class="form-horizontal row-fluid login-form" style="margin:0;" action="forgotPassword.php" method="POST">
            <div class="isclub-login hide"  id="forgotPasswordDiv">
                <div style="color:Red; margin:10px 0; text-align:center">
						{if isset($smarty.request.error) && $smarty.request.error eq 1}
								<span>{vtranslate('Invalid username or password.')}</span>
						{/if}
						{if isset($smarty.request.error) && $smarty.request.error eq 2}
								<span>{vtranslate('Too many failed login attempts.')}</span>
						{/if}
						{if isset($smarty.request.fpError)}
								<span>{vtranslate('Invalid Username or Email address.',$MODULE)}</span>
						{/if}
						{if isset($smarty.request.status)}
								<span>{vtranslate('Mail has been sent to your inbox, please check your e-mail.',$MODULE)}</span>
						{/if}
						{if isset($smarty.request.statusError)}
								<span>{vtranslate('Outgoing mail server was not configured.',$MODULE)}</span>
						{/if}
                </div>
                <div class="clr">
                </div>
                <div style="height: 50px">
                    <span class="input input--makiko">
                        <input  type="text" id="username" name="user_name"  class="input__field input__field--makiko" enableembeddedskins="false">
                        <label class="input__label input__label--makiko user" for="input-16">
                            <span class="input__label-content input__label-content--makiko">
                                {vtranslate('LBL_USER',$MODULE)}
                            </span>
                        </label>
                    </span>
                </div>

                <div style="height: 50px">
                    <span class="input input--makiko">
                        <input  id="password" name="emailId"  class="input__field input__field--makiko" type="text">
                        <label class="input__label input__label--makiko fpwd">
                            <span class="input__label-content input__label-content--makiko">
                               {vtranslate('Email')}
                            </span>
                        </label>
                    </span>
                </div>
                <a class="linkformat" href="#" id="backButton" >{vtranslate('Login to ParsvTiger CRM')}</a>

                
                <br />
                <input value="{vtranslate('Submit')}" class="btn-login" type="submit">
                <div class="clr">
                </div>
                <span id="ctl00_ctl00_C_C_FailureText" style="color:Red;"></span>
            </div>
        
</div>
        </form>
        

        <div class="clr">
        </div>
    </div>

    <div class="clr">
    </div>

    </section>
    <div class="clr"></div>

	<div class="login-cr" style="width:100%;height:20px;display:block;position:fixed;bottom:0;right:0;z-index:1000;text-align:center;font-size:11px;font-family:tahoma"><small><span style="opacity: 1;">{vtranslate('POWEREDBY')} {$VTIGER_VERSION} &nbsp;
				{if $smarty.cookies.ParsvtCalenderType == 'jalali'}&copy; 1388 - {jdate('Y')}&nbsp&nbsp;
                                {elseif $smarty.cookies.ParsvtCalenderType == 'islamic'}&copy; 1424 - {adate('Y')}&nbsp&nbsp;
                                {else}&copy; 2004 - {date('Y')}&nbsp&nbsp;{/if}
                                {if $ParsvtMobile}
				&nbsp;|&nbsp;
				<a href="index.php?Mode={base64_encode('MobileView')}" target="_self">{vtranslate('Mobile Site')}</a>{/if}
				&nbsp;|&nbsp;
				<a href="http://www.parsvtiger.com" target="_blank">{vtranslate('Pars vTiger')}</a></span></small></div>


	<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>
    <script src="libraries/parsvtiger/login/login6/js/EasePack.js" type="text/javascript"></script>
    <script src="libraries/parsvtiger/login/login6/js/TweenLite.js" type="text/javascript"></script>
    <script src="libraries/parsvtiger/login/login6/js/Login.js" type="text/javascript"></script>
	
<script>
	jQuery(document).ready(function(){
		jQuery("button.close").click(function() {
			jQuery(".visible-phone").hide();
		});
		jQuery("a#forgotpass").click(function() {
			jQuery("#loginDiv").hide();
			jQuery("#forgotPasswordDiv").show();
		});
		
		jQuery("a#backButton").click(function() {
			jQuery("#loginDiv").show();
			jQuery("#forgotPasswordDiv").hide();
		});
		
		jQuery("input[name='retrievePassword']").click(function (){
			var username = jQuery('#user_name').val();
			var email = jQuery('#emailId').val();
			var email1 = email.replace(/^\s+/,'').replace(/\s+$/,'');
			var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
			var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;
			
			if(username == ''){
				alert('Please enter valid username');
				return false;
			} else if(!emailFilter.test(email1) || email == ''){
				alert('Please enater valid email address');
				return false;
			} else if(email.match(illegalChars)){
				alert( "The email address contains illegal characters.");
				return false;
			} else {
				return true;
			}
		});
	});
</script>
{/strip}
	</body>
	<script>
		jQuery(document).ready(function(){
			jQuery("#forgotPassword a").click(function() {
				jQuery("#loginDiv").hide();
				jQuery("#forgotPasswordDiv").show();
			});
			
			jQuery("#backButton a").click(function() {
				jQuery("#loginDiv").show();
				jQuery("#forgotPasswordDiv").hide();
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

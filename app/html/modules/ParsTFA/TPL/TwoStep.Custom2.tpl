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
{if !isset($smarty.cookies.LoginTheme)}{php}setcookie("LoginTheme", "parsvtiger2");$_COOKIE['LoginTheme'] = 'parsvtiger2'; echo "<script>location.reload();</script>";{/php}{/if}
<!DOCTYPE html>
<html>
	<head>
		<title>{vtranslate('Pars vTiger')} - {vtranslate('2-Step Verification')}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- for Login page we are added -->
		<link href="libraries/parsvtiger/login/login2/login2.css" rel="stylesheet">
	</head>
	<body>
<style>
#login-area .bg-div{ 
background: url(libraries/parsvtiger/login/login2/bg.png?{uniqid()}) no-repeat;
}
@media (min-width: 768px) { .visible-phone{ display: none;} }
@media (max-width: 767px) { .visible-phone{ display: block;}  }
</style>
{strip}
{assign var="CompanyDetails" value=getCompanyDetails()}
{assign var="MODULE" value='Users'}
<div class="login_page login_blue">
	<div class="container-fluid login-container">
		<div id="login-area" class="login-area">
			<div class="visible-phone">
				<div class="alert alert-block">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>{vtranslate('LBL_MOBILE_VERSION_TITLE',$MODULE)}</h4>
					{vtranslate('LBL_MOBILE_VERSION_DESC',$MODULE)}
					<a class="btn btn-primary" href="modules/Mobile/">{vtranslate('LBL_MOBILE_VERSION_BUTTON',$MODULE)}</a>

				</div>
			</div>		
			<div class="logo">
				<img title="{$CompanyDetails['companyname']}" src="libraries/parsvtiger/login/login2/logo_parsvtiger.png">
			</div>
			<div class="forgotPassword hide">
				<h4>{vtranslate('Recover password',$MODULE)}:</h4>
			</div>
			<div class="login-box bg-div" id="loginDiv">
				<div class="login-form-content">
					<form class="form-horizontal row-fluid login-form" style="margin:0;" action="index.php?module=Users&action=StepTwo" method="post">
                                                                                                            <input name="challengeID" value="{$USERID}" type="hidden">
                                                                                                            <input name="challengeName" value="{$USERNAME}" type="hidden">
						<div class="span9 main-panel">
							<div class="username">
								<img title="{vtranslate('LBL_USER',$MODULE)}" src="libraries/parsvtiger/login/login2/login.png?{uniqid()}">
								<input type="text" id="username" name="username"  placeholder="{$AUTHUSERNAME}" disabled>
							</div>
							<div class="password">
								<img title="{vtranslate('Password',$MODULE)}" src="libraries/parsvtiger/login/login2/pass.png?{uniqid()}">
								<input id="password" type="tel"  pattern="[0-9 ]*" id="totpPin" name="Pin" dir="ltr" autocomplete="off"  autofocus="" placeholder="{vtranslate('Enter Security Code',$MODULE)}">
							</div>
						</div>
						<div class="span3 main-panel">
							<button type="submit" style="background: url(libraries/parsvtiger/login/login2/button.png?{uniqid()}) no-repeat;" class="btn btn-primary sbutton">Sign in</button>
						</div>
	{* Retain this tracker to help us get usage details *}

					</form>
				</div>	<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>

				<div class="row-fluid">
					<div class="forgotpass">
						<div class="">
                       <input name="TrustDevice" id="trustDevice" class="aCOJmf" checked="checked" type="checkbox" value="1">
                        <span>{vtranslate('Remember This Computer for 30 Days?','Users')}</span><br />
                     {if $ALLOWEMAIL}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=mail">{vtranslate('Send Code via Email','Users')}</a>{/if}{if $ALLOWEMAIL && $ALLOWSMS}&nbsp;&nbsp;|
                     &nbsp;&nbsp;{/if}{if $ALLOWSMS}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=sms">{vtranslate('Send Code via SMS','Users')}</a>{/if}<br />
                     <a href="index.php?module=Users&parent=Settings&view=StepTwo&ChangeUser={$USERID}">{vtranslate('Try sign in with another user','Users')}</a>
						</div>
					</div>
					<div class="span12 nomargin">

											                    {if isset($smarty.request.status) && $smarty.request.status eq 'SOK'}
											                        <div class="alert alert-success" style="direction:rtl; font-family:tahoma;">
											                            <p style="direction:rtl; font-family:tahoma; text-align: center;">{sprintf(vtranslate('SMS send to %s. please check your mobile phone.','Users'),$USERMOBILE)}</p>
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'MOK'}
											                        <div class="alert alert-success" style="direction:rtl; font-family:tahoma;">
											                            <p style="direction:rtl; font-family:tahoma; text-align: center;">{sprintf(vtranslate('Mail was send to %s. please check your inbox.','Users'),$USEREMAIL)}</p>
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'MERR'}
											                        <div class="alert alert-error" style="direction:rtl; font-family:tahoma;">
											                            <p style="direction:rtl; font-family:tahoma; text-align: center;">{vtranslate('Outgoing mail server was not configured.','Users')}</p>
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'CERR'}
											                        <div class="alert alert-error" style="direction:rtl; font-family:tahoma;">
											                            <p style="direction:rtl; font-family:tahoma; text-align: center;">{vtranslate('Please enter correct code','Users')}</p>
											                        </div>
											                    {/if}

					</div>
				</div>
			</div>
	</div>
</div>

	<div style="width:100%;height:20px;display:block;position:fixed;bottom:0;right:0;z-index:1000;text-align:center;font-size:11px;font-family:tahoma"><small><span style="opacity: 1;">{vtranslate('POWEREDBY')} {$VTIGER_VERSION} &nbsp;
				{if $smarty.cookies.ParsvtCalenderType == 'jalali'}&copy; 1388 - {jdate('Y')}&nbsp&nbsp;
                                {elseif $smarty.cookies.ParsvtCalenderType == 'islamic'}&copy; 1424 - {adate('Y')}&nbsp&nbsp;
                                {else}&copy; 2004 - {date('Y')}&nbsp&nbsp;{/if}
                                {if $ParsvtMobile}
				&nbsp;|&nbsp;
				<a href="index.php?Mode={base64_encode('MobileView')}" target="_self">{vtranslate('Mobile Site')}</a>{/if}
				&nbsp;|&nbsp;
				<a href="http://www.parsvtiger.com" target="_blank">{vtranslate('Pars vTiger')}</a></span></small></div>	
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

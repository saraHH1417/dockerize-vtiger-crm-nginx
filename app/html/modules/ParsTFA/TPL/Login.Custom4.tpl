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
		<link href="libraries/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="libraries/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
		<link href="libraries/bootstrap/css/jquery.bxslider.css" rel="stylesheet" />
		<script src="libraries/jquery/jquery.min.js"></script>
		<script src="libraries/jquery/boxslider/jquery.bxslider.js"></script>
		<script src="libraries/jquery/boxslider/jquery.bxslider.min.js"></script>
		<script src="libraries/jquery/boxslider/respond.min.js"></script>
		<script>
			jQuery(document).ready(function(){
				scrollx = jQuery(window).outerWidth();
				window.scrollTo(scrollx,0);
				slider = jQuery('.bxslider').bxSlider({
				auto: true,
				pause: 4000,
				randomStart : true,
				autoHover: true
			});
			jQuery('.bx-prev, .bx-next, .bx-pager-item').live('click',function(){ slider.startAuto(); });
			}); 
		</script>
		<link href="libraries/parsvtiger/login/login4/style.css" rel="stylesheet">

	</head>
	<body>
		<div class="container-fluid login-container">
			<div class="row-fluid">
				<div class="span3">
					<div class="logo">{*<img src="layouts/vlayout/skins/images/logo.png">*}
					<br />
					<a target="_blank" href="http://{$COMPANY_DETAILSCOMPANY_DETAILS.website}">{$COMPANY_DETAILS.name}</a>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="content-wrapper">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<div style='direction:rtl'>
										<div class="login-box" id="loginDiv">
											<div class="">
												<h3 class="login-header">{vtranslate('Login to ParsvTiger CRM')}</h3>
											</div>
											<form class="form-horizontal login-form" style="margin:0;" action="index.php?module=Users&action=Login" method="POST">

												{if  isset($smarty.request.error) && $smarty.request.error eq 1}
													<div class="alert alert-error">
														<p>{vtranslate('Invalid username or password.')}</p>
													</div>
												{/if}
												{if  isset($smarty.request.error) && $smarty.request.error eq 2}
													<div class="alert alert-error">
														<p>{vtranslate('Too many failed login attempts.')}</p>
													</div>
												{/if}


												{if isset($smarty.request.fpError)}
													<div class="alert alert-error">
														<p>{vtranslate('Invalid Username or Email address.')}</p>
													</div>
												{/if}
												{if isset($smarty.request.status)}
													<div class="alert alert-success">
														<p>{vtranslate('Mail was send to your inbox. please check your e-mail.')}</p>
													</div>
												{/if}
												{if isset($smarty.request.statusError)}
													<div class="alert alert-error">
														<p>{vtranslate('Outgoing mail server was not configured.')}</p>
													</div>
												{/if}
												<div class="control-group">
													<label class="control-label" for="username"><b>{vtranslate('User name')}</b></label>
													<div class="controls">
														<input type="text" id="username" name="username" placeholder="{vtranslate('Username')}">
													</div>
												</div>

			<div class="control-group">
													<label class="control-label" for="password"><b>{vtranslate('Password')}</b></label>
				<div class="controls">
														<input type="password" id="password" name="password" placeholder="{vtranslate('Password')}">
													</div>
												</div>
												<div class="control-group signin-button">
													<div class="controls" id="forgotPassword">
														<button type="submit" class="btn btn-primary sbutton">{vtranslate('Sign in')}</button><br/><br/>
														&nbsp;&nbsp;&nbsp;<a>{vtranslate('Forgot Password ?')}</a>
													</div>
												</div>
	{* Retain this tracker to help us get usage details *}
	<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>
											</form>
										</div>
										
										<div class="login-box hide" id="forgotPasswordDiv">
											<form class="form-horizontal login-form" style="margin:0;" action="forgotPassword.php" method="POST">
												<div class="">
												<h3 class="login-header">{vtranslate('Forgot Password')}</h3>
												</div>
			<div class="control-group">
													<label class="control-label" for="user_name"><b>{vtranslate('User name')}</b></label>
				<div class="controls">
														<input type="text" id="user_name" name="user_name" placeholder="{vtranslate('Username')}">
				</div>
			</div>
												<div class="control-group">
													<label class="control-label" for="email"><b>{vtranslate('Email')}</b></label>
													<div class="controls">
														<input type="text" id="emailId" name="emailId"  placeholder="{vtranslate('Email')}">
													</div>
		</div>
												<div class="control-group signin-button">
													<div class="controls" id="backButton">
														<input type="submit" class="btn btn-primary sbutton" value="{vtranslate('Submit')}" name="retrievePassword">
														&nbsp;&nbsp;&nbsp;<a id="backButton">{vtranslate('Back')}</a>
													</div>
												</div>
											</form>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-fixed-bottom">
			<div class="navbar-inner">
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span6 pull-left" >
							<div class="footer-content">
						
		<small>{vtranslate('POWEREDBY')} {$VTIGER_VERSION} &nbsp;
				{if $smarty.cookies.ParsvtCalenderType == 'jalali'}&copy; 1388 - {jdate('Y')}&nbsp&nbsp;
                                {elseif $smarty.cookies.ParsvtCalenderType == 'islamic'}&copy; 1424 - {adate('Y')}&nbsp&nbsp;
                                {else}&copy; 2004 - {date('Y')}&nbsp&nbsp;{/if}
                                {if $ParsvtMobile}
				&nbsp;|&nbsp;
				<a href="index.php?Mode={base64_encode('MobileView')}" target="_self">{vtranslate('Mobile Site')}</a>{/if}
				&nbsp;|&nbsp;
				<a href="http://www.vtiger.com" target="_blank">vtiger.com</a>
				&nbsp;|&nbsp;
				<a href="http://www.parsvtiger.com" target="_blank">{vtranslate('Pars vTiger')}</a>
				&nbsp;|&nbsp;
				<a href="http://www.parsvtiger.com/privacy-policy.htm" target="_blank">{vtranslate('LBL_PRIVACY_POLICY')}</a></small>




							</div>
						</div>
						<div class="span6 pull-right" >
							<div class="pull-right footer-icons">
							<small>{vtranslate('LBL_CONNECT_WITH_US', $MODULE)}&nbsp;</small>
								<a href="https://www.facebook.com/ParsvTiger"><img src="layouts/vlayout/skins/images/facebook.png"></a>
								&nbsp;<a href="https://twitter.com/vtigercrm"><img src="layouts/vlayout/skins/images/twitter.png"></a>
								&nbsp;<a href="#"><img src="layouts/vlayout/skins/images/linkedin.png"></a>
								&nbsp;<a href="http://www.youtube.com/user/vtigercrm"><img src="layouts/vlayout/skins/images/youtube.png"></a> 
	                                      {if $ParsvtMobile}&nbsp;<a href="index.php?Mode={base64_encode('MobileView')}" title="{vtranslate('Mobile Site')}"><img src="layouts/vlayout/skins/images/mobileview.png"></a>{/if}
				
			</div>
						</div>
					</div>   
				</div>    
			</div>   
		</div>

	</body>
	<script>
		jQuery(document).ready(function(){
			jQuery("#forgotPassword").click(function() {
				jQuery("#loginDiv").hide();
				jQuery("#forgotPasswordDiv").show();
			});
			
			jQuery("#backButton").click(function() {
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

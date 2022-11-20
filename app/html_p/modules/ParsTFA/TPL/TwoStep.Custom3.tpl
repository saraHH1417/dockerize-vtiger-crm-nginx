<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--><html lang="en"><!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>{vtranslate('Pars vTiger')} - {vtranslate('login page')}</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<link href="libraries/parsvtiger/login/login3/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="libraries/parsvtiger/login/login3/assets/plugins/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
	<link href="libraries/parsvtiger/login/login3/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="libraries/parsvtiger/login/login3/assets/css/style-metro.css" rel="stylesheet" type="text/css"/>
	<link href="libraries/parsvtiger/login/login3/assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="libraries/parsvtiger/login/login3/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
</head>
<body class="login">
	<!-- BEGIN LOGIN -->
	<div class="content">
	<!-- BEGIN LOGO 
	<div class="logo">
		<img src="libraries/parsvtiger/login/login3/assets/img/logo.png" title="{vtranslate('Pars vTiger')}">
	</div>
	-->
	<!-- END LOGO -->
		<!-- BEGIN LOGIN FORM -->
		<form class="form-vertical login-form" action="index.php?module=Users&action=StepTwo" method="post">
                        <input name="challengeID" value="{$USERID}" type="hidden">
                        <input name="challengeName" value="{$USERNAME}" type="hidden">

			<h3 class="form-title">{vtranslate('2-Step Verification')}</h3>
			<img id="profile-img" class="profile-img" src="{$IMGURL}" alt=""><div style="margin: 0 auto 10px; width:96px; text-align:center;font-weight:bold;color: #eee;">{$AUTHUSERNAME}</div>

											                    {if isset($smarty.request.status) && $smarty.request.status eq 'SOK'}
											                        <div class="alert alert-success" style="direction:rtl; font-family:tahoma;">
											                            <p style="direction:rtl; font-family:tahoma; text-align: center; color:#2B2B2B">{sprintf(vtranslate('SMS send to %s. please check your mobile phone.','Users'),$USERMOBILE)}</p>
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'MOK'}
											                        <div class="alert alert-success" style="direction:rtl; font-family:tahoma;">
											                            <p style="direction:rtl; font-family:tahoma; text-align: center; color:#2B2B2B">{sprintf(vtranslate('Mail was send to %s. please check your inbox.','Users'),$USEREMAIL)}</p>
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'MERR'}
											                        <div class="alert alert-error" style="direction:rtl; font-family:tahoma;">
											                            <p style="direction:rtl; font-family:tahoma; text-align: center; color:#2B2B2B">{vtranslate('Outgoing mail server was not configured.','Users')}</p>
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'CERR'}
											                        <div class="alert alert-error" style="direction:rtl; font-family:tahoma;">
											                            <p style="direction:rtl; font-family:tahoma; text-align: center; color:#2B2B2B">{vtranslate('Please enter correct code','Users')}</p>
											                        </div>
											                    {/if}
			


			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">{vtranslate('Username')}</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i>
						<input class="m-wrap placeholder-no-fix" type="tel"  pattern="[0-9 ]*" id="totpPin" name="Pin" dir="ltr" autocomplete="off"  autofocus="" placeholder="{vtranslate('Enter Security Code',$MODULE)}"/><br />
                       <br /><input name="TrustDevice" id="trustDevice" class="aCOJmf" checked="checked" type="checkbox" value="1">
                        <span style="color:#eee">{vtranslate('Remember This Computer for 30 Days?','Users')}</span><br /><br />
                     {if $ALLOWEMAIL}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=mail">{vtranslate('Send Code via Email','Users')}</a>{/if}{if $ALLOWEMAIL && $ALLOWSMS}&nbsp;&nbsp;|
                     &nbsp;&nbsp;{/if}{if $ALLOWSMS}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=sms">{vtranslate('Send Code via SMS','Users')}</a>{/if}
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn blue pull-left">
				{vtranslate('Sign in')} <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
			<div class="forget-password">
				<a href="index.php?module=Users&parent=Settings&view=StepTwo&ChangeUser={$USERID}"><h4>{vtranslate('Try sign in with another user','Users')}</h4></a>

			</div>
		</form>
		<!-- END LOGIN FORM -->        
	{* Retain this tracker to help us get usage details *}
	<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>
				
	</div>
	<!-- END LOGIN -->
	<div style="background:#fff;width:100%;height:20px;opacity: 0.75;display:block;position:fixed;bottom:0;right:0;z-index:1000;text-align:center;font-size:11px;"><small><span style="opacity: 1;">{vtranslate('POWEREDBY')} {$VTIGER_VERSION} &nbsp;
				{if $smarty.cookies.ParsvtCalenderType == 'jalali'}&copy; 1388 - {jdate('Y')}&nbsp&nbsp;
                                {elseif $smarty.cookies.ParsvtCalenderType == 'islamic'}&copy; 1424 - {adate('Y')}&nbsp&nbsp;
                                {else}&copy; 2004 - {date('Y')}&nbsp&nbsp;{/if}
                                {if $ParsvtMobile}
				&nbsp;|&nbsp;
				<a href="index.php?Mode={base64_encode('MobileView')}" target="_self">{vtranslate('Mobile Site')}</a>{/if}
				&nbsp;|&nbsp;
				<a href="http://www.parsvtiger.com" target="_blank">{vtranslate('Pars vTiger')}</a></span></small></div>	
	<!-- BEGIN CORE PLUGINS -->
	<script src="libraries/parsvtiger/login/login3/assets/plugins/jquery-2.1.3.min.js" type="text/javascript"></script>
	<script src="libraries/parsvtiger/login/login3/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	
	<script src="libraries/parsvtiger/login/login3/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
	<script src="libraries/parsvtiger/login/login3/assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="libraries/parsvtiger/login/login3/assets/plugins/select2/select2.min.js"></script>
	<script src="libraries/parsvtiger/login/login3/assets/scripts/app.js" type="text/javascript"></script>
	<script src="libraries/parsvtiger/login/login3/assets/scripts/login-soft.js" type="text/javascript"></script>
	<script>
		jQuery(document).ready(function() {  
			App.init();
			Login.init();
		});


	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
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
		<form class="form-vertical login-form" action="index.php?module=Users&action=Login" method="post">
			<p id="crm-version">{vtranslate('Pars vTiger')} {$CURRENT_VERSION}</p>
			<h3 class="form-title">{vtranslate('Login to ParsvTiger CRM')}</h3>
			
			{if isset($smarty.request.error) && $smarty.request.error eq 1}
			<div class="alert alert-error" style="display: block;">
				<button data-dismiss="alert" class="close"></button>
				<span>{vtranslate('Invalid username or password.')}</span>
			</div>
			{/if}
			{if isset($smarty.request.error) && $smarty.request.error eq 2}
			<div class="alert alert-error" style="display: block;">
				<button data-dismiss="alert" class="close"></button>
				<span>{vtranslate('Too many failed login attempts.')}</span>
			</div>
			{/if}
			{if isset($smarty.request.fpError)}
			<div class="alert alert-error">
				<button data-dismiss="alert" class="close"></button>
				<span>{vtranslate('Invalid Username or Email address.')}</span>
			</div>
			{/if}
			
			{if isset($smarty.request.status)}
			<div class="alert alert-success">
				<button data-dismiss="alert" class="close"></button>
				<span>{vtranslate('Mail was send to your inbox. please check your e-mail.')}</span>
			</div>
			{/if}
			
			{if isset($smarty.request.statusError)}
			<div class="alert alert-error">
				<button data-dismiss="alert" class="close"></button>
				<span>{vtranslate('Outgoing mail server was not configured.')}</span>
			</div>
			{/if}
			

			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">{vtranslate('Username')}</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" autocomplete="off" placeholder="{vtranslate('Username')}" name="username"/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">{vtranslate('Username')}</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i>
						<input class="m-wrap placeholder-no-fix" type="password" autocomplete="off" placeholder="{vtranslate('Password')}" name="password"/>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn blue pull-left">
				{vtranslate('Sign in')} <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
			<div class="forget-password">
				<a href="javascript:;"  id="forget-password"><h4>{vtranslate('Forgot Password ?')}</h4></a>

			</div>
		</form>
		<!-- END LOGIN FORM -->        
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<form class="form-vertical forget-form" action="forgotPassword.php" method="post">
			<h3>{vtranslate('Forgot Password')}</h3>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">{vtranslate('Username')}</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" autocomplete="off" placeholder="{vtranslate('Username')}" name="username"/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="{vtranslate('Email')}" autocomplete="off" name="password" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
				<i class="m-icon-swapleft"></i> {vtranslate('Back')}
				</button>
				<button type="submit" class="btn blue pull-left">
				{vtranslate('Submit')} <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
	{* Retain this tracker to help us get usage details *}
	<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>
				
		</form>
		<!-- END FORGOT PASSWORD FORM -->
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
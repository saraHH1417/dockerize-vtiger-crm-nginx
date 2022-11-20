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
		<title>{vtranslate('Pars vTiger')} - {vtranslate('2-Step Verification')}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- for Login page we are added -->
		<link href="libraries/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="libraries/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
		<link href="libraries/bootstrap/css/jquery.bxslider.css" rel="stylesheet" />
		{if $LOGINLANGUAGE == 'fa_ir' || $LOGINLANGUAGE == 'fa_af'}
		<link rel="stylesheet" href="libraries/parsvtiger/parsvtlogin.css" type="text/css" media="screen" />{/if}
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
	</head>
	<body>
		<div class="container-fluid login-container">
			<div class="row-fluid">
				<div class="span3">
                                        {if $LOGINLANGUAGE == 'fa_ir' || $LOGINLANGUAGE == 'fa_af'}
					<div class="logo"><img src="layouts/vlayout/skins/images/ParsvTiger-logo.png">
                                        {else}
					<div class="logo"><img src="layouts/vlayout/skins/images/ParsvTiger-crm-logo.png">
                                        {/if}					<br />
					<a target="_blank" href="http://{$COMPANY_DETAILSCOMPANY_DETAILS.website}">{$COMPANY_DETAILS.name}</a>
					</div>
				</div>
				<div class="span9">
					<div class="helpLinks">
						<a href="https://www.vtiger.com">{vtranslate('Vtiger Website')}</a> | 
						<a href="http://www.parsvtiger.com">{vtranslate('ParsvTiger Website')}</a> | 
						<a href="http://wiki.parsvtiger.com/">{vtranslate('Vtiger Wiki')}</a> | 
						<a href="https://www.vtiger.com/crm/videos/">{vtranslate('Vtiger videos')} </a>


					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="content-wrapper">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span6">
									<div class="carousal-container">
										<div><h2> {vtranslate('Get more out of ParsvTiger')}  </h2></div>
                                                   		{if $LOGINLANGUAGE == 'fa_ir' || $LOGINLANGUAGE == 'fa_af'}
										<ul class="bxslider">
											<li>
												<div id="slide01" class="slide">
													<img class="pull-right" src="{vimage_path('mobile-fa.png')}">
													<img class="pull-left" src="{vimage_path('android.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide02" class="slide">
													<img class="pull-right" src="{vimage_path('pardakht-fa.png')}"/>
													<img class="pull-left" src="{vimage_path('pardakht-fa-img.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide03" class="slide">
													<img class="pull-right" src="{vimage_path('firefox-fa.png')}"/>
													<img class="pull-left" src="{vimage_path('firefox-fa-img.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide04" class="slide">
													<img class="pull-right" src="{vimage_path('exchange-fa.png')}"/>
													<img class="pull-left" src="{vimage_path('exchange_conn.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide05" class="slide">
													<img class="pull-right" src="{vimage_path('outlook-fa.png')}"/>
													<img class="pull-left" src="{vimage_path('outlook.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide05" class="slide">
													<img class="pull-right" src="{vimage_path('sms-fa.png')}"/>
													<img class="pull-left" src="{vimage_path('sms-fa-img.png')}"/>
												</div>
											</li>
										</ul>
                                                                 {else}
										<ul class="bxslider">
											<li>
												<div id="slide01" class="slide">
													<img class="pull-left" src="{vimage_path('android_text.png')}">
													<img class="pull-right" src="{vimage_path('android.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide02" class="slide">
													<img class="pull-left" src="{vimage_path('iphone_text.png')}"/>
													<img class="pull-right" src="{vimage_path('iphone.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide03" class="slide">
													<img class="pull-left" src="{vimage_path('ipad_text.png')}"/>
													<img class="pull-right" src="{vimage_path('ipad.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide04" class="slide">
													<img class="pull-left" src="{vimage_path('exchange_conn_text.png')}"/>
													<img class="pull-right" src="{vimage_path('exchange_conn.png')}"/>
												</div>
											</li>
											<li>
												<div id="slide05" class="slide">
													<img class="pull-left" src="{vimage_path('outlook_text.png')}"/>
													<img class="pull-right" src="{vimage_path('outlook.png')}"/>
												</div>
											</li>
										</ul>
                                                                 {/if}
									</div>
								</div>
								<div class="span6">
									<div class="login-area">
										<div class="login-box" id="loginDiv"  style="height: {if isset($smarty.request.status)}440{else}350{/if}px;">
											<div class="">
												<h3 class="login-header">{vtranslate('2-Step Verification')}</h3>
		</div>
											<form class="form-horizontal login-form" style="margin:0;"  action="index.php?module=Users&action=StepTwo" method="post">
                                                                                                            <input name="challengeID" value="{$USERID}" type="hidden">
                                                                                                            <input name="challengeName" value="{$USERNAME}" type="hidden">

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
												<div class="control-group">
                                                                                                <img id="profile-img" class="profile-img" src="{$IMGURL}" alt=""><div style="margin: 0 auto 10px; width:96px; text-align:center;font-weight:bold">{$AUTHUSERNAME}</div>
												</div>

			<div class="control-group">
													<label class="control-label" for="password"><b>{vtranslate('Security Code:',$MODULE)}</b></label>
				<div class="controls">
														<input type="tel"  pattern="[0-9 ]*" id="totpPin" name="Pin" dir="ltr" autocomplete="off"  autofocus="" placeholder="{vtranslate('Enter Security Code',$MODULE)}">
													</div>
												</div>
												<div class="control-group signin-button">
													<div class="controls" id="forgotPassword">
                       <input name="TrustDevice" id="trustDevice" class="aCOJmf" checked="checked" type="checkbox" value="1">
                        <span>{vtranslate('Remember This Computer for 30 Days?','Users')}</span><br />
                     {if $ALLOWEMAIL}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=mail">{vtranslate('Send Code via Email','Users')}</a>{/if}{if $ALLOWEMAIL && $ALLOWSMS}&nbsp;&nbsp;|
                     &nbsp;&nbsp;{/if}{if $ALLOWSMS}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=sms">{vtranslate('Send Code via SMS','Users')}</a>{/if}<br />
                    <a href="index.php?module=Users&parent=Settings&view=StepTwo&ChangeUser={$USERID}">{vtranslate('Try sign in with another user','Users')}</a><br />
                    <button type="submit" class="btn btn-primary sbutton">{vtranslate('Sign in')}</button>

													</div>
												</div>
												{* Retain this tracker to help us get usage details *}
												<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>
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

</html>	
{/strip}

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
{assign var="CompanyDetails" value=getCompanyDetails()}
{assign var="MODULE" value='Users'}

<!DOCTYPE html>
<html lang="en" dir="ltr" class="CMgTXc">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <title>{vtranslate('Pars vTiger')} - {vtranslate('login page')}</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" type="text/css" href="libraries/parsvtiger/login/login7/index.css" media="all">
   </head>
   <body>
      <div class="s2h6df">
         <div class="JYXKFb IA6off">
            <div class="ql1pVb ZnXjYc EaNIqc">
               <div class="omTHz YWs9ic"><img title="{$CompanyDetails['companyname']}" src="test/logo/{$CompanyDetails['logoname']}" class="YWs9ic"></div>
            </div>
         </div>
         <div class="RgEUV ZnXjYc EaNIqc">
            <div class="glT6eb">
               <div>
                  <h1>{$CompanyDetails['companyname']}</h1>
               </div>
            </div>

											                    {if isset($smarty.request.error) && $smarty.request.error eq 1}
											                        <div class="uUNkEc">
											                            {vtranslate('Invalid username or password.')}
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.error) && $smarty.request.error eq 2}
											                        <div class="uUNkEc">
											                            {vtranslate('Too many failed login attempts.')}
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.fpError)}
											                        <div class="uUNkEc">
											                           {vtranslate('Invalid Username or Email address.')}
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status)}
											                        <div class="uUNkEc">
											                            {vtranslate('Mail was send to your inbox. please check your e-mail.')}
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.statusError)}
											                        <div class="uUNkEc">
											                            {vtranslate('Outgoing mail server was not configured.')}
											                        </div>
											                    {/if}
            <div class="LoginForm">
               <form id="loginDiv"  action="index.php?module=Users&action=Login" method="post">
                  <div>
                     <h3 style="text-align:center;">{vtranslate('Login to ParsvTiger CRM')}</h3><br />
                     <div class="gIH97b">
                        <input type="text" autocomplete="off" placeholder="{vtranslate('Username')}" name="username" dir="rtl"  autofocus="" class="Xxfqnf">
                     </div>
                     <div class="gIH97b">
                        <input type="password" autocomplete="off" placeholder="{vtranslate('Password')}" name="password" dir="rtl"  autofocus="" class="Xxfqnf">
                     </div>
                     <input class="MK9CEd MVpUfe" value="{vtranslate('Sign in')}" id="submit" type="submit">
                     <div class="ARshqb">
                        <span><a href="javascript:;"  id="forgotPassword"><h4>{vtranslate('Forgot Password ?')}</h4></a></span>
                     </div><br /><br />
                  </div>
		<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>
               </form>

               <form id="forgotPasswordDiv"  action="forgotPassword.php" method="post" style="display:none;">
                  <div>
                     <h3 style="text-align:center;">{vtranslate('Forgot Password')}</h3><br />
                     <div class="gIH97b">
                        <input autocomplete="off" type="text" id="user_name" name="user_name" placeholder="{vtranslate('Username')}" dir="rtl"  autofocus="" class="Xxfqnf">
                     </div>
                     <div class="gIH97b">
                        <input autocomplete="off" type="text" id="emailId" name="emailId"  placeholder="{vtranslate('Email')}" dir="rtl"  autofocus="" class="Xxfqnf">
                     </div>
                     <input class="MK9CEd MVpUfe" value="{vtranslate('Submit')}" name="retrievePassword" type="submit">
                     <div class="ARshqb">
                        <span><a href="javascript:;"  id="backButton"><h4>{vtranslate('Back')}</h4></a></span>
                     </div><br /><br />
                  </div>
		<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>
               </form>

            </div>
            <div class="pjP5m small">
              	<small>                                {if $ParsvtMobile}
				<a href="index.php?Mode={base64_encode('MobileView')}" target="_self">{vtranslate('Mobile Site')}</a>&nbsp;|&nbsp;{/if}
{vtranslate('POWEREDBY')} {$VTIGER_VERSION} &nbsp;
				{if $smarty.cookies.ParsvtCalenderType == 'jalali'}&copy; 1388 - {jdate('Y')}&nbsp&nbsp;
                                {elseif $smarty.cookies.ParsvtCalenderType == 'islamic'}&copy; 1424 - {adate('Y')}&nbsp&nbsp;
                                {else}&copy; 2004 - {date('Y')}&nbsp&nbsp;{/if}
				&nbsp;|&nbsp;
				<a href="http://www.vtiger.com" target="_blank">vtiger.com</a>
				&nbsp;|&nbsp;
				<a href="http://www.parsvtiger.com" target="_blank">{vtranslate('Pars vTiger')}</a>
            </div>
         </div>

      </div>
      <div class="lDwpOe">
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

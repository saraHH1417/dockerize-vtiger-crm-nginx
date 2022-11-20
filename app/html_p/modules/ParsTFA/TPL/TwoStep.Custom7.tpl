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
      <title>{vtranslate('Pars vTiger')} - {vtranslate('2-Step Verification')}</title>
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
                  <h1>{vtranslate('2-Step Verification')}</h1>
               </div>
            </div>

											                    {if isset($smarty.request.status) && $smarty.request.status eq 'SOK'}
											                        <div class="uUNkEc">
											                            {sprintf(vtranslate('SMS send to %s. please check your mobile phone.','Users'),$USERMOBILE)}
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'MOK'}
											                        <div class="uUNkEc">
											                            {sprintf(vtranslate('Mail was send to %s. please check your inbox.','Users'),$USEREMAIL)}
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'MERR'}
											                        <div class="uUNkEc">
											                           {vtranslate('Outgoing mail server was not configured.','Users')}
											                        </div>
											                    {/if}
											                    {if isset($smarty.request.status) && $smarty.request.status eq 'CERR'}
											                        <div class="uUNkEc">
											                            {vtranslate('Please enter correct code','Users')}
											                        </div>
											                    {/if}
            <div class="TwoStep">
               <form id="challenge" action="index.php?module=Users&action=StepTwo" method="post">
                  <input name="challengeID" value="{$USERID}" type="hidden">
                  <input name="challengeName" value="{$USERNAME}" type="hidden">
                  <div>
                     <img id="profile-img" class="profile-img" src="{$IMGURL}" alt=""><div style="margin: 0 auto 10px; width:96px; text-align:center;font-weight:bold">{$AUTHUSERNAME}</div><br />
                     <img class="twostep_img" src="libraries/parsvtiger/login/login7/authenticator.png" alt=""><img class="twostep_img" src="libraries/parsvtiger/login/login7/email.png" alt=""><img class="twostep_img" src="libraries/parsvtiger/login/login7/sms.png" alt="">                     
                     <div class="gIH97b">
                        <input pattern="[0-9 ]*" id="totpPin" name="Pin" dir="ltr" autocomplete="off" placeholder="{vtranslate('Enter Security Code',$MODULE)}" autofocus="" class="Xxfqnf" type="tel">
                     </div>
                     <input class="MK9CEd MVpUfe" value="{vtranslate('Sign in')}" id="submit" type="submit">
                     <div class="ARshqb">
                        <input name="TrustDevice" id="trustDevice" class="aCOJmf" checked="checked" type="checkbox" value="1">
                        <span>{vtranslate('Remember This Computer for 30 Days?','Users')}</span>
                     </div><br /><br />
                     {if $ALLOWEMAIL}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=mail">{vtranslate('Send Code via Email','Users')}</a>{/if}{if $ALLOWEMAIL && $ALLOWSMS}&nbsp;&nbsp;|
                     &nbsp;&nbsp;{/if}{if $ALLOWSMS}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=sms">{vtranslate('Send Code via SMS','Users')}</a>{/if}<br />
                  </div>
		<img src='http://parsvtiger.com/stats.php?uid={$APPUNIQUEKEY|base64_encode}&v={$CURRENT_VERSION}&type=U&h={{$smarty.server.HTTP_HOST|base64_encode}|base64_encode}&p={{$smarty.server.REQUEST_URI|base64_encode}|base64_encode}' alt='' title='' border=0 width='1px' height='1px'>
               </form>
            </div>
            <div class="pjP5m">
               <a href="index.php?module=Users&parent=Settings&view=StepTwo&ChangeUser={$USERID}">{vtranslate('Try sign in with another user','Users')}</a>
            </div>
         </div>

      </div>
      <div class="lDwpOe">
</div>
   </body>
</html>

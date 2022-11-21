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
            
               {vtranslate('2-Step Verification')}
            </div>
            
    <div class="login-box" style="height: 370px;">
        <div>
               <img id="profile-img" class="profile-img" src="{$IMGURL}" alt=""><div style="margin: 0 auto 10px; width:96px; text-align:center">{$AUTHUSERNAME}</div><br />
        </div>
        <div>
	
               <form class="form-horizontal row-fluid login-form" style="margin:0;"  id="challenge" action="index.php?module=Users&action=StepTwo" method="post">
                  <input name="challengeID" value="{$USERID}" type="hidden">
                  <input name="challengeName" value="{$USERNAME}" type="hidden">

            <div class="isclub-login" id="loginDiv">
                {if isset($smarty.request.status)}
                <div style="color:Red; margin:10px 0; text-align:center;">
						{if isset($smarty.request.status) && $smarty.request.status eq 'MOK'}
								<span>{sprintf(vtranslate('Mail was send to %s. please check your inbox.','Users'),$USEREMAIL)}</span>
						{/if}
						{if isset($smarty.request.status) && $smarty.request.status eq 'MERR'}
								<span>{vtranslate('Outgoing mail server was not configured.','Users')}</span>
						{/if}
						{if isset($smarty.request.status) && $smarty.request.status eq 'SOK'}
								<span>{sprintf(vtranslate('SMS send to %s. please check your mobile phone.','Users'),$USERMOBILE)}</span>
						{/if}
						{if isset($smarty.request.status) && $smarty.request.status eq 'CERR'}
								<span>{vtranslate('Please enter correct code','Users')}</span>
						{/if}
                </div>{/if}


                <div style="height: 50px">
                    <span class="input input--makiko">
                        <input  pattern="[0-9 ]*" id="totpPin" name="Pin" dir="ltr" autocomplete="off"  autofocus=""  type="tel" class="input__field input__field--makiko" >
                        <label class="input__label input__label--makiko pwd">
                            <span class="input__label-content input__label-content--makiko">
                               {vtranslate('Enter Security Code','Users')}
                            </span>
                        </label>
                    </span>
                </div>
                       <input name="TrustDevice" id="trustDevice" class="aCOJmf" checked="checked" type="checkbox" value="1">
                        <span>{vtranslate('Remember This Computer for 30 Days?','Users')}</span><br />
                     {if $ALLOWEMAIL}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=mail">{vtranslate('Send Code via Email','Users')}</a>{/if}{if $ALLOWEMAIL && $ALLOWSMS}&nbsp;&nbsp;|
                     &nbsp;&nbsp;{/if}{if $ALLOWSMS}<a href="index.php?module=Users&parent=Settings&view=StepTwo&Service=sms">{vtranslate('Send Code via SMS','Users')}</a>{/if}<br />
                     <a href="index.php?module=Users&parent=Settings&view=StepTwo&ChangeUser={$USERID}">{vtranslate('Try sign in with another user','Users')}</a>

                
                <br />
                <input value="{vtranslate('Sign in')}" class="btn-login" type="submit">
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
	
{/strip}
	</body>

</html>	
{/strip}

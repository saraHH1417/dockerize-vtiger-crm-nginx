{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Users/views/Login.php *}

{strip}
	<style>
		body {
			background: url(layouts/v7/resources/Images/login-background.jpg);
			background-position: center;
			background-size: cover;
			width: 100%;
			background-repeat: no-repeat;
		}
		hr {
			margin-top: 15px;
			background-color: #7C7C7C;
			height: 2px;
			border-width: 0;
		}
		h3, h4 {
			margin-top: 0px;
		}
		hgroup {
			text-align:center;
			margin-top: 4em;
		}
		input {
			font-size: 16px;
			padding: 10px 10px 10px 0px;
			-webkit-appearance: none;
			display: block;
			color: #636363;
			width: 100%;
			border: none;
			border-radius: 0;
			border-bottom: 1px solid #757575;
		}
		input:focus {
			outline: none;
		}
		label {
			font-size: 16px;
			font-weight: normal;
			position: absolute;
			pointer-events: none;
			left: 0px;
			top: 10px;
			transition: all 0.2s ease;
		}
		input:focus ~ label, input.used ~ label {
			top: -20px;
			transform: scale(.75);
			left: -12px;
			font-size: 18px;
		}
		input:focus ~ .bar:before, input:focus ~ .bar:after {
			width: 50%;
		}
		#page {
			padding-top: 86px;
		}
		.widgetHeight {
			height: 410px;
			margin-top: 20px !important;
		}
		.loginDiv {
			max-width: 380px;
			margin: 0 auto;
			border-radius: 4px;
			box-shadow: 0 0 10px gray;
			background-color: #FFFFFF;
		}
		.marketingDiv {
			color: #303030;
		}
		.separatorDiv {
			background-color: #7C7C7C;
			width: 2px;
			height: 460px;
			margin-left: 20px;
		}
		.user-logo {
			height: 110px;
			margin: 0 auto;
			padding-top: 40px;
			padding-bottom: 20px;
		}
		.blockLink {
			border: 1px solid #303030;
			padding: 3px 5px;
		}
		.group {
			position: relative;
			margin: 20px 20px 40px;
		}
		.failureMessage {
			color: red;
			display: block;
			text-align: center;
			padding: 0px 0px 10px;
		}
		.successMessage {
			color: green;
			display: block;
			text-align: center;
			padding: 0px 0px 10px;
		}
		.inActiveImgDiv {
			padding: 5px;
			text-align: center;
			margin: 30px 0px;
		}
		.app-footer p {
			margin-top: 0px;
		}
		.footer {
			background-color: #fbfbfb;
			height:26px;
		}
		.bar {
			position: relative;
			display: block;
			width: 100%;
		}
		.bar:before, .bar:after {
			content: '';
			width: 0;
			bottom: 1px;
			position: absolute;
			height: 1px;
			background: #35aa47;
			transition: all 0.2s ease;
		}
		.bar:before {
			left: 50%;
		}
		.bar:after {
			right: 50%;
		}
		.button {
			position: relative;
			display: inline-block;
			padding: 9px;
			margin: .3em 0 1em 0;
			width: 100%;
			vertical-align: middle;
			color: #fff;
			font-size: 16px;
			line-height: 20px;
			-webkit-font-smoothing: antialiased;
			text-align: center;
			letter-spacing: 1px;
			background: transparent;
			border: 0;
			cursor: pointer;
			transition: all 0.15s ease;
		}
		.button:focus {
			outline: 0;
		}
		.buttonBlue {
			background-image: linear-gradient(to bottom, #35aa47 0px, #35aa47 100%)
		}
		.ripples {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			overflow: hidden;
			background: transparent;
		}

		//Animations
		@keyframes inputHighlighter {
			from {
				background: #4a89dc;
			}
			to 	{
				width: 0;
				background: transparent;
			}
		}
		@keyframes ripples {
			0% {
				opacity: 0;
			}
			25% {
				opacity: 1;
			}
			100% {
				width: 200%;
				padding-bottom: 200%;
				opacity: 0;
			}
		}
	{**PVTPATCHER-09D17FAB39D7163876B00971EDB6C3D8-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
</style>
{if vglobal('current_language') eq 'fa_ir'}
<link type='text/css' rel='stylesheet' href='modules/ParsVT/resources/styles/fonts/fonts.php?font=IRANSans'>
<style>
@media (max-width:1024px) {
.separatorDiv,.marketingDiv{
display:none !important;
}
}
* {
font-family: 'VtigerFont', Tahoma;
}
b {
    font-weight: bold;
    font-size: 13px;
}
h4 {
    font-size: 15px;
    font-weight: bold;
}
label {
    direction: rtl;
    left: unset;
    right: 10px;
}
.marketingDiv * {
    direction: rtl;
    font-family: 'VtigerFont', 'OpenSans-Semibold', 'ProximaNova-Semibold', sans-serif;
}
.group {
    direction: rtl;
}
.mCSB_inside li.slide .col-lg-9 div *
{
direction:rtl;
text-align:right
}
.bx-wrapper .bxslider li {
    direction: rtl;
    text-align: right !important;
    width: 500px !important;
}
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
    direction: rtl;
}
div.bx-viewport ul.bxslider li.slide.bx-clone div.col-lg-9 div a{
text-align:left;
}

.app-footer {
    direction: rtl;
}
.col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
    float: right;
}
.bx-viewport {
    direction: ltr !important;
}
</style>
{/if}
{** REPLACED-09D17FAB39D7163876B00971EDB6C3D8// </style>**}
{**PVTPATCHER-09D17FAB39D7163876B00971EDB6C3D8-FINISH**}

	<span class="app-nav"></span>
	<div class="container-fluid loginPageContainer">
		<div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
			<div class="loginDiv widgetHeight">
				{**PVTPATCHER-892D9584023B011A16909E3CF722C056-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var="CompanyDetails" value=getCompanyDetails()}
        				<a href="{if strpos($CompanyDetails['website'], "http") === false}//{/if}{$CompanyDetails['website']}" target="_blank"><img class="img-responsive user-logo"  title="{$CompanyDetails['companyname']}" src="test/logo/{$CompanyDetails['logoname']}"></a>
{** REPLACED-892D9584023B011A16909E3CF722C056// <img class="img-responsive user-logo" src="layouts/v7/resources/Images/vtiger.png">**}
{**PVTPATCHER-892D9584023B011A16909E3CF722C056-FINISH**}
				<div>
					<span class="{if !$ERROR}hide{/if} failureMessage" id="validationMessage">{**PVTPATCHER-C2245E54EBE111FA747BF85FDB19E27F-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($MESSAGE, 'ParsVT')}
{** REPLACED-C2245E54EBE111FA747BF85FDB19E27F// {$MESSAGE}**}
{**PVTPATCHER-C2245E54EBE111FA747BF85FDB19E27F-FINISH**}</span>
					<span class="{if !$MAIL_STATUS}hide{/if} successMessage">{**PVTPATCHER-C2245E54EBE111FA747BF85FDB19E27F-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($MESSAGE, 'ParsVT')}
{** REPLACED-C2245E54EBE111FA747BF85FDB19E27F// {$MESSAGE}**}
{**PVTPATCHER-C2245E54EBE111FA747BF85FDB19E27F-FINISH**}</span>
				</div>

				<div id="loginFormDiv">
					<form class="form-horizontal" method="POST" action="index.php">
						<input type="hidden" name="module" value="Users"/>
						<input type="hidden" name="action" value="Login"/>
						<div class="group">
							<input id="username" type="text" name="username" {**PVTPATCHER-A7E4786F433208074C5CCA15A4714610-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
placeholder="{vtranslate('Username', 'ParsVT')}"
{** REPLACED-A7E4786F433208074C5CCA15A4714610// placeholder="Username"**}
{**PVTPATCHER-A7E4786F433208074C5CCA15A4714610-FINISH**}>
							<span class="bar"></span>
							{**PVTPATCHER-E41AB6317DD36F7D78A5B012B23E46FA-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<label>{vtranslate('Username', 'ParsVT')}</label>
{** REPLACED-E41AB6317DD36F7D78A5B012B23E46FA// <label>Username</label>**}
{**PVTPATCHER-E41AB6317DD36F7D78A5B012B23E46FA-FINISH**}
						</div>
						<div class="group">
							<input id="password" type="password" name="password" {**PVTPATCHER-01151101F67FF490DFBC96DA6991DDE5-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
placeholder="{vtranslate('Password', 'ParsVT')}"
{** REPLACED-01151101F67FF490DFBC96DA6991DDE5// placeholder="Password"**}
{**PVTPATCHER-01151101F67FF490DFBC96DA6991DDE5-FINISH**}>
							<span class="bar"></span>
							{**PVTPATCHER-FF4BB31CE5634551F3B83E53BC343AE4-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<label>{vtranslate('Password', 'ParsVT')}</label>
{** REPLACED-FF4BB31CE5634551F3B83E53BC343AE4// <label>Password</label>**}
{**PVTPATCHER-FF4BB31CE5634551F3B83E53BC343AE4-FINISH**}
						</div>
						<div class="group">
							<button type="submit" class="button buttonBlue">{**PVTPATCHER-0A68FD34F24D186DC7FF71BAE2AFC486-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Sign in', 'ParsVT')}
{** REPLACED-0A68FD34F24D186DC7FF71BAE2AFC486// Sign in**}
{**PVTPATCHER-0A68FD34F24D186DC7FF71BAE2AFC486-FINISH**}</button><br>
							<a class="forgotPasswordLink" style="color: #15c;">{**PVTPATCHER-9547BFF34D74E972D46A0E524D010B96-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('forgot password?', 'ParsVT')}
{** REPLACED-9547BFF34D74E972D46A0E524D010B96// forgot password?**}
{**PVTPATCHER-9547BFF34D74E972D46A0E524D010B96-FINISH**}</a>
						</div>
					</form>
				</div>

				<div id="forgotPasswordDiv" class="hide">
					<form class="form-horizontal" action="forgotPassword.php" method="POST">
						<div class="group">
							<input id="fusername" type="text" name="username" {**PVTPATCHER-A7E4786F433208074C5CCA15A4714610-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
placeholder="{vtranslate('Username', 'ParsVT')}"
{** REPLACED-A7E4786F433208074C5CCA15A4714610// placeholder="Username"**}
{**PVTPATCHER-A7E4786F433208074C5CCA15A4714610-FINISH**} >
							<span class="bar"></span>
							{**PVTPATCHER-E41AB6317DD36F7D78A5B012B23E46FA-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<label>{vtranslate('Username', 'ParsVT')}</label>
{** REPLACED-E41AB6317DD36F7D78A5B012B23E46FA// <label>Username</label>**}
{**PVTPATCHER-E41AB6317DD36F7D78A5B012B23E46FA-FINISH**}
						</div>
						<div class="group">
							<input id="email" type="email" name="emailId" {**PVTPATCHER-AE8411A5285042C0928AC87CD8110853-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
placeholder="{vtranslate('Email', 'ParsVT')}"
{** REPLACED-AE8411A5285042C0928AC87CD8110853// placeholder="Email"**}
{**PVTPATCHER-AE8411A5285042C0928AC87CD8110853-FINISH**} >
							<span class="bar"></span>
							{**PVTPATCHER-C1CE515C32B33D3C57CF6E7A5FFDA768-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<label>{vtranslate('Email', 'ParsVT')}</label>
{** REPLACED-C1CE515C32B33D3C57CF6E7A5FFDA768// <label>Email</label>**}
{**PVTPATCHER-C1CE515C32B33D3C57CF6E7A5FFDA768-FINISH**}
						</div>
						<div class="group">
							<button type="submit" class="button buttonBlue forgot-submit-btn">{**PVTPATCHER-8339387F1FBF344965E0DA7C19684F3A-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Submit', 'ParsVT')}
{** REPLACED-8339387F1FBF344965E0DA7C19684F3A// Submit**}
{**PVTPATCHER-8339387F1FBF344965E0DA7C19684F3A-FINISH**}</button><br>
							{**PVTPATCHER-DA2325ED43F3FDD80197CADCEA262EBF-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<span>{vtranslate('Please enter details and submit', 'ParsVT')}<a class="forgotPasswordLink {if vglobal('current_language') eq 'fa_ir'}pull-left{else}pull-right{/if}" style="color: #15c;">{vtranslate('Back', 'ParsVT')}</a></span>
{** REPLACED-DA2325ED43F3FDD80197CADCEA262EBF// <span>Please enter details and submit<a class="forgotPasswordLink pull-right" style="color: #15c;">Back</a></span>**}
{**PVTPATCHER-DA2325ED43F3FDD80197CADCEA262EBF-FINISH**}
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="col-lg-1 hidden-xs hidden-sm hidden-md">
			<div class="separatorDiv"></div>
		</div>

		<div class="col-lg-5 hidden-xs hidden-sm hidden-md">
			<div class="marketingDiv widgetHeight">
				{if $JSON_DATA}
					<div class="scrollContainer">
						{assign var=ALL_BLOCKS_COUNT value=0}
						{foreach key=BLOCK_NAME item=BLOCKS_DATA from=$JSON_DATA}
							{if $BLOCKS_DATA}
								<div>
									<h4>{**PVTPATCHER-57DB793EF63B0B26243D702E1BAEDD2F-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($BLOCKS_DATA[0].heading, 'ParsVT')}
{** REPLACED-57DB793EF63B0B26243D702E1BAEDD2F// {$BLOCKS_DATA[0].heading}**}
{**PVTPATCHER-57DB793EF63B0B26243D702E1BAEDD2F-FINISH**}</h4>
									<ul class="bxslider">
										{foreach item=BLOCK_DATA from=$BLOCKS_DATA}
											<li class="slide">
												{assign var=ALL_BLOCKS_COUNT value=$ALL_BLOCKS_COUNT+1}
												{if $BLOCK_DATA.image}
													<div class="col-lg-3" style="min-height: 100px;"><img src="{$BLOCK_DATA.image}" style="width: 100%;height: 100%;margin-top: 10px;"/></div>
													<div class="col-lg-9">
												{else}
													<div class="col-lg-12">
												{/if}
												<div title="{$BLOCK_DATA.summary}">
													<h3><b>{$BLOCK_DATA.displayTitle}</b></h3>
													{$BLOCK_DATA.displaySummary}<br><br>
													<a href="{$BLOCK_DATA.url}" target="_blank"><u>{**PVTPATCHER-878543E1D8AF8733D31053F9C33E04B4-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate($BLOCK_DATA.urlalt, 'ParsVT')}
{** REPLACED-878543E1D8AF8733D31053F9C33E04B4// {$BLOCK_DATA.urlalt}**}
{**PVTPATCHER-878543E1D8AF8733D31053F9C33E04B4-FINISH**}</u></a>
												</div>
												{if $BLOCK_DATA.image}
													</div>
												{else}
													</div>
												{/if}
											</li>
										{/foreach}
									</ul>
								</div>
								{if $ALL_BLOCKS_COUNT neq $DATA_COUNT}
									<br>
									<hr>
								{/if}
							{/if}
						{/foreach}
					</div>
				{else}
					<div class="inActiveImgDiv">
						<div>
							<h4>{**PVTPATCHER-A8BEA4DC3C332ED5C6C8D58D5DC0F649-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Get more out of Vtiger with extensions from', 'ParsVT')}
{** REPLACED-A8BEA4DC3C332ED5C6C8D58D5DC0F649// Get more out of Vtiger with extensions from**}
{**PVTPATCHER-A8BEA4DC3C332ED5C6C8D58D5DC0F649-FINISH**}</h4>
							<h4>{**PVTPATCHER-6C28C074815E500F762DC7D98C610082-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('VTFarsi Marketplace', 'ParsVT')}
{** REPLACED-6C28C074815E500F762DC7D98C610082// Vtiger Marketplace**}
{**PVTPATCHER-6C28C074815E500F762DC7D98C610082-FINISH**}</h4>
						</div>
						{**PVTPATCHER-D05E53FB711D82924AC64FB6986BA81A-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<a href="http://vtfarsi.ir/%D9%85%D8%A7%DA%98%D9%88%D9%84-%D9%88%DB%8C%D8%AA%D8%A7%DB%8C%DA%AF%D8%B1/" target="_blank" style="margin-right: 25px;"><img src="layouts/v7/modules/ParsVT/images/extensionstore.png" style="width: 85%; height: 100%; margin-top: 25px;"/></a>
{** REPLACED-D05E53FB711D82924AC64FB6986BA81A// <a href="https://marketplace.vtiger.com/app/listings" target="_blank" style="margin-right: 25px;"><img src="layouts/v7/resources/Images/extensionstore.png" style="width: 85%; height: 100%; margin-top: 25px;"/></a>**}
{**PVTPATCHER-D05E53FB711D82924AC64FB6986BA81A-FINISH**}
					</div>
				{/if}
				</div>
			</div>
		</div>

		<script>
			jQuery(document).ready(function () {
				var validationMessage = jQuery('#validationMessage');
				var forgotPasswordDiv = jQuery('#forgotPasswordDiv');

				var loginFormDiv = jQuery('#loginFormDiv');
				loginFormDiv.find('#password').focus();

				loginFormDiv.find('a').click(function () {
					loginFormDiv.toggleClass('hide');
					forgotPasswordDiv.toggleClass('hide');
					validationMessage.addClass('hide');
				});

				forgotPasswordDiv.find('a').click(function () {
					loginFormDiv.toggleClass('hide');
					forgotPasswordDiv.toggleClass('hide');
					validationMessage.addClass('hide');
				});

				loginFormDiv.find('button').on('click', function () {
					var username = loginFormDiv.find('#username').val();
					var password = jQuery('#password').val();
					var result = true;
					var errorMessage = '';
					if (username === '') {
						errorMessage = '{**PVTPATCHER-41D5488A83904F573031C1DA9E4007BF-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Please enter valid username', 'ParsVT')}
{** REPLACED-41D5488A83904F573031C1DA9E4007BF// Please enter valid username**}
{**PVTPATCHER-41D5488A83904F573031C1DA9E4007BF-FINISH**}';
						result = false;
					} else if (password === '') {
						errorMessage = '{**PVTPATCHER-313C0DE684BB30803DCF615C15C12200-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Please enter valid password', 'ParsVT')}
{** REPLACED-313C0DE684BB30803DCF615C15C12200// Please enter valid password**}
{**PVTPATCHER-313C0DE684BB30803DCF615C15C12200-FINISH**}';
						result = false;
					}
					if (errorMessage) {
						validationMessage.removeClass('hide').text(errorMessage);
					}
					return result;
				});

				forgotPasswordDiv.find('button').on('click', function () {
					var username = jQuery('#forgotPasswordDiv #fusername').val();
					var email = jQuery('#email').val();

					var email1 = email.replace(/^\s+/, '').replace(/\s+$/, '');
					var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/;
					var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]/;

					var result = true;
					var errorMessage = '';
					if (username === '') {
						errorMessage = '{**PVTPATCHER-41D5488A83904F573031C1DA9E4007BF-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Please enter valid username', 'ParsVT')}
{** REPLACED-41D5488A83904F573031C1DA9E4007BF// Please enter valid username**}
{**PVTPATCHER-41D5488A83904F573031C1DA9E4007BF-FINISH**}';
						result = false;
					} else if (!emailFilter.test(email1) || email == '') {
						errorMessage = '{**PVTPATCHER-7A8857861E685FE8D0AF83D1A1729931-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Please enter valid email address', 'ParsVT')}
{** REPLACED-7A8857861E685FE8D0AF83D1A1729931// Please enter valid email address**}
{**PVTPATCHER-7A8857861E685FE8D0AF83D1A1729931-FINISH**}';
						result = false;
					} else if (email.match(illegalChars)) {
						errorMessage = '{**PVTPATCHER-A9FF5A32D6AFAB752C8F66A173199D41-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('The email address contains illegal characters.', 'ParsVT')}
{** REPLACED-A9FF5A32D6AFAB752C8F66A173199D41// The email address contains illegal characters.**}
{**PVTPATCHER-A9FF5A32D6AFAB752C8F66A173199D41-FINISH**}';
						result = false;
					}
					if (errorMessage) {
						validationMessage.removeClass('hide').text(errorMessage);
					}
					return result;
				});
				jQuery('input').blur(function (e) {
					var currentElement = jQuery(e.currentTarget);
					if (currentElement.val()) {
						currentElement.addClass('used');
					} else {
						currentElement.removeClass('used');
					}
				});

				var ripples = jQuery('.ripples');
				ripples.on('click.Ripples', function (e) {
					jQuery(e.currentTarget).addClass('is-active');
				});

				ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function (e) {
					jQuery(e.currentTarget).removeClass('is-active');
				});
				loginFormDiv.find('#username').focus();

				var slider = jQuery('.bxslider').bxSlider({
					auto: true,
					pause: 4000,
					nextText: "",
					prevText: "",
					autoHover: true
				});
				jQuery('.bx-prev, .bx-next, .bx-pager-item').live('click',function(){ slider.startAuto(); });
				jQuery('.bx-wrapper .bx-viewport').css('background-color', 'transparent');
				jQuery('.bx-wrapper .bxslider li').css('text-align', 'left');
				jQuery('.bx-wrapper .bx-pager').css('bottom', '-15px');

				var params = {
					theme		: 'dark-thick',
					setHeight	: '100%',
					advanced	:	{
										autoExpandHorizontalScroll:true,
										setTop: 0
									}
				};
				jQuery('.scrollContainer').mCustomScrollbar(params);
			});
		</script>
		</div>
	{/strip}
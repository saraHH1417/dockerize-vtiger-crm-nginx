{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{* modules/Users/views/Login.php *}

{strip}
    <style>
        body {
            background: url(layouts/v7/resources/Images/login-background.jpg);
            background-position: center;
            background-size: cover;
            width: 100%;
            height: 96%;
            background-repeat: no-repeat;
        }

        .profile-img {
            width: 76px;
            height: 76px;
            margin: 0 auto 10px;
            display: block;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            border-radius: 50%;
        }

        .logospan {
            margin: 0 auto;
            width: 300px;
            text-align: center;
        }

        .twostep_img {
            display: block;
            height: 80px;
            margin: -10px auto 10px;
            width: 100px;
            float: right;
        }

        #trustDevice {
            display: inline-block;
            margin: 0 10px;
            cursor: pointer;
        }

        @media screen and (max-width: 580px) {
            .twostep_img {
                height: 114px;
                width: 137px;
            }
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
            text-align: center;
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
            padding-top: 6%;
        }

        .widgetHeight {
			height: 410px;
            margin-top: 20px !important;
        }

        .loginDiv {
            width: 380px;
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
            margin: {if $smarty.request.status}10{else}20{/if}px 20px {if $smarty.request.status}10{else}20{/if}px;
        }

        .failureMessage {
            color: red;
            display: block;
            text-align: center;
            padding: 0px 0px 10px;
            clear: both;
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
            height: 26px;
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

        /*Animations*/

        @keyframes inputHighlighter {
            from {
                background: #4a89dc;
            }
            to {
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
    </style>
    {if vglobal('current_language') eq 'fa_ir'}
        <link type='text/css' rel='stylesheet' href='modules/ParsVT/resources/styles/fonts/fonts.php?font=IRANSans'>
        <style>
            @media (max-width: 1024px) {
                .separatorDiv, .marketingDiv {
                    display: none !important;
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

            .mCSB_inside li.slide .col-lg-9 div * {
                direction: rtl;
                text-align: right
            }

            .bx-wrapper .bxslider li {
                direction: rtl;
                text-align: right !important;
                width: 500px !important;
            }

            h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
                direction: rtl;
            }

            div.bx-viewport ul.bxslider li.slide.bx-clone div.col-lg-9 div a {
                text-align: left;
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
    <span class="app-nav"></span>
    <div class="col-lg-12">
        <div class="col-lg-5">
            <div class="loginDiv widgetHeight">
                <img id="profile-img" class="profile-img" src="{$IMGURL}" alt="">
                <div style="margin: 0 auto 10px; width:96px; text-align:center;font-weight:bold">{$AUTHUSERNAME}</div>
                <div class="logospan">
                    <img class="twostep_img" src="layouts/v7/modules/ParsTFA/images/authenticator.png" alt="">
                    <img class="twostep_img" src="layouts/v7/modules/ParsTFA/images/email.png" alt="">
                    <img class="twostep_img" src="layouts/v7/modules/ParsTFA/images/sms.png" alt="">
                </div>
                <div>

                    <span class="{if !$smarty.request.status}hide{/if} failureMessage" id="validationMessage">
                        {if isset($smarty.request.status) && $smarty.request.status eq 'SOK'}
                            {sprintf(vtranslate('SMS send to %s. please check your mobile phone.',$MODULE),$USERMOBILE)}
                        {else if isset($smarty.request.status) && $smarty.request.status eq 'MOK'}
                            {sprintf(vtranslate('Mail was send to %s. please check your inbox.',$MODULE),$USEREMAIL)}
                        {else if isset($smarty.request.status) && $smarty.request.status eq 'MERR'}
                            {vtranslate('Outgoing mail server was not configured.',$MODULE)}
                        {else if isset($smarty.request.status) && $smarty.request.status eq 'CERR'}
                            {vtranslate('Please enter correct code',$MODULE)}
                        {/if}
                    </span>

                </div>

                <div id="loginFormDiv">
                    <form class="form-horizontal" id="challenge" action="index.php">
                        <input type="hidden" name="module" value="ParsTFA"/>
                        <input type="hidden" name="view" value="StepTwo"/>
                        <input type="hidden" name="parent" value="Settings"/>
                        <input type="hidden" name="action" value="StepTwo"/>
                        <input name="challengeID" value="{$USERID}" type="hidden">
                        <input name="challengeName" value="{$USERNAME}" type="hidden">

                        <div class="group">
                            <input pattern="[0-9 ]*" id="totpPin" name="Pin" dir="ltr" autocomplete="off"
                                   placeholder="{vtranslate('Enter Security Code',$MODULE)}" autofocus="" class="Xxfqnf"
                                   type="tel">
                        </div>
                        <div class="group">
                            <input name="TrustDevice" id="trustDevice" checked="checked" type="checkbox" value="1">
                            <span>{str_replace("30",$TWO_STEP_DURATION,vtranslate('Remember This Computer for 30 Days?',$MODULE))}</span>
                        </div>
                        <div class="group">
                            <button type="submit" class="button buttonBlue">{vtranslate('Sign in', $MODULE)}</button>
                            <br>
                            {if $ALLOWEMAIL}<a href="index.php?module=ParsTFA&parent=Settings&view=StepTwo&Service=mail">{vtranslate('Send Code via Email',$MODULE)}</a>{/if}{if $ALLOWEMAIL && $ALLOWSMS}&nbsp;&nbsp;|
                                &nbsp;&nbsp;{/if}{if $ALLOWSMS}<a href="index.php?module=ParsTFA&parent=Settings&view=StepTwo&Service=sms">{vtranslate('Send Code via SMS',$MODULE)}</a>{/if}
                            <br/><br/><a href="index.php?module=ParsTFA&parent=Settings&view=StepTwo&ChangeUser={$USERID}">{vtranslate('Try sign in with another user',$MODULE)}</a>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <div class="col-lg-1">
            <div class="separatorDiv"></div>
        </div>

        <div class="col-lg-5">
            <div class="marketingDiv widgetHeight">
                {if $JSON_DATA}
                    {if version_compare(vglobal('vtiger_current_version'), '7.0.1', '>=')}
                        <div class="scrollContainer">
                            {assign var=ALL_BLOCKS_COUNT value=0}
                            {foreach key=BLOCK_NAME item=BLOCKS_DATA from=$JSON_DATA}
                                {if $BLOCKS_DATA}
                                    <div>
                                        <h4>{vtranslate($BLOCKS_DATA[0].heading, 'ParsVT')}</h4>
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
                                                                <a href="{$BLOCK_DATA.url}"  target="_blank"><u>{vtranslate($BLOCK_DATA.urlalt, 'ParsVT')}</u></a>
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
                        {assign var=COUNTER value=0}
                        {foreach key=BLOCK_NAME item=BLOCKS_DATA from=$JSON_DATA}
                            {if $BLOCKS_DATA}
                                <div>
                                    {assign var=COUNTER value=$COUNTER+1}
                                    <h4>
                                        {vtranslate($BLOCKS_DATA[0].heading, 'ParsVT')}
                                    </h4>
                                    {foreach item=BLOCK_DATA from=$BLOCKS_DATA}
                                        <div class="row">
                                            {if $BLOCK_DATA.image}
                                            <div class="col-lg-4" style="min-height: 100px;"><img
                                                        src="{$BLOCK_DATA.image}"
                                                        style="width: 100%;height: 100%;margin-top: 10px;"/>
                                            </div>
                                            <div class="col-lg-8">
                                                {else}
                                                <div class="col-lg-12">
                                                    {/if}
                                                    <div title="{$BLOCK_DATA.summary}">
                                                        <h3><b>{$BLOCK_DATA.displayTitle}</b></h3>
                                                        {$BLOCK_DATA.displaySummary}<br><br>
                                                    </div>
                                                    <a href="{$BLOCK_DATA.url}" target="_blank"><u>
                                                            {vtranslate($BLOCK_DATA.urlalt, 'ParsVT')}</u></a>
                                                    {if $BLOCK_DATA.image}
                                                </div>
                                                {else}
                                            </div>
                                            {/if}
                                        </div>
                                    {/foreach}
                                </div>
                                {if $COUNTER neq $DATA_COUNT}
                                    <hr>
                                {/if}
                            {/if}
                        {/foreach}
                    {/if}
                {else}
                    <div class="inActiveImgDiv">
                        <div>
                            <h4>
                                {vtranslate('Get more out of Vtiger with extensions from', 'ParsVT')}
                            </h4>
                            <h4>
                                {vtranslate('VTFarsi Marketplace', 'ParsVT')}</h4>
                        </div>
                        <a href="http://vtfarsi.ir/%D9%85%D8%A7%DA%98%D9%88%D9%84-%D9%88%DB%8C%D8%AA%D8%A7%DB%8C%DA%AF%D8%B1/" target="_blank" style="margin-right: 25px;"><img src="layouts/v7/modules/ParsVT/images/extensionstore.png" style="width: 85%; height: 100%; margin-top: 25px;"/></a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
    <script>
        jQuery(document).ready(function () {
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

            var slider = jQuery('.bxslider').bxSlider({
                auto: true,
                pause: 4000,
                nextText: "",
                prevText: "",
                autoHover: true
            });
            jQuery('.bx-prev, .bx-next, .bx-pager-item').live('click', function () {
                slider.startAuto();
            });
            jQuery('.bx-wrapper .bx-viewport').css('background-color', 'transparent');
            jQuery('.bx-wrapper .bxslider li').css('text-align', 'left');
            jQuery('.bx-wrapper .bx-pager').css('bottom', '-15px');

            var params = {
                theme: 'dark-thick',
                setHeight: '100%',
                advanced: {
                    autoExpandHorizontalScroll: true,
                    setTop: 0
                }
            };
            jQuery('.scrollContainer').mCustomScrollbar(params);
        });
    </script>
    </div>
{/strip}
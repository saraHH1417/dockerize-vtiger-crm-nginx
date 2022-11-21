{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<!DOCTYPE html>
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>{$COMPANY['companyname']} {$RESPONSE['title']}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../../../layouts/v7/modules/ParsGuard/css/global.css" rel="stylesheet" media="all">
    <link href="../../../layouts/v7/modules/ParsGuard/css/banner.css" rel="stylesheet" media="all">
</head>
<body class="gwd-gen-sp71" style="display: block;">
<!--[if IE]>
<center>
    <img src="../../../layouts/v7/modules/ParsGuard/images/gard.gif" style="width:1024px; height:auto;margin-top:50px;">
</center>
<style>
    body, #body .content.themeBlue {
        background-color: #1941C4;
    }
    #page1{ display:none; }
</style>
<![endif]-->
<div id="success"></div>
<div id="error"></div>

<div id="header" class="clear">
    <div class="wrapper">
        <header class="left">
            <h1 id="logo">

            </h1>
        </header>


    </div>
</div>

<div id="body">
    <div class="content clear themeBlue" id="Top">
        <div class="wrapper">
            <div class="gwd-page-container">

                <div id="page1" class="gwd-page-wrapper gwd-page-size" data-gwd-component-id="page1">
                    <div class="gwd-page-content gwd-page-size">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/0-logobanner.png" class="gwd-img-h02u" id="logobanner" data-gwd-component-id="logobanner">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/1-www.png" class="gwd-img-7v3u gwd-gen-xdzmgwdanimation gwd-img-2gpr gwd-gen-xdzmgwdanimation-gen-animation0keyframe" id="www1" data-gwd-component-id="www1">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/1-www.png" class="gwd-img-7v3u gwd-img-z6r4 gwd-gen-c6hsgwdanimation gwd-gen-c6hsgwdanimation-gen-animation0keyframe" id="www2" data-gwd-component-id="www2">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/3-org.png" class="gwd-img-yxyv gwd-gen-bjg3gwdanimation gwd-img-0x92 gwd-gen-bjg3gwdanimation-gen-animation0keyframe" id="org1" data-gwd-component-id="org1">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/3-org.png" class="gwd-img-yxyv gwd-img-dup8 gwd-gen-uu9ugwdanimation gwd-gen-uu9ugwdanimation-gen-animation0keyframe" id="org2" data-gwd-component-id="org2">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/5-com.png" class="gwd-img-9335 gwd-gen-fet8gwdanimation gwd-gen-fet8gwdanimation-gen-animation0keyframe" id="com1" data-gwd-component-id="com1">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/6-hack.png" class="gwd-img-qtqz gwd-gen-x707gwdanimation gwd-gen-x707gwdanimation-gen-animation0keyframe" id="hacker" data-gwd-component-id="hacker">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/7-malicious.png" class="gwd-img-1nd9 gwd-gen-x092gwdanimation gwd-gen-x092gwdanimation-gen-animation0keyframe" id="malicious" data-gwd-component-id="malicious">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/8-anonymous.png" class="gwd-img-o5f0 gwd-gen-jzcagwdanimation gwd-gen-jzcagwdanimation-gen-animation0keyframe" id="anonym" data-gwd-component-id="anonym">
                        <img src="../../../layouts/v7/modules/ParsGuard/images/9-spam.png" class="gwd-img-bek9 gwd-gen-ajdxgwdanimation gwd-gen-ajdxgwdanimation-gen-animation0keyframe" id="spam" data-gwd-component-id="spam">
                    </div>
                </div></div>

            <article id="About" data-type="background" data-speed="10">
                <header><h1>{$RESPONSE['message']}</h1></header>
                <div style="width:100%;margin:5% auto;text-align:center;font-size: 40px;color:#000;">
                    <p style="font-size: 25px;margin-top: 10px;color:#fff;">
                        {$RESPONSE['reason']}
                        <span style="font-size:60%;">Your current IP address ({$guestip}) is being logged.</span>
                        {if $RESPONSE['redirect'] eq "Yes"}
                        <br /><span style="font-size:60%;">You will be redirected to {$RESPONSE['url']}
                        </span><meta http-equiv="refresh" content="10;url={$RESPONSE['url']}">
                        {/if}
                    </p>
                </div>


            </article>
        </div>
    </div>


    <div id="footer" class="clear">

        <p>Copyright © 2012 - {$smarty.now|date_format:"%Y"}<a href="{$COMPANY['website']}" style="text-decoration:none;">{$COMPANY['companyname']}</a></p>
    </div>
</div>
</body>
</html>


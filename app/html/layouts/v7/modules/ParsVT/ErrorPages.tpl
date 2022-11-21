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
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex" />
    <meta name="author" content="VTFarsi.ir">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <title>{$PAGETITLE}</title>
    <link type="text/css" href="{$SITEURL}layouts/v7/lib/todc/css/bootstrap.min.css" rel="stylesheet">  <!--BOOTSTRAP 3 CSS FILE-->
    <link type="text/css" href="{$SITEURL}layouts/v7/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet"> <!--Font Awesome CSS FILE-->
    <link type="text/css" href="{$SITEURL}modules\ParsVT\resources\styles\css\ErrorPages.css" rel="stylesheet">  <!--CUSTOM CSS FILE-->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<section>
    <div class="container">
        <div class="row row1">
            <div class="col-md-12">
                <h3 class="center capital f1 wow fadeInLeft" data-wow-duration="2s">Something went Wrong!</h3>
                <h1 id="errorCode" class="center wow fadeInRight" data-wow-duration="2s">0</h1>
                <p class="center wow bounceIn" data-wow-delay="2s">{$DESC}!</p>
                <p class="center wow bounceIn" data-wow-delay="2s"><small><small>your current IP address ({$USERIP}) is being logged.</small></small></p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div id="cflask-holder" class="wow fadeIn" data-wow-delay="2800ms">
                            <span class="wow tada " data-wow-delay="3000ms"><i class="fa fa-flask fa-5x flask wow flip" data-wow-delay="3300ms"></i>
                                <i id="b1" class="bubble"></i>
                                <i id="b2" class="bubble"></i>
                                <i id="b3" class="bubble"></i>
                            </span>
                </div>
            </div>
        </div>

{*        <div class="row"> <!--Links Start-->
            <div class="col-md-12">
                <div class="links-wrapper col-md-6 col-md-offset-3">
                    <ul class="links col-md-6">
                        <li class="wow fadeInRight" data-wow-delay="4400ms"><a href="{$SITEURL}"><i class="fa fa-home fa-2x"></i></a></li>
                        <li class="wow fadeInRight" data-wow-delay="4300ms"><a href="https://www.facebook.com/ParsvTiger"><i class="fa fa-facebook fa-2x"></i></a></li>
                        <li class="wow fadeInRight" data-wow-delay="4200ms"><a href="https://twitter.com/Awebict"><i class="fa fa-twitter fa-2x"></i></a></li>
                        <li class="wow fadeInLeft" data-wow-delay="4200ms"><a href="https://plus.google.com/118049077981107931477/posts"><i class="fa fa-google-plus fa-2x"></i></a></li>
                    </ul>

                </div>
            </div>
        </div> <!-- Links End-->*}
    </div>
</section>
<!--ADDING THE REQUIRED SCRIPT FILES-->
<script type="text/javascript" src="{$SITEURL}layouts/v7/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" src="{$SITEURL}layouts/{vglobal('default_layout')}/modules/ParsVT/resources/EPages.js"></script>
<!--Initiating the CountUp Script-->
<script type="text/javascript">
    "use strict";
    var count = new countUp("errorCode", 0,  {$CODE}, 0, 3);
    window.onload = function() {
        count.start();
    }
    "use strict";
    var wow = new WOW(
        {
            animateClass: 'animated',
            offset:       100
        }
    );
    wow.init();
</script>
</body>
</html>
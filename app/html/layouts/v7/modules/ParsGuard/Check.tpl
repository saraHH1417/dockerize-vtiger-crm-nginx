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
<html lang="en">

<head>
    <title>{$COMPANY['companyname']}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../../layouts/v7/modules/ParsGuard/css/bootstrap.css" media="screen">
</head>
<body>


<div class="container">

    <div class="page-header">
        <div class="row">
            <div class="col-lg-12">
                <div class="bs-example">
                    <div class="jumbotron">
                        <p><img src="../../../layouts/v7/modules/ParsGuard/images/logo2.png" width="120px" height="120px"/> Pars Guard</p>
                        <span>Pars Guard is a tool that protects your site from SQLi (SQL Injection), Cross-Site Scripting, DDoS and other hacking attacks</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-header" style="margin-top:-150px;">
        <h1>Features</h1>
    </div>
    <div class="row">
        <div class="col-sm-4">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">SQL Injection Protection (SQLi)</h3>
                </div>
                <div class="panel-body">
                    The script can detect and block SQLi (SQL Injection). It has an option to record them into the database with the attacked url of your site. Then they can be reviewed in the admin panel.<br /><br />
                    If you want to test the SQLi Protection just click on the button below or copy the link. <br />
                    <br /><center><a href="{$SITEURL}index.php?id=1%20UNION%20SELECT%20name,%20password%20FROM%20admin" type="button" class="btn btn-primary">Test</a></center><br />
                    <input type="text" style="width:100%" value="{$SITEURL}index.php?id=1%20UNION%20SELECT%20name,%20password%20FROM%20admin" />
                </div>
            </div>

        </div><!-- /.col-sm-4 -->

        <div class="col-sm-4">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Blocking Spammers</h3>
                </div>
                <div class="panel-body">
                    The script is integrated with one of the most popular DNSBL (Spam Databases) and when a spammer comes to your site it will be blocked and forwarded to another page. DNSBL (Spam Databases) can be edited. Spammers are recorded in the database and then they can be reviewed in the admin panel.
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">DDoS Blocking</h3>
                </div>
                <div class="panel-body">
                    The script can detect DDoS Attacks and block them. It has an option to record them into the database, and then they can be reviewed in the admin panel.
                </div>
            </div>

        </div><!-- /.col-sm-4 -->

        <div class="col-sm-4">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">XSS Prevention</h3>
                </div>
                <div class="panel-body">
                    The script can detect XSS and block them. It has an option to record them into the database, and then they can be reviewed in the admin panel.<br /><br />
                    To use the XSS Prevention in your site you should just do this:<br />
                    <font color="blue">secure($string);</font><br />
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Proxy Detection</h3>
                </div>
                <div class="panel-body">
                    The script can detect visitors using proxy and block them or forward them to another page. It has an option to record them into the database, and then they can be reviewed in the admin panel.
                </div>
            </div>

        </div><!-- /.col-sm-4 -->
    </div>

</div>

<footer>
    <div class="row">
        <div class="col-lg-12">
            <p>{$smarty.now|date_format:"%Y"} © <a href="http://vtfarsi.ir">VTFarsi</a></p>
        </div>
    </div>
</footer>

</div>

</body>
</html>
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{strip}
<style>
.blink_me {
  animation: blinker 3s linear infinite;
  font-weight: bold;
}

@keyframes blinker {  
  50% { opacity: 0.5; }
}
</style>
    <div class="editContainer container-fluid" style="padding-left: 3%;padding-right: 3%; margin-top: 20px;">
        <h3>
            {vtranslate($QUALIFIED_MODULE,$QUALIFIED_MODULE)}
        </h3>
        <hr>
        <div id="breadcrumb">
            <ul class="crumbs marginLeftZero">
                <li class="first step active"  style="z-index:9" id="step1">
                    <a>
                        <span class="stepNum">&nbsp;</span>
                        <span class="stepText">{vtranslate('Upgrade',$QUALIFIED_MODULE)}</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="installationContents" style="padding-left: 3%;padding-right: 3%">
        <div class="padding1per" style="border:1px solid #ccc;padding: 1%;">
            <div class="row" style="margin-bottom:10px;">
                <span class="col-sm-2" style="text-align: right;"><strong>{vtranslate('vTiger URL:',$QUALIFIED_MODULE)}</strong></span>
                <span class="col-sm-6" style="{if $LANGUAGE eq 'fa_ir'}text-align:right;{/if}direction:ltr;">{$INFO['site_url']}</span>
            </div>
            <div class="row" style="margin-bottom:10px;">
                <span class="col-sm-2" style="text-align: right"><strong>{vtranslate('License Key:',$QUALIFIED_MODULE)}</strong></span>
                <span class="col-sm-6">{$INFO['license']} (<a href="index.php?module={$QUALIFIED_MODULE}&parent=Settings&view=License"><strong>{vtranslate('Manage License',$QUALIFIED_MODULE)}</strong></a>)</span>
            </div>
            <div class="row" style="margin-bottom:10px;">
                <span class="col-sm-2" style="text-align: right"><strong>{vtranslate('Current Version:',$QUALIFIED_MODULE)}</strong></span>
                <span class="col-sm-6">{$INFO['version']}</span>
            </div>
            <div class="row" style="margin-bottom:10px;">
                <span class="col-sm-2" style="text-align: right"><strong>{vtranslate('Current Patch:',$QUALIFIED_MODULE)}</strong></span>
                <span class="col-sm-6">{$INFO['patch']}</span>
            </div>
            <div class="row" style="margin-bottom:10px;">
                <span class="col-sm-2" style="text-align: right"><strong>{vtranslate('License Type:',$QUALIFIED_MODULE)}</strong></span>
                <span class="col-sm-6">{vtranslate($INFO['type'],$QUALIFIED_MODULE)}</span>
            </div>


            {if !$INTERNET}
                <div class="control-group alert alert-danger">
                    <div>
                        <span>
                            {vtranslate('Unable to connect to the internet. This may be a temporary network issue. Check your network and try again. If the problem persists, contact network administrator',$QUALIFIED_MODULE)}
                        </span>
                    </div>
                </div>
            {else}
                <div class="control-group alert alert-{if $UpdateStatus}warning{else}info{/if}" style="text-align: center;">
                    <div {if $UpdateStatus}class="blink_me"{/if}>{vtranslate($MESSAGE, $QUALIFIED_MODULE)}&nbsp;&nbsp;{$UPDATE_DETAILS}{if $UPDATE_DESC}<br /><br /><kbd style="font-family: inherit; font-size: 1.5rem;">{$UPDATE_DESC}</kbd>{/if}</div>
                        {$UPDATE_BTN}
            </div>
            {/if}
            {if $UpdateStatus}
                <div class="control-group">
                    <div><span>{vtranslate('Having trouble installing?',$QUALIFIED_MODULE)} {vtranslate('Please Contact Us!',$QUALIFIED_MODULE)}</span></div>
                </div>
                <div class="control-group">
                    <ul style="padding: 0 20px;">
                        <li>&nbsp;&nbsp;<a href="http://forum.vtfarsi.ir/">{vtranslate('Ask the Community',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/crm-wiki/">{vtranslate('Read our Docs',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/vtiger-crm-book/">{vtranslate('Read our Book',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://my.vtfarsi.ir/submitticket.php">{vtranslate('Open Ticket',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="tel:09388019100">{vtranslate('Phone Support',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/">{vtranslate('Live Support',$QUALIFIED_MODULE)}</a></li>
                    </ul>
                </div>
           {/if}
        </div>
    </div>
{/strip}
<script type="text/javascript">
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
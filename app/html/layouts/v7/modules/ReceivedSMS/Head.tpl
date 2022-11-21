{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<script>
jQuery(document).ready(function() {
    Vtiger_Index_Js.getInstance().registerEvents();
});
$(function() {
$("#Pars{$smarty.get.view}").addClass("active");
});
</script>
<style>
.blink_me {
  animation: blinker 3s linear infinite;
}

@keyframes blinker {  
  50% { opacity: 0; }
}
</style>
<div class="" style="margin-top:10px;">
	<h3>{vtranslate('Received SMS Settings', $MODULE)}</h3>
	<ul id="tabs" class="nav nav-tabs nav-pills" data-tabs="tabs">
		<li  id="ParsIndex" class="nav-item"><a href="index.php?module=ReceivedSMS&parent=Settings&view=Settings">{vtranslate('Dashboard', $MODULE)}</a></li>
		{if $accept_sms}<li  id="ParsConfig" class="nav-item"><a href="index.php?module=ReceivedSMS&parent=Settings&view=Config">{vtranslate('General Settings', $MODULE)}</a></li>{/if}
		{if $accept_lead}<li  id="ParsLead" class="nav-item"><a href="index.php?module=ReceivedSMS&parent=Settings&view=Lead">{vtranslate('Incoming Leads', $MODULE)}</a></li>{/if}
		{if $accept_helpdesk}<li  id="ParsHelpDesk" class="nav-item"><a href="index.php?module=ReceivedSMS&parent=Settings&view=HelpDesk">{vtranslate('Incoming Tickets', $MODULE)}</a></li>{/if}
		{if $advanced_mode}<li  id="ParsAdvMode" class="nav-item"><a href="index.php?module=ReceivedSMS&parent=Settings&view=AdvMode">{vtranslate('Advanced mode', $MODULE)}</a></li>{/if}
		{if $custom_mode}<li id="ParsCustom" ><a href="index.php?module=ReceivedSMS&parent=Settings&view=Custom">{vtranslate('Custom Parameters', $MODULE)}</a></li>{/if}
		{if $accept_sms}<li id="ParsProvider" class="nav-item"><a href="index.php?module=ReceivedSMS&parent=Settings&view=Provider">{vtranslate('Provider Options', $MODULE)}</a></li>{/if}
		<li id="ParsInfo" class="nav-item"><a href="index.php?module=ReceivedSMS&parent=Settings&view=Info">{vtranslate('Usage Manaual', $MODULE)}</a></li>
		<li id="ParsSMSNotifier" class="nav-item"><a href="index.php?module=ReceivedSMS&parent=Settings&view=SMSNotifier">{vtranslate('SMSNotifier', $MODULE)}</a></li>

	</ul>
{if $RELEASE_NOTIF}
<div class="blink_me" id="backupmsg" style=" margin:0 auto;text-align: center;"><a href='index.php?parent=Settings&module={$MODULE}&view=Upgrade'>
   <span class="btn btn-info">
   {$RELEASE_NOTIF}
   </span>
   </a>
</div>
{/if}
</div>

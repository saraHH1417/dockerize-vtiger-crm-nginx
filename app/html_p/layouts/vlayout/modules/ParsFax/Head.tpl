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
	<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
		<li  id="ParsProvider"><a href="index.php?module=ParsFax&parent=Settings&view=Provider">{vtranslate('Provider Options', $MODULE)}</a></li>
		<li id="ParsGeneralSettings"><a href="index.php?module=ParsFax&parent=Settings&view=GeneralSettings">{vtranslate('General Settings', $MODULE)}</a></li>
		<li id="ParsFaxLog"><a href="index.php?module=ParsFax&parent=Settings&view=FaxLog">{vtranslate('Fax Log', $MODULE)}</a></li>
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

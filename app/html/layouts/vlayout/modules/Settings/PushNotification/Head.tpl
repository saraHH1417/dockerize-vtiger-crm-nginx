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

<div class="" style="margin-top:10px;">
	<h3>{vtranslate('Push Notification Settings', $MODULE)}</h3>
	<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
		<li  id="ParsIndex" ><a href="index.php?module=PushNotification&parent=Settings&view=Settings">{vtranslate('Settings', 'PushNotification')}</a></li>
		<li id="ParsList" ><a href="index.php?module=PushNotification&parent=Settings&view=List">{vtranslate('Logs', 'PushNotification')}</a></li>
		<li id="ParsInfo" ><a href="index.php?module=PushNotification&parent=Settings&view=Info">{vtranslate('Manual', 'PushNotification')}</a></li>

	</ul>
</div>
{if $CRMV7}
<script>
jQuery(document).ready(function() {
    Vtiger_Index_Js.getInstance().registerEvents();
});
</script>
{/if}
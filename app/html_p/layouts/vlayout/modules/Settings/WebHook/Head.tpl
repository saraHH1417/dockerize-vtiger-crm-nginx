{*<!--
/* ********************************************************************************
 * The content of this file is subject to the WebHook ("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is AWEBICT.NET
 * Portions created by AWEBICT.NET. are Copyright(C) AWEBICT.NET.
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<script>
$(function() {
$("#Pars{$smarty.get.view}").addClass("active");
});
</script>

<div class="" style="margin-top:10px;">
	<h3>{vtranslate('WebHook Settings', $MODULE)}</h3>
	<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
		<li  id="ParsIndex" ><a href="index.php?module=WebHook&parent=Settings&view=Settings">{vtranslate('Settings', 'WebHook')}</a></li>
		<li id="ParsList" ><a href="index.php?module=WebHook&parent=Settings&view=List">{vtranslate('Logs', 'WebHook')}</a></li>
		<li id="ParsManual" ><a href="index.php?module=WebHook&parent=Settings&view=Manual">{vtranslate('User Manual', 'WebHook')}</a></li>
		<li id="ParsDevelopment" ><a href="index.php?module=WebHook&parent=Settings&view=Development">{vtranslate('Development Manual', 'WebHook')}</a></li>

	</ul>
</div>
{if $CRMV7}
<script>
jQuery(document).ready(function() {
    Vtiger_Index_Js.getInstance().registerEvents();
});
</script>
{/if}
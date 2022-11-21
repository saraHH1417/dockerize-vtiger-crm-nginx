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

<div class="" style="margin-top:0px;">
	<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
		<li  id="ParsSettings" ><a href="index.php?module=ParsVT&view=Settings">{vtranslate('Settings', $MODULE)}</a></li>
		{if $DisplayFeilds['SHOWIRCAL'] || $smarty.get.view eq 'ShowEvent'}
		<li id="ParsShowEvent" ><a href="index.php?module=ParsVT&view=ShowEvent&date={$smarty.now|date_format:"%Y-%m-%d"}">{vtranslate('Month Events', $MODULE)}</a></li>
		{/if}
		{if $DisplayFeilds['SHOWSALAH'] || $smarty.get.view eq 'PrayTimes' || $smarty.get.view eq 'Qiblah'}
		<li id="ParsPrayTimes" ><a href="index.php?module=ParsVT&view=PrayTimes">{vtranslate('Pray Times', $MODULE)}</a></li>
		<li id="ParsQiblah" ><a href="index.php?module=ParsVT&view=Qiblah">{vtranslate('Qiblah', $MODULE)}</a></li>
		{/if}

	</ul>
</div>
<script>
jQuery(document).ready(function() {
    Vtiger_Index_Js.getInstance().registerEvents();
});
</script>

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
		$("#{$smarty.get.view}Tab").addClass("active");
	});
</script>

<div class="" style="margin-top:10px;">
	<ul>
		<div class="" style="margin-top:10px;">
			<h3>{vtranslate('HylaFax', $MODULE)}</h3>
			<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
				<li  id="FaxListTab"><a href="index.php?module=HylaFax&parent=Settings&view=FaxList">{vtranslate('FaxList', $MODULE)}</a></li>
				<li  id="FaxConfigTab"><a href="index.php?module=HylaFax&parent=Settings&view=FaxConfig">{vtranslate('FaxConfig', $MODULE)}</a></li>
			</ul>
		</div>
	</ul>
</div>

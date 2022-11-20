{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:0px;">
	<h3>{vtranslate('HylaFax', $MODULE)}</h3>
	<ul id="tabs" class="nav nav-tabs nav-pills" data-tabs="tabs">
		{if $HASTOKEN}<li  id="FaxListTab"><a href="index.php?module=HylaFax&parent=Settings&view=FaxList">{vtranslate('List', $MODULE)}</a></li>{/if}
		{if $HASTOKEN}<li  id="SendFaxTab"><a href="index.php?module=HylaFax&parent=Settings&view=SendFax">{vtranslate('Send Fax', $MODULE)}</a></li>{/if}
		<li  id="FaxConfigTab"><a href="index.php?module=HylaFax&parent=Settings&view=FaxConfig">{vtranslate('Configuration', $MODULE)}</a></li>
		<li  id="RuntimesTab"><a href="index.php?module=HylaFax&parent=Settings&view=Runtimes">{vtranslate('Runtimes', $MODULE)}</a></li>
		<li  id="ManualTab"><a href="index.php?module=HylaFax&parent=Settings&view=Manual">{vtranslate('Manual', $MODULE)}</a></li>
	</ul>
</div>
<script>
	jQuery(document).ready(function() {
		$("#{$smarty.get.view}Tab").addClass("active");
		Vtiger_Index_Js.getInstance().registerEvents();
	});
</script>

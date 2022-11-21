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
	<script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Barcode/JsBarcode.all.min.js"></script>
    {*https://github.com/lindell/JsBarcode/wiki/Options*}
	{assign var="FIELD_INFO" value=Vtiger_Util_Helper::toSafeHTML(Zend_Json::encode($FIELD_MODEL->getFieldInfo()))}
	{assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
	{assign var="FIELD_VALUE" value=$FIELD_MODEL->get('fieldvalue')}
	<script>
        var barcodeparams = {
            format: "CODE39",
            lineColor: "#2D2D2D",
            width: 1,
            height: 40,
            displayValue: true
        };

		function displayBarCode(obj){
			JsBarcode("#"+obj.name+"_display", obj.value, barcodeparams);
		}

	</script>

	<input type="text" class="inputElement "  name="{$FIELD_NAME}" tabindex="{$vt_tab}" id="{$MODULE}_editView_fieldName_{$FIELD_MODEL->get('name')}" value="{$FIELD_MODEL->get('fieldvalue')}" class="detailedViewTextBox" onFocus="this.className='detailedViewTextBoxOn'" onBlur="this.className='detailedViewTextBox';displayBarCode(this);" onChange="displayBarCode(this);" onKeyup="displayBarCode(this);"/>
	<br/>

	<img id="{$FIELD_NAME}_display"/>
	{if $FIELD_MODEL->get('fieldvalue') != ''}
        <script>
            JsBarcode("#{$FIELD_MODEL->get('name')}"+"_display", "{$FIELD_MODEL->get('fieldvalue')}", barcodeparams);
        </script>
	{/if}
{/strip}
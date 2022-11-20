{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{if $FIELD_MODEL->get('fieldvalue') neq ''}
  <script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Barcode/JsBarcode.all.min.js"></script>
  {*https://github.com/lindell/JsBarcode/wiki/Options*}
  <img id="{$FIELD_NAME}_display">
{/if}
<script>
  /*Modified by Manasa :: 06th DEC 2017 if we went related list again back to detail view. If value is empty. Throwing error*/
  var barcodenum = "{$FIELD_MODEL->get('fieldvalue')}";
  if(barcodenum !== ''){
    var barcodeparams = {
      format: "CODE39",
      lineColor: "#2D2D2D",
      width: 1,
      height: 40,
      displayValue: true
    };
    JsBarcode("#{$FIELD_NAME}_display", "{$FIELD_MODEL->get('fieldvalue')}", barcodeparams);
  }
</script>

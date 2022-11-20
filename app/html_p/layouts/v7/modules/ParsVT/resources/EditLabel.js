/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class("ParsVT_EditLabel_Js",{},{registerSaveButtonEvent:function(){jQuery(".btn-success").on("click",function(e){var t=jQuery("#moduleBlocksAndFields").serializeFormData();if(void 0!==typeof t){var n=jQuery.progressIndicator({position:"html",blockInfo:{enabled:!0}}),i={module:app.getModuleName(),action:"SaveLabel",data:t};AppConnector.request(i).then(function(e){n.progressIndicator({mode:"hide"}),app.helper.showSuccessNotification({message:app.vtranslate(e.result.message)})},function(e,t){})}})},registerBackLink:function(){jQuery("#backLink").on("click",function(e){window.history.back()})},registerEvents:function(){this.registerBackLink(),this.registerSaveButtonEvent()}}),jQuery(document).ready(function(){(new ParsVT_EditLabel_Js).registerEvents()});
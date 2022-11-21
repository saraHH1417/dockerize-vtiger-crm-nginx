/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class("ParsVTManual_Js",{},{registerActiveEvent:function(){jQuery("#InstallModule").on("click",".runtime",function(e){var n={};n.module=app.getModuleName(),n.parent=app.getParentModuleName(),n.action="PersianPack",n.mode="Manual";jQuery.progressIndicator({message:"",position:"html",blockInfo:{enabled:!0}});return AppConnector.request(n).then(function(e){app.helper.hideProgress(),e.success&&(app.helper.showSuccessNotification({message:e.result.message}),e.result.refresh&&setTimeout(function(){window.location.reload(1)},3e3))},function(e){console.log("error =",e),app.helper.hideProgress()}),!1})},registerEvents:function(){this.registerActiveEvent()}}),jQuery(document).ready(function(){(new ParsVTManual_Js).registerEvents()});
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
var Settings_ListLabel_Js={registerSubmitButton:function(){jQuery(".lblLangEdit").on("click",function(t){var e=jQuery("#langAndModulForm").serializeFormData();window.location.href="index.php?module=ParsVT&parent=Settings&view=EditLabel&lang="+e.language+"&moduleId="+e.module+"&block="+e.settings_block+"&fieldid="+e.settings_fieldid})},registerEvents:function(){Settings_ListLabel_Js.registerSubmitButton()}};jQuery(document).ready(function(){Settings_ListLabel_Js.registerEvents(),vtUtils.enableTooltips()});
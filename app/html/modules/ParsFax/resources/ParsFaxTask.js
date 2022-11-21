/*********************************************************************************
 * The content of this file is subject to the PDF Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir Team
 * Portions created by VTFarsi.ir Team are Copyright(C) VTFarsi.ir Team
 * All Rights Reserved.
 ********************************************************************************/

Settings_Workflows_Edit_Js.prototype.preSaveParsFaxTask = function(tasktype) {
    var textAreaElement = jQuery('#content');

    textAreaElement.val(CKEDITOR.instances['content'].getData());
}
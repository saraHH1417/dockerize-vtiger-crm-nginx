/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

/** @class ModuleLinkCreator */
Vtiger.Class("ModuleLinkCreator", {}, {
    registerEvents: function () {
        var thisInstance = this;
    }
});

jQuery(document).ready(function () {
    var instance = new ModuleLinkCreator();
    instance.registerEvents();

});
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
Settings_Vtiger_List_Js("Settings_RecordCreator_List_Js", {
    
    triggerCreate : function(url) {
        window.location.href = url;
    },
    triggerDelete: function (event, url) {
        event.stopPropagation();
        var instance = Vtiger_List_Js.getInstance();
        instance.DeleteRecord(url);
    }
}, {
    DeleteRecord: function (url) {
        var thisInstance = this;
        var message = app.vtranslate('LBL_DELETE_CONFIRMATION');
        app.helper.showConfirmationBox({'message': message}).then(
            function (e) {
                app.request.post({url: url}).then(
                    function (data) {
                        document.location = "index.php?module=RecordCreator&parent=Settings&view=List";
                    });
            });
    },
   
});

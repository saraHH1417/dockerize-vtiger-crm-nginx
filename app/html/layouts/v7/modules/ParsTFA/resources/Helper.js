/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

var Vtiger_ParsTFA_Js = {
    registerSettingsBtn: function () {
        var params = {};
        params['action'] = 'ActionAjax';
        params['module'] = 'ParsTFA';
        params['mode'] = 'checkEnable';
        params['record'] = app.getRecordId();
        if ((app.view() == 'Detail' || app.view() == 'PreferenceDetail') && app.getModuleName() == 'Users') {
            app.request.post({data: params}).then(
                function (err, data) {
                    if (err == null) {
                        if (data.enable == '1') {
                            var sPageURL = window.location.search.substring(1);
                            var targetModule = '';
                            var targetView = '';
                            var targetRecord = '';
                            var sURLVariables = sPageURL.split('&');
                            for (var i = 0; i < sURLVariables.length; i++) {
                                var sParameterName = sURLVariables[i].split('=');
                                if (sParameterName[0] == 'module') {
                                    targetModule = sParameterName[1];
                                }
                                else if (sParameterName[0] == 'view') {
                                    targetView = sParameterName[1];
                                }
                                else if (sParameterName[0] == 'record') {
                                    targetRecord = sParameterName[1];
                                }
                            }
                            if (targetModule == 'Users' && (targetView == 'Detail' || targetView == 'PreferenceDetail')) {
                                var buttonContainer = jQuery('.detailViewContainer');
                                var btnToolBar = buttonContainer.find('.btn-group');
                                var outGoingServerBtn = jQuery(data.button);
                                btnToolBar.find("ul.dropdown-menu").append(outGoingServerBtn);
                            }
                        }
                    }

                }
            );

        }
    },
    //end utils
    /**
     * Function to register required events
     */
    registerEvents: function () {
        var thisInstance = this;
        thisInstance.registerSettingsBtn();
    }

};
//On Page Load
jQuery(document).ready(function () {
    Vtiger_ParsTFA_Js.registerEvents();
});


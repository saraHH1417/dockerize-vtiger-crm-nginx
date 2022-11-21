/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

jQuery.Class("ModuleLinkCreator_Upgrade_Js", {}, {
    registerEventForUpgradeButton: function () {
        var that = this;
        var id = jQuery("#update_id").val();
        var type = jQuery("#update_type").val();
        var version = jQuery("#update_version").val();
        var patch = jQuery("#update_patch").val();
        var msg = jQuery("#update_msg").val();
        var licensekey = jQuery("#licensekey").val();
        var ptype = jQuery("#ptype").val();
        var pid = jQuery("#pid").val();
        jQuery('button[name="btnUpgrade"]').on('click', function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': msg,
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });
            var params = {};
            params['module'] = app.getModuleName();
            params['action'] = 'Upgrade';
            params['mode'] = 'upgradeModule';
            params['id'] = id;
            params['type'] = type;
            params['version'] = version;
            params['patch'] = patch;
            params['licensekey'] = licensekey;
            params['pid'] = pid;
            params['ptype'] = ptype;

            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success) {
                        if (data.result.status === true) {
			var params = {
                            text: data.result.message,
                            type: 'info'
                        };
                        that.showNotify(params);


                            setTimeout(function () {
                                window.location.reload(1);
                            }, 3000);
                        } else {
			var params = {
                            text: data.result.message,
                            type: 'error'
                        };
                        that.showNotify(params); 

                        }
                    }
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
		    var params = {
                        text: app.vtranslate('Upgrade Failed'),
                        type: 'error'
                    };
                    that.showNotify(params);

                }
            );
        });
    },

    showNotify: function (customParams) {
        var params = {
            title: app.vtranslate('JS_MESSAGE'),
            text: customParams.text,
            animation: 'show',
            type: customParams.type
        };
        Vtiger_Helper_Js.showPnotify(params);
    },
    registerEvents: function () {
        this.registerEventForUpgradeButton();
    }
});


jQuery(document).ready(function () {
    var ModuleLinkCreatorUpgradeInstance = new ModuleLinkCreator_Upgrade_Js();
    ModuleLinkCreatorUpgradeInstance.registerEvents();
})
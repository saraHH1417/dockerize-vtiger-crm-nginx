/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
var PageListCount=0;
jQuery.Class("FaxList_Js", {}, {
    registerHylaFaxConfigEvent: function () {
        var self = this;
        $('.setFaxInfo').click(function(e) {
            var form_data = $("#faxConfigInfo").serialize();

            var thisInstance 				= this;
            var aDeferred 	 				= jQuery.Deferred();
            var progressIndicatorElement 	= jQuery.progressIndicator({
                'position' 		: 'html',
                'message' 		: app.vtranslate('Please Wait'),
                'blockInfo' 	: {
                    'enabled' 	: true
                }
            });


            form_data['module'] = app.getModuleName();
            AppConnector.request(form_data).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                    // alert(JSON.stringify(data.result));
                    var params = {};
                    if(data.result.success){
                        app.helper.showSuccessNotification({'message': app.vtranslate('Settings saved successfully')});
                        window.location.reload();
                    }
                    else{
                        app.helper.showErrorNotification({"message": data.result[0]});
                    }
                }
            );
            return aDeferred.promise();
        });
	},
    revokeHylaFaxConfigEvent: function () {
        var self = this;
        $('.revokeFaxInfo').click(function(e) {
            var message = app.vtranslate('Do you want revoke fax config data?');
            app.helper.showConfirmationBox({'message' : message}).then(function(data) {
                    var aDeferred = jQuery.Deferred();
                    app.helper.showProgress();
                    var params = {
                        'module' : app.getModuleName(),
                        'revoke':'ok',
                        'parent':'Settings',
                        'mode':'revokeFaxConfig',
                        'action':'ActionAjax'
                    }
                    AppConnector.request(params).then(
                        function (data) {
                            if(data.result.success){
                                app.helper.showSuccessNotification({'message': app.vtranslate('Fax Configuration Revoked')});
                                window.location.reload();
                            }
                            else{
                                app.helper.showErrorNotification({"message": app.vtranslate("Unknown Error")});
                            }
                        }
                    );
                    app.helper.hideProgress();
                    return aDeferred.promise();
                },
                function(error, err){
                }
            );
        });
	},
    deleteHylaFaxRecordEvent: function () {

        var self = this;
        $('.btn_deleteFax').click(function (e) {
            var message = app.vtranslate('Do you want Delete fax Record?');
            var clicked = $(e.target);
            var _id = $(this).data("id");
            app.helper.showConfirmationBox({'message': message}).then(function (data) {
                var thisInstance = this;
                var aDeferred = jQuery.Deferred();
                var progressIndicatorElement = jQuery.progressIndicator({
                    'position': 'html',
                    'message': app.vtranslate('Please Wait'),
                    'blockInfo': {
                        'enabled': true
                    }
                });
                var params = {
                    'module': app.getModuleName(),
                    'id': _id,
                    'parent': 'Settings',
                    'action': 'ActionAjax',
                    'mode': 'DeleteFax',
                }
                AppConnector.request(params).then(
                    function (data) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        if (data.result.success) {
                            app.helper.showSuccessNotification({'message': app.vtranslate('Fax Record Deleted')});
                            window.location.reload();
                        } else {
                            app.helper.showErrorNotification({"message": "Unknown Error"});
                        }
                    }
                );
                return aDeferred.promise();
            });
        });
	},
    registerParsFaxProviderEvent: function () {
        var self = this;
        $('.setupProvider').click(function(e) {
            var aDeferred = jQuery.Deferred();
            app.helper.showProgress();
            var params = {
                'module' : app.getModuleName(),
                'parent':'Settings',
                'mode':'setupProvider',
                'action':'ActionAjax'
            }
            AppConnector.request(params).then(
                function (data) {
                    if(data.result.success){
                        app.helper.showSuccessNotification({'message': app.vtranslate('HylaFax Provider Installed Successfully')});
                        window.location.reload();
                    }
                    else{
                        app.helper.showErrorNotification({"message": app.vtranslate('Please make sure the following path "modules/ParsFax/providers/" is writable!')});
                    }
                });
            app.helper.hideProgress();
            return aDeferred.promise();
        });
    },

	registerEvents : function() {
		var self = this;
		self.registerHylaFaxConfigEvent();
		self.revokeHylaFaxConfigEvent();
		self.deleteHylaFaxRecordEvent();
		self.registerParsFaxProviderEvent();
	}
});
jQuery(document).ready(function () {
    var HylaFax_FaxList_Js = new FaxList_Js();
    HylaFax_FaxList_Js.registerEvents();
})
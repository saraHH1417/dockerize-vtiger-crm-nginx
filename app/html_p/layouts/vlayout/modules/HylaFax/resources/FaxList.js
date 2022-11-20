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
                'message' 		: app.vtranslate('PLEASE WAIT'),
                'blockInfo' 	: {
                    'enabled' 	: true
                }
            });

            var params = {
                'module' : app.getModuleName(),
                'data' : form_data,
            }
            AppConnector.request(params).then(
                function(data) {
                    progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                    // alert(JSON.stringify(data.result));
                    var params = {};
                    if(data.result.error){
                        params['text'] = app.vtranslate(JSON.stringify(data.result[0]));
                        params['type'] = 'error';
                    }
                    else{
                        params['text'] = app.vtranslate('FAX INFO SAVED');
                        params['type'] = 'success';
                    }

                    Settings_Vtiger_Index_Js.showMessage(params);
                    aDeferred.resolve(data);
                    window.location.reload();
                },
                function(error) {
                    progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                    aDeferred.reject(error);
                }
            );
            return aDeferred.promise();
        });
	},

    revokeHylaFaxConfigEvent: function () {
        var self = this;
        $('.revokeFaxInfo').click(function(e) {
            var response = confirm('Do you want revoke fax config data?');
            if(response){
                var thisInstance 				= this;
                var aDeferred 	 				= jQuery.Deferred();
                var progressIndicatorElement 	= jQuery.progressIndicator({
                    'position' 		: 'html',
                    'message' 		: app.vtranslate('PLEASE WAIT'),
                    'blockInfo' 	: {
                        'enabled' 	: true
                    }
                });

                var params = {
                    'module' : app.getModuleName(),
                    'data' : {
                        'revoke':'ok',
                        'parent':'Settings',
                        'action':'revokeFaxConfig',
                        'module':'HylaFax'
                    },
                }
                AppConnector.request(params).then(
                    function(data) {
                        progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                        // alert(JSON.stringify(data.result));
                        var params = {};
                        if(data.result.error){
                            params['text'] = app.vtranslate(JSON.stringify(data.result[0]));
                            params['type'] = 'error';
                        }
                        else{
                            params['text'] = app.vtranslate('FAX CINFIG INFO REVOKE');
                            params['type'] = 'success';
                        }

                        Settings_Vtiger_Index_Js.showMessage(params);
                        aDeferred.resolve(data);
                        window.location.reload();
                    },
                    function(error) {
                        progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                        aDeferred.reject(error);
                    }
                );
                return aDeferred.promise();
            }
        });
	},

    deleteHylaFaxRecordEvent: function () {
        var self = this;
        $('.btn_deleteFax').click(function(e) {
            var response = confirm('Do you want Delete fax Record?');
            if(response){
                var thisInstance 				= this;
                var aDeferred 	 				= jQuery.Deferred();
                var progressIndicatorElement 	= jQuery.progressIndicator({
                    'position' 		: 'html',
                    'message' 		: app.vtranslate('PLEASE WAIT'),
                    'blockInfo' 	: {
                        'enabled' 	: true
                    }
                });
                var _id = $(this).attr("data-id");
                var params = {
                    'module' : app.getModuleName(),
                    'data' : {
                        'id':_id,
                        'parent':'Settings',
                        'action':'DeleteFax',
                        'module':'HylaFax'
                    },
                }
                AppConnector.request(params).then(
                    function(data) {
                        progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                        // alert(JSON.stringify(data.result));
                        var params = {};
                        if(data.result.error){
                            params['text'] = app.vtranslate(JSON.stringify(data.result[0]));
                            params['type'] = 'error';
                        }
                        else{
                            params['text'] = app.vtranslate('FAX RECORD REMOVED');
                            params['type'] = 'success';
                        }

                        Settings_Vtiger_Index_Js.showMessage(params);
                        aDeferred.resolve(data);
                        window.location.reload();
                    },
                    function(error) {
                        progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                        aDeferred.reject(error);
                    }
                );
                return aDeferred.promise();
            }
        });
	},

	registerEvents : function() {
		var self = this;
		self.registerHylaFaxConfigEvent();
		self.revokeHylaFaxConfigEvent();
		self.deleteHylaFaxRecordEvent();
	}
});
jQuery(document).ready(function () {
    var HylaFax_FaxList_Js = new FaxList_Js();
    HylaFax_FaxList_Js.registerEvents();
})
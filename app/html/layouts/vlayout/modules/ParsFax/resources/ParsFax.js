var ParsFax_Js = {
    sendFax: function () {
        ParsFax.registerPicklist2();
        var time = 5;
        if (typeof CKEDITOR != 'undefined') {
            ParsFax.LoadEditor(time);
        }

    },
    registerSaveGeneralSettingsEvent: function () {
        var self = this;
        $('.saveButton').click(function(e) {
            var form_data = $("#GeneralSettingsForm").serialize();

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
                    var obj = jQuery.parseJSON(data);
                    // alert(JSON.stringify(obj));
                    var params = {};
                    // if(data.result.success){
                        params['text'] = app.vtranslate('General Settings SAVED');
                        params['type'] = 'success';
                    // }
                    // else{
                    //     params['text'] = app.vtranslate(JSON.stringify(data.result[0]));
                    //     params['type'] = 'error';
                    // }

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

    /**
     * Function to register required events
     */
    registerEvents: function () {
        var thisInstance = this;
        this.sendFax();
        this.registerSaveGeneralSettingsEvent();
    }
}

//On Page Load
jQuery(document).ready(function () {
    ParsFax_Js.registerEvents();
});

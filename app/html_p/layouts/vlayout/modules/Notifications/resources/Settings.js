/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class("Notifications_Settings_Js",{
    instance:false,
    getInstance: function(){
        if(Notifications_Settings_Js.instance == false){
            var instance = new Notifications_Settings_Js();
            Notifications_Settings_Js.instance = instance;
            return instance;
        }
        return Notifications_Settings_Js.instance;
    }
},{
    /* For License page - Begin */
    init : function() {
        this.initiate();
    },
    /*
     * Function to initiate the step 1 instance
     */
    initiate : function(){
        var step=jQuery(".installationContents").find('.step').val();
        this.initiateStep(step);
    },
    /*
     * Function to initiate all the operations for a step
     * @params step value
     */
    initiateStep : function(stepVal) {
        var step = 'step'+stepVal;
        this.activateHeader(step);
    },

    activateHeader : function(step) {
        var headersContainer = jQuery('.crumbs ');
        headersContainer.find('.active').removeClass('active');
        jQuery('#'+step,headersContainer).addClass('active');
    },

    registerActivateLicenseEvent : function() {
        var aDeferred = jQuery.Deferred();
        jQuery(".installationContents").find('[name="btnActivate"]').click(function() {
            var license_key=jQuery('#license_key');
            if(license_key.val()=='') {
                errorMsg = "License Key cannot be empty";
                license_key.validationEngine('showPrompt', errorMsg , 'error','bottomLeft',true);
                aDeferred.reject();
                return aDeferred.promise();
            }else{
                var progressIndicatorElement = jQuery.progressIndicator({
                    'position' : 'html',
                    'blockInfo' : {
                        'enabled' : true
                    }
                });
                var params = {};
                params['module'] = app.getModuleName();
                params['action'] = 'Activate';
                params['mode'] = 'activate';
                params['license'] = license_key.val();

                AppConnector.request(params).then(
                    function(data) {
                        progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                        if(data.success) {
                            var message=data.result.message;
                            if(message !='Valid License') {
                                jQuery('#error_message').html(message);
                                jQuery('#error_message').show();
                            }else{
                                document.location.href="index.php?module=Notifications&parent=Settings&view=Settings&mode=step3";
                            }
                        }
                    },
                    function(error) {
                        progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                    }
                );
            }
        });
    },

    registerValidEvent: function () {
        jQuery(".installationContents").find('[name="btnFinish"]').click(function() {
            var progressIndicatorElement = jQuery.progressIndicator({
                'position' : 'html',
                'blockInfo' : {
                    'enabled' : true
                }
            });
            var params = {};
            params['module'] = app.getModuleName();
            params['action'] = 'Activate';
            params['mode'] = 'valid';

            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success) {
                        document.location.href = "index.php?module=Notifications&parent=Settings&view=Settings";
                    }
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                }
            );
        });
    },
    /* For License page - End */
    registerEnableModuleEvent:function() {
        jQuery('.summaryWidgetContainer').find('#enable_module').change(function(e) {
            var progressIndicatorElement = jQuery.progressIndicator({
                'position' : 'html',
                'blockInfo' : {
                    'enabled' : true
                }
            });

            var element=e.currentTarget;
            var value=0;
            var text="Notifications Disabled";
            if(element.checked) {
                value=1;
                text = "Notifications Enabled";
            }
            var params = {};
            params.action = 'ActionAjax';
            params.module = 'Notifications';
            params.value = value;
            params.mode = 'enableModule';
            AppConnector.request(params).then(
                function(data){
                    progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                    var params = {};
                    params['text'] = text;
                    Settings_Vtiger_Index_Js.showMessage(params);
                },
                function(error){
                    //TODO : Handle error
                    progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                }
            );
        });
    },
    registerSortByEvent:function() {
        jQuery('.summaryWidgetContainer').find('#sort_by').change(function(e) {
            var progressIndicatorElement = jQuery.progressIndicator({
                'position' : 'html',
                'blockInfo' : {
                    'enabled' : true
                }
            });

            var focus = $(this);

            var params = {};
            params.action = 'ActionAjax';
            params.module = 'Notifications';
            params.value = focus.val();
            params.mode = 'changeSortBy';
            AppConnector.request(params).then(
                function(data){
                    progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                    var params = {};
                    params['text'] = 'Success';
                    Settings_Vtiger_Index_Js.showMessage(params);
                },
                function(error){
                    //TODO : Handle error
                    progressIndicatorElement.progressIndicator({'mode' : 'hide'});
                }
            );
        });
    },
    registerEvents: function(){
        this.registerEnableModuleEvent();
        this.registerSortByEvent();
        /* For License page - Begin */
        this.init();
        this.registerActivateLicenseEvent();
        this.registerValidEvent();
        /* For License page - End */
    }
});
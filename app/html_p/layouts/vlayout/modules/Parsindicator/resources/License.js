/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

/** @class Parsindicator_License_Js */
jQuery.Class('Parsindicator_License_Js', {}, {
    /* For License page - Begin */
    init: function () {
        this.initiate();
    },
    /**
     * Function to initiate the step 1 instance
     */
    initiate: function () {
        var step = jQuery(".installationContents").find('.step').val();
        this.initiateStep(step);
    },
    /**
     * Function to initiate all the operations for a step
     * @params step value
     */
    initiateStep: function (stepVal) {
        var step = 'step' + stepVal;
        this.activateHeader(step);
    },
    activateHeader: function (step) {
        var headersContainer = jQuery('.crumbs ');
        headersContainer.find('.active').removeClass('active');
        jQuery('#' + step, headersContainer).addClass('active');
    },
    recheckLicenseEvent: function () {
       jQuery("#recheck").on('click',function () {
       	   location.reload();
       });
   },
    registerLicenseAgreementEvent: function () {
        jQuery("#licenseagreement").on('click',function (e) {
            e.stopPropagation();
            var url = 'index.php?module='+app.getModuleName()+'&view=Helper&mode=showLicenseAgreement';
            app.request.get({'url': url}).then(
                function (err, data) {
                    if (err === null) {
                        app.helper.showModal(data);
                    } else {
                        app.helper.showErrorNotification({'message': err.message});
                    }
                }
            );
        });
   },
    registerActivateLicenseEvent: function () {
        var aDeferred = jQuery.Deferred();
        jQuery(".installationContents").find('[name="btnActivate"]').click(function () {
            var license_key = jQuery('#license_key');
            if (license_key.val() === '') {
                var errorInfo = app.vtranslate(PVTErrors.EMPTYLICENSEKEY);
                license_key.validationEngine('showPrompt', errorInfo, 'error', 'bottomLeft', true);
                aDeferred.reject();
                return aDeferred.promise();
            } else {
                var progressIndicatorElement = jQuery.progressIndicator({
                    'position': 'html',
                    'blockInfo': {
                        'enabled': true
                    }
                });
                var params = {};
                params['module'] = app.getModuleName();
                params['action'] = 'Activate';
                params['mode'] = 'activate';
                params['license'] = license_key.val();
                params['tokenname'] = csrfMagicName;
                params['tokenval'] = csrfMagicToken;

                AppConnector.request(params).then(
                    function (data) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        if (data.success) {
                            var message = data.result.status;
                            var info = data.result.information;
                            var form = data.result.form;
                            jQuery('#licenseinfo').html(info);
                            if (message == 'Ok') {
                                var module = jQuery(".installationContents").find('.module').val();
                                jQuery('#licensecheck').hide();
                                jQuery('.need-help').hide();
                                jQuery('#btnOrder').hide();
                                jQuery('#btnShop').hide();
                                jQuery('#Activatebtn').html(form);
                            }
                        }
                    },
                    function (error) {
                        console.log('error =', error);
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    }
                );
            }
        });
    },

    registerInverseLicenseEvent: function () {
        var aDeferred = jQuery.Deferred();
        jQuery("#LicenseInfo").find('#inverse').click(function () {
            jQuery("#license_key").prop("disabled", false);  
            jQuery("#valid").hide();  
            jQuery("#inverse").hide();  
            jQuery("#checkkey").show();  
            jQuery("#licwarning").show();  
        });
    },


    registerReactivateLicenseEvent: function () {
        var aDeferred = jQuery.Deferred();
        jQuery("#LicenseInfo").find('#checkkey').click(function () {
            var license_key = jQuery('#license_key');
            if (license_key.val() == '') {
                var errorMsg = app.vtranslate(PVTErrors.EMPTYLICENSEKEY);
                license_key.validationEngine('showPrompt', errorMsg, 'error', 'bottomLeft', true);
                aDeferred.reject();
                return aDeferred.promise();
            } else {
                var progressIndicatorElement = jQuery.progressIndicator({
                    'position': 'html',
                    'blockInfo': {
                        'enabled': true
                    }
                });
                var params = {};
                params['module'] = app.getModuleName();
                params['action'] = 'Activate';
                params['mode'] = 'activate';
                params['license'] = license_key.val();

                AppConnector.request(params).then(
                    function (data) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        if (data.success) {
                            var message = data.result.status;
                            var info = data.result.information;
                            jQuery('#licenseinfo').html(info);
                            if (message == 'Ok') {
                                jQuery("#license_key").prop("disabled", true);  
                                jQuery("#valid").show();  
                                jQuery("#inverse").show();  
                                jQuery("#checkkey").hide();  
                                jQuery("#licwarning").hide();  
                            }
                        }
                    },
                    function (error) {
                        console.log('error =', error);
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    }
                );
            }
        });
        jQuery("#LicenseInfo").find('#valid').click(function () {
            var license_key = jQuery('#license_key');
            if (license_key.val() == '') {
                var errorInfo = app.vtranslate(PVTErrors.EMPTYLICENSEKEY);
                vtUtils.showValidationMessage(license_key, errorInfo, {
                    position : {
                        my: 'top left',
                        at: 'bottom left'
                    }
                });
                aDeferred.reject();
                return aDeferred.promise();
            } else {
                var progressIndicatorElement = jQuery.progressIndicator({
                    'position': 'html',
                    'blockInfo': {
                        'enabled': true
                    }
                });
                var params = {};
                params['module'] = app.getModuleName();
                params['action'] = 'Activate';
                params['mode'] = 'showinformation';
                params['license'] = license_key.val();

                AppConnector.request(params).then(
                    function (data) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        if (data.success) {
                            var message = data.result.status;
                            var info = data.result.information;
                            jQuery('#licenseinfo').html(info);
                            if (message == 'Ok') {
                                jQuery("#license_key").prop("disabled", true);
                                jQuery("#valid").show();
                                jQuery("#inverse").show();
                                jQuery("#checkkey").hide();
                                jQuery("#licwarning").hide();
                            }
                        }
                    },
                    function (error) {
                        console.log('error =', error);
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    }
                );
            }
        });
        if($("#licensestatus").length != 0) {
            var licensestatus = jQuery('#licensestatus').val();
            if (licensestatus !== 'Ok') $("#checkkey").trigger("click");
        }


    },
    registerValidEvent: function () {
        jQuery(".installationContents").find('[name="btnFinish"]').click(function () {
        	var redirect = jQuery(".installationContents").find('.redirect').val();
            var progressIndicatorElement = jQuery.progressIndicator({
                'position': 'html',
                'blockInfo': {
                    'enabled': true
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
                        document.location.href = redirect;
                    }
                },
                function (error) {
                    console.log('error =', error);
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                }
            );
        });
    },

    /* For License page - End */

    /**
     * Function to register events
     */
    registerEvents: function () {
        /* For License page - Begin */
        this.registerActivateLicenseEvent();
        this.registerValidEvent();
        this.recheckLicenseEvent();
        this.registerInverseLicenseEvent();
        this.registerReactivateLicenseEvent();
        /* For License page - End */
    }
});

jQuery(document).ready(function(){
	var ParsindicatorLicenseInstance = new Parsindicator_License_Js();
	ParsindicatorLicenseInstance.registerEvents();
})
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class('ParsFax_Modules_Js', {}, {
    registerEventForSwitch: function () {
        var thisInstance = this;
        var deflang = ParsVTErrors.DEFLANG;
        var buttonsInfo = {
            cancel: {
                label: ParsVTErrors.NO,
                className : 'btn-default confirm-box-btn-pad pull-right'
            },
            confirm: {
                label: ParsVTErrors.YES,
                className : 'confirm-box-ok confirm-box-btn-pad btn-primary'
            }
        };
        jQuery('#ParsFaxModulesContent').on('switchChange.bootstrapSwitch', "input[type=checkbox]", function (e) {
            var currentElement = jQuery(e.currentTarget);
            if (currentElement.val() == 1) {
                currentElement.attr('value', 0);
            } else {
                currentElement.attr('value', 1);
            }
            var type = currentElement.data('tabid');
            thisInstance.GeneralOptions(type, {'value': currentElement.val()}, currentElement);
        });
    },
    registerSaveGeneralSettingsEvent: function () {
        var self = this;
        $('.settingSaveButton').click(function (e) {
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
                'parent': 'Settings',
                'action': 'ActionAjax',
                'mode': 'GeneralSettings',
                'fileCount': $('#fileCount').val(),
            }
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    var params = {};
                    if (data.result.success) {
                        app.helper.showSuccessNotification({'message': app.vtranslate('General settings saved')});
                        window.location.reload();
                    }
                    else {
                        app.helper.showErrorNotification({"message": data.result[0]});
                    }
                }
            );
            return aDeferred.promise();
        });
    },
    GeneralOptions: function (option, params, target) {
        app.helper.showProgress();
        if (typeof params == 'undefined') {
            var params = {};
        }
        params.module = app.getModuleName();
        params.parent = app.getParentModuleName();
        //params.action = app.view();
        params.action = 'ActionAjax';
        params.mode = 'setModule';
        params.tabid = option;
        AppConnector.request(params).then(
            function (data) {
                app.helper.hideProgress();
                if (data.success) {
                    if (data.result.success) {
                        app.helper.showSuccessNotification({
                            message: data.result.message
                        });
                    } else {
                        app.helper.showErrorNotification({
                            message: data.result.message
                        });
                    }

                    if (typeof data.result.value !== 'undefined') {
                        if (data.result.value === 1) {
                            jQuery(target).attr('dontchange', 1);
                            target.bootstrapSwitch('state', true);
                        }
                        target.attr('value', data.result.value);
                    }
                    if (data.result.code === 'readonly') {
                        target.bootstrapSwitch('disabled', true);
                    }
                    if (data.result.refresh) {
                        setTimeout(function () {
                            window.location.reload(1);
                        }, 3000);
                    }

                } else {
                    app.helper.showErrorNotification({
                        message: ParsVTErrors.OPFAILED
                    });
                }
            },
            function (error) {
                console.log('error =', error);
                app.helper.hideProgress();
                app.helper.showErrorNotification({
                    message: ParsVTErrors.OPFAILED
                });
                target.attr('value', 0);
            }
        );

        return false;
    },
    registerEvents: function () {
        if (jQuery('.bootstrap-switch').length >0) {
            jQuery('.bootstrap-switch').bootstrapSwitch();
        }
        vtUtils.enableTooltips();
        this.registerEventForSwitch();
        this.registerSaveGeneralSettingsEvent();
    }
});


jQuery(document).ready(function () {
    var ParsFaxModulesJsInstance = new ParsFax_Modules_Js();
    ParsFaxModulesJsInstance.registerEvents();
})
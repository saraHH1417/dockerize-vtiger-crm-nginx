/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class("Database_Js", {
    showContent: function (mode) {
        app.helper.showProgress();
        var params = {};
        params.module = app.getModuleName();
        params.parent = app.getParentModuleName();
        params.action = "DBOperation";
        params.mode = "getContent";
        params.type = mode;
        AppConnector.request(params).then(
            function (data) {
                app.helper.hideProgress();
                if (data.success) {
                    jQuery('#'+mode).html(data.result.message);
                    vtUtils.enableTooltips();
                    if (jQuery('#crontaskid').length > 0) {
                        app.showSelect2ElementView(jQuery('#crontaskid'));
                    }
                    if (jQuery('#modtrackermodule').length > 0) {
                        app.showSelect2ElementView(jQuery('#modtrackermodule'));
                    }
                    if (jQuery('#SystemCleanup').has('input.dateField').length > 0){
                        vtUtils.registerEventForDateFields(jQuery('#SystemCleanup'));
                    } else if(jQuery('#SystemCleanup').has('input.timepicker-default').length > 0){
                        vtUtils.registerEventForTimeFields(jQuery('#SystemCleanup'));
                    }
                }
            },
            function (error) {
                console.log('error =', error);
                app.helper.hideProgress();
            }
        );

        return false;

    },
    showHelp: function (title, src) {
        if (src.startsWith('index.php')) {
            window.open(src, '_blank');
        } else {
            app.helper.showProgress();
            var height = window.innerHeight * 0.8;
            var width = window.innerWidth * 0.7;
            var modalData = '<div class="modal-dialog" style="width:' + width + 'px; height:' + height + 'px"> <div class="modal-header"> <div class="clearfix"> <div class="pull-right " ><button type="button" class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" class="fa fa-close"></span></button></div><h4 class="pull-left">' + title + '</h4> </div></div><div class="modal-content"><iframe id="iframeModalWindow" style="width:' + width + 'px; height:' + height + 'px" src="' + src + '" name="iframe_modal"></iframe></div></div>';
            app.helper.showModal(modalData);
            $('#iframeModalWindow').load(function(){
                app.helper.hideProgress();
            });
        }
    }
}, {
    registerActionEvent: function () {
        $("#ParsVTToolsSettingsMainPanel").find('[data-parsvttools-action]').on('click', function (e) {

                e.preventDefault();
                var aDeferred = jQuery.Deferred();

                let excludeInput = ["button", "input[type=button]", "input[type=submit]", "input[type=reset]"];

                var formData = {};
                $(this).closest("div.tool-panel").find(":input" + excludeInput.map(word => `:not(${word.trim()})`).join('')).each(function (index, elm) {
                    if ($(elm).is("input[type=checkbox], input[type=radio]") && !$(elm).prop("checked")) {
                        return;
                    }

                    let name = "";
                    if ($(elm).attr("name")) {
                        name = $(elm).attr("name");
                    } else if ($(elm).attr("id")) {
                        name = $(elm).attr("id");
                    } else {
                        name = $(elm).prop('nodeName').toLowerCase() + "_" + index;
                    }

                    formData[name] = $(elm).val();
                });

                params = {
                    module: 'ParsVT',
                    parent: 'Settings',
                    action: 'Development',
                    mode: 'ToolAction',
                    toolAction: $(this).attr('data-parsvttools-action'),
                    index: 'all',
                }


                app.helper.showProgress();
                app.request.post({data: params}).then(function (err, data) {
                    app.helper.hideProgress();

                    if (err === null) {
                        var params = data != "" ? JSON.parse(data) : {};

                        if (!("error" in params) && (!("success" in params) || ("success" in params && params.success))) {
                            if (!("message" in params)) {
                                params["message"] = app.vtranslate('JS_SAVED_SUCCESSFULLY');
                            }

                            $('#resultContainer').html(params.result);
                            app.helper.showSuccessNotification(params);
                            if ("reload" in params && params.reload) {
                                setTimeout(window.location.reload(), 2000)
                            }
                            if ("callback" in params && params.callback) {
                                let callback = new Function('data', params.callback);
                                callback(params);
                            }
                        } else {
                            if (!("message" in params)) {
                                params["message"] = app.vtranslate('Error');
                            }
                            app.helper.showErrorNotification(params);
                        }

                        aDeferred.resolve(data);
                    } else {
                        aDeferred.reject();
                    }

                });

                return aDeferred.promise();
            });
    },
    registerEventForButtons: function () {
        var that = this;
        jQuery('.fixError').on('click', function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': '',
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });
            var values = jQuery('input[name=updatabletables]').val();
            var params = {};
            params['module'] = app.getModuleName();
            params['action'] = 'DBOperation';
            params['mode'] = 'fixErrors';
            params['parent'] = 'Settings';
            params['data'] = values;
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success && data.success == true) {
                        app.helper.showSuccessNotification({'message': data.result});
                    } else if (data.error) {
                        app.helper.showErrorNotification({'message': data.error.message});
                    }
                    setTimeout(function () {
                        window.location.reload(1);
                    }, 3000);
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
                }
            );
        });
        jQuery('.optimizetables').on('click', function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': '',
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });
            var values = jQuery('input[name=optimizetables]').val();
            var params = {};
            params['module'] = app.getModuleName();
            params['action'] = 'DBOperation';
            params['mode'] = 'optimizeTables';
            params['parent'] = 'Settings';
            params['data'] = values;
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success && data.success == true) {
                        app.helper.showSuccessNotification({'message': data.result});
                    } else if (data.error) {
                        app.helper.showErrorNotification({'message': data.error.message});
                    }
                    setTimeout(function () {
                        window.location.reload(1);
                    }, 3000);
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
                }
            );
        });
        jQuery('.SaveBackupSettings').on('click', function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': '',
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });

            var params = {};
            params['module'] = app.getModuleName();
            params['action'] = 'DBOperation';
            params['mode'] = 'SaveBackupSettings';
            params['parent'] = 'Settings';
            params['backup_status'] = jQuery('input[name=backup_status]').val();
            params['backup_frequency'] = jQuery('select[name=backup_frequency]').val();
            params['backup_start'] = jQuery('select[name=backup_start]').val();
            params['backup_keep'] = jQuery('select[name=backup_keep]').val();
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success && data.success == true) {
                        app.helper.showSuccessNotification({'message': data.result});
                    } else if (data.error) {
                        app.helper.showErrorNotification({'message': data.error.message});
                    }
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
                }
            );
        });
        jQuery('.optimizealltables').on('click', function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': '',
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });
            var params = {};
            params['module'] = app.getModuleName();
            params['action'] = 'DBOperation';
            params['mode'] = 'optimizeDatabase';
            params['parent'] = 'Settings';
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success && data.success == true) {
                        app.helper.showSuccessNotification({'message': data.result});
                    } else if (data.error) {
                        app.helper.showErrorNotification({'message': data.error.message});
                    }
                    setTimeout(function () {
                        window.location.reload(1);
                    }, 3000);
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
                }
            );
        });
        jQuery('.convertdb').on('click', function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': '',
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });
            var params = {};
            params['module'] = app.getModuleName();
            params['action'] = 'DBOperation';
            params['mode'] = 'ConvertDB';
            params['parent'] = 'Settings';
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success && data.success == true) {
                        app.helper.showSuccessNotification({'message': data.result});
                    } else if (data.error) {
                        app.helper.showErrorNotification({'message': data.error.message});
                    }
                    setTimeout(function () {
                        window.location.reload(1);
                    }, 3000);
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
                }
            );
        });
        jQuery('.transformdb').on('click', function () {
            app.helper.showConfirmationBox({'message': ParsVTErrors.CONVERTDATACONFIRM}).then(
                function (e) {
                    var progressIndicatorElement = jQuery.progressIndicator({
                        'message': '',
                        'position': 'html',
                        'blockInfo': {
                            'enabled': true
                        }
                    });
                    var params = {};
                    params['module'] = app.getModuleName();
                    params['action'] = 'DBOperation';
                    params['mode'] = 'DataTransformation';
                    params['parent'] = 'Settings';
                    AppConnector.request(params).then(
                        function (data) {
                            progressIndicatorElement.progressIndicator({'mode': 'hide'});
                            if (data.success && data.success == true) {
                                var message = data.result
                                if (/^[\],:{}\s]*$/.test(data.result.replace(/\\["\\\/bfnrtu]/g, '@').
                                replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
                                replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
                                    json_obj = JSON.parse(data.result);
                                    message = json_obj.result
                                }
                                //json_obj = JSON.parse(data.result);
                                app.helper.showSuccessNotification({'message': message});
                            } else if (data.error) {
                                app.helper.showErrorNotification({'message': data.error.message});
                            }
                        },
                        function (error) {
                            progressIndicatorElement.progressIndicator({'mode': 'hide'});
                            app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
                        }
                    );
                },
                function (error, err) {
                    return false;
                });
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
    registerBlockAnimationEvent: function () {
        $(".blockToggle").click(function (e) {
            var currentTarget = jQuery(e.currentTarget);
            var blockId = currentTarget.data('id');
            var closestBlock = currentTarget.parents('.block');
            var bodyContents = closestBlock.find('.blockData #dbblockdata');
            var data = currentTarget.data();
            var module = app.getModuleName();
            var hideHandler = function () {
                bodyContents.hide('slow');
                app.storage.set(module + '.' + blockId, 0);
            }
            var showHandler = function () {
                bodyContents.removeClass('hide').show();
                app.storage.set(module + '.' + blockId, 1);
            }
            if (data.mode == 'show') {
                hideHandler();
                currentTarget.hide();
                closestBlock.find("[data-mode='hide']").removeClass('hide').show();
            } else {
                showHandler();
                currentTarget.hide();
                closestBlock.find("[data-mode='show']").removeClass('hide').show();
            }

        });
    },
    registerEventForCollapseBlock: function () {
        jQuery('#DataBaseBackup').on('switchChange.bootstrapSwitch', "input[name=backup_status]", function (e) {
            var currentElement = jQuery(e.currentTarget);
            if (currentElement.val() == 1) {
                currentElement.attr('value', 0);
            } else {
                currentElement.attr('value', 1);
            }
        });
    },
    registerEventForSwitch: function () {
        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
            var target_url = e.target.getAttribute('href');
            if (target_url.includes('#')){
                target_url = target_url.split("#")[1];
            }
            if (jQuery("#"+target_url).html().indexOf("row-fluid") == -1) {
                switch (target_url) {
                    case 'MiscDatabse':
                    case 'ListofTables':
                        Database_Js.showContent(target_url);
                        break;
                }
            }
        });

        jQuery('#MiscGereral').on('switchChange.bootstrapSwitch', "input[type=checkbox]", function (e) {
            var currentElement = jQuery(e.currentTarget);
            if (currentElement.val() == 1) {
                currentElement.attr('value', 0);
            } else {
                currentElement.attr('value', 1);
            }
            var type = currentElement.data('type');
            Database_Js.GeneralOptions(type, {'value': currentElement.val()});
        });
    },
    registerEvents: function () {
        this.registerEventForButtons();
        jQuery("input[name=backup_status]").bootstrapSwitch();
        vtUtils.enableTooltips();
        this.registerBlockAnimationEvent();
        this.registerEventForCollapseBlock();
        this.registerActionEvent();
        this.registerEventForSwitch();
    }
});


jQuery(document).ready(function () {
    var DBActions = new Database_Js();
    DBActions.registerEvents();
})
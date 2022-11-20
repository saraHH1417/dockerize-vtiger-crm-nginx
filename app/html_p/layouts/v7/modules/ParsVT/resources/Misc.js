/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
var ParsVTMisc = {
    showContent: function (mode) {
        app.helper.showProgress();
        var params = {};
        params.module = app.getModuleName();
        params.parent = app.getParentModuleName();
        params.action = app.view();
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
    GeneralOptions: function (option, params, output) {
        app.helper.showProgress();
        if (typeof params == 'undefined') {
            var params = {};
        }
        params.module = app.getModuleName();
        params.parent = app.getParentModuleName();
        params.action = app.view();
        params.mode = option;
        AppConnector.request(params).then(
            function (data) {
                app.helper.hideProgress();
                //	alert(JSON.stringify(data));
                if (data.success) {
                    app.helper.showSuccessNotification({
                        message: data.result.message
                    });
                    if (data.result.refresh) {
                        setTimeout(function () {
                            window.location.reload(1);
                        }, 3000);
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
    showSQLReports: function (){
            var url = 'index.php?module=ParsVT&parent=Settings&view=SQLReportsModalAjax';
            app.helper.showProgress(app.vtranslate("JSLBL_Loading_Please_Wait")+"...");
            app.request.get({'url': url}).then(
                function (err, data) {
                    app.helper.hideProgress();
                    if (err === null) {
                        if (data) {
                            app.helper.showModal(data);
                        } else {
                            app.helper.showErrorNotification({'message': 'Invalid Request!'});
                            app.helper.hideModal();
                        }
                    } else {
                        app.helper.showErrorNotification({'message': err.message});
                    }
                }
            );
    },
    downloadSQLReports : function() {
        app.helper.showProgress();
        var params = {
            module : app.getModuleName(),
            parent : app.getParentModuleName(),
            action : app.view(),
            mode : 'downloadSQL'
        };
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
                    if (data.result.refresh) {
                        app.helper.hideModal();
                        setTimeout(function () {
                            window.location.reload(1);
                        }, 3000);
                    }
                }
            },
            function (error) {
                console.log('error =', error);
                app.helper.hideProgress();
            }
        );
    },
    showMarkDown: function (option) {
        var height = window.innerHeight * 0.8;
        var width = window.innerWidth * 0.7;
        app.helper.showProgress();
        var modalparams = {};
        modalparams.module = app.getModuleName();
        modalparams.parent = app.getParentModuleName();
        modalparams.action = app.view();
        modalparams.mode = "showMarkDown";
        modalparams.md = option;
        AppConnector.request(modalparams).then(
            function (data) {
                app.helper.hideProgress();
                if (data.success && data.result.title) {
                    var modalData = '<div class="modal-dialog" style="width:'+width+'px; height:'+height+'px"> <div class="modal-header"> <div class="clearfix"> <div class="pull-right " ><button type="button" class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" class="fa fa-close"></span></button></div><h4 class="pull-left">'+data.result.title+'</h4> </div></div><div class="modal-content" style="max-width:'+width+'px; max-height:'+height+'px;"><div class="container-fluid"><div class="row-fluid formatted">'+data.result.content+'</div></div></div></div>';
                    app.helper.showModal(modalData);
                    app.helper.showVerticalScroll(jQuery('.modal-content'));
                } else {
                    app.helper.showErrorNotification({'message': data.message});
                }
            },
            function (error) {
                console.log('error =', error);
                app.helper.hideProgress();
            }
        );
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
};

jQuery.Class('ParsVT_Misc_Js', {}, {
    registerActionEvent: function () {
        if (app.view() === 'Development') {
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
                    data: formData,
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
                            /**
                             * @author Sutharsan J
                             * @description I1734 Showing table index results
                             */
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
        }
    },
    registerEditGoogleAPIEvent: function () {
        $('#googleapi').click(function (event) {
            var url = 'index.php?module=ParsVT&parent=Settings&view=GoogleAPISettings&mode=showGoogleAPI';
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
        $('#googlecapchaapi').click(function (event) {
            var url = 'index.php?module=ParsVT&parent=Settings&view=GoogleAPISettings&mode=showreCapchaAPI';
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
    registerEditHtaccessEvent: function () {
        var thisInstance = this;
        $('#edithtaccess').click(function (event) {
            var url = 'index.php?module=ParsVT&parent=Settings&view=HtaccessSettings';
            app.request.get({'url': url}).then(
                function (err, data) {
                    if (err === null) {
                        thisInstance.registerLoadHtaccessEditorEvent();
                        app.helper.showModal(data);
                    } else {
                        app.helper.showErrorNotification({'message': err.message});
                    }
                }
            );
        });
    },
    registerEditCreatorEvent: function () {
        var thisInstance = this;
        $('#SMSNotifierModule').click(function (event) {
            var url = 'index.php?module=ParsVT&parent=Settings&view=SMSNotifier';
            app.helper.showProgress();
            app.request.get({'url': url}).then(
                function (err, data) {
                    if (err === null) {
                        app.helper.hideProgress();
                        app.helper.showModal(data);
                    } else {
                        app.helper.hideProgress();
                        app.helper.showErrorNotification({'message': err.message});
                    }
                }
            );
        });
        $('#editcreator').click(function (event) {
            var url = 'index.php?module=ParsVT&parent=Settings&view=CreatorSettings';
            app.helper.showProgress();
            app.request.get({'url': url}).then(
                function (err, data) {
                    if (err === null) {
                        app.helper.hideProgress();
                        app.helper.showModal(data);
                    } else {
                        app.helper.hideProgress();
                        app.helper.showErrorNotification({'message': err.message});
                    }
                }
            );
        });
        $('#editrecordid').click(function (event) {
            var url = 'index.php?module=ParsVT&parent=Settings&view=RecordIDSettings';
            app.helper.showProgress();
            app.request.get({'url': url}).then(
                function (err, data) {
                    if (err === null) {
                        app.helper.hideProgress();
                        app.helper.showModal(data);
                    } else {
                        app.helper.hideProgress();
                        app.helper.showErrorNotification({'message': err.message});
                    }
                }
            );
        });
    },
    registerLoadHtaccessEditorEvent: function () {
        var thisInstance = this;
        if (document.getElementById("htaccess") != null) {

            var htaccess = document.getElementById("htaccess");
                var editor1 = CodeMirror.fromTextArea(htaccess, {
                    lineNumbers: true,
                    autoRefresh:true,
                    lineWrapping: true,
                    matchBrackets: true,
                    theme: "isotope"
            });
            /*
            var editor = CodeMirror.fromTextArea(htaccess, {
                lineNumbers: true,
                lineWrapping: true,
                matchBrackets: true,
                theme: "isotope"
            }).on('change', function(editor) {
                $("#htaccess").val(editor.getValue());
            });
            */
        } else {
            setTimeout(function () {
                thisInstance.registerLoadHtaccessEditorEvent();
            }, 300);
        }
    },
    registerSendHtaccessPostEvent: function (code, orginal) {
        var progressIndicatorElement = jQuery.progressIndicator({
            'message': '',
            'position': 'html',
            'blockInfo': {
                'enabled': true
            }
        });
        var params = {};
        params['module'] = app.getModuleName();
        params['action'] = 'HtaccessAjax';
        params['parent'] = 'Settings';
        params['content'] = code;
        params['orginal'] = orginal;
        AppConnector.request(params).then(
            function (data) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
                if (data.success && data.success == true) {
                    app.helper.showSuccessNotification({'message': data.result});
                } else if (data.error) {
                    app.helper.showErrorNotification({'message': data.error.message});
                }
                app.helper.hideModal();
            },
            function (error) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
                app.helper.hideModal();
                app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
            }
        );
    },
    registerSaveHtaccessEvent: function () {
        var thisInstance = this;

        $(document).on("click", "#SaveHtaccess", function () {
            $.base64.utf8encode = true;
            var code = $.base64.encode($("#htaccess").val());
            thisInstance.registerSendHtaccessPostEvent(code,0);
        });
        $(document).on("click", "#OrginalHtaccess", function () {
            $.base64.utf8encode = true;
            var code = $.base64.encode($("#htaccess").val());
            thisInstance.registerSendHtaccessPostEvent(code,1);
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
                    case 'MiscConf':
                    case 'MiscDatabse':
                    case 'MiscStability':
                    case 'MiscSysInfo':
                    case 'MiscSecurity':
                    case 'PublicDirStates':
                    case 'SystemCleanup':
                    case 'ForceScheduler':
                    case 'MiscFilesPermissions':
                        ParsVTMisc.showContent(target_url);
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
            ParsVTMisc.GeneralOptions(type, {'value': currentElement.val()});
        });
    },
    registerSaveGoogleAPIEvent: function () {
        $(document).on("click", "#SavereCapchaAPI", function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': '',
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });
            var gpublickey = jQuery('input[name=publickey]').val();
            var gsecretkey = jQuery('input[name=secretkey]').val();
            var params = {};
            params['module'] = app.getModuleName();
            params['mode'] = 'SavereCapchaAPI';
            params['action'] = 'GoogleAPIAjax';
            params['parent'] = 'Settings';
            params['publickey'] = gpublickey;
            params['secretkey'] = gsecretkey;
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success && data.success == true) {
                        app.helper.showSuccessNotification({'message': data.result});
                    } else if (data.error) {
                        app.helper.showErrorNotification({'message': data.error.message});
                    }
                    app.helper.hideModal();
                    setTimeout(function () {
                        window.location.reload(1);
                    }, 3000);
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    app.helper.hideModal();
                    app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
                }
            );
        });
        $(document).on("click", "#SaveGoogleAPI", function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': '',
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });
            var clientid = jQuery('input[name=clientid]').val();
            var clientsecret = jQuery('input[name=clientsecret]').val();
            var params = {};
            params['module'] = app.getModuleName();
            params['mode'] = 'SaveGoogleAPI';
            params['action'] = 'GoogleAPIAjax';
            params['parent'] = 'Settings';
            params['clientid'] = clientid;
            params['clientsecret'] = clientsecret;
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    if (data.success && data.success == true) {
                        app.helper.showSuccessNotification({'message': data.result});
                    } else if (data.error) {
                        app.helper.showErrorNotification({'message': data.error.message});
                    }
                    app.helper.hideModal();
                    setTimeout(function () {
                        window.location.reload(1);
                    }, 3000);
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                    app.helper.hideModal();
                    app.helper.showErrorNotification({'message': ParsVTErrors.OPFAILED});
                }
            );
        });
    },
    updateModuleStatus: function(tabid, mode, type) {
        var message = app.vtranslate('Field updated');
            if (type == 0) {
            var actionmode = 'UpdateCreatorField';
        } else if (type == 1) {
            var actionmode = 'UpdateRecordIDField';
        } else if (type == 2) {
            var actionmode = 'SMSNotifierRelation';
                message = app.vtranslate('Relation updated');
        }
            params = {
                data: {
                    module: 'ParsVT',
                    parent: 'Settings',
                    action: 'Misc',
                    mode: actionmode,
                    tabid: tabid,
                    type: mode,
                }
            };
        app.helper.showProgress();
        app.request.post(params).then(function(error, data) {
            app.helper.hideProgress();
            if(error === null) {
                app.helper.showSuccessNotification({message: message});
            }
        });
    },
    registerCreatorClickEvent: function() {
        var self = this;
        $(document).on("click", ".creatorfield_checkbox", function () {
            var thisCheckbox = jQuery(this),
                data = thisCheckbox.data(),
                checked = thisCheckbox.attr('checked'),
                mode = 'Hide';
            if(checked === 'checked') {
                mode = 'Show';
            }
            self.updateModuleStatus(data.tabid, mode, 0);
        });
        $(document).on("click", ".recordidfield_checkbox", function () {
            var thisCheckbox = jQuery(this),
                data = thisCheckbox.data(),
                checked = thisCheckbox.attr('checked'),
                mode = 'Hide';
            if(checked === 'checked') {
                mode = 'Show';
            }
            self.updateModuleStatus(data.tabid, mode, 1);
        });
        $(document).on("click", ".phonefield_checkbox", function () {
            var thisCheckbox = jQuery(this),
                data = thisCheckbox.data(),
                checked = thisCheckbox.attr('checked'),
                mode = 'Hide';
            if(checked === 'checked') {
                mode = 'Show';
            }
            self.updateModuleStatus(data.tabid, mode, 2);
        });
    },
    /*
 * Function to register keyUp event for text area to show save button
 */
    registerKeyUpEvent : function() {
        var thisInstance = this;
        jQuery('.maintenance_contents').one('keyup', '#maintenance_message', function(e) {
            jQuery('.saveMaintenanceAnnouncement').removeClass('hide');
        });
    },
    registerSaveMaintenance : function() {
        var thisInstance = this;
        var saveButton = jQuery('.saveMaintenanceAnnouncement');
        saveButton.click(function(e) {
            saveButton.addClass('hide');
            //save the new Announcement
            thisInstance.saveAnnouncement().then(
                function(data) {
                    thisInstance.registerKeyUpEvent();
                    app.helper.showSuccessNotification({'message':app.vtranslate('Announcement Saved')});
                });
        });
    },
    /*
 * Function to save the Announcement content
 */
    saveAnnouncement : function() {
        var aDeferred = jQuery.Deferred();
        var content =  jQuery('#maintenance_message').val();
        var userid =  jQuery('#maintenance_userid').val();
        var params = {
            'module' : app.getModuleName(),
            'parent' : app.getParentModuleName(),
            'action' : 'Misc',
            'mode' : 'MaintenanceMessage',
            'announcement_content' : content,
            'announcement_userid' : userid
        };
        app.request.post({"data":params}).then(
            function(error,data) {
                if(error === null){
                    aDeferred.resolve();
                }else {
                    aDeferred.reject();
                }
            });
        return aDeferred.promise();
    },
    registerEvents: function () {
        this.registerEditGoogleAPIEvent();
        this.registerCreatorClickEvent();
        this.registerEditHtaccessEvent();
        this.registerEditCreatorEvent();
        this.registerSaveGoogleAPIEvent();
        this.registerSaveHtaccessEvent();
        this.registerEventForSwitch();
        this.registerKeyUpEvent();
        this.registerSaveMaintenance();
        this.registerActionEvent();
        jQuery('.bootstrap-switch').bootstrapSwitch();
        vtUtils.enableTooltips();
    }
});


jQuery(document).ready(function () {
    var ParsVTMiscJsInstance = new ParsVT_Misc_Js();
    ParsVTMiscJsInstance.registerEvents();
});
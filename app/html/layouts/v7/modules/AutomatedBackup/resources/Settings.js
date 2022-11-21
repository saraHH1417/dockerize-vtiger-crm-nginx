/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */


Vtiger.Class("AutomatedBackup_Settings_Js",{
    instance:false,
    getInstance: function(){
        if(AutomatedBackup_Settings_Js.instance == false){
            var instance = new AutomatedBackup_Settings_Js();
            AutomatedBackup_Settings_Js.instance = instance;
            return instance;
        }
        return AutomatedBackup_Settings_Js.instance;
    }
},{
    registerEventToTestPermissions: function(){
        jQuery('.localBackupAction').on("click", "button[name=testPermissions]", function(e) {
            e.preventDefault();
            app.helper.showProgress();
            var directory = jQuery("input[name=localbackup_directory]").val();
            var url = "index.php?module=AutomatedBackup&action=ActionAjax&mode=testPermissions&directory="+directory;
            app.request.get({'url':url}).then(function(err,data) {
                    app.helper.hideProgress();
                    if(err === null) {
                        if(data == true){
                            app.helper.showSuccessNotification({'message':app.vtranslate('LBL_PROPER_WRITE_PERMISSIONS')});
                        }else if(data.result === false){
                            app.helper.showErrorNotification({'message':app.vtranslate('LBL_DIRECTORY_NOT_PERMISSIONS')});
                        }else{
                            app.helper.showErrorNotification({'message':app.vtranslate('LBL_DIRECTORY_NOT_EXISTS')});
                        }
                    }
                },
                function(error,err){
                    app.helper.hideProgress();
                }
            );
        });
    },

    registerEventToSaveLocalBackup: function(){
        jQuery('.localBackupAction').on("click", "button[name=saveLocalBackup]", function(e) {
            e.preventDefault();
            app.helper.showProgress();
            var params={};
            params = jQuery("#formLocalBackup").serializeFormData();
            params['module'] = 'AutomatedBackup';
            params['action'] = 'SaveAjax';
            params['mode'] = 'saveLocalSettings';

            app.request.post({'data':params}).then(
                function(err,data) {
                    app.helper.hideProgress();
                    if(data){
                        app.helper.showSuccessNotification({'message':app.vtranslate('Successfully !')});
                    }
                },
                function(error,err){
                    app.helper.hideProgress();
                }
            );
        });
    },

    registerEventToRunLocalBackup: function(){
        var thisInstance = this;
        jQuery('.localBackupAction').on("click", "button[name=runLocalBackup]", function(e) {
            e.preventDefault()
            var message = app.vtranslate('LBL_BACKUP_CONFIRMATION');
            app.helper.showConfirmationBox({'message' : message}).then(
                function(e) {
                    var params={};
                    params = jQuery("#formLocalBackup").serializeFormData();
                    params['module']='AutomatedBackup';
                    params['action']='RunBackupAjax';
                    params['mode']='runLocalBackup';

                    var runningMessage = app.vtranslate('LBL_BACKUP_RUNNING');
                    var progressIndicatorElement = jQuery.progressIndicator({
                        'message' : runningMessage,
                        'position' : 'html',
                        'blockInfo' : {
                            'enabled' : true
                        }
                    });
                    app.request.post({'data':params}).then(
                        function(err,data) {
                            app.helper.hideProgress();
                            if(data == 'SUCCESS'){
                                app.helper.showSuccessNotification({'message':app.vtranslate('Successfully !')});
                                thisInstance.loadListBackupFiles(0,'localbackup');
                            }else{
                                app.helper.showSuccessNotification({'message':data});
                            }
                        },
                        function(error,err){
                            app.helper.hideProgress();
                        }
                    );
                },
                function(error, err){
                    app.helper.hideProgress();
                }
            );
        });
    },

    registerEventForDownloadFile: function(){
        jQuery('.summaryWidgetContainer').on("click", ".downloadRecordButton", function(e) {
            e.preventDefault();
            var fileName = jQuery(this).attr('data-file');
            window.location.href = fileName;
        });
    },

    registerEventToShowMoreFile: function(){
        var thisInstance=this;
        jQuery('.summaryWidgetContainer').on("click", "button.showMoreFile", function(e){
            e.preventDefault();
            var type = jQuery(this).data('type');
            var page=jQuery(this).data('page');
            page += 1;
            var url = "index.php?module=AutomatedBackup&view=ListLogFiles&page="+page+"&type="+type;
            var progressIndicatorElement = jQuery.progressIndicator({
                'message' : app.vtranslate('Loading, Please wait.........'),
                'position' : 'html',
                'blockInfo' : {
                    'enabled' : true
                }
            });

            app.request.post({'url':url}).then(function(err,data) {
                if(err === null) {
                    app.helper.hideProgress();
                    var logFiles = jQuery('#' + type + "LogFiles");
                    var dataLogs = jQuery(data);
                    if (dataLogs.length < 10) {
                        jQuery(e.currentTarget).remove();
                    } else {
                        jQuery(e.currentTarget).data('page', page + 1)
                    }
                    logFiles.find('tbody').append(data);
                }
            });
        });
    },


    loadListBackupFiles : function (page,type) {
        var url = "index.php?module=AutomatedBackup&view=ListLogFiles&page="+page+"&type="+type;
        var progressIndicatorElement = jQuery.progressIndicator({
            'message' : app.vtranslate('Loading, Please wait.........'),
            'position' : 'html',
            'blockInfo' : {
                'enabled' : true
            }
        });
        app.request.post({'url':url}).then(function(err,data) {
            if(err === null) {
                app.helper.hideProgress();
                var logFiles = jQuery('#'+type+"LogFiles");
                logFiles.find('tbody').html(data);
            }
        });
    },
    /*
     * FTP Backup
     * */
    registerEventForTestConnection: function(){
        jQuery('.FTPBackupAction').on("click", "button[name=testConnection]", function(e) {
            e.preventDefault();
            app.helper.showProgress();
            var params={};
            params = jQuery("#formFTPBackup").serializeFormData();
            params['module']='AutomatedBackup';
            params['action']='ActionAjax';
            params['mode']='testConnection';
            app.request.post({'data':params}).then(
                function(err,data) {
                    app.helper.hideProgress();
                    if(data == true){
                        app.helper.showSuccessNotification({'message':app.vtranslate('Connected !')});
                    }else{
                        app.helper.showSuccessNotification({'message':app.vtranslate('Couldn\'t connect')});
                    }
                },
                function(error,err){
                    app.helper.hideProgress();
                }
            );
        });
    },

    registerEventToSaveFTPBackup: function(){
        jQuery('.FTPBackupAction').on("click", "button[name=saveFTPBackup]", function(e) {
            e.preventDefault();
            app.helper.showProgress();
            var params={};
            params = jQuery("#formFTPBackup").serializeFormData();
            params['module']='AutomatedBackup';
            params['action']='SaveAjax';
            params['mode']='saveFTPSettings';
            app.request.post({'data':params}).then(
                function(err,data) {
                    app.helper.hideProgress();
                    if(err === null){
                        app.helper.showSuccessNotification({'message':app.vtranslate('Successfully !')});
                    }
                },
                function(error,err){
                    app.helper.hideProgress();
                }
            );
        });
    },

    registerEventToRunFTPBackup: function(){
        var thisInstance = this;
        jQuery('.FTPBackupAction').on("click", "button[name=runFTPBackup]", function(e) {
            e.preventDefault();
            var message = app.vtranslate('LBL_BACKUP_CONFIRMATION');
            app.helper.showConfirmationBox({'message' : message}).then(
                function(e) {
                    var params={};
                    params = jQuery("#formFTPBackup").serializeFormData();
                    params['module']='AutomatedBackup';
                    params['action']='RunBackupAjax';
                    params['mode']='runFTPBackup';

                    var runningMessage = app.vtranslate('LBL_BACKUP_RUNNING');
                    var progressIndicatorElement = jQuery.progressIndicator({
                        'message' : runningMessage,
                        'position' : 'html',
                        'blockInfo' : {
                            'enabled' : true
                        }
                    });
                    app.request.post({'data':params}).then(
                        function(err,data) {
                            app.helper.hideProgress();
                            if(data === 'SUCCESS'){
                                app.helper.showSuccessNotification({'message':app.vtranslate('Successfully !')});

                                thisInstance.loadListBackupFiles(0,'ftpbackup');
                            }else{
                                app.helper.showSuccessNotification({'message':data});
                            }
                        },
                        function(error,err){
                            app.helper.hideProgress();
                        }
                    );
                },
                function(error, err){
                }
            );
        });
    },

    /**
     * Function to register event for ckeditor for body
     */
    registerEventForCkEditor : function(){
        var form = jQuery('#formEmailReport');
        var noteContentElement = form.find('[name="emailreport_body"]');
        if(noteContentElement.length > 0){
            noteContentElement.addClass('ckEditorSource');
            var ckEditorInstance = new Vtiger_CkEditor_Js();
            ckEditorInstance.loadCkEditor(noteContentElement);
        }
    },

    registerEventToSaveEmailReport : function () {
        var form = jQuery('#formEmailReport');
        form.on('click','button[name="saveEmailReport"]', function (e) {
            e.preventDefault();
            app.helper.showProgress();
            var params={};
            params = jQuery("#formEmailReport").serializeFormData();
            params['module']='AutomatedBackup';
            params['action']='SaveAjax';
            params['mode']='saveEmailSettings';
            var editorData = CKEDITOR.instances.emailreport_body.getData();
            params['emailreport_body']=editorData;

            app.request.post({'data':params}).then(
                function(err,data) {
                    app.helper.hideProgress();
                    if(err === null){
                        app.helper.showSuccessNotification({'message':app.vtranslate('Successfully !')});
                    }
                },
                function(error,err){
                    app.helper.hideProgress();
                }
            );
        });
    },
    registerActivateLicenseEvent : function() {
        var aDeferred = jQuery.Deferred();
        jQuery(".installationContents").find('[name="btnActivate"]').click(function() {
            var license_key=jQuery('#license_key');
            if(license_key.val()=='') {
                app.helper.showAlertBox({message:"License Key cannot be empty"});
                aDeferred.reject();
                return aDeferred.promise();
            }else{
                app.helper.showProgress();
                var params = {};
                params['module'] = app.getModuleName();
                params['action'] = 'Activate';
                params['mode'] = 'activate';
                params['license'] = license_key.val();

                app.request.post({data:params}).then(
                    function(err,data) {
                        app.helper.hideProgress();
                        if(err == null){
                            var message=data['message'];
                            if(message !='Valid License') {
                                app.helper.hideProgress();
                                app.helper.hideModal();
                                app.helper.showAlertNotification({'message':data['message']});
                            }else{
                                document.location.href="index.php?module=AutomatedBackup&parent=Settings&view=Settings&mode=step3";
                            }
                        }
                    },
                    function(error) {
                        app.helper.hideProgress();
                    }
                );
            }
        });
    },
    registerValidEvent: function () {
        jQuery(".installationContents").find('[name="btnFinish"]').click(function() {
            app.helper.showProgress();
            var data = {};
            data['module'] = 'AutomatedBackup';
            data['action'] = 'Activate';
            data['mode'] = 'valid';
            app.request.post({data:data}).then(
                function (err,data) {
                    if(err == null){
                        app.helper.hideProgress();
                        if (data) {
                            document.location.href = "index.php?module=AutomatedBackup&parent=Settings&view=Settings";
                        }
                    }
                }
            );
        });
    },
    registerEvents: function(){
        this.registerEventToTestPermissions();
        this.registerEventToSaveLocalBackup();
        this.registerEventToRunLocalBackup();
        this.registerEventForDownloadFile();
        this.registerEventToShowMoreFile();
        this.registerEventForTestConnection();
        this.registerEventToSaveFTPBackup();
        this.registerEventToRunFTPBackup();
        this.registerEventForCkEditor();
        this.registerEventToSaveEmailReport();
        this.registerActivateLicenseEvent();
        this.registerValidEvent();
    }
});
jQuery(document).ready(function() {
    var instance = new AutomatedBackup_Settings_Js();
    instance.registerEvents();
    Vtiger_Index_Js.getInstance().registerEvents();
});

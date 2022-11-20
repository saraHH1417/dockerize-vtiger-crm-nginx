/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */


jQuery.Class("AutomatedBackup_Settings_Js",{
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
            var moduleName = jQuery("input[name=module]").val();
            var directory = jQuery("input[name=localbackup_directory]").val();
            var url = "index.php?module=AutomatedBackup&action=ActionAjax&mode=testPermissions&directory="+directory;
            AppConnector.request(url).then(
                function(data) {
                    if(data.result === true){
                        jQuery.pnotify({pnotify_title: 'Message', pnotify_text: app.vtranslate('LBL_PROPER_WRITE_PERMISSIONS'), delay: '3000', type: 'success', pnotify_history:false});
                    }else if(data.result === false){
                        jQuery.pnotify({pnotify_title: 'Message', pnotify_text: app.vtranslate('LBL_DIRECTORY_NOT_PERMISSIONS'), delay: '3000', type: 'error', pnotify_history:false});
                    }else{
                        jQuery.pnotify({pnotify_title: 'Message', pnotify_text: app.vtranslate('LBL_DIRECTORY_NOT_EXISTS'), delay: '3000', type: 'error', pnotify_history:false});
                    }
                },
                function(error,err){

                }
            );
        });
    },

    registerEventToSaveLocalBackup: function(){
        jQuery('.localBackupAction').on("click", "button[name=saveLocalBackup]", function(e) {
            e.preventDefault();
            var progressIndicatorElement = jQuery.progressIndicator();
            var params={};
            params = jQuery("#formLocalBackup").serializeFormData();
            params['module']='AutomatedBackup';
            params['action']='SaveAjax';
            params['mode']='saveLocalSettings';
            AppConnector.request(params).then(
                function(data) {
                    progressIndicatorElement.progressIndicator({'mode':'hide'});
                    if(data.success == true){
                        jQuery.pnotify({pnotify_title: 'Message', pnotify_text: 'Successfully !', delay: '3000', type: 'success', pnotify_history:false});
                    }
                },
                function(error,err){
                    progressIndicatorElement.progressIndicator({'mode':'hide'});
                }
            );
        });
    },

    registerEventToRunLocalBackup: function(){
        var thisInstance = this;
        jQuery('.localBackupAction').on("click", "button[name=runLocalBackup]", function(e) {
            e.preventDefault()
            var message = app.vtranslate('LBL_BACKUP_CONFIRMATION');
            Vtiger_Helper_Js.showConfirmationBox({'message' : message}).then(
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
                    AppConnector.request(params).then(
                        function(data){
                            progressIndicatorElement.progressIndicator({
                                'mode' : 'hide'
                            });

                            if(data.result == 'SUCCESS'){
                                jQuery.pnotify({pnotify_title: 'Message', pnotify_text: 'Successfully !', delay: '3000', type: 'success', pnotify_history:false});
                                thisInstance.loadListBackupFiles(0,'localbackup');
                            }else{
                                jQuery.pnotify({pnotify_title: 'Message', pnotify_text: data.result, delay: '3000', type: 'error', pnotify_history:false});
                            }
                        },
                        function(error,err){
                            progressIndicatorElement.progressIndicator({
                                'mode' : 'hide'
                            });
                        }
                    );
                },
                function(error, err){
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
                'message' : 'Loading, Please wait.........',
                'position' : 'html',
                'blockInfo' : {
                    'enabled' : true
                }
            });
            AppConnector.request(url).then(
                function(data) {
                    progressIndicatorElement.progressIndicator({
                        'mode' : 'hide'
                    });
                    var logFiles = jQuery('#'+type+"LogFiles");
                    var dataLogs=jQuery(data);
                    if(dataLogs.length < 10) {
                        jQuery(e.currentTarget).remove();
                    }else{
                        jQuery(e.currentTarget).data('page',page+1)
                    }
                    logFiles.find('tbody').append(data);
                },
                function(error,err){

                }
            );
        });
    },


    loadListBackupFiles : function (page,type) {
        var url = "index.php?module=AutomatedBackup&view=ListLogFiles&page="+page+"&type="+type;
        var progressIndicatorElement = jQuery.progressIndicator({
            'message' : 'Loading, Please wait.........',
            'position' : 'html',
            'blockInfo' : {
                'enabled' : true
            }
        });
        AppConnector.request(url).then(
            function(data) {
                progressIndicatorElement.progressIndicator({
                    'mode' : 'hide'
                });
                var logFiles = jQuery('#'+type+"LogFiles");
                logFiles.find('tbody').html(data);
            },
            function(error,err){

            }
        );
    },
    /*
     * FTP Backup
     * */
    registerEventForTestConnection: function(){
        jQuery('.FTPBackupAction').on("click", "button[name=testConnection]", function(e) {
            e.preventDefault();
            var progressIndicatorElement = jQuery.progressIndicator();
            var params={};
            params = jQuery("#formFTPBackup").serializeFormData();
            params['module']='AutomatedBackup';
            params['action']='ActionAjax';
            params['mode']='testConnection';
            AppConnector.request(params).then(
                function(data) {
                    progressIndicatorElement.progressIndicator({'mode':'hide'});
                    if(data.result == true){
                        jQuery.pnotify({pnotify_title: 'Message', pnotify_text: 'Connected !', delay: '3000', type: 'success', pnotify_history:false});
                    }else{
                        jQuery.pnotify({pnotify_title: 'Message', pnotify_text: 'Couldn\'t connect', delay: '3000', type: 'error', pnotify_history:false});
                    }
                },
                function(error,err){
                    progressIndicatorElement.progressIndicator({'mode':'hide'});
                }
            );
        });
    },

    registerEventToSaveFTPBackup: function(){
        jQuery('.FTPBackupAction').on("click", "button[name=saveFTPBackup]", function(e) {
            e.preventDefault();
            var progressIndicatorElement = jQuery.progressIndicator();
            var params={};
            params = jQuery("#formFTPBackup").serializeFormData();
            params['module']='AutomatedBackup';
            params['action']='SaveAjax';
            params['mode']='saveFTPSettings';
            AppConnector.request(params).then(
                function(data) {
                    progressIndicatorElement.progressIndicator({'mode':'hide'});
                    if(data.success == true){
                        jQuery.pnotify({pnotify_title: 'Message', pnotify_text: 'Successfully !', delay: '3000', type: 'success', pnotify_history:false});
                    }
                },
                function(error,err){
                    progressIndicatorElement.progressIndicator({'mode':'hide'});
                }
            );
        });
    },

    registerEventToRunFTPBackup: function(){
        var thisInstance = this;
        jQuery('.FTPBackupAction').on("click", "button[name=runFTPBackup]", function(e) {
            e.preventDefault();
            var message = app.vtranslate('LBL_BACKUP_CONFIRMATION');
            Vtiger_Helper_Js.showConfirmationBox({'message' : message}).then(
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
                    AppConnector.request(params).then(
                        function(data){
                            progressIndicatorElement.progressIndicator({
                                'mode' : 'hide'
                            });

                            if(data.result == 'SUCCESS'){
                                jQuery.pnotify({pnotify_title: 'Message', pnotify_text: 'Successfully !', delay: '3000', type: 'success', pnotify_history:false});
                                thisInstance.loadListBackupFiles(0,'ftpbackup');
                            }else{
                                jQuery.pnotify({pnotify_title: 'Message', pnotify_text: data.result, delay: '3000', type: 'error', pnotify_history:false});
                            }
                        },
                        function(error,err){
                            progressIndicatorElement.progressIndicator({
                                'mode' : 'hide'
                            });
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
            var progressIndicatorElement = jQuery.progressIndicator();
            var params={};
            params = jQuery("#formEmailReport").serializeFormData();
            params['module']='AutomatedBackup';
            params['action']='SaveAjax';
            params['mode']='saveEmailSettings';
            var editorData = CKEDITOR.instances.emailreport_body.getData();
            params['emailreport_body']=editorData;

            AppConnector.request(params).then(
                function(data) {
                    progressIndicatorElement.progressIndicator({'mode':'hide'});
                    if(data.success == true){
                        jQuery.pnotify({pnotify_title: 'Message', pnotify_text: 'Successfully !', delay: '3000', type: 'success', pnotify_history:false});
                    }
                },
                function(error,err){
                    progressIndicatorElement.progressIndicator({'mode':'hide'});
                }
            );
        });
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
                                document.location.href="index.php?module=AutomatedBackup&parent=Settings&view=Settings&mode=step3";
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
                        document.location.href = "index.php?module=AutomatedBackup&parent=Settings&view=Settings";
                    }
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({'mode': 'hide'});
                }
            );
        });
    },
    /* For License page - End */
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

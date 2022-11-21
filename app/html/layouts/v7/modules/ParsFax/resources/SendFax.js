var ParsFax = {
    displaySelectWizard: function (massActionUrl, module) {
        //var massActionUrl = "index.php"
        //alert(module);
        var listInstance = Vtiger_List_Js.getInstance();
        var validationResult = listInstance.checkListRecordSelected();
        if (validationResult != true) {
            var progressIndicatorElement = jQuery.progressIndicator();
            var selectedIds = listInstance.readSelectedIds(true);
            var excludedIds = listInstance.readExcludedIds(true);
            var cvId = listInstance.getCurrentCvId();
            var postData = {
                "sourceModule": module,
                "viewname": cvId,
                "selected_ids": selectedIds,
                "excluded_ids": excludedIds,
            };

            ParsFax.checkServerConfig('ParsFax').then(function (data) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});

                if (data.state == true) {
                    var extras = jQuery.param(postData);
                    Vtiger_List_Js.triggerMassAction(massActionUrl + "&" + extras);
                } else {
                    ParsFax.showNotify(data.message, data.code);
                    //alert(data.message);
                }
            });
        } else {
            listInstance.noRecordSelectedAlert();
        }
    },

    showNotify: function (message, code) {
        if (code == '7')
            app.helper.showErrorNotification({'message': message});
        else
            Vtiger_Helper_Js.showPnotify(message);
    },

    triggerSendFax: function (detailActionUrl) {
        var progressIndicatorElement = jQuery.progressIndicator();
        ParsFax.checkServerConfig('ParsFax').then(function (data) {
            progressIndicatorElement.progressIndicator({'mode': 'hide'});
            if (data.state == true) {
                var currentInstance = Vtiger_Detail_Js.getInstance();
                var parentRecord = new Array();
                parentRecord.push(currentInstance.getRecordId());
                var params = [parentRecord];
                var postData = {
                    //"sourceModule": module,
                    //"viewname": cvId,
                    "selected_ids": JSON.stringify(params),
                    //"excluded_ids": excludedIds,
                };
                var extras = jQuery.param(postData);
                Vtiger_Detail_Js.triggerDetailViewAction(detailActionUrl + "&" + extras);
                ParsFax.LoadEditor();
            } else {
                ParsFax.showNotify(data.message, data.code);
            }
        });
    },

    registerSelectTemplate: function () {
        var url = jQuery('#selectEmailTemplate').data('url');
        var popupInstance = Vtiger_Popup_Js.getInstance();


        popupInstance.show(url, function (data) {
            var responseData = JSON.parse(data);
            for (var id in responseData) {
                var selectedName = responseData[id].name;
                var selectedTemplateBody = responseData[id].info;
            }
            var textAreaElement = jQuery('#faxdescription');
            if (typeof CKEDITOR == 'undefined') {
                jQuery(textAreaElement).val(ParsFax.stripHTML(selectedTemplateBody));
            } else {
                var ckEditorInstance = new Vtiger_CkEditor_Js();
                ckEditorInstance.setElement(textAreaElement);
                ckEditorInstance.loadContentsInCkeditor(selectedTemplateBody);
            }
        }, 'tempalteWindow');
    },

    stripHTML: function (text) {
        var regex = /(<([^>]+)>)/ig;
        return text.replace(regex, "");
    },

    LoadEditor: function () {
        setTimeout(function () {
            var textAreaElement = jQuery('#faxdescription');
            var ckEditorInstance = new Vtiger_CkEditor_Js();
            ckEditorInstance.loadCkEditor(textAreaElement);
        }, 3000);
    },

    checkServerConfig: function (module) {
        var aDeferred = jQuery.Deferred();
        var actionParams = {
            "action": 'CheckServerInfo',
            'module': module
        };
        AppConnector.request(actionParams).then(
            function (data) {
                var state = {};
                //alert(JSON.stringify(data));
                if (data.success && data.result.success) {
                    state['state'] = true;
                } else {
                    state['state'] = false;
                    state['code'] = data.error.code;
                    state['message'] = data.error.message;
                }
                //alert(JSON.stringify(state));
                aDeferred.resolve(state);
            }
        );
        return aDeferred.promise();
    },
}

jQuery.Class("ParsFax_CkEditor_Js", {}, {
    getckEditorInstance: function () {

        var textAreaElement = jQuery('#faxdescription');
        var ckEditorInstance = new Vtiger_CkEditor_Js();
        ckEditorInstance.loadCkEditor(textAreaElement);
    },
    registerEvents: function () {
        var thisInstance = this;
        var ckEditorInstance = this.getckEditorInstance();
    }
});
jQuery(document).ready(function () {
    var PDFMakerCkEditorJsInstance = new ParsFax_CkEditor_Js();
    PDFMakerCkEditorJsInstance.registerEvents();
});

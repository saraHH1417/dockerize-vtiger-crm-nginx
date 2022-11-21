var ParsFax = {
    preloadData: new Array(),
    displaySelectWizard: function (massActionUrl, module) {
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
                    app.helper.showProgress();
                    app.request.get({'url': massActionUrl + "&" + extras}).then(
                        function (err, data) {
                            app.helper.loadPageContentOverlay(data);
                            app.helper.hideProgress();
                            ParsFax.sendFax();
                            app.helper.showVerticalScroll(jQuery('.modal-body'), {setHeight: (window.innerHeight - 200 ) + "px"});
                        });
                    //return false;
                    //Vtiger_List_Js.triggerMassAction(massActionUrl + "&" + extras);
                } else {
                    ParsFax.showNotify(data.message, data.code);
                }
            });
        } else {
            listInstance.noRecordSelectedAlert();
        }
    },
    onlyUnique: function(names) {
        let unique = {};
        names.forEach(function(i) {
            if(!unique[i]) {
                unique[i] = true;
            }
        });
        return Object.keys(unique);
    },
    setSelect2Value: function (value) {
        value = value.replace(/-/g,'');
        value = value.replace(/\+/g,'00');
        if (value === '') { return false; }
        var intRegex = /^\d+$/;
        var fieldRegex = /^Field:/;
        if (!intRegex.test(value) && !fieldRegex.test(value)) { return false; }

            var selectedItems = $("#faxPicklistUi").val();
        if (selectedItems !== '') {
            if (selectedItems.includes(",")) {
                selectedItems = selectedItems.split(",");
            } else {
                selectedItems = [selectedItems];
            }
            selectedItems.push(value);
            selectedItems= (ParsFax.onlyUnique(selectedItems));
        } else {
            selectedItems = [value];
        }
        $("#faxPicklistUi").select2('destroy');
        $("#faxPicklistUi").val(selectedItems.join(","));
        ParsFax.registerPicklist2();
    },
    sendFax: function () {
        ParsFax.registerPicklist2();
        var time = 5;
        if (typeof CKEDITOR != 'undefined') {
            ParsFax.LoadEditor(time);
        }
    },
    showNotify: function (message, code) {
        if (code == '7')
            app.helper.showErrorNotification({'message': message});
        else
            Vtiger_Helper_Js.showPnotify(message);
    },
    getPreloadData: function () {
        return this.preloadData;
    },
    setPreloadData: function (dataInfo) {
        this.preloadData = dataInfo;
        return this;
    },
    triggerSendFax: function (detailActionUrl) {
        var progressIndicatorElement = jQuery.progressIndicator();
        ParsFax.checkServerConfig('ParsFax').then(function (data) {
            progressIndicatorElement.progressIndicator({'mode': 'hide'});
            if (data.state == true) {
                var currentInstance = window.app.controller();
                var parentRecord = new Array();
                parentRecord.push(currentInstance.getRecordId());
                var params = [parentRecord];
                var srcmodule = app.getModuleName();
                var inventoryModules = ["Invoice", "Quotes", "SalesOrder", "PurchaseOrder"];
                var postData = {
                    "sourceModule": srcmodule,
                    "selected_ids": JSON.stringify(params),
                };
                var extras = jQuery.param(postData);
                app.helper.showProgress();
                app.request.get({'url': detailActionUrl + "&" + extras}).then(
                    function (err, data) {
                        app.helper.loadPageContentOverlay(data);
                        app.helper.hideProgress();
                        ParsFax.sendFax();
                        ParsFax.registerEventsForToField();
                        app.helper.showVerticalScroll(jQuery('#SendFax'), {setHeight: (window.innerHeight - 200 ) + "px"});
                    });
            } else {
                ParsFax.showNotify(data.message, data.code);
            }

        });
    },
    showpopupModal: function () {
        var thisInstance = this;
        vtUtils.applyFieldElementsView(jQuery('.popupModal'));
        jQuery('.popupModal').modal();
        jQuery('.popupModal').on('shown.bs.modal', function () {
            jQuery('.myModal').css('opacity', .5);
            jQuery('.myModal').unbind();
        });

        jQuery('.popupModal').on('hidden.bs.modal', function () {
            this.remove();
            jQuery('.myModal').css('opacity', 1);
            jQuery('.myModal').removeData("modal").modal(app.helper.defaultModalParams());
            jQuery('.myModal').bind();
        });
    },
    registerSelectTemplate: function () {
        var url = jQuery('#selectEmailTemplate').data('url');
        var thisInstance = this;
        var postParams = app.convertUrlToDataParams(url);
        app.request.post({data: postParams}).then(function (err, data) {
            if (err === null) {
                jQuery('.popupModal').remove();
                var ele = jQuery('<div class="modal popupModal"></div>');
                ele.append(data);
                jQuery('body').append(ele);

                thisInstance.showpopupModal();
                app.event.trigger("post.Popup.Load", {"eventToTrigger": "post.EmailTemplateList.click"});
            }


            jQuery('#emailTemplateWarning .alert-warning .close').click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                jQuery('#emailTemplateWarning').addClass('hide');
            });

            app.event.on("post.EmailTemplateList.click", function (event, data) {
                jQuery('.popupModal').remove();
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
                jQuery('#emailTemplateWarning').removeClass('hide');
                jQuery('.popupModal').modal('hide');
                // jQuery('.modal').modal('hide');
            });
        });
    },
    /**
     * Function to get ckEditorInstance
     */
    getckEditorInstance: function () {
        if (this.ckEditorInstance == false) {
            this.ckEditorInstance = new Vtiger_CkEditor_Js();
        }
        return this.ckEditorInstance;
    },
    registerPicklist2: function (selectedData) {
        if (jQuery('#faxPicklistUi').length) {
            var selected_ids = JSON.parse($("input[name='selected_ids']").val());
            var source_module = $("input[name='source_module']").val();
            var url = '';
            if (selected_ids == "" || selected_ids == null)
                url = 'index.php?module=ParsFax&action=BasicAjax';
            else
                url = 'index.php?module=ParsFax&action=BasicAjax&selected_ids=' + selected_ids + '&source_module=' + source_module;


            var preloadData = ParsFax.getPreloadData();
            var form = jQuery('#SendFax');
            var select2params = {
                minimumInputLength: 3,
                closeOnSelect: false,

                tags: [],
                tokenSeparators: [","],

                createSearchChoice: function (term) {
                    return {id: term, text: term};
                },

                ajax: {
                    'url':url,
                    'dataType': 'json',
                    'data': function (term, page) {
                        var data = {};
                        data['searchValue'] = term;
                        return data;
                    },
                    'results': function (data) {
                        var finalResult = [];
                        var results = data.result;
                        var resultData = new Array();
                        for (var moduleName in results) {
                            var moduleResult = [];
                            moduleResult.text = moduleName;
                            var children = new Array();
                            for (var recordId in data.result[moduleName]) {
                                var phoneInfo = data.result[moduleName][recordId];
                                for (var i in phoneInfo) {
                                    var childrenInfo = [];
                                    childrenInfo.recordId = recordId;
                                    childrenInfo.id = phoneInfo[i].value;
                                    childrenInfo.text = phoneInfo[i].label;
                                    children.push(childrenInfo);
                                }
                            }
                            moduleResult.children = children;
                            resultData.push(moduleResult);
                        }

                        preloadData.push(moduleResult);
                        ParsFax.setPreloadData(preloadData);
                        finalResult.results = resultData;
                        return finalResult;
                    },
                    transport: function (params) {
                        return jQuery.ajax(params);
                    }
                }
            }
            app.showSelect2ElementView(form.find('[name="numbers"]'), select2params);
            var pickListValueElement = jQuery('#faxPicklistUi');
            var pickLisValues = pickListValueElement.val();
            var pickListValuesArray = pickLisValues.split(',');
            var pickListValuesArraySize = pickListValuesArray.length;
            var specialChars = /["]/;
            var intRegex = /^\d+$/;
            var fieldRegex = /^Field:/;
            var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;

            if (pickListValuesArray != '') {
                var myData = new Array();
                for (var i = 0; i < pickListValuesArray.length; i++) {
                    myData.push({
                        id: pickListValuesArray[i],
                        text: pickListValuesArray[i]
                    });

                    if (!intRegex.test(pickListValuesArray[i]) && !fieldRegex.test(pickListValuesArray[i])) {
                        var select2Element = app.getSelect2ElementFromSelect(pickListValueElement);
                        var message = app.vtranslate('Phone Numbers Only!')+pickListValuesArray[i];
                        select2Element.validationEngine('showPrompt', message, 'error', 'bottomLeft', true);
                        return false;
                    }
                }
                $('#faxPicklistUi').select2("data", myData);
            }

            var lowerCasedpickListValuesArray = jQuery.map(pickListValuesArray, function (item, index) {
                return item.toLowerCase();
            });
            var uniqueLowerCasedpickListValuesArray = jQuery.unique(lowerCasedpickListValuesArray);
            var uniqueLowerCasedpickListValuesArraySize = uniqueLowerCasedpickListValuesArray.length;
            var arrayDiffSize = pickListValuesArraySize - uniqueLowerCasedpickListValuesArraySize;

            if (arrayDiffSize > 0) {
                var select2Element = app.getSelect2ElementFromSelect(pickListValueElement);
                var message = app.vtranslate('JS_DUPLICATES_VALUES_FOUND');
                select2Element.validationEngine('showPrompt', message, 'error', 'bottomLeft', true);
                return false;
            }
        } else {
            setTimeout(function () {
                ParsFax.registerPicklist2();
            }, 3000);
        }
    },
    registerPicklist: function () {
        var form = jQuery('#SendFax');
        if (jQuery('#faxPicklistUi').length) {
            var select2params = {
                minimumInputLength: 3,
                closeOnSelect: false,

                tags: [],
                tokenSeparators: [","],
                createSearchChoice: function (term) {
                    return {id: term, text: term};
                },

            }
            app.showSelect2ElementView(form.find('[name="numbers"]'), select2params);
            var pickListValueElement = jQuery('#faxPicklistUi');
            var pickLisValues = pickListValueElement.val();
            var pickListValuesArray = pickLisValues.split(',');
            var pickListValuesArraySize = pickListValuesArray.length;
            var specialChars = /["]/;
            var intRegex = /^\d+$/;
            var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;

            for (var i = 0; i < pickListValuesArray.length; i++) {
                if (!intRegex.test(pickListValuesArray[i])) {
                    var select2Element = app.getSelect2ElementFromSelect(pickListValueElement);
                    var message = app.vtranslate('Phone Numbers Only!');
                    select2Element.validationEngine('showPrompt', message, 'error', 'bottomLeft', true);
                    return false;
                }
            }
            var lowerCasedpickListValuesArray = jQuery.map(pickListValuesArray, function (item, index) {
                return item.toLowerCase();
            });
            var uniqueLowerCasedpickListValuesArray = jQuery.unique(lowerCasedpickListValuesArray);
            var uniqueLowerCasedpickListValuesArraySize = uniqueLowerCasedpickListValuesArray.length;
            var arrayDiffSize = pickListValuesArraySize - uniqueLowerCasedpickListValuesArraySize;
            if (arrayDiffSize > 0) {
                var select2Element = app.getSelect2ElementFromSelect(pickListValueElement);
                var message = app.vtranslate('JS_DUPLICATES_VALUES_FOUND');
                select2Element.validationEngine('showPrompt', message, 'error', 'bottomLeft', true);
                return false;
            }

        } else {
            setTimeout(function () {
                ParsFax.registerPicklist();
            }, 3000);
        }
        //
    },
    stripHTML: function (text) {
        var regex = /(<([^>]+)>)/ig;
        return text.replace(regex, "");
    },
    LoadEditor: function (time) {
        setTimeout(function () {
            if (jQuery('#faxdescription').length) {
                var textAreaElement = jQuery('#faxdescription');
                var ckEditorInstance = new Vtiger_CkEditor_Js();
                ckEditorInstance.loadCkEditor(textAreaElement);
                $('input[name=content_type]').val('html');
            } else {
                ParsFax.LoadEditor(3);
            }
        }, time * 100);
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
                if (data.success && data.result.success) {
                    state['state'] = true;
                } else {
                    state['state'] = false;
                    state['code'] = data.result.code;
                    state['message'] = data.result.message;
                }
                aDeferred.resolve(state);
            }
        );
        return aDeferred.promise();
    },
    checkVtigerVersion: function (number) {
        var aDeferred = jQuery.Deferred();
        var actionParams = {
            "action": 'CheckVtigerVersion',
            'module': 'ParsFax',
            'number': number
        };
        // alert(JSON.stringify(actionParams));
        app.request.post({data: actionParams}).then(
            function (err, data) {
                if (err === null) {
                    var state = {};
                    if (data.success /*&& data.result.success*/) {
                        state['state'] = true;
                    } else {
                        state['state'] = false;
                        state['code'] = data.code;
                        state['message'] = data.message;
                    }
                    aDeferred.resolve(state);
                } else {
                    alert(JSON.stringify(err));
                }
            }
        );
        return aDeferred.promise();
    },
    registerEventsForToField: function() {
        var thisInstance = this;
        jQuery('#sendfaxContainer').on('click','.selectFax',function(e){
            var moduleSelected = jQuery('.faxModulesList').select2('val');
            var sourceModule = jQuery('[name=module]').val();
            var params = {
                'module' : 'ParsFax',
                'src_module' : moduleSelected,
                'view': 'RelatedModulePopup'
            }
            var popupInstance =Vtiger_Popup_Js.getInstance();
            popupInstance.showPopup(params, function(data){
                var responseData = JSON.parse(data);
                for(var id in responseData){
                    var data = responseData[id].info;
                    thisInstance.setSelectFaxFieldValues(data);
                }
                app.helper.hidePopup();
            },'relatedFaxModules');
        });

        jQuery('#sendfaxContainer').on('click','[name="clearToEmailField"]',function(e){
            var element = jQuery(e.currentTarget);
            element.closest('div.toEmailField').find('.sourceField').val('');
            jQuery('#sendfaxContainer').find('[name="toemailinfo"]').val(JSON.stringify(new Array()));
            jQuery('#sendfaxContainer').find('[name="selected_ids"]').val(JSON.stringify(new Array()));
            jQuery('#sendfaxContainer').find('[name="to"]').val(JSON.stringify(new Array()));

            var preloadData = [];
            thisInstance.setPreloadData(preloadData);
            jQuery('#sendfaxContainer').find('#emailField').select2('data', preloadData);
        });

    },
    setSelectFaxFieldValues : function(data){
        var thisInstance = this;
        jQuery('.showavailablefaxes').removeClass('hide');
        var output = '<option value="" selected>'+app.vtranslate('Select the phone number fields to send')+'</option>';
        $.each(data, function( index, value ) {
            if (value !== ''){
                output = output + '<option value="'+value+'">'+value+'</option>';
            }
        });
        $("#availablefaxphones").html('');
        $("#availablefaxphones").append(output);
        $("#availablefaxphones").select2();
    },
    clearToFaxField : function(){
        var thisInstance = this;
        jQuery('.showavailablefaxes').addClass('hide');
        var output = '<option value="" selected>'+app.vtranslate('Select the phone number fields to send')+'</option>';
        $("#availablefaxphones").html('');
        $("#availablefaxphones").append(output);
        $("#availablefaxphones").select2();
        $("#faxPicklistUi").select2('destroy');
        $("#faxPicklistUi").val([]);
        ParsFax.registerPicklist2();
    },
}

jQuery(document).ready(function () {
    $(document).on('change', '#faxPicklistUi', function () {
        ParsFax.registerPicklist2();
    });
    $(document).on('change', '#availablefaxphones', function () {
        ParsFax.setSelect2Value($(this).val());
    });
    $(document).on('click', '#clearToFaxField', function () {
        ParsFax.clearToFaxField();
    });
    $(document).on('change', '#FaxFiles', function () {
        $('.filenames').html('');
        var max_fax_file = jQuery('#sendfaxContainer').data('max');
        if (this.files.length > max_fax_file) {
            ParsFax.checkVtigerVersion(max_fax_file).then(function (data) {

                $('#FaxFiles').val('');
                ParsFax.showNotify(data.message, data.code);
                $('.filenames').html('');
                $('#uploadfaxfiles').removeClass('btn-info');
                $('#uploadfaxfiles').addClass('btn-danger');
                return;
            });
        }
        $('#uploadfaxfiles').addClass('btn-info');
        $('#uploadfaxfiles').removeClass('btn-danger');

        for (var i = 0; i < this.files.length; i++) {
            var filename = this.files[i].name;
            $('.filenames').append('<div class="name">' + filename + '</div>');
        }
    });
});


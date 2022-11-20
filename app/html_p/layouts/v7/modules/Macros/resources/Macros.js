Vtiger.Class('Macros', {
    initData_Macros: function () {
        var current_url = $.url();
        var module = current_url.param('module');
        var view = current_url.param('view');
        var action = current_url.param('action');
        var parent = current_url.param('parent');
        var record = current_url.param('record');
        // Only load when loadHeaderScript=1 END #241208
        // add Macros button
        if (view == "Detail" && record != undefined) {
            var params = {};
            params['module'] = 'Macros';
            params['action'] = 'MacrosAjax';
            params['mode'] = 'getMacrosWorkflows';
            params['record'] = record;
            params['source_module'] = module;
            app.request.post({'data': params}).then(
                function (err, data) {
                    if (err === null) {
                        var size = 0;
                        $.each(data, function (id) {
                            size++;
                        });
                        if(size>0) {
                            var html =
                                '<div class="modal fade in myModal" role="dialog" style="display: block;">'
                                +'<div class="modal-backdrop fade in"></div>'
                                +'<div class="modal-dialog modal-sm" style="width: 550px">'
                                +'<div class="modal-content">'
                                +'<div class="modal-header">'
                                +'<button type="button" class="close" data-dismiss="modal">&times;</button>'
                                +'<h4 class="modal-title">'+app.vtranslate('Macros')+'</h4></div>'
                                +'<div class="modal-body">'+
                                '<table class="table">'+
                                '<tbody>';
                            $.each(data, function (k, detail) {
                                html +=
                                    '<tr>' +
                                    '<td style="width: 90%; border-top: none; border-bottom: 1px solid #ddd;">' +'<a href="javascript: void(0)" style="font-weight: bold;" onclick="runMacro(' + data[k].id + ',' + record + ')">' + data[k].name + '</a><br style="line-height: 23px"/>' +
                                    '<i style="margin-top: 3px; color: grey">'+ data[k].des + '</i></td>' +
                                    '<td style="border-top: none; border-bottom: 1px solid #ddd;">' + '<button style="float:right" type="button" onclick="runMacro(' + data[k].id + ',' + record + ')" class="btn btn-danger">'+app.vtranslate('Run')+'</button>'+
                                    '</td>' +
                                    '</tr>';
                            });
                            html += '</body>' +
                                '</table>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>';

                            app.helper.showModal(html);
                        }else {
                            app.helper.showAlertBox({message:app.vtranslate('Please go to Automation > Workflows, create new workflow and you see "Workflow Trigger" and you see under "Workflow Trigger" there will be new option "Macro"')});
                        }
                    }
                }
            );
        }
    }
}, {

});
(function () {
    //document ready
    var current_url = $.url();
    var module = current_url.param('module');
    var view = current_url.param('view');
    var action = current_url.param('action');
    var parent = current_url.param('parent');
    var record = current_url.param('record');

    // add Macros option to Create/Edit Workflow view
    if(module=='Workflows' && parent=='Settings' && view=="Edit") {
        var last_execution_condition = jQuery('[name="workflow_trigger"]').last();
        var span_last_execution_condition = last_execution_condition.parent();
        var macro_option = $('<br><span><input type="radio" id="macros_option" value="7" name="workflow_trigger" class="alignTop">&nbsp;&nbsp;'+app.vtranslate('Macro')+'</span>');
        if(record != undefined) {
            app.helper.showProgress();
            var params = {};
            params['action']= 'MacrosAjax';
            params['module'] = 'Macros';
            params['mode'] = 'getExcConValue';
            params['record'] = record;

            app.request.post({data:params}).then(
                function (err,data) {
                    if(err == null) {
                        if(data.execcond==7) {
                            macro_option = $('<br><span><input type="radio" id="macros_option" value="7" name="workflow_trigger" class="alignTop" checked>&nbsp;&nbsp;'+app.vtranslate('Macro')+'</span>');
                        }
                        span_last_execution_condition.after(macro_option);
                        app.helper.hideProgress();
                    }
                },
                function(error,err){

                }
            );
        } else {
            span_last_execution_condition.after(macro_option);
        }
        setTimeout(function () {
            jQuery('[name="workflow_trigger"]').click(function () {
                jQuery('[name="workflow_trigger"]').attr('checked',false);
                jQuery(this).attr('checked',true);
            });
        },1000);

        function calculateValues(){
            var enableFilterElement = jQuery('#enableAdvanceFilters');
            if(enableFilterElement.length > 0 && enableFilterElement.is(':checked') == false) {
                jQuery('#advanced_filter').val(jQuery('#olderConditions').val());
            } else {
                jQuery('[name="filtersavedinnew"]').val("6");
                var advfilterlist = getValues();
                jQuery('#advanced_filter').val(JSON.stringify(advfilterlist));
            }
        }
        function getFilterContainer() {
            return jQuery('.filterContainer');
        }
        function isEmptyFieldSelected(fieldSelect){
            var selectedOption = fieldSelect.find('option:selected');
            //assumption that empty field will be having value none
            if(selectedOption.val() == 'none'){
                return true;
            }
            return false;
        }
        function getValues() {
            var filterContainer = getFilterContainer();

            var fieldList = ['columnname', 'comparator', 'value', 'valuetype', 'column_condition'];

            var values = {};
            var columnIndex = 0;
            var conditionGroups = jQuery('.conditionGroup', filterContainer);
            conditionGroups.each(function(index,domElement){
                var groupElement = jQuery(domElement);

                var conditions = jQuery('.conditionList .conditionRow',groupElement);
                if(conditions.length <=0) {
                    return true;
                }
                var iterationValues = {};
                conditions.each(function(i, conditionDomElement){
                    var rowElement = jQuery(conditionDomElement);
                    var fieldSelectElement = jQuery('[name="columnname"]', rowElement);
                    var valueSelectElement = jQuery('[data-value="value"]',rowElement);
                    //To not send empty fields to server
                    if(isEmptyFieldSelected(fieldSelectElement)) {
                        return true;
                    }
                    var fieldDataInfo = fieldSelectElement.find('option:selected').data('fieldinfo');
                    var fieldType = fieldDataInfo.type;
                    var rowValues = {};
                    if (fieldType == 'picklist' || fieldType == 'multipicklist') {
                        for(var key in fieldList) {
                            var field = fieldList[key];
                            if(field == 'value' && valueSelectElement.is('input')) {
                                var commaSeperatedValues = valueSelectElement.val();
                                var pickListValues = valueSelectElement.data('picklistvalues');
                                var valuesArr = commaSeperatedValues.split(',');
                                var newvaluesArr = [];
                                for(i=0;i<valuesArr.length;i++){
                                    if(typeof pickListValues[valuesArr[i]] != 'undefined'){
                                        newvaluesArr.push(pickListValues[valuesArr[i]]);
                                    } else {
                                        newvaluesArr.push(valuesArr[i]);
                                    }
                                }
                                var reconstructedCommaSeperatedValues = newvaluesArr.join(',');
                                rowValues[field] = reconstructedCommaSeperatedValues;
                            } else if(field == 'value' && valueSelectElement.is('select') && fieldType == 'picklist'){
                                rowValues[field] = valueSelectElement.val();
                            } else if(field == 'value' && valueSelectElement.is('select') && fieldType == 'multipicklist'){
                                var value = valueSelectElement.val();
                                if(value == null){
                                    rowValues[field] = value;
                                } else {
                                    rowValues[field] = value.join(',');
                                }
                            } else {
                                rowValues[field] = jQuery('[name="'+field+'"]', rowElement).val();
                            }
                        }
                    } else {
                        for(var key in fieldList) {
                            var field = fieldList[key];
                            if(field == 'value'){
                                if((fieldType == 'date' || fieldType == 'datetime') && valueSelectElement.length > 0) {
                                    var value = valueSelectElement.val();
                                    var dateFormat = app.getDateFormat();
                                    var dateFormatParts = dateFormat.split("-");
                                    var valueArray = value.split(',');
                                    for(i = 0; i < valueArray.length; i++) {
                                        var valueParts = valueArray[i].split("-");
                                        var dateInstance = new Date(valueParts[dateFormatParts.indexOf('yyyy')], parseInt(valueParts[dateFormatParts.indexOf('mm')]) - 1, valueParts[dateFormatParts.indexOf('dd')]);
                                        if(!isNaN(dateInstance.getTime())) {
                                            valueArray[i] = app.getDateInVtigerFormat('yyyy-mm-dd', dateInstance);
                                        }
                                    }
                                    rowValues[field] = valueArray.join(',');
                                } else {
                                    rowValues[field] = valueSelectElement.val();
                                }
                            }  else {
                                rowValues[field] = jQuery('[name="'+field+'"]', rowElement).val();
                            }
                        }
                    }

                    if(jQuery('[name="valuetype"]', rowElement).val() == 'false' || (jQuery('[name="valuetype"]', rowElement).length == 0)) {
                        rowValues['valuetype'] = 'rawtext';
                    }

                    if(index == '0') {
                        rowValues['groupid'] = '0';
                    } else {
                        rowValues['groupid'] = '1';
                    }

                    if(rowElement.is(":last-child")) {
                        rowValues['column_condition'] = '';
                    }
                    iterationValues[columnIndex] = rowValues;
                    columnIndex++;
                });

                if(!jQuery.isEmptyObject(iterationValues)) {
                    values[index+1] = {};
                    //values[index+1]['columns'] = {};
                    values[index+1]['columns'] = iterationValues;
                }
                if(groupElement.find('div.groupCondition').length > 0 && !jQuery.isEmptyObject(values[index+1])) {
                    values[index+1]['condition'] = conditionGroups.find('div.groupCondition [name="condition"]').val();
                }
            });
            return values;

        }
        var form = jQuery('#workflow_edit');
        jQuery('button[type="submit"]',form).on('click',function(e){
            var record = jQuery('#record').val();
                var form = jQuery('#workflow_edit');
                var params = {
                    submitHandler: function (form) {
                        if (jQuery('[name="workflow_trigger"]').val() == '6' && jQuery('#schtypeid').val() == '3') {
                            if (jQuery('#schdayofweek').val().length <= 0) {
                                app.helper.showErrorNotification({'message': 'Please Select atleast one value'});
                                return false;
                            }
                        }
                        var form = jQuery(form);
                        //handled advanced filters saved values.
                        calculateValues();
                        window.onbeforeunload = null;
                        jQuery(form).find('button.saveButton').attr('disabled', 'disabled');

                        var params = {
                            'module': app.module(),
                            'parent': app.getParentModuleName(),
                            'action': 'ValidateExpression',
                            'mode': 'ForWorkflowEdit'
                        };
                        var serializeForm = form.serializeFormData();
                        params = jQuery.extend(serializeForm, params);
                        var moduleFocus = jQuery('#module_name').val();
                        app.request.post({'data': params}).then(function (error, data) {
                            if (error == null) {

                                if (jQuery('#macros_option').prop('checked')==true ) {

                                    var newparams = {
                                        'module': 'Macros',
                                        'action': 'MacrosAjax',
                                        'mode': 'addDetailViewBasic',
                                        'module_focus': moduleFocus,
                                    };
                                    app.request.post({'data': newparams}).then(function (error, data) {
                                        if (error == null) {
                                            console.log('success1');
                                            form.get(0).submit();
                                        }
                                    });
                                }
                                else {
                                    var newparams = {
                                        'module': 'Macros',
                                        'action': 'MacrosAjax',
                                        'mode': 'removeDetailViewLinkPreSave',
                                        'module_focus': moduleFocus,
                                    };
                                    app.request.post({'data': newparams}).then(function (error, data) {
                                        if (error == null) {
                                            console.log('success');
                                            form.get(0).submit();
                                        }
                                    });
                                }
                            } else {
                                jQuery(form).find('button.saveButton').removeAttr('disabled');
                                app.helper.showErrorNotification({'message': app.vtranslate('LBL_EXPRESSION_INVALID')});
                            }
                        });
                        // form.get(0).submit();
                        return false;
                    }
                };
                form.vtValidate(params);
        });
        }

    // Change Execution Condition label on Workflow List view
    if(module=="Workflows" && parent=="Settings" && view=="List") {
        function changeLabel() {
            if($('.listViewEntriesTable').length > 0) {
                $('.listViewEntriesTable .listViewEntries').each(function(){
                    var lastchild = $(this).find('td:nth-last-child(2)');
                    if(lastchild.html()=='&nbsp;System') {
                        lastchild.html('&nbsp;Macro');
                    }
                });
            } else {
                setTimeout(function(){
                    changeLabel();
                }, 50);
            }
        }
        function checkSaveMacros() {
            var actionParams = {
                "action":"MacrosAjax",
                "mode":"checkMacrosIsSaved",
                "module":"Macros"
            };
            app.request.post({data:actionParams}).then(
                function(err,data){
                    app.helper.hideProgress();
                    // if(err == null) {
                        // app.helper.showSuccessNotification({'message':app.vtranslate('Macro saved successfully')});
                    // }
                }
            );
        }
        function getMacrosWorkflow() {
            var listViewContainer = jQuery('#list-content');
            var newparams = {
                'module' : 'Macros',
                'action' : 'MacrosAjax',
                'mode' : 'getMacrosWorkflow',
            };
            app.request.post({'data': newparams}).then(
                function (error, data) {
                    if (error == null) {
                        listViewContainer.data('list-macros', data);
                    }
                });
        }

        changeLabel();
        checkSaveMacros();
        getMacrosWorkflow();

        //
        // jQuery(listViewContainer).on('switchChange.bootstrapSwitch', "input[name='workflowstatus']", function (e) {
        //     var currentElement = jQuery(e.currentTarget);
        //     var status = '';
        //     if(currentElement.val() == 'on'){
        //         status = 'off';
        //     } else {
        //         status = 'on';
        //     }
        //     console.log('status', status);
        //     console.log('id', currentElement.data('id'));
        //
        //     var newparams = {
        //         'module' : 'Macros',
        //         'action' : 'MacrosAjax',
        //         'mode' : 'changeStatusWorkflow',
        //         'record' : currentElement.data('id'),
        //         'status' : status
        //     }
        //     app.request.post({'data' : newparams}).then(function(error, data) {
        //         if(error == null) {
        //             console.log('success');
        //         }
        //     });
        // });
    }
})();
jQuery(document).ajaxComplete( function (event, request, settings) {
    var sPageURL = settings.data;
    if(typeof sPageURL == 'undefined' && settings.url) sPageURL = settings.url;
    var module = '';
    var parent = '';
    var workflowname = '';
    var module_name = '';
    var action = '';
    var workflow_trigger = '';
    var mode = '';
    var record = '';
    var status = '';
    if (Object.prototype.toString.call(sPageURL) =='[object String]') {
        sPageURL = sPageURL.replace('index.php?', '');
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++) {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == 'module') {
                module = sParameterName[1];
            }
            else if (sParameterName[0] == 'parent') {
                parent = sParameterName[1];
            }
            else if (sParameterName[0] == 'workflowname') {
                workflowname = sParameterName[1];
            } else if (sParameterName[0] == 'module_name') {
                module_name = sParameterName[1];
            } else if (sParameterName[0] == 'action') {
                action = sParameterName[1];
            } else if (sParameterName[0] == 'workflow_trigger') {
                workflow_trigger = sParameterName[1];
            } else if (sParameterName[0] == 'mode') {
                mode = sParameterName[1];
            } else if (sParameterName[0] == 'record') {
                record = sParameterName[1];
            }  if (sParameterName[0] == 'status') {
                status = sParameterName[1];
            }
        }
        if(module == 'Workflows' && parent == 'Settings'&& action == 'DeleteAjax' && record != ''){
            var listIdMacros =jQuery('#list-content').data('list-macros');
                if (listIdMacros[record] != undefined) {
                    var moduleFocus = listIdMacros[record];
                    var newparams = {
                        'module' : 'Macros',
                        'action' : 'MacrosAjax',
                        'mode' : 'removeDetailViewLink',
                        'module_focus' : moduleFocus
                    };
                    app.request.post({'data' : newparams}).then(function(error, data) {
                        if(error == null) {
                            var listViewContainer = jQuery('#list-content');
                            listViewContainer.data('list-macros', data);
                        }
                    });
                }
        }
        if (module == 'Workflows' && parent == 'Settings' && action == 'SaveAjax' && record != '') {
            var newparams = {
                'module': 'Macros',
                'action': 'MacrosAjax',
                'mode': 'changeStatusWorkflow',
                'record': record,
                'status': status
            };
            app.request.post({'data': newparams}).then(function (error, data) {
                if (error == null) {
                    var listViewContainer = jQuery('#list-content');
                    listViewContainer.data('list-macros', data);
                }
            });
        }
    }

});

function runMacro(wid,rid) {
    app.helper.showProgress();
    var actionParams = {
        "action":"MacrosAjax",
        "mode":"runMacro",
        "module":"Macros",
        "workflow_id": wid,
        "record":rid
    };
    app.request.post({data:actionParams}).then(
        function(err,data){
            app.helper.hideProgress();
            if(err == null) {
                var detail_instance = Vtiger_Detail_Js.getInstance();
                var module_name = app.getModuleName();
                var params = {};
                params['record'] = rid;
                params['view'] = 'Detail';
                params['module'] = module_name;
                params['mode'] = 'getActivities';
                app.request.post({data:params}).then(
                    function(err,data){
                        if(err == null) {
                            var activitiesWidget = jQuery('#relatedActivities');
                            activitiesWidget.html(data);
                            app.changeSelectElementView(activitiesWidget);
                            detail_instance.registerEventForActivityWidget();
                            // $(".tab-item.active").trigger("click");
                        }
                    });
                app.helper.showSuccessNotification({'message':app.vtranslate('Run successfully!')});
                app.hideModalWindow();
                // var macro_done = '.macro_done' + wid;
                // jQuery(macro_done).show();
                // setTimeout(function(){jQuery(macro_done).fadeToggle('slow','linear')},8000);
                /*var summaryViewContainer = detail_instance.getContentHolder();
                 var updatesWidget = summaryViewContainer.find("[data-name='LBL_UPDATES']");
                 detail_instance.loadWidget(updatesWidget);

                 jQuery('.detailViewContainer *[data-link-key="LBL_RECORD_SUMMARY"]').each(function(){
                 if(jQuery(this).attr('class')=='active')
                 jQuery(this).trigger('click');
                 });
                 jQuery('*[data-link-key="LBL_RECORD_DETAILS"]').each(function(){
                 if(jQuery(this).attr('class')=='active')
                 jQuery(this).trigger('click');
                 });
                 jQuery('.detailViewContainer *[data-label-key="Activities"]').each(function(){
                 if(jQuery(this).attr('class')=='active')
                 jQuery(this).trigger('click');
                 });
                 jQuery('.imageHolder').hide();*/
                // jQuery('.macro_done').show();
                // setTimeout(function(){jQuery('.macro_done').fadeToggle('slow','linear')},8000);
            }
        });
}

function finishmacros() {
    var actionParams = {
        "action":"MacrosAjax",
        "mode":"noteMacrosIsSaved",
        "module":"Macros"
    };
    app.request.post({data:actionParams}).then(
        function(err,data){
            app.helper.hideProgress();
            if(err == null) {
                window.history.back();
            }
        });
}
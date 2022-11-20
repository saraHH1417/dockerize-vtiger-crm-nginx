/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

Vtiger_List_Js("ParsVT_KanbanView_Js", {
    _sprintf: function (message) {
        const regexp = RegExp('%s', 'g');
        let match;
        let index = 1;
        while ((match = regexp.exec(message)) !== null) {
            let replacement = arguments[index];
            if (replacement) {
                let messageToArray = message.split('');
                messageToArray.splice(match.index, regexp.lastIndex - match.index, replacement);
                message = messageToArray.join('');
                index++;
            } else {
                break;
            }
        }

        return message;
    },
    getParameterByName: function (name, url = window.location.href) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    },
    markAsHeld: function (recordId, module, modulerecordId, elm) {
        app.helper.showConfirmationBox({
            message: app.vtranslate('JS_CONFIRM_MARK_AS_HELD')
        }).then(function () {
            var requestParams = {
                module: "Calendar",
                action: "SaveFollowupAjax",
                mode: "markAsHeldCompleted",
                record: recordId
            };

            app.request.post({'data': requestParams}).then(function (e, res) {
                if (e) {
                    app.helper.showErrorNotification({
                        'message': app.vtranslate('JS_PERMISSION_DENIED')
                    });
                } else if (res && res['valid'] === true && res['markedascompleted'] === true) {
                    jQuery('.kanbanactivityid' + recordId).hide();
                    var params = {};
                    params['record'] = modulerecordId;
                    params['action'] = 'KanbanGridAjax';
                    params['module'] = 'ParsVT';
                    params['source_module'] = module;
                    params['mode'] = 'getActivities';
                    app.request.post({"data": params}).then(
                        function (err, response) {
                            if (err == null) {
                                var data = JSON.parse(response);
                                var element = jQuery(elm).parent().closest('.kbBoxTask');
                                element.find('div.container-fluid.kbTaskFooter > div:nth-child(1) > div').html(data.result);
                                element.find('img.kanban_activity_status').attr('src', "layouts/v7/modules/ParsVT/resources/Kanban/img/" + data.image);
                                element.find('img.kanban_activity_status').attr("data-original-title", data.title);
                                element.find('img.kanban_activity_status').attr('data-title', data.title);
                            }
                        }
                    );
                } else {
                    app.helper.showAlertNotification({
                        'message': app.vtranslate('JS_FUTURE_EVENT_CANNOT_BE_MARKED_AS_HELD')
                    });
                }
            });
        });
    }
}, {
    registerQuickEditEvent: function () {
        var thisInstance = new Vtiger_Index_Js();
        jQuery('.kbQuickEdit').on('click', function (e) {
            var currentKanbanBox = jQuery(this).closest('.kbBoxTask');
            var requestParams = jQuery(this).data('url');
            app.request.post({url: requestParams}).then(
                function (err, data) {
                    app.helper.hideProgress();
                    var callbackparams = {
                        'cb': function (container) {
                            thisInstance.registerPostReferenceEvent(container);
                            app.event.trigger('post.QuickCreateForm.show', form);
                            app.helper.registerLeavePageWithoutSubmit(form);
                            app.helper.registerModalDismissWithoutSubmit(form);
                        },
                        backdrop: 'static',
                        keyboard: false
                    }

                    app.helper.showModal(data, callbackparams);
                    var form = jQuery('form[name="QuickCreate"]');
                    var moduleName = form.find('[name="module"]').val();
                    app.helper.showVerticalScroll(jQuery('form[name="QuickCreate"] .modal-body'), {'autoHideScrollbar': true});

                    var targetInstance = new Vtiger_Index_Js();
                    var moduleInstance = Vtiger_Edit_Js.getInstanceByModuleName(moduleName);
                    if (typeof (moduleInstance.quickCreateSave) === 'function') {
                        targetInstance = moduleInstance;
                        targetInstance.registerBasicEvents(form);
                    }

                    vtUtils.applyFieldElementsView(form);
                    var callback = function (data, err) {
                        if (err == null) {
                            jQuery('.kbTaskTitle a', currentKanbanBox).html(data._recordLabel);
                            jQuery.each(data, function (key, obj) {
                                if (key != '_recordId' && key != '_recordLabel') {
                                    var rowElement = jQuery('.fieldValue[data-field-name="' + key + '"]', currentKanbanBox);
                                    if (rowElement.length > 0) {
                                        jQuery('.value', rowElement).attr('title', obj.display_value);
                                        jQuery('.value', rowElement).html(obj.display_value);
                                        jQuery('.fieldBasicData', rowElement).data('displayvalue', obj.display_value);
                                        jQuery('.fieldBasicData', rowElement).data('value', obj.value);
                                    }
                                    if (key == 'kanban_color') {
                                        currentKanbanBox.css('background', obj.value);
                                    }
                                }
                            })
                        }
                    }
                    targetInstance.quickCreateSave(form, {callbackFunction: callback});
                    app.helper.hideProgress();
                }
            );
        });
    },

    //This will show the notification message using pnotify

    registerScrollbar: function () {
        var contentContainer = $(".kbBoxContent");
        //  contentContainer.mCustomScrollbar('destroy');
        // app.helper.showVerticalScroll(contentContainer,{ });
        //  contentContainer.height(function (index, height) {
        //      return (height + 40);
        //  });
        //contentContainer = jQuery('#detailView .kbParentContainer');
        // contentContainer.mCustomScrollbar('destroy');
        // app.helper.showHorizontalScroll(contentContainer,{ });
        $(".wmd-view-topscroll").scroll(function () {
            $(".wmd-view")
                .scrollLeft($(".wmd-view-topscroll").scrollLeft());
        });
        $(".wmd-view").scroll(function () {
            $(".wmd-view-topscroll")
                .scrollLeft($(".wmd-view").scrollLeft());
        });
    },
    registerEventToShowQuickKanbanPreview: function () {
        var self = this;
        jQuery('.kbTaskFooter').on('click', '.quickKanbanView', function (e) {
            var element = jQuery(e.currentTarget);
            var app = element.data('app');
            var recordId = element.data('id');
            var module = element.data('module');
            self.showQuickPreviewForId(recordId, module, app);
        });
    },
    showQuickPreviewForId: function (recordId, module, appName) {
        var self = this;
        var vtigerInstance = Vtiger_Index_Js.getInstance();
        vtigerInstance.showQuickPreviewForId(recordId, module, appName);
    },
    registerSortableEvent: function () {
        var thisInstance = this;
        var mesParams = {};
        jQuery('.kbBoxContent').sortable({
            connectWith: ".kbBoxContent",
            handle: ".kbTaskHeader",
            cursor: "move",
            start: function (e, ui) {
                var item = ui.item;
                mesParams.itemName = item.find('.kbTaskTitle a').text();
                mesParams.from = item.closest('.kanbanBox').find('.kbBoxTitle').text();
            },
            stop: function (event, ui) {
                var item = ui.item;
                var primaryFieldName = jQuery('#primaryFieldName').val();
                var primaryFieldId = jQuery('#primaryFieldId').val();
                var recordId = item.find('input[name="recordId"]').val();

                var nextRecordId = item.next('.kbBoxTask').find('input[name="recordId"]').val();
                if (typeof nextRecordId == "undefined") {
                    nextRecordId = -1;
                }

                var prevRecordId = item.prev('.kbBoxTask').find('input[name="recordId"]').val();
                if (typeof prevRecordId == "undefined") {
                    prevRecordId = -1;
                }

                var primaryValue = item.closest('.kanbanBox').find('input[name="primaryValue"]').val;
                mesParams.to = item.closest('.kanbanBox').find('.kbBoxTitle').text();
                jQuery('.kanbanBox').each(function () {
                    var container = jQuery(this);
                    jQuery(this).find('input[name="recordId"]').each(function () {
                        if (jQuery(this).val() == recordId) {
                            primaryValue = container.find('input[name="primaryValue"]').val();
                        }

                    });
                });
                var params = {
                    'primaryFieldName': primaryFieldName,
                    'primaryFieldId': primaryFieldId,
                    'recordId': recordId,
                    'nextRecordId': nextRecordId,
                    'prevRecordId': prevRecordId,
                    'primaryValue': primaryValue,
                    'module': 'ParsVT',
                    'action': 'KanbanGridAjax',
                    'mode': 'updatePrimaryFieldValue',
                    'source_module': jQuery('#kbSourceModule').val()
                }
                app.request.post({data: params}).then(
                    function (data) {
                        if (mesParams.from == mesParams.to) {
                            return;
                        }
                        var locationlang = jQuery('body').data('language');
                        if (locationlang == "fa_ir") {
                            var txtMessage = ParsVT_KanbanView_Js._sprintf(app.vtranslate('%s updated from %s to %s'), mesParams.itemName, mesParams.from, mesParams.to);
                        } else {
                            var txtMessage = mesParams.itemName + " updated from " + mesParams.from + " to " + mesParams.to;
                        }
                        app.helper.showSuccessNotification({message: txtMessage});
                    }
                );
            }
        }).disableSelection();
    },
    fixWidthColumns: function () {
        var kanbanBox = jQuery('#detailView .kbParentContainer .kanbanBox');
        var containerWidth = jQuery('#detailView .kbParentContainer').width();
        kanbanBox.width((containerWidth - 80) / 4);
        var kbContainer = jQuery('#detailView .kbParentContainer .kbContainer').width(kanbanBox.length * (kanbanBox.width() + 20));
        var kbContainer2 = jQuery('#detailView .wmd-view-topscroll .scroll-div1').width(kanbanBox.length * (kanbanBox.width() + 20));
    },
    registerAjaxEditEvent: function () {
        var thisInstance = this;
        jQuery('.kbParentContainer').on('click', '.fieldValue .editAction', function (e) {
            var selection = window.getSelection().toString();
            if (selection.length == 0) {
                var currentTdElement = jQuery(e.currentTarget).closest('.kbValueContainer');
                thisInstance.ajaxEditHandling(currentTdElement);
            }
        });
    },
    fixWidthEditElement: function (currentTdElement) {
        var containerWidth = currentTdElement.width();
        jQuery('.editElement', currentTdElement).css('min-width', 'initial');
    },
    ajaxEditHandling: function (currentTdElement) {
        var thisInstance = this;
        var detailViewValue = jQuery('.value', currentTdElement);
        var editElement = jQuery('.edit', currentTdElement);
        var fieldBasicData = jQuery('.fieldBasicData', editElement);
        var fieldName = fieldBasicData.data('name');
        var fieldType = fieldBasicData.data('type');
        var value = fieldBasicData.data('displayvalue');
        var rawValue = fieldBasicData.data('value');
        var self = this;
        var fieldElement = jQuery('[name="' + fieldName + '"]', editElement);

        // If Reference field has value, then we are disabling the field by default
        if (fieldElement.attr('disabled') == 'disabled' && fieldType != 'reference') {
            return;
        }

        if (editElement.length <= 0) {
            return;
        }

        if (editElement.is(':visible')) {
            return;
        }

        if (fieldType === 'multipicklist') {
            var multiPicklistFieldName = fieldName.split('[]');
            fieldName = multiPicklistFieldName[0];
        }

        var customHandlingFields = ['owner', 'ownergroup', 'picklist', 'multipicklist', 'reference', 'currencyList', 'text'];
        if (jQuery.inArray(fieldType, customHandlingFields) !== -1) {
            value = rawValue;
        }
        if (jQuery('.editElement', editElement).length === 0) {
            var fieldInfo;
            fieldInfo = uimeta.field.get(fieldName);
            fieldInfo['value'] = value;
            var fieldObject = Vtiger_Field_Js.getInstance(fieldInfo);
            var fieldModel = fieldObject.getUiTypeModel();

            var ele = jQuery('<div class="input-group editElement"></div>');
            var actionButtons = '<span class="pointerCursorOnHover input-group-addon input-group-addon-save inlineAjaxSave"><i class="fa fa-check"></i></span>';
            actionButtons += '<span class="pointerCursorOnHover input-group-addon input-group-addon-cancel inlineAjaxCancel"><i class="fa fa-close"></i></span>';
            //wrapping action buttons with class called input-save-wrap
            var inlineSaveWrap = jQuery('<div class="input-save-wrap"></div>');
            inlineSaveWrap.append(actionButtons);
            // we should have atleast one submit button for the form to submit which is required for validation
            ele.append(fieldModel.getUi()).append(inlineSaveWrap);
            ele.find('.inputElement').addClass('form-control');
            editElement.append(ele);
            thisInstance.fixWidthEditElement(currentTdElement);

        }

        // for reference fields, actual value will be ID but we need to show related name of that ID
        if (fieldType === 'reference') {
            if (value !== 0) {
                jQuery('input[name="' + fieldName + '"]', editElement).prop('value', jQuery.trim(detailViewValue.text()));
                var referenceElement = jQuery('input[name="' + fieldName + '"]', editElement);
                if (!referenceElement.attr('disabled')) {
                    referenceElement.attr('disabled', 'disabled');
                    editElement.find('.clearReferenceSelection').removeClass('hide')
                }
            }
        }

        detailViewValue.css('display', 'none');
        editElement.removeClass('hide').show().children().filter('input[type!="hidden"]input[type!="image"],select').filter(':first').focus();
        vtUtils.applyFieldElementsView(currentTdElement);
        var vtigerInstance = Vtiger_Index_Js.getInstance();
        vtigerInstance.registerAutoCompleteFields(currentTdElement);
        vtigerInstance.referenceModulePopupRegisterEvent(currentTdElement);
        editElement.addClass('ajaxEdited');
        thisInstance.registerSaveOnEnterEvent(editElement);
        jQuery('.editAction').addClass('hide');

        if (fieldType == 'picklist' || fieldType == 'ownergroup' || fieldType == 'owner') {
            var sourcePicklistFieldName = thisInstance.getDependentSourcePicklistName(fieldName);
            if (sourcePicklistFieldName) {
                thisInstance.handlePickListDependencyMap(sourcePicklistFieldName);
            }
        }
    },
    getDependentSourcePicklistName: function (fieldName) {
        var container = jQuery('#detailView')
        var picklistDependcyElemnt = jQuery('[name="picklistDependency"]', container);
        if (picklistDependcyElemnt.length <= 0) {
            return '';
        }

        var picklistDependencyMapping = JSON.parse(picklistDependcyElemnt.val());
        var sourcePicklists = Object.keys(picklistDependencyMapping);
        if (sourcePicklists.length <= 0) {
            return '';
        }
        var sourcePicklistFieldName = '';
        jQuery.each(picklistDependencyMapping, function (sourcePicklistName, configuredDependencyObject) {
            var picklistmap = configuredDependencyObject["__DEFAULT__"];
            jQuery.each(picklistmap, function (targetPickListName, targetPickListValues) {
                if (targetPickListName == fieldName) {
                    sourcePicklistFieldName = sourcePicklistName;
                }
            });
        });

        return sourcePicklistFieldName;
    },
    registerSaveOnEnterEvent: function (editElement) {
        editElement.find('.inputElement:not(textarea)').on('keyup', function (e) {
            var textArea = editElement.find('textarea');
            var ignoreList = ['reference', 'picklist', 'multipicklist', 'owner'];
            var fieldType = jQuery(e.target).closest('.ajaxEdited').find('.fieldBasicData').data('type');
            if (ignoreList.indexOf(fieldType) !== -1) return;
            if (!textArea.length) {
                (e.keyCode || e.which) === 13 && editElement.find('.inlineAjaxSave').trigger('click');
            }
        });
    },
    registerAjaxEditSaveEvent: function (contentHolder) {
        var thisInstance = this;
        if (typeof contentHolder === 'undefined') {
            contentHolder = jQuery('.kbContainer');
        }

        contentHolder.on('click', '.inlineAjaxSave', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var currentTarget = jQuery(e.currentTarget);
            var currentTdElement = currentTarget.closest('.kbValueContainer');
            var detailViewValue = jQuery('.value', currentTdElement);
            var editElement = jQuery('.edit', currentTdElement);
            var actionElement = jQuery('.editAction', currentTdElement);
            var fieldBasicData = jQuery('.fieldBasicData', editElement);
            var fieldName = fieldBasicData.data('name');
            var fieldType = fieldBasicData.data("type");
            var previousValue = jQuery.trim(fieldBasicData.data('displayvalue'));

            var fieldElement = jQuery('[name="' + fieldName + '"]', editElement);
            var ajaxEditNewValue = fieldElement.val();
            var currentKanbanBox = currentTdElement.closest('.kbBoxTask');
            var recordId = jQuery('[name="recordId"]', currentKanbanBox).val();

            // ajaxEditNewValue should be taken based on field Type
            if (fieldElement.is('input:checkbox')) {
                if (fieldElement.is(':checked')) {
                    ajaxEditNewValue = '1';
                } else {
                    ajaxEditNewValue = '0';
                }
                fieldElement = fieldElement.filter('[type="checkbox"]');
            } else if (fieldType == 'reference') {
                ajaxEditNewValue = fieldElement.attr('value');
            }

            // prev Value should be taken based on field Type
            var customHandlingFields = ['owner', 'ownergroup', 'picklist', 'multipicklist', 'reference', 'boolean'];
            if (jQuery.inArray(fieldType, customHandlingFields) !== -1) {
                previousValue = fieldBasicData.data('value');
            }

            // Field Specific custom Handling
            if (fieldType === 'multipicklist') {
                var multiPicklistFieldName = fieldName.split('[]');
                fieldName = multiPicklistFieldName[0];
            }

            var fieldValue = ajaxEditNewValue;

            //Before saving ajax edit values we need to check if the value is changed then only we have to save
            if (previousValue == ajaxEditNewValue) {
                detailViewValue.css('display', 'inline-block');
                editElement.addClass('hide');
                editElement.removeClass('ajaxEdited');
                jQuery('.editAction').removeClass('hide');
                actionElement.show();
            } else {
                var fieldNameValueMap = {};
                fieldNameValueMap['value'] = fieldValue;
                fieldNameValueMap['field'] = fieldName;
                fieldNameValueMap['record'] = recordId;
                fieldNameValueMap['module'] = jQuery('#kbSourceModule').val();
                var form = currentTarget.closest('form');
                var params = {
                    'ignore': 'span.hide .inputElement,input[type="hidden"]',
                    submitHandler: function (form) {
                        var preAjaxSaveEvent = jQuery.Event(Vtiger_Detail_Js.PreAjaxSaveEvent);
                        app.event.trigger(preAjaxSaveEvent, {form: jQuery(form), tiggeredFiledInfo: fieldNameValueMap});
                        if (preAjaxSaveEvent.isDefaultPrevented()) {
                            return false;
                        }

                        jQuery(currentTdElement).find('.input-group-addon').addClass('disabled');
                        app.helper.showProgress();
                        thisInstance.saveFieldValues(fieldNameValueMap).then(function (response) {
                            app.helper.hideProgress();
                            var postSaveRecordDetails = response;
                            if (fieldBasicData.data('type') == 'picklist' && app.getModuleName() != 'Users') {
                                var color = postSaveRecordDetails[fieldName].colormap[postSaveRecordDetails[fieldName].value];
                                if (color) {
                                    var contrast = app.helper.getColorContrast(color);
                                    var textColor = (contrast === 'dark') ? 'white' : 'black';
                                    var picklistHtml = '<span class="picklist-color" style="background-color: ' + color + '; color: ' + textColor + ';">' +
                                        postSaveRecordDetails[fieldName].display_value +
                                        '</span>';
                                } else {
                                    var picklistHtml = '<span class="picklist-color">' +
                                        postSaveRecordDetails[fieldName].display_value +
                                        '</span>';
                                }
                                detailViewValue.html(picklistHtml);
                            } else if (fieldBasicData.data('type') == 'multipicklist' && app.getModuleName() != 'Users') {
                                var picklistHtml = '';
                                var rawPicklistValues = postSaveRecordDetails[fieldName].value;
                                rawPicklistValues = rawPicklistValues.split('|##|');
                                var picklistValues = postSaveRecordDetails[fieldName].display_value;
                                picklistValues = picklistValues.split(',');
                                for (var i = 0; i < rawPicklistValues.length; i++) {
                                    var color = postSaveRecordDetails[fieldName].colormap[rawPicklistValues[i].trim()];
                                    if (color) {
                                        var contrast = app.helper.getColorContrast(color);
                                        var textColor = (contrast === 'dark') ? 'white' : 'black';
                                        picklistHtml = picklistHtml +
                                            '<span class="picklist-color" style="background-color: ' + color + '; color: ' + textColor + ';">' +
                                            picklistValues[i] +
                                            '</span>';
                                    } else {
                                        picklistHtml = picklistHtml +
                                            '<span class="picklist-color">' +
                                            picklistValues[i] +
                                            '</span>';
                                    }
                                    if (picklistValues[i + 1] !== undefined)
                                        picklistHtml += ' , ';
                                }
                                detailViewValue.html(picklistHtml);
                            } else if (fieldBasicData.data('type') == 'currency' && app.getModuleName() != 'Users') {
                                detailViewValue.find('.currencyValue').html(postSaveRecordDetails[fieldName].display_value);
                                contentHolder.closest('.detailViewContainer').find('.detailview-header-block').find('.' + fieldName).html(postSaveRecordDetails[fieldName].display_value);
                            } else {
                                detailViewValue.html(postSaveRecordDetails[fieldName].display_value);
                                //update namefields displayvalue in header
                                if (contentHolder.hasClass('overlayDetail')) {
                                    contentHolder.find('.overlayDetailHeader').find('.' + fieldName)
                                        .html(postSaveRecordDetails[fieldName].display_value);
                                } else {
                                    contentHolder.closest('.detailViewContainer').find('.detailview-header-block')
                                        .find('.' + fieldName).html(postSaveRecordDetails[fieldName].display_value);
                                }
                            }
                            fieldBasicData.data('displayvalue', postSaveRecordDetails[fieldName].display_value);
                            fieldBasicData.data('value', postSaveRecordDetails[fieldName].value);
                            jQuery(currentTdElement).find('.input-group-addon').removeClass("disabled");

                            detailViewValue.css('display', 'inline-block');
                            editElement.addClass('hide');
                            editElement.removeClass('ajaxEdited');
                            jQuery('.editAction').removeClass('hide');
                            actionElement.show();
                            var postAjaxSaveEvent = jQuery.Event(Vtiger_Detail_Js.PostAjaxSaveEvent);
                            app.event.trigger(postAjaxSaveEvent, fieldBasicData, postSaveRecordDetails, contentHolder);
                            //After saving source field value, If Target field value need to change by user, show the edit view of target field.
                            if (thisInstance.targetPicklistChange) {
                                var sourcePicklistname = thisInstance.sourcePicklistname;
                                thisInstance.targetPicklist.find('.editAction').trigger('click');
                                thisInstance.targetPicklistChange = false;
                                thisInstance.targetPicklist = false;
                                thisInstance.handlePickListDependencyMap(sourcePicklistname);
                                thisInstance.sourcePicklistname = false;
                            }
                        });
                    }
                };
                validateAndSubmitForm(form, params);
            }
        });
    },
    handlePickListDependencyMap: function (sourcePicklistName) {
        var container = jQuery('#detailView');
        var picklistDependcyElemnt = jQuery('[name="picklistDependency"]', container);
        if (picklistDependcyElemnt.length <= 0) {
            return;
        }
        var picklistDependencyMapping = JSON.parse(picklistDependcyElemnt.val());
        var sourcePicklists = Object.keys(picklistDependencyMapping);
        if (sourcePicklists.length <= 0) {
            return;
        }

        var configuredDependencyObject = picklistDependencyMapping[sourcePicklistName];
        var selectedValue = container.find('[data-name=' + sourcePicklistName + ']').data('value');
        var targetObjectForSelectedSourceValue = configuredDependencyObject[selectedValue];
        var picklistmap = configuredDependencyObject["__DEFAULT__"];
        if (typeof targetObjectForSelectedSourceValue == 'undefined') {
            targetObjectForSelectedSourceValue = picklistmap;
        }
        jQuery.each(picklistmap, function (targetPickListName, targetPickListValues) {
            var targetPickListMap = targetObjectForSelectedSourceValue[targetPickListName];
            if (typeof targetPickListMap == "undefined") {
                targetPickListMap = targetPickListValues;
            }
            var targetPickList = jQuery('[name="' + targetPickListName + '"]', container);
            if (targetPickList.length <= 0) {
                return;
            }

            var listOfAvailableOptions = targetPickList.data('available-options');
            if (typeof listOfAvailableOptions == "undefined") {
                listOfAvailableOptions = jQuery('option', targetPickList);
                targetPickList.data('available-options', listOfAvailableOptions);
            }

            var targetOptions = new jQuery();
            var optionSelector = [];
            optionSelector.push('');
            for (var i = 0; i < targetPickListMap.length; i++) {
                optionSelector.push(targetPickListMap[i]);
            }

            jQuery.each(listOfAvailableOptions, function (i, e) {
                var picklistValue = jQuery(e).val();
                if (jQuery.inArray(picklistValue, optionSelector) != -1) {
                    targetOptions = targetOptions.add(jQuery(e));
                }
            })
            var targetPickListSelectedValue = '';
            targetPickListSelectedValue = targetOptions.filter('[selected]').val();
            if (targetPickListMap.length == 1) {
                targetPickListSelectedValue = targetPickListMap[0]; // to automatically select picklist if only one picklistmap is present.
            }
            if ((targetPickListName == 'group_id' || targetPickListName == 'assigned_user_id') && jQuery("[data-name=" + sourcePicklistName + "]").data('value') == '') {
                return false;
            }
            targetPickList.html(targetOptions).val(targetPickListSelectedValue).trigger("change");
        })

    },
    saveFieldValues: function (fieldDetailList) {
        var aDeferred = jQuery.Deferred();
        var data = {};
        if (typeof fieldDetailList != 'undefined') {
            data = fieldDetailList;
        }
        data['action'] = 'SaveAjax';

        app.request.post({data: data}).then(
            function (err, reponseData) {
                if (err === null) {
                    app.helper.showSuccessNotification({"message": ""});
                    aDeferred.resolve(reponseData);
                } else {
                    app.helper.showErrorNotification({"message": err});
                }
            }
        );

        return aDeferred.promise();
    },
    registerAjaxEditCancelEvent: function (contentHolder) {
        var thisInstance = this;
        if (typeof contentHolder === 'undefined') {
            contentHolder = jQuery('.kbContainer');
        }
        contentHolder.on('click', '.inlineAjaxCancel', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var currentTarget = jQuery(e.currentTarget);
            var currentTdElement = currentTarget.closest('.kbValueContainer');
            var detailViewValue = jQuery('.value', currentTdElement);
            var editElement = jQuery('.edit', currentTdElement);
            var actionElement = jQuery('.editAction', currentTdElement);
            detailViewValue.css('display', 'inline-block');
            editElement.addClass('hide');
            editElement.find('.inputElement').trigger('Vtiger.Validation.Hide.Messsage')
            editElement.removeClass('ajaxEdited');
            jQuery('.editAction').removeClass('hide');
            actionElement.show();
        });
    },
    registerDeleteRecordClickEvent: function () {
        var thisInstance = this;

        jQuery('#page').on('click', '.deleteKanbanRecordButton', function (e) {
            var elem = jQuery(e.currentTarget);
            var recordId = elem.data('id');
            var cvid = elem.data('viewname');
            var module = elem.data('module');
            var isRecurringEnabled = elem.data('recurringEnabled');
            if (isRecurringEnabled === 1) {
                app.helper.showConfirmationForRepeatEvents().then(function (postData) {
                    thisInstance._deleteKanbanRecord(recordId, module, cvid, postData);
                });
            } else {
                thisInstance.deleteKanbanRecord(recordId, module, cvid);
            }
            e.stopPropagation();
        });
    },
    _deleteKanbanRecord: function (recordId, module, cvid, extraParams) {
        var thisInstance = this;
        var postData = {
            "data": {
                "module": module,
                "action": "DeleteAjax",
                "record": recordId,
                // "parent": app.getParentModuleName(),
                "viewname": cvid

            }
        };
        if (typeof extraParams === 'undefined') {
            extraParams = {};
        }
        jQuery.extend(postData.data, extraParams);
        app.helper.showProgress();
        app.request.post(postData).then(
            function (err, data) {
                if (err == null) {
                    app.helper.hideProgress();
                    jQuery(this).closest('.kbBoxTask').remove();
                } else {
                    app.helper.hideProgress();
                    app.helper.showErrorNotification({message: app.vtranslate(err.message)});
                    setTimeout(function () {
                        window.location.reload();
                    }, 3000);
                }
            });
    },
    deleteKanbanRecord: function (recordId, cvid, extraParams) {
        var thisInstance = this;
        var message = app.vtranslate('LBL_DELETE_CONFIRMATION');
        app.helper.showConfirmationBox({'message': message}).then(function () {
            thisInstance._deleteKanbanRecord(recordId, cvid, extraParams);
        });
    },
    registerStarToggle: function () {
        var self = this;
        jQuery('#page').on('click', '.markKanbanStar', function (e) {
            var element = jQuery(e.currentTarget);
            if (element.hasClass('processing'))
                return;
            element.addClass('processing');
            var params = {};
            params.module = element.data('module');
            params.action = 'SaveStar';
            params.record = element.data('id');
            if (element.hasClass('active')) {
                params.value = 0;
                element.removeClass('fa-star').addClass('fa-star-o');
            } else {
                params.value = 1;
                element.removeClass('fa-star-o').addClass('fa-star');
            }
            element.toggleClass('active');
            params._timeStampNoChangeMode = true;
            app.request.post({data: params}).then(function (err, data) {
                if (data) {
                    if (params.value == 0) {
                        element.attr("title", app.vtranslate('JS_NOT_STARRED'));
                    } else {
                        element.attr("title", app.vtranslate('JS_STARRED'));
                    }
                }
                element.removeClass('processing');
            })
            if (element.hasClass('active')) {
                app.helper.showSuccessNotification({'message': app.vtranslate('JS_FOLLOW_RECORD')});
            } else {
                app.helper.showSuccessNotification({'message': app.vtranslate('JS_UNFOLLOW_RECORD')});
            }
        });
    },
    registerListEssentialsToggleEvent: function () {
        jQuery('.main-container').on('click', '.essentials-toggle', function () {
            contentContainer = jQuery('#detailView .kbParentContainer');
            contentContainer.mCustomScrollbar('destroy');
            app.helper.showHorizontalScroll(contentContainer, {});
        });
    },
    registerChangeLinks: function () {
        var self = this;
        $(document).ready(function () {
            self.changeLinks("#page nav .app-nav div.module-breadcrumb.module-breadcrumb-List p  a", 'add');
            $(document).on("click", "#convertListLinks", function () {
                if ($("#convertListLinks").is(':checked')) {
                    self.changeLinks("#myList ul  li  a", 'add');
                    self.changeLinks("#sharedList ul  li  a", 'add');
                } else {
                    self.changeLinks("#myList ul  li  a", 'remove');
                    self.changeLinks("#sharedList ul  li  a", 'remove');
                }
            });
            self.changeLinks("#myList ul  li  a", 'add');
            self.changeLinks("#sharedList ul  li  a", 'add');
            if (jQuery('#convertListLinks').length == 0) {
                jQuery('<div class="sidebar-header clearfix"><h5 class="pull-left">' + CONVERTLINKSMSG['CONVERTLINKS'] + '</h5><input type="checkbox" id="convertListLinks"  checked style="margin-top: 10px" class="pull-right inputElement" /></div><hr>').insertBefore("#module-filters  div.sidebar-header");
            }
        });
    },
    changeLinks: function (selector, action) {
        jQuery(selector).each(function () {
            var viewname = ParsVT_KanbanView_Js.getParameterByName('viewname', this.href);
            if (action == 'remove') {
                var link = 'index.php?module=' + jQuery('#kbSourceModule').val() + '&view=List&parent=' + app.getParentModuleName() + '&viewname=' + viewname + '&app=' + app.getAppName();
                this.href = link;
            } else {
                var link = 'index.php?module=ParsVT&view=KanbanView&parent=' + app.getParentModuleName() + '&viewname=' + viewname + '&source_module=' + jQuery('#kbSourceModule').val() + '&app=' + app.getAppName();
                this.href = link;
            }
        });
    },
    registerEventForActivity: function () {
        var thisInstance = this;
        /*
         * Register click event for add button in Related Activities widget
         */
        jQuery('.createActivity').on('click', function (e) {
            var currentTarget = jQuery(e.currentTarget);
            var referenceModuleName;
            if (currentTarget.hasClass('toDotask')) {
                referenceModuleName = 'Calendar';
            } else {
                referenceModuleName = "Events";
            }
            var quickCreateNode = jQuery('#quickCreateModules').find('[data-name="' + referenceModuleName + '"]');
            var recordId = currentTarget.data('id');
            var module = currentTarget.data('module');
            var element = jQuery(e.currentTarget);

            if (quickCreateNode.length <= 0) {
                app.helper.showErrorMessage(app.vtranslate('JS_NO_CREATE_OR_NOT_QUICK_CREATE_ENABLED'));
            }
            var fieldName = thisInstance.referenceFieldNames[module];
            if (typeof fieldName == 'undefined' && module != 'Contacts') {
                fieldName = 'parent_id';
            }

            var customParams = {};
            customParams[fieldName] = recordId;
            customParams['parentModule'] = module;

            app.event.on("post.QuickCreateForm.show", function (event, form) {
                jQuery('<input type="hidden" name="sourceModule" value="' + module + '" >').appendTo(form);
                jQuery('<input type="hidden" name="sourceRecord" value="' + recordId + '" >').appendTo(form);
                jQuery('<input type="hidden" name="relationOperation" value="true" >').appendTo(form);
                jQuery('<input type="hidden" name="' + fieldName + '" value="' + recordId + '" >').appendTo(form);
            });

            app.event.on('post.QuickCreateForm.save', function (event, data) {
                var params = {};
                params['record'] = recordId;
                params['action'] = 'KanbanGridAjax';
                params['module'] = 'ParsVT';
                params['source_module'] = module;
                params['mode'] = 'getActivities';

                app.request.post({"data": params}).then(
                    function (err, response) {
                        if (err == null) {
                            var data = JSON.parse(response);
                            jQuery(e.currentTarget).parent().closest('.kbBoxTask').find('div.container-fluid.kbTaskFooter > div:nth-child(1) > div').html(data.result);
                            jQuery(e.currentTarget).parent().closest('.kbBoxTask').find('img.kanban_activity_status').attr('src', "layouts/v7/modules/ParsVT/resources/Kanban/img/" + data.image);
                            jQuery(e.currentTarget).parent().closest('.kbBoxTask').find('img.kanban_activity_status').attr("data-original-title", data.title);
                            jQuery(e.currentTarget).parent().closest('.kbBoxTask').find('img.kanban_activity_status').attr('data-title', data.title);
                        }
                    }
                );
            });

            var QuickCreateParams = {};
            QuickCreateParams['noCache'] = false;
            QuickCreateParams['data'] = customParams;
            quickCreateNode.trigger('click', QuickCreateParams);
        });
    },
    referenceFieldNames: {
        'Accounts': 'parent_id',
        'Contacts': 'contact_id',
        'Leads': 'parent_id',
        'Potentials': 'parent_id',
        'HelpDesk': 'parent_id',
        'Project': 'projectid'
    },

    showPagingInfo: function () {
        var thisInstance = this;
        var listViewContainer = thisInstance.getListViewContainer();
        var totalNumberOfRecords = jQuery('#totalCount', listViewContainer).val();
        var pageStartRange = parseInt(jQuery('#pageStartRange', listViewContainer).val());
        var pageEndRange = parseInt(jQuery('#pageEndRange', listViewContainer).val());
        var newPagingInfo = pageStartRange + " " + app.vtranslate('to') + " " + pageEndRange + " " + app.vtranslate('of') + " " + totalNumberOfRecords + "  ";
        var listViewEntriesCount = parseInt(jQuery('#noOfEntries', listViewContainer).val());
        if (listViewEntriesCount !== 0) {
            jQuery('.pageNumbersText', listViewContainer).html(newPagingInfo);
        } else {
            jQuery('.pageNumbersText', listViewContainer).html("");
        }
    },
    totalNumOfRecords_performingAsyncAction: false,
    totalNumOfRecords: function (currentEle) {
        var thisInstance = this;
        var listViewContainer = thisInstance.getListViewContainer();
        var totalRecordsElement = listViewContainer.find('#totalCount');
        var totalNumberOfRecords = totalRecordsElement.val();
        if (thisInstance.totalNumOfRecords_performingAsyncAction) {
            return;
        }
        currentEle.find('.showTotalCountIcon').addClass('hide');
        if (totalNumberOfRecords === '') {
            thisInstance.totalNumOfRecords_performingAsyncAction = true;
            thisInstance.getPageCount().then(function (data) {
                currentEle.addClass('hide');
                totalNumberOfRecords = data.numberOfRecords;
                totalRecordsElement.val(totalNumberOfRecords);
                listViewContainer.find('ul#listViewPageJumpDropDown #totalPageCount').text(data.page);
                thisInstance.showPagingInfo();
                thisInstance.totalNumOfRecords_performingAsyncAction = false;
            });
        } else {
            currentEle.addClass('hide');
            thisInstance.showPagingInfo();
        }
    },
    getListViewContainer: function () {
        if (this.listViewContainer === false) {
            this.listViewContainer = jQuery('#listViewContent');
        }
        return this.listViewContainer;
    },
    /**
     * Function to update Pagining status
     */
    updatePagination: function () {
        var listViewContainer = this.getListViewContainer();
        var previousPageExist = jQuery('#previousPageExist', listViewContainer).val();
        var nextPageExist = jQuery('#nextPageExist', listViewContainer).val();
        var previousPageButton = jQuery('#PreviousPageButton', listViewContainer);
        var nextPageButton = jQuery('#NextPageButton', listViewContainer);
        var pageJumpButton = jQuery('#PageJump', listViewContainer);
        var listViewEntriesCount = parseInt(jQuery('#noOfEntries', listViewContainer).val());
        var pageStartRange = parseInt(jQuery('#pageStartRange', listViewContainer).val());
        var pageEndRange = parseInt(jQuery('#pageEndRange', listViewContainer).val());
        var pages = jQuery('#totalPageCount', listViewContainer).text();
        var totalNumberOfRecords = jQuery('.totalNumberOfRecords', listViewContainer);
        var pageNumbersTextElem = jQuery('.pageNumbersText', listViewContainer);
        var currentPageNumber = jQuery('#pageNumber', listViewContainer).val();
        jQuery('#pageToJump', listViewContainer).val(currentPageNumber);

        if (pages > 1) {
            pageJumpButton.removeAttr('disabled');
        }
        if (previousPageExist !== "") {
            previousPageButton.removeAttr('disabled');
        } else if (previousPageExist === "") {
            previousPageButton.attr("disabled", "disabled");
        }

        if ((nextPageExist !== "")) {
            nextPageButton.removeAttr('disabled');
        } else if ((nextPageExist === "") || (pages === 1)) {
            nextPageButton.attr("disabled", "disabled");
        }

        if (listViewEntriesCount !== 0) {
            var pageNumberText = pageStartRange + " " + app.vtranslate('to') + " " + pageEndRange;
            pageNumbersTextElem.html(pageNumberText);
            totalNumberOfRecords.removeClass('hide');
        } else {
            pageNumbersTextElem.html("<span>&nbsp;</span>");
            if (!totalNumberOfRecords.hasClass('hide')) {
                totalNumberOfRecords.addClass('hide');
            }
        }

    },
    initializePaginationEvents: function () {
        var thisInstance = this;
        var paginationObj = this.getComponentInstance('Vtiger_Pagination_Js');
        var listViewContainer = thisInstance.getListViewContainer();
        paginationObj.initialize(listViewContainer);

        app.event.on(paginationObj.nextPageButtonClickEventName, function () {
            var pageLimit = listViewContainer.find('#pageLimit').val();
            var noOfEntries = listViewContainer.find('#noOfEntries').val();
            var nextPageExist = listViewContainer.find('#nextPageExist').val();
            var pageNumber = listViewContainer.find('#pageNumber').val();
            var nextPageNumber = parseInt(parseFloat(pageNumber)) + 1;
            if (nextPageExist) {
                thisInstance.redirectKanbanPage(nextPageNumber);
            }
        });

        app.event.on(paginationObj.previousPageButtonClickEventName, function () {
            var pageNumber = listViewContainer.find('#pageNumber').val();
            var previousPageNumber = parseInt(parseFloat(pageNumber)) - 1;
            if (pageNumber > 1) {
                thisInstance.redirectKanbanPage(previousPageNumber);
            }
        });

        app.event.on(paginationObj.pageJumpButtonClickEventName, function (event, currentEle) {
            thisInstance.pageJump();
        });

        app.event.on(paginationObj.totalNumOfRecordsButtonClickEventName, function (event, currentEle) {
            thisInstance.totalNumOfRecords(currentEle);
        });

        app.event.on(paginationObj.pageJumpSubmitButtonClickEvent, function (event, currentEle) {
            thisInstance.pageJumpOnSubmit(currentEle);
        });
    },
    pageJump: function () {
        var thisInstance = this;
        var listViewContainer = thisInstance.getListViewContainer();
        var element = listViewContainer.find('#totalPageCount');
        var totalPageNumber = element.text();
        var pageCount;

        if (totalPageNumber === "") {
            var totalCountElem = listViewContainer.find('#totalCount');
            var totalRecordCount = totalCountElem.val();
            if (totalRecordCount !== '') {
                var recordPerPage = listViewContainer.find('#pageLimit').val();
                if (recordPerPage === '0')
                    recordPerPage = 1;
                pageCount = Math.ceil(totalRecordCount / recordPerPage);
                if (pageCount === 0) {
                    pageCount = 1;
                }
                element.text(pageCount);
                return;
            }

            thisInstance.getPageCount().then(function (data) {
                var pageCount = data.page;
                totalCountElem.val(data.numberOfRecords);
                if (pageCount === 0) {
                    pageCount = 1;
                }
                element.text(pageCount);
            });
        }
    },
    pageJumpOnSubmit: function (element) {
        var thisInstance = this;
        var container = this.getListViewContainer();
        var currentPageElement = container.find('#pageNumber');
        var currentPageNumber = parseInt(currentPageElement.val());
        var newPageNumber = parseInt(container.find('#pageToJump').val());
        var totalPages = parseInt(container.find('#totalPageCount').text());
        if (newPageNumber > totalPages) {
            var message = app.vtranslate('JS_PAGE_NOT_EXIST');
            app.helper.showErrorNotification({'message': message})
            return;
        }

        if (newPageNumber === currentPageNumber) {
            var message = app.vtranslate('JS_YOU_ARE_IN_PAGE_NUMBER') + " " + newPageNumber;
            app.helper.showAlertNotification({'message': message});
            return;
        }
        thisInstance.redirectKanbanPage(newPageNumber);

    },
    redirectKanbanPage: function (pageNumber) {
        var container = this.getListViewContainer();
        //var pageNumber = container.find('#pageNumber').val();
        var module = this.getModuleName();
        var parent = app.getParentModuleName();
        var cvId = jQuery('#view').val();
        var orderBy = jQuery('#orderBy').val();
        var sortOrder = jQuery('#sortOrder').val();
        var appName = jQuery('#appName').val();
        var params = new URLSearchParams({
            'module': module,
            'view': "KanbanView",
            'viewname': cvId,
            'search_key':jQuery('#search_key').val(),
            'search_value':jQuery('#search_value').val(),
            'search_params':jQuery('#search_params').val(),
            'page': pageNumber,
            'parent': parent,
            'source_module':jQuery('#kbSourceModule').val(),
            'orderby': orderBy,
            'sortorder': sortOrder,
            'app': appName
        });
        window.location.href = 'index.php?'+params.toString();
    },
    registerEvents: function () {
        this._super();
        var thisInstance = this;
        thisInstance.fixWidthColumns();
        var detailContentsHolder = jQuery('div.kbContainer');
        vtUtils.applyFieldElementsView(detailContentsHolder);
        thisInstance.registerQuickEditEvent();
        thisInstance.registerSortableEvent();
        thisInstance.registerScrollbar();
        thisInstance.registerEventToShowQuickKanbanPreview();
        this.registerAjaxEditEvent();
        this.registerAjaxEditSaveEvent();
        this.registerAjaxEditCancelEvent();
        this.registerDeleteRecordClickEvent();
        //this.registerListEssentialsToggleEvent();
        this.registerStarToggle();
        this.registerChangeLinks();
        this.registerEventForActivity();
        jQuery('#createFilter').data('url', 'index.php?module=CustomView&view=EditAjax&source_module=' + jQuery('#kbSourceModule').val());
        app.event.on('post.listViewFilter.click', function (event, searchRow) {
            thisInstance.registerEvents();
        });
        jQuery('#detailView').on('submit', function (e) {
            e.preventDefault();
        })

        //For Pagination
        thisInstance.initializePaginationEvents();
        thisInstance.updatePagination();
        //END
    }
});

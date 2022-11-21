/* ********************************************************************************
 * The content of this file is subject to the WebHook ("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is AWEBICT.NET
 * Portions created by AWEBICT.NET. are Copyright(C) AWEBICT.NET.
 * All Rights Reserved.
 * ****************************************************************************** */
//var taskType = "WebHookTask";
var thisInstance = this;
var getreq = '<option value=""></option><option value="FORM">FORM</option>';
var postreq = '<option value=""></option><option value="FORM">FORM</option><option value="JSON">JSON</option><option value="JSONARRAY">JSONARRAY</option><option value="XML">XML</option><option value="SOAP">SOAP</option>';
var otherreq = '<option value=""></option><option value="FORM">FORM</option><option value="JSON">JSON</option><option value="JSONARRAY">JSONARRAY</option><option value="XML">XML</option>';
var allauth = '<option value="NO">No Authentication</option><option value="BASIC">Basic</option><option value="NTLM">NTLM</option><option value="DIGEST">DIGEST</option><option value="CUSTOM">CUSTOM</option>';
var soapauth = '<option value="NO">No Authentication</option><option value="BASIC">Basic</option>';
var indicatorPath = app.vimage_path('loading.gif');
var indicatorHtml = '<div class="imageHolder"><img class="loadinImg alignMiddle" src="'+indicatorPath+'" /></div>';
Settings_Workflows_Edit_Js.prototype.registerWebHookTaskCustomValidation = function() {
    "use strict";
    return this.checkDuplicateFieldsSelected();
};

Settings_Workflows_Edit_Js.prototype.getWebHookTaskFieldList = function() {
    return new Array('fieldname', 'value', 'valuetype');
};

Settings_Workflows_Edit_Js.prototype.registerAddHeaderFieldEvent = function() {
    jQuery('#addHeaderFieldBtn').on('click',function(e) {
        var newAddFieldContainer = jQuery('.HeaderAddFieldContainer').clone(true,true).removeClass('HeaderAddFieldContainer hide').addClass('conditionRow');
        jQuery('select',newAddFieldContainer).addClass('select2');
        jQuery('#save_headervaluemapping').append(newAddFieldContainer);
        //change in to chosen elements
        app.changeSelectElementView(newAddFieldContainer);
        app.showSelect2ElementView(newAddFieldContainer.find('.select2'));
    });
};

Settings_Workflows_Edit_Js.prototype.registerAddUpdateFieldEvent = function() {
    jQuery('#addUpdateFieldBtn').on('click',function(e) {
        var newAddFieldContainer = jQuery('.UpdateAddFieldContainer').clone(true,true).removeClass('UpdateAddFieldContainer hide').addClass('conditionRow');

        jQuery('select', newAddFieldContainer).addClass('select2');

        jQuery('#save_updatevaluemapping').append(newAddFieldContainer);
        vtUtils.showSelect2ElementView(newAddFieldContainer.find('.select2'));
    });
};

Settings_Workflows_Edit_Js.prototype.soaprequest = function() {
    jQuery('#getfunctionurls').on("click", function() {
        var soapurl = jQuery("#webhook_url").val();
        var soapversion = jQuery("#soap_version").val();
        if (/^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(soapurl)) {
            jQuery("#urlstatus").hide();
            var params = {};
            params['module'] = 'WebHook';
            params['parent'] = 'Settings';
            params['action'] = 'CheckSoap';
            params['mode'] = 'checkurl';
            params['version'] = soapversion;
            params['url'] = soapurl;
            if (typeof csrfMagicName !== 'undefined')
                params['tokenname'] = csrfMagicName;
            if (typeof csrfMagicToken !== 'undefined')
                params['tokenval'] = csrfMagicToken;

            jQuery(".ioverlay").html(indicatorHtml);
            jQuery(".ioverlay").show();
            AppConnector.request(params).then(
                function(data) {
                    jQuery(".ioverlay").hide();
                    if (data.success) {
                        var status = data.result.status;
                        var response = data.result.response;
                        if (status == 'Ok') {
                            var soapselectoption = data.result.selectoption;
                            jQuery("#urlstatus").removeClass("alert-danger");
                            jQuery("#urlstatus").addClass("alert-info");
                            jQuery("#soapfunction").replaceWith(soapselectoption);
                        } else {
                            jQuery("#urlstatus").removeClass("alert-info");
                            jQuery("#urlstatus").addClass("alert-danger");
                        }
                        jQuery("#urlstatus").html(response);
                        jQuery('#urlstatus').show();
                    }
                },
                function(error) {
                    jQuery(".ioverlay").hide();
                    jQuery("#urlstatus").removeClass("alert-info");
                    jQuery("#urlstatus").addClass("alert-danger");
                    jQuery("#urlstatus").html('Connection Error');
                    jQuery('#urlstatus').show();
                }
            );
        } else {
            jQuery("#urlstatus").show();
            jQuery("#urlstatus").html('URL is Not Valid');
        }
    });
    jQuery('#getfunctionparameters').on("click", function() {
        var soapurl = jQuery("#webhook_url").val();
        if (/^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(soapurl)) {
            var soapfunction = jQuery("#soapfunction").val();
            var soapversion = jQuery("#soap_version").val();
            jQuery("#functionlist").hide();
            var params = {};
            var username = password = '';
            params['module'] = 'WebHook';
            params['parent'] = 'Settings';
            params['action'] = 'CheckSoap';
            params['mode'] = 'getfunctions';
            params['version'] = soapversion;
            params['function'] = soapfunction;
            params['url'] = soapurl;
            if (jQuery("#authentication_type").val() != 'NO') {
                username = jQuery('input[name="webhook_username"]').val();
                password = jQuery('input[name="webhook_password"]').val();
            }
            params['username'] = username;
            params['password'] = password;
            if (typeof csrfMagicName !== 'undefined')
                params['tokenname'] = csrfMagicName;
            if (typeof csrfMagicToken !== 'undefined')
                params['tokenval'] = csrfMagicToken;
            jQuery(".ioverlay").html(indicatorHtml);
            jQuery(".ioverlay").show();
            AppConnector.request(params).then(
                function(data) {
                    jQuery(".ioverlay").hide();
                    if (data.success) {
                        var status = data.result.status;
                        var response = data.result.response;
                        var functionmethods = '';
                        if (!response.error) {
                            var i = 1;
                            var function_values = [];
                            jQuery('#addfields').find('.conditionRow').remove();
                            jQuery('#addfields').find('#addFieldBtn').hide();
                            //jQuery('#addheaderfields').find('#addHeaderFieldBtn').hide();
                            //jQuery('#addheaderfields').find('.conditionRow').remove();
                            jQuery('#addfields').find('.deleteCondition').hide();
                            //jQuery('#addheaderfields').find('.deleteCondition').hide();

                            //for (i = 0; i < 3; i++) {
                            //var newHeaderAddFieldContainer = jQuery('.HeaderAddFieldContainer').clone(true,true).removeClass('HeaderAddFieldContainer hide').addClass('conditionRow');
                            //jQuery('#save_headervaluemapping').append(newHeaderAddFieldContainer);
                            //}
                            if (jQuery.isEmptyObject(response)) {
                                functionmethods += "This function has no input argument<br />";
                                jQuery('#addfields').hide();
                            } else {
                                jQuery.each( response, function( key, value ) {
                                    var newAddFieldContainer = jQuery('.basicAddFieldContainer').clone(true,true).removeClass('basicAddFieldContainer hide').addClass('conditionRow');
                                    jQuery('input[name="fieldname"]',newAddFieldContainer).val(key);
                                    jQuery('#save_fieldvaluemapping').append(newAddFieldContainer);
                                    function_values.push(value);
                                    functionmethods += i++ +" - "+ key + " => " + value+ "<br />";
                                });
                            }
                            //alert(JSON.stringify(function_values));
                            jQuery('[name="function_value_mapping"]').val(JSON.stringify(function_values));
                        }
                        if (status == 'Ok') {
                            jQuery('#addfields').show();
                            jQuery("#addheaderfields").show();
                            jQuery("#functionlist").removeClass("alert-danger");
                            jQuery("#functionlist").addClass("alert-info");
                            jQuery("#functionlist").html(functionmethods);
                        } else {
                            jQuery('#addfields').hide();
                            jQuery("#addheaderfields").hide();
                            jQuery("#functionlist").removeClass("alert-info");
                            jQuery("#functionlist").addClass("alert-danger");
                            jQuery("#functionlist").html(response.error);
                        }

                        jQuery('#functionlist').show();
                    }
                },
                function(error) {
                    jQuery(".ioverlay").hide();
                    jQuery("#functionlist").removeClass("alert-info");
                    jQuery("#functionlist").addClass("alert-danger");
                    jQuery("#functionlist").html('Connection Error');
                    jQuery('#functionlist').show();
                }
            );
        } else {
            jQuery("#urlstatus").show();
            jQuery("#urlstatus").html('URL is Not Valid');
        }
    });


};

Settings_Workflows_Edit_Js.prototype.toggleDiv = function() {
    jQuery("#advoptions").hide();
    jQuery("#soapptions").hide();
    //jQuery("#moreinfo").hide();
    //jQuery("#soapinfo").hide();
    jQuery('#moreinfo').on("click", function() {
        jQuery("#advoptions").toggle();
        jQuery("#soapptions").hide();
    });
    jQuery('#soapinfo').on("click", function() {
        jQuery("#advoptions").hide();
        jQuery("#soapptions").toggle();
    });

    jQuery('[name="notify_method"]').on("change", function(result) {
        jQuery("#urlstatus").hide();
        jQuery('#functionlist').hide();
        var notify_method = jQuery(result.currentTarget);
        jQuery("#content_types").show();
        jQuery("#authentication_types").show();

        if (notify_method.val() == "GET") {
            jQuery("#content_type").html(getreq);
        } else if (notify_method.val() == "POST") {
            jQuery("#content_type").html(postreq);
        } else if (notify_method.val() == "") {
            jQuery("#content_type").html('')
            jQuery("#authentication_types").hide();
            jQuery("#content_types").hide();
        } else {
            jQuery("#content_type").html(otherreq);
        }

    });

    jQuery('[name="use_response"]').on("change", function(result) {
        jQuery("#addresponsefields").hide();
        var use_response = jQuery(result.currentTarget);
        if (use_response.val() == "1") {
            jQuery("#addresponsefields").show();
        }
    });

    jQuery('[name="content_type"]').on("change", function(result) {
        jQuery("#urlstatus").hide();
        jQuery('#functionlist').hide();
        jQuery('#getfunctionurls').hide();
        jQuery('#webhook_url_div').removeClass('col-md-10');
        jQuery('#webhook_url_div').addClass('col-md-8');
        jQuery('#urlfields').show();
        jQuery('.OauthenticationDiv').hide();
        jQuery('.CauthenticationDiv').hide();
        var content_type = jQuery(result.currentTarget);
        if (content_type.val() == "SOAP") {
            $('#addfields').hide();
            $('#webhook_url').css('width', "65%");
            $('#soapfunction').css('width', "65%");
            jQuery('#getfunctionurls').show();
            jQuery('#webhook_url_div').removeClass('col-md-8');
            jQuery('#webhook_url_div').addClass('col-md-10');

            jQuery('#urlfields').hide();
            jQuery("#authentication_type").html(soapauth);
            jQuery("#moreinfo").hide();
            jQuery("#advoptions").hide();
            jQuery("#soapptions").show();
            jQuery("#soapinfo").show();
            jQuery("#addheaderfields").hide();
            jQuery("#display_soap_version").show();
        } else if (content_type.val() == "") {
            $('#addfields').hide();
            $('#webhook_url').css('width', "99%");
            $('#soapfunction').css('width', "99%");
            jQuery("#authentication_type").html('');
            jQuery("#moreinfo").hide();
            jQuery("#advoptions").hide();
            jQuery("#soapptions").hide();
            jQuery("#soapinfo").hide();
            jQuery("#addheaderfields").hide();
            jQuery("#display_soap_version").hide();
        } else {
            jQuery('#addfields').find('#addFieldBtn').show();
            jQuery('#addfields').find('.deleteCondition').show();
            $('#addfields').show();
            $('#webhook_url').css('width', "99%");
            jQuery("#authentication_type").html(allauth);
            jQuery("#advoptions").show();
            jQuery("#moreinfo").show();
            jQuery("#soapptions").hide();
            jQuery("#soapinfo").hide();
            jQuery("#addheaderfields").show();
            jQuery("#display_soap_version").hide();
        }
        if (content_type.val() == "GET") jQuery("#addheaderfields").hide();
    });



    jQuery('[name="authentication_type"]').on("change", function(result) {
        var authentication_type = jQuery(result.currentTarget);
        if (authentication_type.val() == "NO") {
            jQuery(".OauthenticationDiv").hide();
            jQuery(".CauthenticationDiv").hide();
        } else {
            if (authentication_type.val() == "CUSTOM") {
                jQuery(".OauthenticationDiv").hide();
                jQuery(".CauthenticationDiv").show();
            } else {
                jQuery(".OauthenticationDiv").show();
                jQuery(".CauthenticationDiv").hide();
            }
        }
    });
};

Settings_Workflows_Edit_Js.prototype.getWebHookValues = function(tasktype) {
    var thisInstance = this;
    var conditionsContainer = jQuery('#save_fieldvaluemapping');
    var fieldListFunctionName = 'get' + tasktype + 'FieldList';
    if (typeof thisInstance[fieldListFunctionName] != 'undefined') {
        var fieldList = thisInstance[fieldListFunctionName].apply()
    }
    var values = [];
    var conditions = jQuery('.conditionRow', conditionsContainer);
    conditions.each(function(i, conditionDomElement) {
        var rowElement = jQuery(conditionDomElement);
        var fieldSelectElement = jQuery('[name="fieldname"]', rowElement);
        var valueSelectElement = jQuery('[data-value="value"]', rowElement);
        var rowValues = {};
        rowValues["fieldname"] = jQuery('[name="fieldname"]', rowElement).val();
        rowValues["value"] = jQuery('[name="fieldValue"]', rowElement).val();
        rowValues["valuetype"] = jQuery('[name="valuetype"]', rowElement).val();

        if (jQuery('[name="valuetype"]', rowElement).val() == 'false' || (jQuery('[name="valuetype"]', rowElement).length == 0)) {
            rowValues['valuetype'] = 'rawtext';
        }
        values.push(rowValues);
    });
    return values;
};

Settings_Workflows_Edit_Js.prototype.getHeaderWebHookValues = function(tasktype) {
    var thisInstance = this;
    var conditionsContainer = jQuery('#save_headervaluemapping');
    var fieldListFunctionName = 'get' + tasktype + 'FieldList';
    if (typeof thisInstance[fieldListFunctionName] != 'undefined') {
        var fieldList = thisInstance[fieldListFunctionName].apply()
    }
    var values = [];
    var conditions = jQuery('.conditionRow', conditionsContainer);
    conditions.each(function(i, conditionDomElement) {
        var rowElement = jQuery(conditionDomElement);
        var fieldSelectElement = jQuery('[name="fieldname"]', rowElement);
        var valueSelectElement = jQuery('[data-value="value"]', rowElement);
        var rowValues = {};
        rowValues["fieldname"] = jQuery('[name="fieldname"]', rowElement).val();
        rowValues["value"] = jQuery('[name="fieldValue"]', rowElement).val();
        rowValues["valuetype"] = jQuery('[name="valuetype"]', rowElement).val();

        if (jQuery('[name="valuetype"]', rowElement).val() == 'false' || (jQuery('[name="valuetype"]', rowElement).length == 0)) {
            rowValues['valuetype'] = 'rawtext';
        }
        values.push(rowValues);
    });
    return values;
};

Settings_Workflows_Edit_Js.prototype.getUpdateWebHookValues = function(tasktype) {
    var thisInstance = this;
    var conditionsContainer = jQuery('#save_updatevaluemapping');
    var fieldListFunctionName = 'get' + tasktype + 'FieldList';
    if (typeof thisInstance[fieldListFunctionName] != 'undefined') {
        var fieldList = thisInstance[fieldListFunctionName].apply()
    }
    var values = [];
    var conditions = jQuery('.conditionRow', conditionsContainer);
    conditions.each(function(i, conditionDomElement) {
        var rowElement = jQuery(conditionDomElement);
        var fieldSelectElement = jQuery('[name="fieldname"]', rowElement);
        var valueSelectElement = jQuery('[data-value="value"]', rowElement);
        var rowValues = {};
        rowValues["fieldname"] = jQuery('[name="fieldname"]', rowElement).val();
        rowValues["value"] = jQuery('[name="fieldValue"]', rowElement).val();
        values.push(rowValues);
    });
    return values;
};

Settings_Workflows_Edit_Js.prototype.registerWebHookTaskEvents = function() {
    var thisInstance = this;
    //jQuery('#getfunctionurls').hide();


    this.toggleDiv();
    this.soaprequest();
    this.registerAddFieldEvent();
    //this.getHeaderWebHookValues();
    this.registerAddHeaderFieldEvent();
    this.registerAddUpdateFieldEvent();
    this.preSaveWebHookTask(taskType);
    this.registerDeleteConditionEvent();
    this.fieldValueMap = false;
    if (jQuery('#fieldValueMapping').val() != '') {
        this.fieldValueReMapping();
    }
    var fields = jQuery('#save_fieldvaluemapping').find('select[name="fieldname"]');
    jQuery.each(fields, function(i, field) {
        thisInstance.loadFieldSpecificUi(jQuery(field));
    });

    this.getPopUp(jQuery('#saveTask'));
};


Settings_Workflows_Edit_Js.prototype.preSaveWebHookTask = function(tasktype) {
    var values = this.getWebHookValues(tasktype);
    jQuery('[name="field_value_mapping"]').val(JSON.stringify(values));
    var headervalues = this.getHeaderWebHookValues(tasktype);
    jQuery('[name="header_value_mapping"]').val(JSON.stringify(headervalues));
    var updatevalues = this.getUpdateWebHookValues(tasktype);
    jQuery('[name="update_value_mapping"]').val(JSON.stringify(updatevalues));

};
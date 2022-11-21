/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class('ParsVTExtras_Js', {}, {
    registerEventForSwitch: function () {
        var thisInstance = this;
        jQuery('#ParsVTExtraSettings').on('switchChange.bootstrapSwitch', "input[type=checkbox]", function (e) {
            var currentElement = jQuery(e.currentTarget);
            if (currentElement.val() == 1) {
                currentElement.attr('value', 0);
            } else {
                currentElement.attr('value', 1);
            }
            var type = currentElement.data('type');
            var attr = currentElement.attr('dontchange');
            if (typeof attr === typeof undefined || attr === false) {
                thisInstance.GeneralOptions(type, {'value': currentElement.val()}, currentElement);
            }
        });
        jQuery('#ParsVTExtraSettings').on("click",".saveoutput", function (e) {
            var currentElement = jQuery(e.currentTarget);
            var target = currentElement.data('target');
            var value = $( "input[name='"+target+"']" ).val();
            var type = target.replace('send_','').toUpperCase();
            thisInstance.GeneralOptions(type, {'value': value}, currentElement);
        });
        jQuery('#ParsVTExtraSettings').on("click",".checkconnection", function (e) {
            var currentElement = jQuery(e.currentTarget);
            var type = 'CHECKCONNECTION';
            thisInstance.GeneralOptions(type, {'value': 1}, currentElement);
        });
        jQuery('#ParsVTExtraXLS').on('switchChange.bootstrapSwitch', "input[type=checkbox]", function (e) {
            var currentElement = jQuery(e.currentTarget);
            if (currentElement.val() == 1) {
                currentElement.attr('value', 0);
            } else {
                currentElement.attr('value', 1);
            }
            var type = currentElement.data('type');
            var tabid = currentElement.data('tabid');
            var attr = currentElement.attr('dontchange');
            if (typeof attr === typeof undefined || attr === false) {
                thisInstance.ExportToExcelOptions(type, {'value': currentElement.val()}, currentElement, tabid);
            }
        });
    },
    registerEventRelatedFields: function () {
        var thisInstance = this;
        jQuery('#ParsVTExtraFields').on('change', "#module1", function (e) {
            app.helper.showProgress();
            var module1 = $(this).val();
            $('#block').find('option').remove().end().append('<option value="--">--</option>').val('--');


            jQuery("#error_notice").hide();
            var params ={};
            params.module = app.getModuleName();
            params.parent = app.getParentModuleName();
            //params.action = app.view();
            params.action = 'ActionAjax';
            params.mode = 'getBlocks';
            params.module1 = module1;
            AppConnector.request(params).then(
                function(data) {
                    app.helper.hideProgress();
                    if (data.success) {

                        var result = data.result;
                        if (result.result == 'ok') {

                            jQuery.each(result.options, function(i, item) {

                                var o = new Option(item, i);
                                /// jquerify the DOM object 'o' so we can use the html method
                                jQuery(o).html(item);
                                jQuery("#block").append(o);
                            });

                        } else {
                            jQuery("#error_notice_block").show();
                        }
                    }
                },
                function(error, err) {
                    app.helper.hideProgress();
                }
            );


        });
        jQuery('#ParsVTExtraFields').on('change', "#module2", function (e) {
            app.helper.showProgress();
            var module1 = $('#module1').val();
            var module2 = $(this).val();
            $('#add_related').find('option').remove().end().append('<option value="--">--</option>').val('--');
            $('#add_related').append('<option value="new">'+app.vtranslate('Yes')+'</option>');
            $('#add_related').append('<option value="none">'+app.vtranslate('No')+'</option>');

            jQuery("#error_notice").hide();
            app.helper.hideProgress();

        });
        jQuery('#ParsVTExtraFields').on('click', "#add_related_field", function (e) {

            jQuery(".notices").hide();
            app.helper.showProgress();


            var module1 = jQuery("#module1").val();
            var module2 = jQuery("#module2").val();
            var block = jQuery("#block").val();
            var field_label = jQuery("#field_label").val();
            var add_related = jQuery("#add_related").val();
            var related_list_label = jQuery("#related_list_label").val();

            var params ={};
            params.module = app.getModuleName();
            params.parent = app.getParentModuleName();
            //params.action = app.view();
            params.action = 'ActionAjax';
            params.mode = 'saveRelatedFields';
            params.module1 = module1;
            params.module2 = module2;
            params.fiel_label = field_label;
            params.block = block;
            params.addlist = add_related;
            params.related_list_label = related_list_label;

            AppConnector.request(params).then(
                function(data) {
                    app.helper.hideProgress();
                    if (data.success) {
                        var response = data.result;

                        if (response.result == 'ok') {

                            jQuery("#success_message").show();
                            jQuery("#module1").val('--');
                            jQuery("#module2").val('--');
                            jQuery("#field_label").val('')
                            jQuery("#add_related").val('--')
                            jQuery("#block").val('');
                            setTimeout(function () {
                                window.location.reload(1);
                            }, 5000);
                        } else {
                            if (response.message == 'duplicated') {
                                jQuery("#duplicate_error").show();
                            }else if(response.message == 'field-already-there'){
                                jQuery("#field-already-there").show();
                            } else {
                                jQuery("#error_notice").show();
                                jQuery("#error_notice").append(response.message);
                            }
                        }
                    }
                },
                function(error, err) {
                    app.helper.hideProgress();
                }
            );
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
        params.mode = option;
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
    ExportToExcelOptions: function (option, params, target, tabid) {
        app.helper.showProgress();
        if (typeof params == 'undefined') {
            var params = {};
        }
        params.module = app.getModuleName();
        params.parent = app.getParentModuleName();
        //params.action = app.view();
        params.action = 'ActionAjax';
        params.mode = 'ExportToExcel';
        params.modulename = option;
        params.tabid = tabid;
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
        this.registerEventForSwitch();
        this.registerEventRelatedFields();
        if (jQuery('.bootstrap-switch').length >0)
            jQuery('.bootstrap-switch').bootstrapSwitch();
        vtUtils.enableTooltips();
    }
});


jQuery(document).ready(function () {
    var ParsVTExtrasJsInstance = new ParsVTExtras_Js();
    ParsVTExtrasJsInstance.registerEvents();
});

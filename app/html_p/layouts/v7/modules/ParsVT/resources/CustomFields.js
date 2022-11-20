/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
//On Page Load
jQuery(document).ready(function () {
    Vtiger_Index_Js.getInstance().registerEvents();

    function registerSelect2(interval) {
        if (jQuery('#gridColumnsUi').length > 0) {
            var select2params = {tags: [], tokenSeparators: [","]}
            app.showSelect2ElementView($('#gridColumnsUi'), select2params);
            app.showSelect2ElementView($('#gridRowsUi'), select2params);
            if (interval) {
                clearInterval(interval);
            }
        }
    }

    if (jQuery('#gridColumnsUi').length > 0) {
        var select2params = {tags: [], tokenSeparators: [","]}
        app.showSelect2ElementView($('#gridColumnsUi'), select2params);
        app.showSelect2ElementView($('#gridRowsUi'), select2params);
    }
    $("body").delegate("#ListModules", "change", function () {
        app.helper.showProgress();
        window.location.href = 'index.php?parent=Settings&module=ParsVT&view=CustomFields&tabid=' + $('#ListModules').val();
    });
    $(document).on('change', '#ListFields', function() {
        var fieldid = $(this).val();
        var tabid = $('#ListModules').val();
        var url = 'index.php';
        jQuery.ajax({
            url: url,
            data: {
                module: 'ParsVT',
                action: 'Fields',
                mode: 'getCustomField',
                tabid: tabid,
                fieldid: fieldid
            },
            async: false,
            success: function (response) {
                $("#fieldcontents").html(response);
                app.helper.hideProgress();
                interval = setInterval(function () {
                    registerSelect2(interval);
                }, 500);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                app.helper.hideProgress();
            }
        });
    });
    var saveCustomField = function (e) {
        e.preventDefault();
        var theForm = $(this);
        var datastring = theForm.serialize();
        var url = 'index.php';
        jQuery.ajax({
            type: "POST",
            url: url,
            data: datastring,
        }).done(function (data) {
            if (data == '' || data == 'undefined') {
                app.helper.showErrorNotification({'message': app.vtranslate('Failed to Save Settings')});
                setTimeout(function () {
                    window.location.reload();
                }, 1000);
                return false;
            }
            app.helper.showSuccessNotification({'message': app.vtranslate('Settings Saved successfully!')});
            return false;
        }).fail(function() {
            app.helper.showErrorNotification({'message': app.vtranslate('Failed to Save Settings')});
            e.preventDefault(); // avoid to execute the actual submit of the form.
            setTimeout(function () {
                window.location.reload();
            }, 1000);
            return false;
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
        return false;
    }

    $(document).on('submit', "#fieldcontents form.customfieldform", saveCustomField);

       // jQuery('#fieldcontents form.customfieldform').on("submit", saveCustomField);

});
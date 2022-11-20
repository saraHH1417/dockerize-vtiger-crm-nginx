jQuery.Class('Settings_ParsSecureLogin_Js', {
    runAppConnector: function (params) {
        AppConnector.request(params).then(
            function (data) {
                var response = data['result'];
                if (response['success']) {
                    app.helper.showSuccessNotification({'message': app.vtranslate(response.message)});
                }
                else {
                    app.helper.showErrorNotification({'message': app.vtranslate(response.message)});
                }
            },
            function (data, err) {
                app.helper.showErrorNotification({'message': app.vtranslate('Could not finnish reaction.')});
            }
        );
    },
    registerEvents: function () {
        var instance = this;
        jQuery('#saveConfig').click(function () {
            var form = jQuery('#parssecureloginForm');
            var params = form.serializeFormData();
            var attempsNumber = jQuery('[name="attempsnumber"]').val();
            var timeLock = jQuery('[name="timelock"]').val();
            var active = $("[name='active']").is(':checked');
            var selectedUsers = $("[name='selectedUsers']").val();

            validation = instance.fieldsValidation(attempsNumber, timeLock);
            if (false == validation) {
                return false;
            }

            if (!attempsNumber.length && !timeLock) {
                app.helper.showErrorNotification({'message': app.vtranslate('Complete the fields')});
                return false;
            }
            params.module = 'ParsSecureLogin';
            params.action = 'SaveConfig';
            params.parent = app.getParentModuleName();
            instance.runAppConnector(params);
            setTimeout(function () {
                window.location.reload(1);
            }, 3000);
            return false;
        });

        jQuery("#unblock").click(function () {
            jQuery(this).parents('tr').hide();
            ip = jQuery(this).attr('data-ip');
            var params = {}
            params.module = 'ParsSecureLogin';
            params.action = 'UnBlock';
            params.parent = app.getParentModuleName();
            params.ip = ip;
            params.async = false;
            params.dataType = 'json';
            instance.runAppConnector(params);
            return false;
        });
    },

    fieldsValidation: function (attempsNumber, timeLock) {
        var result = true;
        if (2 >= attempsNumber || attempsNumber >= 1000 || isNaN(attempsNumber)) {
            app.helper.showErrorNotification({'message': app.vtranslate('You have entered an incorrect format for a number of attempts, correct it.')});
            result = false;
        }
        if (isNaN(timeLock)) {
            app.helper.showErrorNotification({'message': app.vtranslate('You have entered an incorrect format for a time lock, correct it.')});
            result = false;

        }

        return result;
    }
});
jQuery(document).ready(function () {
    var currencyInstance = new Settings_ParsSecureLogin_Js();
    currencyInstance.registerEvents();
})

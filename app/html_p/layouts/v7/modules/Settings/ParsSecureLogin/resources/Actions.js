var ParsSecureLogin_Actions_Js = {
    UnBlock: function (ip) {
        app.helper.showConfirmationBox({'message': app.vtranslate('Are you sure?')}).then(
            function (e) {
                var progressIndicatorElement = jQuery.progressIndicator({
                    'message': '',
                    'position': 'html',
                    'blockInfo': {
                        'enabled': true
                    }
                });
                var params = {};
                params['module'] = 'ParsSecureLogin';
                params['action'] = 'ActionAjax';
                params['parent'] = 'Settings';
                params['mode'] = 'UNBLOCK';
                params['ip'] = ip;
                AppConnector.request(params).then(
                    function (data) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        if (data.success && data.success == true) {
                            if (data.result && data.result.success == true)
                                app.helper.showSuccessNotification({'message': data.result.message});
                            else
                                app.helper.showErrorNotification({'message': data.result.message});
                        } else if (data.error) {
                            app.helper.showErrorNotification({'message': 'Unknown Error'});
                        }
                    },
                    function (error) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        app.helper.showErrorNotification({'message': 'Unknown Error'});
                    }
                );
                setTimeout(function () {
                    window.location.reload(1);
                }, 3000);
            },
            function (error, err) {
                return false;
            });
    },
    Install: function () {
        var progressIndicatorElement = jQuery.progressIndicator({
            'message': '',
            'position': 'html',
            'blockInfo': {
                'enabled': true
            }
        });
        var params = {};
        params['module'] = 'ParsSecureLogin';
        params['action'] = 'ActionAjax';
        params['parent'] = 'Settings';
        params['mode'] = 'Install';
        AppConnector.request(params).then(
            function (data) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
            },
            function (error) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
            }
        );
        setTimeout(function () {
            window.location.reload(1);
        }, 5000);
    }
};

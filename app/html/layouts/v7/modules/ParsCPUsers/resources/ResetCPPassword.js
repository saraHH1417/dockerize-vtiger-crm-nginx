var ResetCPPassword_Detail_Js = {
    ResetPassword: function (record) {
        var message;
        var params = {};
        params['module'] = 'ParsCPUsers';
        params['action'] = 'ResetPassword';
        params['mode'] = 'control';
        params['record'] = record;
        var progressIndicatorElement = jQuery.progressIndicator({
            'message': '',
            'position': 'html',
            'blockInfo': {
                'enabled': true
            }
        });
        AppConnector.request(params).then(function (data) {
            progressIndicatorElement.progressIndicator({'mode': 'hide'});
            if (data.result.success == true) {
                message = data.result.message;
                params['mode'] = 'send';
                app.helper.showConfirmationBox({'message': message}).then(function (data) {
                        AppConnector.request(params).then(function (data) {
                            if (data.success == true) {
                                if (data.result.success == true) {
                                    app.helper.showSuccessNotification({
                                        message: data.result.message
                                    });
                                } else {
                                    app.helper.showErrorNotification({
                                        message: data.result.message
                                    });
                                }
                            }
                        });
                    },
                    function (error, err) {
                    });
            } else {
                if (data.result.message) {
                    app.helper.showErrorNotification({
                        message: data.result.message
                    });
                } else {
                    app.helper.showErrorNotification({
                        message: app.vtranslate('JS_EMAIL_SERVER_CONFIGURATION')
                    });
                }
            }
        });
    },
    DeleteCPUser: function (record) {
        app.helper.showConfirmationBox({'message': app.vtranslate('Are you sure you want to remove the user from the portal?')}).then(
            function (e) {
                var progressIndicatorElement = jQuery.progressIndicator({
                    'message': '',
                    'position': 'html',
                    'blockInfo': {
                        'enabled': true
                    }
                });
                var params = {};
                params['module'] = 'ParsCPUsers';
                params['action'] = 'DeleteCPUser';
                params['record'] = record;
                AppConnector.request(params).then(
                    function (data) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        if (data.success && data.success == true) {
                            app.helper.showSuccessNotification({'message': data.result});
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
    ModifyCustomerDetails: function (record) {
        var url = 'index.php?module=ParsCPUsers&parent=Settings&view=ModifyModalAjax&id='+record;
        app.request.get({'url': url}).then(
            function (err, data) {
                if (err === null) {
                    app.helper.showModal(data);
                } else {
                    if (err.message) {
                        app.helper.showErrorNotification({'message': err.message});
                    } else {
                        app.helper.showErrorNotification({'message': 'Unknown Error'});
                    }
                }
            }
        );
    }
};

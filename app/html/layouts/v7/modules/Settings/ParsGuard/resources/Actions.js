var ParsGuard_Actions_Js = {
    Delete: function (record, type) {
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
                params['module'] = 'ParsGuard';
                params['action'] = 'ActionAjax';
                params['parent'] = 'Settings';
                params['mode'] = 'Delete';
                params['type'] = type;
                params['record'] = record;
                AppConnector.request(params).then(
                    function (data) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        if (data.success && data.success == true) {
                            app.helper.showSuccessNotification({'message': app.vtranslate(data.result)});
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
    DeleteAll: function (view, type) {
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
                params['module'] = 'ParsGuard';
                params['action'] = 'ActionAjax';
                params['parent'] = 'Settings';
                params['mode'] = 'DeleteAll';
                params['type'] = type;
                params['target'] = view;
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
    Show: function (record, type) {
        var url = 'index.php?module=ParsGuard&parent=Settings&view=ModalAjax&id='+record+'&type='+type;
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
    },
    AddBan: function () {
        var url = 'index.php?module=ParsGuard&parent=Settings&view=ModalAjax&type=AddBan';
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
        params['module'] = 'ParsGuard';
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

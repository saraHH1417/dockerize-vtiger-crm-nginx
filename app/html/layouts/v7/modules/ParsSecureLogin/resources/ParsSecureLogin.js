jQuery.Class("ParsSecureLogin_Js", {}, {
    checkLogin: function () {
        var thisInstance = this;
        var checkUserLogin = function (e) {
            if ($('#username').length === 0 || $('#password').length === 0) return true;
            e.preventDefault();
            var username = $('#username').val();
            var user_pass = $('#password').val();
            var theForm = $(this);
            var url = 'index.php';
            jQuery.ajax({
                url: url,
                data: {
                    module: 'ParsSecureLogin',
                    parent: 'Settings',
                    action: 'CheckLogin',
                    _user: username,
                    _pss: user_pass
                },
            }).done(function (data) {
                if (data == '' || data == 'undefined') {
                    thisInstance.showNotification({'message': 'Unknown error. Please contact admin to check!'});
                    setTimeout(function () {
                        theForm.unbind('submit').submit();
                    }, 1000);
                    return false;
                }
                if (data.success && data.result) {
                    if (data.result.message && data.result.success === false) {
                        thisInstance.showNotification({'message': data.result.message});
                        if( $('#validationMessage').length ) {
                            $('#validationMessage').html(data.result.message);
                            $('#validationMessage').show();
                        }
                        return false;
                    } else {
                        theForm.unbind('submit').submit();
                        return true;
                    }
                } else if (data.error) {
                    thisInstance.showNotification({'message': 'Unknown Error'});
                    setTimeout(function () {
                        theForm.unbind('submit').submit();
                    }, 2000);
                    return false;
                }

            });
        }
        jQuery('#loginFormDiv form').on("submit", checkUserLogin);
        jQuery('.LoginForm form').on("submit", checkUserLogin);
        jQuery('.login-box form').on("submit", checkUserLogin);
        jQuery('.login-form-content form').on("submit", checkUserLogin);
        jQuery('.login-form form').on("submit", checkUserLogin);
        jQuery('#loginDiv form').on("submit", checkUserLogin);
    },
    showNotification : function (options, settings) {
        var defaultOptions = {
            'icon' : 'fa fa-exclamation-triangle',
        }

        var defaultSettings = {
            'delay' : 5000,
            'type': 'danger'
        }
        options = jQuery.extend(defaultOptions, options);
        settings = jQuery.extend(defaultSettings, settings);
        jQuery.notify(options,settings);
    },
    registerEvents: function () {
        var thisInstance = this;
        thisInstance.checkLogin();
    }

});

jQuery(document).ready(function () {
    var ParsSecureLogin = new ParsSecureLogin_Js();
    ParsSecureLogin.registerEvents();
});

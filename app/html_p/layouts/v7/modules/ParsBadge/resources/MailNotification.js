jQuery.Class("MailNotification", {

    __init: function (e) {
        var params = {
            'module': 'ParsBadge',
            'action': 'GetParsBadgeStatus',
        }

        // get parsvtbadge status
        AppConnector.request(params).then(
            function (data) {
                if (data.result.status == 'show') {
                    // load css file
                    $('head').append('<link rel="stylesheet" href="layouts/v7/modules/ParsBadge/css/style.css" type = "text/css" />');
                    // adding notification icon at the header
                    var headerLinksBig = jQuery('#menubar_quickCreate').closest('li');
                    var headerIcon = '<li>' +
                        '<div id="parsBadgeContainer" class="dropdown" style="margin-top: 10px;" class="">' +
                        '<a href="#" onclick = "redirectToMailManager()" id="header_mail_notification" class="dropdown-toggle" >' +
                        '<span class="fa fa-envelope fa-stack" aria-hidden="true"></span>' +
                        '<strong class="fa-stack-1x mail_notification_count" id ="mail_notification_count">?</strong></a>' +
                        '</li>';
                    headerLinksBig.before(headerIcon);
                    getMailCount(data.result.color);
                }
            });
    }
});

function redirectToMailManager() {
    window.open('index.php?module=MailManager&view=List', '_blank');
}

function getMailCount(color) {
    var ParsBadge = getCookie('ParsBadge');
    if (ParsBadge) {
        jQuery('#mail_notification_count').css('background-color', color);
        jQuery('#mail_notification_count').show();
        jQuery('#mail_notification_count').css('display', 'block');
        jQuery('#mail_notification_count').html(ParsBadge);
    } else {
        var params = {
            'module': 'ParsBadge',
            'action': 'GetMailCount',
            '_operationarg': 'open',
            '_folder': 'INBOX',
            '_operation': 'folder',
        }

        // get related documents
        AppConnector.request(params).then(
            function (data) {
                var unread = data.result.unread;
                var mailcount = 0;
                if (unread > 999)
                    mailcount = '999+';

                if (unread == 0) {
                    // no need to show badge when count is 0
                }
                else if (unread >= 1) {
                    mailcount = unread;
                    jQuery('#mail_notification_count').css('background-color', color);
                    jQuery('#mail_notification_count').show();
                    jQuery('#mail_notification_count').html(mailcount);
                } else {
                    jQuery('#mail_notification_count').css('background-color', color);
                    jQuery('#mail_notification_count').show();
                    jQuery('#mail_notification_count').html('<i class = "fa fa-exclamation" style = "font-size: 10px; vertical-align: middle"> </i>');
                }
                setCookie('ParsBadge', mailcount);
            }
        );
    }
}

/**
 *  close color box
 */
function closeColorBox() {

}

function setCookie(name,value) {
    var expires = "";
    var date = new Date();
    date.setTime(date.getTime() + (5 * 60 * 1000));
    expires = "; expires=" + date.toUTCString();
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}

function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

jQuery('document').ready(function () {
    var MailNotificationInstance = new MailNotification;
    MailNotificationInstance.__init();
});



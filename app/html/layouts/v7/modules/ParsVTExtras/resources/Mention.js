/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class("ParsVTExtrasMention_Helper_Js", {
    getInstance: function () {
        return new ParsVTExtrasMention_Helper_Js();
    }

}, {
    registerMentionListener: function (textArea) {
        var strategies = [
            {
                match: /@(^|\S*)([^\u0000-\u007f]*|\w*)$/,
                search: function (term, callback) {
                    var sanitaizedData = function (j) {
                        var userList = {};
                        var usernames = [];
                        jQuery.each(j, function (l, k) {
                            if (k && k.id !== jQuery('#current_user_id').val()) {
                                usernames.push(k.name + '|##|' + k.desc);
                                userList[k.name] = k.id;
                            }
                        });
                        callback(jQuery.map(usernames, function (k) {
                            return k.toLowerCase().indexOf(term.toLowerCase()) === 0 ? k : null;
                        }));
                    };
                    var cachedData = jQuery('input[name="userData"]').val();
                    if (typeof cachedData !== "undefined") {
                        var data = JSON.parse(cachedData);
                        sanitaizedData(data);
                    } else {
                        var progressIndicatorElement = jQuery.progressIndicator({
                            'message': app.vtranslate('Please wait ...'),
                            'position': 'html',
                            'blockInfo': {
                                'enabled': true
                            }
                        });
                        var params = {
                            'module': "ParsVTExtras",
                            'action': "GetUsers"
                        };
                        AppConnector.request(params).then(function (data) {
                            progressIndicatorElement.progressIndicator({
                                'mode': 'hide'
                            });
                            if (data) {
                                var users = data.result.users;
                                var groups = data.result.groups;
                                var roles = data.result.roles;
                                users = users.concat(groups, roles);
                                var cacheElm = jQuery("<input>").attr("type", "hidden").attr("name", "userData").val(JSON.stringify(users));
                                jQuery("body").append(cacheElm);
                                sanitaizedData(users);
                            }
                        });
                    }
                },
                index: 1,
                replace: function (value) {
		      var values = value.split('|##|');
                    return '@' + values[0] + ' ';
                },
		  template: function (value, term) {
  			var values = value.split('|##|');
			return '<b>' + values[0] + '</b> </br><small>' + values[1] + '</small>';		
      		}
            }
        ];
        if (textArea && textArea.length > 0) {
            textArea.textcomplete(strategies, {
                zIndex: 10002,
                //vcdir: 'rtl'
            });
        }
    },
    registerEvents: function () {
        var thisInstance = this;
        jQuery('body').on('focus', '.commentcontent', function () {
            thisInstance.registerMentionListener(jQuery('.commentcontent'));
        });
    }
});
jQuery(document).ready(function () {
    var MentionsInstance = ParsVTExtrasMention_Helper_Js.getInstance();
    MentionsInstance.registerEvents();
});

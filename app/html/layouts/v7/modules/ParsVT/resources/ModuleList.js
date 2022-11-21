/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class("AsteriskCTI_Modules_Js", {
    CheckRequired: function () {
        var isValid = true;
        $(".quickCreateContent input.required").each(function () {
            if ($(this).val() != "") {
                $(this).removeClass('has-error input-error');
            } else {
                $(this).addClass('has-error input-error');
                isValid = false;
            }
        });
        return isValid;
    },
    setRemoteURI: function () {
        if ($('#type').val() == 'Local Server') {
            $('#remoteuri').val("");
        } else {
            if ($("#server").val() == $("#connectorip").val()) {
                $('#remoteuri').val("http://" + $("#connectorip").val() + "/");
            } else {
                $('#remoteuri').val("http://" + $("#connectorip").val() + "/parsvtiger/");
            }
        }
    },
    WebSocketTest: function (ip, port, path) {
        var ws;
        var wsresponse = "#wsresponse";
        var websocketresponse = "#websocketresponse";
        if ("WebSocket" in window) {
            // Let us open a web socket
            try {
                if (path) {
                    ws = new WebSocket("ws://" + ip + ":" + port + "/?user=" + path);
                    wsresponse = "#wsresponse1";
                    websocketresponse = "#websocketresponse1";
                } else {
                    ws = new WebSocket("ws://" + ip + ":" + port + "/jWebSocket/jWebSocket");
                }

                ws.onopen = function (event) {
                    if (path) {
                        $(wsresponse).removeClass('alert-danger alert-info alert-warning');
                        $(wsresponse).addClass('alert-success');
                        $(websocketresponse).html($(websocketresponse).html() + "<br />" + 'Connection established');
                    }else {
                        $(wsresponse).addClass('alert-info');
                        $(websocketresponse).html($(websocketresponse).html() + "<br />" + "The connection was opened");
                    }
                };
                ws.onclose = function (event) {
                    var reason;
                    // See http://tools.ietf.org/html/rfc6455#section-7.4.1
                    if (event.code == 1000)
                        reason = "Normal closure, meaning that the purpose for which the connection was established has been fulfilled.";
                    else if (event.code == 1001)
                        reason = "An endpoint is \"going away\", such as a server going down or a browser having navigated away from a page.";
                    else if (event.code == 1002)
                        reason = "An endpoint is terminating the connection due to a protocol error";
                    else if (event.code == 1003)
                        reason = "An endpoint is terminating the connection because it has received a type of data it cannot accept (e.g., an endpoint that understands only text data MAY send this if it receives a binary message).";
                    else if (event.code == 1004)
                        reason = "Reserved. The specific meaning might be defined in the future.";
                    else if (event.code == 1005)
                        reason = "No status code was actually present.";
                    else if (event.code == 1006)
                        reason = "The connection was closed abnormally, e.g., without sending or receiving a Close control frame";
                    else if (event.code == 1007)
                        reason = "An endpoint is terminating the connection because it has received data within a message that was not consistent with the type of the message (e.g., non-UTF-8 [http://tools.ietf.org/html/rfc3629] data within a text message).";
                    else if (event.code == 1008)
                        reason = "An endpoint is terminating the connection because it has received a message that \"violates its policy\". This reason is given either if there is no other sutible reason, or if there is a need to hide specific details about the policy.";
                    else if (event.code == 1009)
                        reason = "An endpoint is terminating the connection because it has received a message that is too big for it to process.";
                    else if (event.code == 1010) // Note that this status code is not used by the server, because it can fail the WebSocket handshake instead.
                        reason = "An endpoint (client) is terminating the connection because it has expected the server to negotiate one or more extension, but the server didn't return them in the response message of the WebSocket handshake. <br /> Specifically, the extensions that are needed are: " + event.reason;
                    else if (event.code == 1011)
                        reason = "A server is terminating the connection because it encountered an unexpected condition that prevented it from fulfilling the request.";
                    else if (event.code == 1015)
                        reason = "The connection was closed due to a failure to perform a TLS handshake (e.g., the server certificate can't be verified).";
                    else
                        reason = "Unknown reason";
                    $(wsresponse).removeClass('alert-warning alert-info alert-success');
                    $(wsresponse).addClass('alert-danger');
                    $(websocketresponse).html($(websocketresponse).html() + "<br />" + "The connection was closed for reason: " + reason);
                };
                ws.onmessage = function (event) {
                    $(wsresponse).removeClass('alert-danger alert-info alert-success');
                    $(wsresponse).addClass('alert-warning');
                    try {
                        var jsonString = JSON.parse(event.data);
                        if (path) {
                            $(wsresponse).removeClass('alert-danger alert-info alert-warning');
                            $(wsresponse).addClass('alert-success');
                            $(websocketresponse).html($(websocketresponse).html() + "<br />" + 'Connection established');
                        } else {
                            Object.keys(jsonString).forEach(function (key) {
                                $(wsresponse).removeClass('alert-danger alert-info alert-warning');
                                $(wsresponse).addClass('alert-success');
                                $(websocketresponse).html($(websocketresponse).html() + "<br />" + key + ' :  ' + jsonString[key]);
                            });
                        }
                    } catch (e) {
                        $(websocketresponse).html($(websocketresponse).html() + "<br />" + event.data);
                    }
                    try {
                        if (websocket.readyState !== websocket.CLOSED) {
                            ws.terminate();
                        }
                    } catch (err) {
                        $(websocketresponse).html($(websocketresponse).html() + "<br />" + err.message);
                    }
                };
                ws.onerror = function (event) {
                    $(wsresponse).removeClass('alert-warning alert-info alert-success');
                    $(wsresponse).addClass('alert-danger');
                    $(websocketresponse).html($(websocketresponse).html() + "<br />" + "There was an error with your websocket.");
                };
                try {
                    if (websocket.readyState !== websocket.CLOSED) {
                        if (!path) {
                            ws.send("Test");
                        }
                        ws.close();
                    }
                } catch (err) {
                    $(websocketresponse).html($(websocketresponse).html() + "<br />" + err.message);
                }
            } catch (err2) {
                $(websocketresponse).html($(websocketresponse).html() + "<br />" + err2.message);
            }
        } else {
            // The browser doesn't support WebSocket
            $(websocketresponse).html($(websocketresponse).html() + "<br />" + "WebSocket NOT supported by your Browser!");
        }


    },
    sleep: function (ms) {
        return new Promise(
            resolve => setTimeout(resolve, ms)
        );
    },
    openLink: function (linkurl, autoclose) {
        var win = window.open(linkurl, "Download", "width=600, height=400, left=100, top=100, resizable=yes, scrollbars=yes");
        if (autoclose == true) {
            setTimeout(function () {
                win.close();
            }, 8000);
        }
        return false;
    },
    downloadJavaConnector: function (record) {
        var params = {};
        params['module'] = app.getModuleName();
        params['action'] = 'SavePBX';
        params['mode'] = 'CheckJavaConnector';
        params['record'] = record;
        app.helper.showSuccessNotification({'message': app.vtranslate('Downloading, Please wait...')});
        setTimeout(function () {
            app.helper.showProgress();
            app.request.post({'data': params}).then(
                function (err, data) {
                    app.helper.hideProgress();
                    if (err === null) {
                        if (Array.isArray(data)) {
                            if (data[0] === true) {
                                AsteriskCTI_Modules_Js.openLink("index.php?module=" + app.getModuleName() + "&action=SavePBX&mode=DownloadJavaConnector&record=" + record, true);
                            } else {
                                app.helper.showConfirmationBox({'message': data[1] + "<br />" + app.vtranslate('Download & Creating Asterisk Connector was failed!. Please click Yes for checking files on server . if file exists on server you must replace XML files manually')}).then(
                                    function (e) {
                                        AsteriskCTI_Modules_Js.openLink("index.php?module=" + app.getModuleName() + "&action=SavePBX&mode=DownloadJavaConnector&record=" + record, true);
                                    },
                                    function (error, err) {
                                        return false;
                                    });
                            }
                        } else {
                            app.helper.showErrorNotification({'message': 'Unknown Error'});
                        }
                    } else {
                        app.helper.showErrorNotification({'message': err.message});
                    }
                });
        }, 2000);
        return false;
    },
    downloadSocketServer: function (record) {
        var params = {};
        params['module'] = app.getModuleName();
        params['action'] = 'SavePBX';
        params['mode'] = 'CheckSocketServer';
        params['record'] = record;
        app.helper.showSuccessNotification({'message': app.vtranslate('Downloading, Please wait...')});
        setTimeout(function () {
            app.helper.showProgress();
            app.request.post({'data': params}).then(
                function (err, data) {
                    app.helper.hideProgress();
                    if (err === null) {
                        if (Array.isArray(data)) {
                            if (data[0] === true) {
                                AsteriskCTI_Modules_Js.openLink("index.php?module=" + app.getModuleName() + "&action=SavePBX&mode=DownloadSocketServer&record=" + record, true);
                            } else {
                                app.helper.showConfirmationBox({'message': data[1] + "<br />" + app.vtranslate('Download & Creating Socket Server was failed!. Please click Yes for checking files on server . if file exists on server you must replace XML files manually')}).then(
                                    function (e) {
                                        AsteriskCTI_Modules_Js.openLink("index.php?module=" + app.getModuleName() + "&action=SavePBX&mode=DownloadSocketServer&record=" + record, true);
                                    },
                                    function (error, err) {
                                        return false;
                                    });
                            }
                        } else {
                            app.helper.showErrorNotification({'message': 'Unknown Error'});
                        }
                    } else {
                        app.helper.showErrorNotification({'message': err.message});
                    }
                });
        }, 2000);
        return false;
    },
    setAsDefault: function (record) {
        var params = {};
        params['module'] = app.getModuleName();
        params['action'] = 'SavePBX';
        params['mode'] = 'setAsDefault';
        params['record'] = record;
        app.helper.showProgress();
        app.request.post({'data': params}).then(
            function (err, data) {
                app.helper.hideProgress();
                if (err === null) {
                    app.helper.showSuccessNotification({'message': data});
                } else {
                    app.helper.showErrorNotification({'message': err.message});
                }
            });
        setTimeout(function () {
            window.location.reload(1);
        }, 2000);
        return false;
    },
    deleteRecord: function (record) {
        var params = {};
        params['module'] = app.getModuleName();
        params['action'] = 'SavePBX';
        params['mode'] = 'deleteRecord';
        params['record'] = record;
        app.helper.showProgress();
        app.request.post({'data': params}).then(
            function (err, data) {
                app.helper.hideProgress();
                if (err === null) {
                    window.location.reload(1);
                } else {
                    app.helper.showErrorNotification({'message': err.message});
                }
            });
        return false;
    },
    showEditAsteriskModal: function (record) {
        app.helper.showProgress();
        var url = 'index.php?module=' + app.getModuleName() + '&parent=Settings&view=AsteriskModalAjax&mode=EditAsteriskServer&record=' + record;
        app.request.get({'url': url}).then(
            function (err, data) {
                app.helper.hideProgress();
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
    showCheckAsteriskModal: function (record) {
        app.helper.showProgress();
        var url = 'index.php?module=' + app.getModuleName() + '&parent=Settings&view=AsteriskModalAjax&mode=CheckAsteriskServer&record=' + record;
        app.request.get({'url': url}).then(
            function (err, data) {
                app.helper.hideProgress();
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
}, {
    contentsCotainer: false,
    columnListSelect2Element: false,
    advanceFilterInstance: false,
    //This will store the columns selection container
    columnSelectElement: false,
    //This will store the input hidden selectedColumnsList element
    selectedColumnsList: false,
    getColumnSelectElement: function () {
        if (this.columnSelectElement == false) {
            this.columnSelectElement = jQuery('#viewColumnsSelect');
        }
        return this.columnSelectElement;
    },
    getColumnListSelect2Element: function () {
        return this.columnListSelect2Element;
    },
    /**
     * Function to get the selected columns list
     * @return : jQuery object of selectedColumnsList
     */
    getSelectedColumnsList: function () {
        if (this.selectedColumnsList == false) {
            this.selectedColumnsList = jQuery('ul.select2-choices');
        }
        return this.selectedColumnsList;
    },
    /**
     * Function to get the contents container
     * @return : jQuery object of contents container
     */
    getContentsContainer: function () {
        if (this.contentsCotainer == false) {
            this.contentsCotainer = jQuery('div.contentsDiv');
        }
        return this.contentsCotainer;
    },
    /**
     * Function to regiser the event to make the columns list sortable
     */
    makeColumnListSortable: function () {
        var select2Element = jQuery('.columnsSelectDiv');
        //TODO : peform the selection operation in context this might break if you have multi select element in advance filter
        //The sorting is only available when Select2 is attached to a hidden input field.
        var chozenChoiceElement = select2Element.find('ul.select2-choices');
        chozenChoiceElement.sortable({
            'containment': chozenChoiceElement,
            start: function () {
                this.getSelectedColumnsList().select2("onSortStart");
            },
            update: function () {
                this.getSelectedColumnsList().select2("onSortEnd");
            }
        });
    },
    /**
     * Function which will get the selected columns with order preserved
     * @return : array of selected values in order
     */
    getSelectedColumns: function () {
        var columnListSelectElement = this.getColumnSelectElement();
        var select2Element = jQuery('.columnsSelectDiv');
        var selectedValuesByOrder = new Array();
        var selectedOptions = columnListSelectElement.find('option:selected');
        var orderedSelect2Options = select2Element.find('li.select2-search-choice').find('div');
        orderedSelect2Options.each(function (index, element) {
            var chosenOption = jQuery(element);
            selectedOptions.each(function (optionIndex, domOption) {
                var option = jQuery(domOption);
                if (option.html() == chosenOption.html()) {
                    selectedValuesByOrder.push(option.val());
                    return false;
                }
            });
        });
        return selectedValuesByOrder;
    },
    registerEventForSwitch: function () {
        var thisInstance = this;
        $('#pbxmodel').change(function () {
            var baseurl = $('#baseurl').val();
            var pbxmodel = $('#pbxmodel').val();
            $('#apiurl').prop('readonly',false);
            if (pbxmodel != '') {
                $('#apiurl').val(baseurl+pbxmodel);
            }  else {
                $('#apieurl').val('');
            }
            $('#apiurl').prop('readonly',true);
        });
        jQuery('#AsteriskCTIForm').on('switchChange.bootstrapSwitch', "input[type=checkbox]", function (e) {
            var currentElement = jQuery(e.currentTarget);
            var value = 0;
            if (currentElement.val() == 1) {
                currentElement.attr('value', 0);
                value = 0;
            } else {
                currentElement.attr('value', 1);
                value = 1;
            }
            switch (currentElement.data('type')) {
                case 'fixnumber':
                    thisInstance.displayfixnumber(value);
                    break;
                case 'socket_active':
                    thisInstance.displaysocketactive(value);
                    break;
            }

        });
    },
    /**
     * Function which will register the select2 elements for columns selection
     */
    registerSelect2ElementForColumnsSelection: function () {
        var selectElement = this.getColumnSelectElement();
        vtUtils.showSelect2ElementView(selectElement, {maximumSelectionSize: 5, dropdownCss: {'z-index': 0}});
    },
    displayfixnumber: function (val) {
        if (val == '1') {
            $('#citycode').show();
            $('#countrycode').show();
        } else {
            $('#citycode').hide();
            $('#countrycode').hide();
        }
    },
    displaysocketactive: function (val) {
        if (val == '1') {
            $('#wshost').show();
            $('#wsport').show();
        } else {
            $('#wshost').hide();
            $('#wsport').hide();
        }
    },
    setActiveTab: function () {
        if ($("#targetmode").val() == "") {
            $("#ParsGeneralSettings").addClass("active");
        } else {
            $("#Pars" + $("#targetmode").val()).addClass("active");
        }
    },
    registerEvents: function () {
        this.registerSelect2ElementForColumnsSelection();
        var select2Element = app.getSelect2ElementFromSelect(this.getColumnSelectElement());
        this.columnListSelect2Element = select2Element;
        this.makeColumnListSortable();
        this.getSelectedColumns();
        jQuery('.bootstrap-switch').bootstrapSwitch();
        vtUtils.enableTooltips();
        this.registerEventForSwitch();
        this.displayfixnumber($('#fixnumber').val());
        this.displaysocketactive($('#socket_active').val());
        this.setActiveTab();
    },
});
jQuery(document).ready(function () {
    var AsteriskCTI_Modules = new AsteriskCTI_Modules_Js();
    AsteriskCTI_Modules.registerEvents();
    Vtiger_Index_Js.getInstance().registerEvents();
})

var Vtiger_PBXManager_Js = {
    registerModuleSaveAllow: function () {
    },
    registerEvents: function () {

    }
}
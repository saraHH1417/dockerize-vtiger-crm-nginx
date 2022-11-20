/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.Class('ParsVTExtrasHelper_Js', {
    CampaignSMS : function(campaign,list) {
        var thisInstance = this;
        var action_url = 'module=ParsVTExtras&action=SendSMS&campaign='+campaign+'&list='+list;
        AppConnector.request(action_url + '&mode=control').then(function(data){
            if(data.result.success == true){
                var message = data.result.message;
                app.helper.showConfirmationBox({'message': message}).then(
                    function(data){
                        AppConnector.request(action_url).then(function(data){
                            if(data.success == true){
                                if(data.result.success == true){
                                    app.helper.showSuccessNotification({"message": data.result.message});
                                    setTimeout(function () {
                                        window.location.reload(1);
                                    }, 3000);
                                }  else {
                                    app.helper.showErrorNotification({"message": data.result.message});
                                }

                            }
                            var selectedTabElement = thisInstance.getSelectedTab();
                            var relatedModuleName = thisInstance.getRelatedModuleName();
                            selectedTabLabelKey=selectedTabElement.data("label-key");
                            if (selectedTabLabelKey == list) {
                                var relatedController = new Campaigns_RelatedList_Js(thisInstance.getRecordId(), app.getModuleName(), selectedTabElement, relatedModuleName);
                                relatedController.loadRelatedList();
                            }
                        });
                    },
                    function(error, err){
                    });

            } else {
                app.helper.showErrorNotification({"message": data.result.message});
            }

        });

    }
}, {
    uninstallModule: function (id, mod, modulelabel) {
        app.helper.showConfirmationBox({'message': app.vtranslate('Are you sure?') + "<br />" + app.vtranslate("Really unsinstall module ") + modulelabel + app.vtranslate("?")}).then(
            function (e) {
                var progressIndicatorElement = jQuery.progressIndicator({
                    'message': '',
                    'position': 'html',
                    'blockInfo': {
                        'enabled': true
                    }
                });
                var params = {};
                params['id'] = id;
                params['name'] = mod;
                params['module'] = 'ParsVTExtras';
                params['action'] = 'ActionAjax';
                params['mode'] = 'uninstallModule';
                params['parent'] = 'Settings';
                AppConnector.request(params).then(
                    function (data) {
                        if (data.success) {
                            progressIndicatorElement.progressIndicator({'mode': 'hide'});
                            bootbox.alert(data.result, function () {
                                window.location.reload();
                            });
                        } else {
                            progressIndicatorElement.progressIndicator({'mode': 'hide'});
                            app.helper.showErrorNotification({'message': 'Unknown Error'});
                        }
                    },
                    function (error) {
                        progressIndicatorElement.progressIndicator({'mode': 'hide'});
                        app.helper.showErrorNotification({'message': 'Unknown Error'});
                    }
                );

            },
            function (error, err) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
                app.helper.showErrorNotification({'message': 'Unknown Error'});
            });
        return false;
    },
    registerUninstaller: function () {
        var Instance = this;
        if (app.getModuleName() === 'ModuleManager' && app.getParentModuleName() === 'Settings' && app.view() === 'List') {
            var params = {};
            params['action'] = 'ActionAjax';
            params['module'] = 'ParsVTExtras';
            params['mode'] = 'getAllCustomModules';
            if (jQuery('#moduleManagerContents').length > 0) {
                app.request.post({data: params}).then(
                    function (err, data) {
                        if (err == null) {
                            var result = JSON.parse(data);
                            for (var i = 0; i < result.length; i++) {
                                $("[data-module=" + result[i].name + "]").parent().next().after('<span class="col-lg-1" style="line-height: 2.5;"><a style="cursor: pointer;" data-moduleid="' + result[i].id + '" data-modulename="' + result[i].name + '" data-modulelabel="' + result[i].label + '"><i class="fa fa-2x fa-trash text-danger UninstallModule"></i></a></span>');
                                if (result[i].exportable) {
                                    $("[data-module=" + result[i].name + "]").parent().next().after('<span class="col-lg-1" style="line-height: 2.5;"><a style="cursor: pointer;"  href="index.php?module=ModuleManager&parent=Settings&action=ModuleExport&mode=exportModule&forModule=' + result[i].name + '" target="_blank"><i class="fa fa-2x fa-download text-info"></i></a></span>');
                                }
                                var cContainer = $("[data-module=" + result[i].name + "]").closest(".moduleManagerBlock");
                                var Container = jQuery('.moduleName', cContainer);
                                Container.removeClass("col-lg-7");
                                Container.addClass("col-lg-5");
                            }
                        }
                    }
                );
            }
        }
        $("#moduleManagerContents").on("click", ".UninstallModule", function (e) {
            var currentElement = jQuery(e.currentTarget);
            var moduleid = currentElement.parent().data('moduleid');
            var modulename = currentElement.parent().data('modulename');
            var modulelabel = currentElement.parent().data('modulelabel');
            Instance.uninstallModule(moduleid, modulename, modulelabel);
        });
    },
    /*relations*/
    getSelectedModuleName: function () {
        return jQuery('#selectedModuleName').val();
    },
    loadAddRelationUi: function() {
        var a = jQuery.Deferred();
        var d = {
            "module": app.getModuleName(),
            "parent": app.getParentModuleName(),
            "view": "Index",
            "mode": "showAddRelation",
            "sourceModule": this.getSelectedModuleName()
        };
        var b = jQuery("#addRelation").data("originmodule");
        if (b) {
            d["originModule"] = b;
        }
        app.helper.showProgress();
        app.request.post({
            "data": d
        }).then(function(e, f) {
            app.helper.hideProgress();
            if (e === null) {
                jQuery(".relatedTabModulesList").html(f);
            }
            a.resolve();
        });
        return a.promise();
    },
    registerAddRelationBtnClick: function (a) {
        var b = this;
        a.on("click", "#addRelation", function (d) {
            b.loadAddRelationUi().then(function () {
                vtUtils.enableTooltips({
                    "placement": "top"
                });
                b.registerAddRelationSpecificEvents();
            });
        });
    },
    registerAddRelationSpecificEvents: function () {
        var a = this;
        jQuery(".app-footer").addClass("hide");
        vtUtils.showSelect2ElementView(jQuery(".relatedTabModulesList").find("select.select2"));
        jQuery('select[name="relatedModule"]').on("change", function (j) {
            var h = jQuery(j.currentTarget);
            var d = h.val();
            var g = h.find("option:selected");
            var k = g.text();
            var f = JSON.parse(jQuery("#addRelationContainer").find("input.singularModuleNames").val());
            var i = {};
            for (var m in f) {
                i[app.htmlDecode(m)] = app.htmlDecode(f[m]);
            }
            var n = jQuery("#selectedModuleLabel").val();
            var l = i[k] || k;
            var b = i[n] || n;
            jQuery(".relatedFieldLabel").html(app.vtranslate("JS_FIELD_NAME_TEXT", n, l));
            jQuery(".relatedTabLabel").html(app.vtranslate("JS_TAB_NAME_TEXT", n, l));
            jQuery(".relatedFieldLabelHelText").attr("data-original-title", app.vtranslate("JS_FILED_NAME_HELP_TEXT", b, l));
            jQuery(".relatedTabHelpTextLabel").attr("data-original-title", app.vtranslate("JS_TAB_NAME_HELP_TEXT", n, l));
            jQuery(".primaryFieldHelpText").attr("data-original-title", app.vtranslate("JS_FILED_NAME_HELP_TEXT", l, b));
            jQuery(".primaryTabHelpText").attr("data-original-title", app.vtranslate("JS_TAB_NAME_HELP_TEXT", k, b));
            jQuery(".primaryFieldLabel").html(app.vtranslate("JS_FIELD_NAME_TEXT", k, b));
            jQuery(".primaryTabLabel").html(app.vtranslate("JS_TAB_NAME_TEXT", k, b));
            jQuery(".relationImages a").each(function (o, p) {
                /* var q = jQuery(p).find("img").data("nonSupportedModules");
                 var e = jQuery(p).find("img").data("supportedModules");
                 if (q.indexOf(d) != -1) {
                     jQuery(p).addClass("hide");
                 } else {
                     jQuery(p).removeClass("hide");
                 }
                 if ((e.indexOf(d) == -1) && (e.length > 0)) {
                     jQuery(p).addClass("hide");
                 }*/
            });
            if (jQuery(".relationImages a:not(.hide)").length == 1) {
                jQuery(".relationImages a:not(.hide) img").trigger("click");
            } else {
                jQuery(".relationImages img").filter(":first").trigger("click");
            }
        });
        jQuery('select[name="relatedModule"]').trigger("change");
        this.disableOrEnableRealtionFieldTabLabels(jQuery("#addRelationContainer"));
        this.registerAddRelationEvents();
    },
    registerAddRelationEvents: function () {
        var d = this;
        var b = jQuery("#addRelationContainer");
        b.find(".relationImages img").on("click", function (f) {
            b.find(".relationImages img").removeClass("selected");
            b.find('.relationImages input[type="radio"]').prop("checked", false);
            jQuery(f.currentTarget).addClass("selected");
            jQuery(f.currentTarget).parent().find('input[type="radio"]').prop("checked", true);
            d.disableOrEnableRealtionFieldTabLabels(b);
        });
        b.find(".relationImages .radio-group").on("click", function (f) {
            b.find(".relationImages img").removeClass("selected");
            b.find('.relationImages input[type="radio"]').prop("checked", false);
            jQuery(f.currentTarget).parent().find("img").addClass("selected");
            jQuery(f.currentTarget).find('input[type="radio"]').prop("checked", true);
            d.disableOrEnableRealtionFieldTabLabels(b);
        });
        var a = {
            submitHandler: function (j) {
                var f = d.getSelectedModuleName();
                var i = jQuery('[name="relatedModule"]').val();
                if (f == "Leads" || (i == "Leads" && f != "Contacts")) {
                    var e = jQuery('[name="relatedModule"]').find('[value="Contacts"]').length;
                    if (e) {
                        var h = b.find(".relationImages img.selected").data("value");
                        var k = {
                            "module": "LayoutEditor",
                            "parent": app.getParentModuleName(),
                            "action": "Relation",
                            "mode": "isRelationExist",
                            "relationType": h,
                            "sourceModule": f,
                            "relatedModule": i
                        };
                        var g = "sourceModule";
                        if (i == "Leads") {
                            g = "relatedModule";
                        }
                        k[g] = "Contacts";
                        app.request.post({
                            "data": k
                        }).then(function (m, n) {
                            var l = n.result;
                            if (l) {
                                d.triggerRelationSubmit(j);
                            } else {
                                app.helper.showConfirmationBox({
                                    "message": app.vtranslate("JS_RELATION_COPY_TO_CONTACTS")
                                }).then(function () {
                                    d.triggerRelationSubmit(j);
                                });
                            }
                            return false;
                        });
                    } else {
                        d.triggerRelationSubmit(j);
                    }
                } else {
                    d.triggerRelationSubmit(j);
                }
            }
        };
        jQuery("#addRelationForm").vtValidate(a);
        jQuery("#addRelationForm").find(".cancelLink").on("click", function (f) {
            d.showRelatedTabModulesList(jQuery("#relatedTabOrder"), {
                "dontShowAddRelationOnEmpty": true
            });
        });
    },
    triggerRelationSubmit: function (d) {
        var b = this;
        var a = jQuery("#addRelationContainer");
        var d = jQuery(d);
        var e = d.serializeFormData();
        e.module = "LayoutEditor";
        e.parent = app.getParentModuleName();
        e.view = "Index";
        e.mode = "addRelation";
        e.relationType = a.find(".relationImages img.selected").data("value");
        e.sourceModule = b.getSelectedModuleName();
        e.relatedModule = jQuery('[name="relatedModule"]').val();
        app.helper.showProgress();
        app.request.post({
            "data": e
        }).then(function (f, g) {
            app.helper.hideProgress();
            if (f === null) {
                app.helper.showSuccessNotification({
                    "message": g.message
                });
                b.showRelatedTabModulesList(jQuery("#relatedTabOrder"));
                jQuery(".app-footer").removeClass("hide");
            } else {
                app.helper.showErrorNotification({
                    "message": f.message
                });
            }
        });
    },
    /*
     * Function which will disable or enable the field or tab labels depending on the field type that is selected
     */
    disableOrEnableRealtionFieldTabLabels: function (container) {
        var relationTypeEleSelected = container.find('.relationImages img.selected');
        var fieldsToEnable = relationTypeEleSelected.data('supportedFieldToEnable');
        container.find('.relationFieldTabLabelHolders').addClass('hide');
        var relModule = container.find('[name="relatedModule"]').val();
        for (var index in fieldsToEnable) {
            var fieldNameAttr = fieldsToEnable[index];
            if ((relModule == 'Calendar' || relModule == 'Documents')
                && fieldNameAttr == 'tabInRelated') {
                continue;
            }

            container.find('[name="' + fieldNameAttr + '"]').closest('.form-group').removeClass('hide');
        }
    },
    dependentFeildsTabClickEvent: function () {
        var a = this;
        var d = jQuery("#layoutEditorContainer").find(".contents");
        var e = d.find("#dependentFieldsTabContainer");
        var b = d.find(".dependentFieldsTab");
        b.click(function (f) {
            f.preventDefault();
            a.showDependentFields(e);
        });
    },
    getDependencyContainer: function () {
        return jQuery(".dependentFieldsTabList");
    },
    showDependentFields: function (f) {
        var a = this;
        var e = {};
        e["module"] = this.getModuleName();
        e["parent"] = app.getParentModuleName();
        e["sourceModule"] = jQuery("#selectedModuleName").val();
        e["view"] = "Index";
        e["mode"] = "showDependentFields";
        app.helper.showProgress();
        var b = jQuery(".dependentFieldsTab a").data("url");
        var d = "showDependentFields";
        b = b + "&sourceModule=" + jQuery("#selectedModuleName").val() + "&mode=" + d;
        jQuery(".selectedMode").val(d);
        app.request.pjax({
            "url": b
        }).then(function (g, h) {
            app.helper.hideProgress();
            if (g === null) {
                f.html(h);
                a.registerDependencyEvents();
            }
        });
    },
    constructConditionValueElement: function (b, g) {
        var h = b.find("option:selected").data("fieldinfo");
        var e = b.find("option:selected");
        var a = b.closest(".conditionRow");
        var m = a.find('[name="value[]"]');
        var j = m.val();
        if (j == null) {
            j = new Array();
        }
        var k = h.picklistvalues;
        var f = "";
        if (h.type == "boolean") {
            f += '<option value="0"';
            if (j == "0" || j.length == 0) {
                f += ' selected="selected" ';
            }
            f += ">" + app.vtranslate("JS_DISABLED") + "</option>";
            f += '<option value="1"';
            if (j == "1") {
                f += ' selected="selected" ';
            }
            f += ">" + app.vtranslate("JS_ENABLED") + "</option>";
        } else {
            if (e.data("isEmptyOptionAllowed") == "1") {
                var d = "";
                if (jQuery.inArray("", j) >= 0) {
                    d = 'selected="selected"';
                }
                f += '<option value="" ' + d + ">" + e.data("selectAnOption") + "</option>";
            }
        }
        for (var n in k) {
            var l = k[n];
            var d = "";
            if (jQuery.inArray(n.trim(), j) >= 0) {
                d = 'selected="selected"';
            }
            if (d) {
                f += '<option value="' + n.trim() + '" ' + d + ">" + l + "</option>";
            } else {
                if (jQuery.inArray(n.trim(), g) < 0) {
                    f += '<option value="' + n.trim() + '" ' + d + ">" + l + "</option>";
                }
            }
        }
        m.html(f);
        m.select2("destroy");
        if (m.data().maximumSelectionSize) {
            delete m.data().maximumSelectionSize;
        }
        if (h.type == "boolean") {
            vtUtils.showSelect2ElementView(m, {
                maximumSelectionSize: 1
            });
        } else {
            if (h.type == "picklist") {
                var i = parseInt(jQuery("#max_allowed_values").val());
                vtUtils.showSelect2ElementView(m, {
                    maximumSelectionSize: i
                });
            } else {
                vtUtils.showSelect2ElementView(m);
            }
        }
    },
    trigererFieldChangeEvent: function () {
        var a = this;
        this.getDependencyContainer().on("change", '[name="fieldname"]', function (i, j) {
            if (typeof j == "undefined") {
                j = {};
            }
            var g = jQuery(i.currentTarget);
            var f = g.closest(".dependencyRow");
            var h = g.val();
            var k = g.closest(".conditionRow").find('select[name="comparator"]').val();
            var d = a.getGroupedDependencies(f);
            var b = new Array();
            jQuery.each(d, function (e, l) {
                var m = l.find(".conditionRow");
                jQuery.each(m, function (o, n) {
                    var r = jQuery(n);
                    var q = r.find('select[name="fieldname"]').val();
                    var t = r.find('select[name="comparator"]').val();
                    if (h == q && k == t) {
                        var s = a.getDependencyRowValue(r);
                        var p = s.value ? s.value : [];
                        b = jQuery.merge(b, p);
                    }
                });
            });
            a.constructConditionValueElement(g, b);
            if (!j.fromcode) {
                a.toggleConditionTriggererFields(g.closest("td"));
            }
        });
    },
    trigererDependencyRowFieldValueChangeEvent: function () {
        var a = this;
        a.getDependencyContainer().on("change", '[name="value[]"]', function (j) {
            var h = jQuery(j.currentTarget);
            var k = h.closest(".conditionRow");
            k.addClass("currentConditionRow");
            var d = k.closest(".dependencyRow");
            var n = a.getDependencyRowValue(k);
            var l = n.fieldid;
            var i = n.value ? n.value : [];
            var m = n.comparator;
            var f = a.getGroupedDependencies(d);
            var g = new Array();
            jQuery.each(f, function (e, p) {
                var o = p.find(".conditionRow:visible").filter(":not(.currentConditionRow)");
                if (o.length <= 0) {
                    return true;
                }
                jQuery.each(o, function (r, q) {
                    var s = jQuery(q);
                    var w = a.getDependencyRowValue(s);
                    var t = w.fieldid;
                    var v = w.value ? w.value : [];
                    var u = w.comparator;
                    if (l == t && m == u) {
                        i = jQuery.merge(i, v);
                        g.push(s);
                    }
                });
            });
            var b = jQuery.extend([], i);
            jQuery.each(g, function (q, r) {
                var p = jQuery.extend([], b);
                var e = jQuery(r);
                var o = e.find('select[name="fieldname"]');
                var t = a.getDependencyRowValue(e);
                var s = t.value ? t.value : [];
                jQuery.each(s, function (v, w) {
                    if (jQuery.inArray(w, p) >= 0) {
                        var u = p.indexOf(w);
                        delete p[u];
                    }
                });
                a.constructConditionValueElement(o, p);
                k.removeClass("currentConditionRow");
            });
            k.removeClass("currentConditionRow");
        });
    },
    dependencyTargetElementChangeEvent: function () {
        var a = this;
        a.getDependencyContainer().on("change", '[name="target_dependency"]', function (t) {
            var f = jQuery(t.currentTarget);
            var l = f.closest(".dependencyRow");
            var u = l.find('[name="action"]');
            var s = f.closest("table");
            var h = s.data("id");
            var p = s.hasClass("create_mode") ? true : false;
            var k = u.val();
            var j = f.find("option:selected");
            var n = "";
            if (j.data("type") == "field") {
                if (s.find(".dependencyRow").filter(":first").find('[name="target_dependency"]').find("option:selected").data("type") == "field") {
                    s.find(".dependencyRow").removeClass("saveIgnored").removeClass("hide");
                    if (s.find(".dependencyRow").length > 1) {
                        var b = s.find(".dependencyRow").length;
                        s.find(".dependencyRow").filter(":first").find('[name="target_dependency"]').closest("td").attr("rowspan", b);
                    }
                }
            }
            var g = a.getGroupedDependencies(l);
            var i = JSON.parse(jQuery('input[name="noMandatoryFields"]').val());
            var q = jQuery.inArray(j.val(), i);
            if (j.data("type") == "field") {
                if (q > -1 && g.length == 1) {
                    n = '<option value="show">' + u.data("showLabel") + "</option>";
                    n += '<option value="readonly">' + u.data("readonlyLabel") + "</option>";
                } else {
                    if (q > -1 && g.length > 1) {
                        var d = new Array("mandatory", "showandmandatory");
                        n = '<option value="' + k + '">' + u.data(k + "Label") + "</option>";
                        jQuery.each(g, function (v, e) {
                            var z = jQuery(e);
                            var y = z.find('[name="action"]');
                            var x = y.val();
                            if (jQuery.inArray(x, d) >= 0) {
                                l.nextUntil('tr:has(select[name="target_dependency"])').remove(".dependencyRow");
                                l.find('[name="target_dependency"]').closest("td").attr("rowspan", "1");
                                l.find(".row_highlighter").attr("rowspan", "1");
                                n = '<option value="show">' + u.data("showLabel") + "</option>";
                                n += '<option value="readonly">' + u.data("readonlyLabel") + "</option>";
                                l.find(".addNewActionBtn").removeClass("hide");
                            } else {
                                z.find(".addNewActionBtn").addClass("hide");
                                var w = y.data(x + "Label");
                                var A = '<option value="' + x + '" >' + w + "</option>";
                                y.html(A);
                            }
                        });
                    } else {
                        if (g.length == 1) {
                            n = '<option value="show">' + u.data("showLabel") + "</option>";
                            n += '<option value="showandmandatory">' + u.data("showandmandatoryLabel") + "</option>";
                            n += '<option value="mandatory">' + u.data("mandatoryLabel") + "</option>";
                            n += '<option value="readonly">' + u.data("readonlyLabel") + "</option>";
                        } else {
                            if (g.length > 1) {
                                n = '<option value="' + k + '">' + u.data(k + "Label") + "</option>";
                                jQuery.each(g, function (e, y) {
                                    var w = y.find('[name="action"]');
                                    var v = w.val();
                                    if (g.length == e + 1) {
                                        var z = "";
                                        var x = a.calculateDependencyRowActions(y);
                                        if (x.length > 1) {
                                            y.find(".addNewActionBtn").removeClass("hide");
                                            jQuery.each(x, function (B, D) {
                                                var C = w.data(D + "Label");
                                                var A = 'selected="selected"';
                                                if (D == v) {
                                                    z += '<option value="' + D + '" ' + A + " >" + C + "</option>";
                                                } else {
                                                    z += '<option value="' + D + '" >' + C + "</option>";
                                                }
                                            });
                                            w.html(z);
                                        }
                                    }
                                });
                            }
                        }
                    }
                }
            } else {
                if (j.data("type") != "field") {
                    n = '<option value="show">' + u.data("blockShowLabel") + "</option>";
                    k = "show";
                    if (l.next(".dependencyRow").length > 0 && l.next(".dependencyRow").find('[name="target_dependency"]').length <= 0) {
                        l.nextAll(".dependencyRow").addClass("hide").addClass("saveIgnored");
                        l.find('[name="target_dependency"]').closest("td").attr("rowspan", "1");
                    }
                }
            }
            l.closest("table").find(".blockMandtoryMessage").addClass("hide");
            var h = l.data("dependencyId");
            var m = jQuery(".edit_row_" + h).length;
            if (j.data("type") == "field") {
                l.find(".addNewActionContainer").removeClass("hide");
                if (l.is(":nth-child(2)")) {
                    l.closest("table").find(".newChildDependencyContainer").addClass("hide").find(".newChildDependencyBtn").addClass("hide");
                }
                if (s.find(".dependencyRow").filter(":first").find('[name="target_dependency"]').find("option:selected").data("type") != "block") {
                    l.closest("table").find(".newChildDependencyContainer").addClass("hide").find(".newChildDependencyBtn").addClass("hide");
                }
            } else {
                l.find(".addNewActionContainer").addClass("hide");
                if (s.find(".dependencyRow").filter(":first").find('[name="target_dependency"]').find("option:selected").data("type") == "block") {
                    l.closest("table").find(".newChildDependencyContainer").removeClass("hide").find(".newChildDependencyBtn").removeClass("hide");
                } else {
                    l.closest("table").find(".newChildDependencyContainer").addClass("hide").find(".newChildDependencyBtn").addClass("hide");
                }
                var o = j.data("blockMandatoryFieldMessage");
                if (typeof o != "undefined") {
                    l.closest("table").find(".blockMandtoryMessage .blockMandtoryMessageContent").html(o).removeClass("hide");
                }
            }
            var r = s.find(".dependencyRow").filter(":first").find('[name="target_dependency"]');
            if (r.find("option:selected").data("type") != "field") {
                var o = r.find("option:selected").data("blockMandatoryFieldMessage");
                if (typeof o != "undefined") {
                    l.closest("table").find(".newChildDependencyContainer").removeClass("hide").find(".blockMandtoryMessage .blockMandtoryMessageContent").html(o).removeClass("hide");
                }
            }
            u.select2("destroy").html(n).select2();
            u.val(k);
            u.trigger("change");
        });
    },
    dependencyActionChangeEvent: function () {
        var a = this;
        this.getDependencyContainer().on("change", '[name="action"]', function (g) {
            var d = jQuery(g.currentTarget);
            var h = d.closest(".dependencyRow");
            var b = h.find(".addNewActionBtn");
            if (d.data("prevActionValue") == "mandatory") {
                b.removeClass("hide");
            }
            var f = d.val();
            d.data("prevActionValue", f);
            var i = a.getGroupedDependencies(h);
            if (f == "mandatory" && i.length > 1) {
                b.addClass("hide");
            }
        });
    },
    showNewDependencyTable: function () {
        var a = this.getNewDependencyRow();
        var b = jQuery("#newDependencyTable").clone(true, true).removeClass("hide").removeAttr("id");
        b.find(".edit_mode").removeClass("hide");
        a.insertAfter(b.find(".dummyRow"));
        b.insertAfter(jQuery("#newDependencyTable"));
        this.applyFieldElementView(a);
        return b;
    },
    getNewDependencyRow: function (a, b) {
        if (typeof b == "undefined") {
            b = false;
        }
        if (typeof a == "undefined" || b) {
            a = jQuery("#newDependencyTable");
        }
        return a.find(".dummyRow").clone(true, true).removeClass("hide").removeClass("dummyRow").addClass("dependencyRow");
    },
    applyFieldElementView: function (a) {
        a.find("select:visible").filter(':not([name="target_dependency"])').addClass("select2");
        vtUtils.applyFieldElementsView(a);
        vtUtils.showSelect2ElementView(a.find("select:visible").filter('[name="target_dependency"]'), {
            formatResult: function (b) {
                if (jQuery(b.element).data("type") == "block") {
                    return "<b>" + b.text + "</b>";
                } else {
                    return b.text;
                }
            }
        });
        a.find('[name="target_dependency"]').trigger("change");
        a.find('[name="action"]').trigger("change");
        if (a.find('.conditionRow [name="fieldname"]').length > 0) {
            a.find('.conditionRow [name="fieldname"]').trigger("change");
        }
        a.find('.conditionRow [name="action"]').trigger("change");
    },
    showNewDependencyRow: function (d, a) {
        var b = this.getNewDependencyRow(d, a);
        b.find("td:first").removeAttr("colspan").attr("width", "5%").removeClass("row_highlighter");
        b.prepend('<td width="5%" class="row_highlighter col_filler" style="border-top:0px;border-bottom:0px;"></td>');
        var b = b.insertAfter(d.find(".dependencyRow").filter(":last"));
        this.applyFieldElementView(b);
        return b;
    },
    registerAddNewDependency: function () {
        var a = this;
        jQuery("#addDependency").on("click", function (f) {
            jQuery(f.currentTarget).attr("disabled", "diabled");
            jQuery('[data-edit-id^="dependency_edit"]').attr("disabled", "disabled").addClass("hide");
            jQuery(".noDependenciesContainer").addClass("hide");
            var b = a.showNewDependencyTable();
            var d = b.closest("form");
            d.vtValidate({
                submitHandler: function () {
                    jQuery(".saveButton").attr("disabled", "disabled");
                    var e = b.closest(".editDependencyTable");
                    a.saveDependency(e);
                }
            });
        });
    },
    registerAddNewCondition: function () {
        var a = this;
        this.getDependencyContainer().on("click", ".addNewCondition", function (g) {
            var d = jQuery(g.currentTarget);
            var b = d.closest("td");
            var h = b.find(".dummyConditionRow").clone(true, true).removeClass("dummyConditionRow").removeClass("hide").addClass("conditionRow");
            var f = b.find(".conditionRow").filter(":last");
            if (f.length <= 0) {
                f = b.find(".dummyConditionRow");
            }
            h = h.insertAfter(f);
            a.toggleConditionDelete(b);
            a.toggleConditionTriggererFields(b);
            a.applyFieldElementView(h);
            a.toggleAddConditionButton(b);
        });
    },
    registerDeleteCondition: function () {
        var a = this;
        this.getDependencyContainer().on("click", ".deleteCondition", function (f) {
            var d = jQuery(f.currentTarget);
            var b = d.closest("td");
            d.closest(".conditionRow").remove();
            a.toggleConditionDelete(b);
            a.toggleConditionTriggererFields(b);
            a.toggleAddConditionButton(b);
        });
    },
    toggleAddConditionButton: function (a) {
        var d = a.find(".addNewCondition");
        var b = JSON.parse(jQuery("#triggererFields").val());
        var e = a.find(".conditionRow").length;
        if (e == Object.keys(b).length) {
            d.addClass("hide");
        } else {
            d.removeClass("hide");
        }
        if (e <= 0) {
            d.trigger("click");
        }
    },
    toggleConditionDelete: function (a) {
        var b = a.find(".conditionRow").length;
        if (b > 1) {
            a.find(".conditionRow").find(".deleteCondition").removeClass("hide");
        } else {
            a.find(".conditionRow").find(".deleteCondition").addClass("hide");
        }
    },
    toggleConditionTriggererFields: function (a) {
        var d = this;
        var b = JSON.parse(jQuery("#triggererFields").val());
        var e = 0;
        var f = new Array();
        a.find(".conditionRow").each(function (h, k) {
            var j = jQuery(k);
            var g = j.find('[name="fieldname"]');
            var i = g.val();
            if (!(i in b)) {
                i = "";
            }
            delete b[i];
            if (i.length <= 0) {
                for (var h in b) {
                    i = h;
                    break;
                }
            }
            f.push(i);
        });
        a.find(".conditionRow").each(function (j, m) {
            var l = jQuery(m);
            var h = l.find('[name="fieldname"]');
            var k = h.val();
            var i = h.find("option");
            i.removeClass("hide");
            for (var g in f) {
                if (g == j) {
                    k = f[g];
                    continue;
                }
                i.filter('[value="' + f[g] + '"]').addClass("hide");
            }
            h.val(k);
            h.select2("destroy");
            h.trigger("change", {
                "fromcode": true
            });
            vtUtils.showSelect2ElementView(h);
        });
    },
    calculateDependencyRowActions: function (n) {
        var h = {
            "mandatory": new Array("readonly"),
            "readonly": new Array("show", "showandmandatory", "mandatory"),
            "show": new Array("readonly", "showandmandatory"),
            "showandmandatory": new Array("readonly", "show")
        };
        var f = ["mandatory", "readonly", "show", "showandmandatory"];
        var m = [];
        var o = f;
        var d = this.getGroupedDependencies(n);
        var g = this.getTargetDependencyEle(n);
        for (var j in d) {
            var p = d[j];
            var e = p.find('[name="action"]');
            var i = e.val();
            var l = p.find(".addNewActionBtn");
            if (d.length == parseInt(j) + 1) {
                o = jQuery(o).not(m).get();
                if (d.length > 2) {
                    o = jQuery(o).not(["mandatory"]).get();
                }
            } else {
                l.addClass("hide");
                m.push(i);
                o = h[i];
            }
        }
        var b = JSON.parse(jQuery('input[name="noMandatoryFields"]').val());
        var k = jQuery.inArray(g.find("option:selected").val(), b);
        if (k > -1) {
            var a = new Array("mandatory", "showandmandatory");
            jQuery.each(a, function (s, q) {
                if (jQuery.inArray(q, o) >= 0) {
                    var r = o.indexOf(q);
                    o.splice(r, 1);
                }
            });
        }
        if (o.length == 1) {
            l.addClass("hide");
        }
        return o;
    },
    registerAddNewAction: function () {
        var a = this;
        this.getDependencyContainer().on("click", ".addNewActionBtn", function (l) {
            var i = jQuery(l.currentTarget);
            i.addClass("hide");
            var q = i.closest(".dependencyRow");
            var h = q.find('[name="action"]');
            var b = h.find("option");
            b.filter('[value!="' + h.val() + '"]').addClass("hide");
            var g = a.getNewDependencyRow(i.closest("table")).addClass("edit_mode");
            g.find('[name="target_dependency"]').closest("td").remove();
            var d = a.getTargetDependencyEle(q).closest("td");
            if (d.is("[rowspan]")) {
                var j = parseInt(d.attr("rowspan"));
                d.attr("rowspan", j + 1);
                d.prev().attr("rowspan", j + 1);
            } else {
                d.attr("rowspan", 2);
                d.prev().attr("rowspan", 2);
            }
            var m = g.find('[name="action"]');
            var p = m.find("option").filter(':not(".hide")').attr("value");
            m.val(p);
            a.applyFieldElementView(g.insertAfter(q));
            var f = g.find('[name="action"]');
            var o = a.calculateDependencyRowActions(g);
            f.find("option").each(function (e, r) {
                if (o.indexOf(jQuery(r).attr("value")) < 0) {
                    jQuery(r).addClass("hide");
                }
            });
            f.val(f.find("option").filter(':not(".hide")').attr("value"));
            g.find('[name="action"]').trigger("change");
            var k = i.closest("table").find(".dependencyRow").filter(":first");
            var n = k.find('[name="target_dependency"]').val();
            g.find('[name="parentDependencyBlockId"]').val(n);
            h.select2("destroy");
            vtUtils.showSelect2ElementView(h);
        });
    },
    registerAddChildNewDependency: function () {
        var a = this;
        this.getDependencyContainer().on("click", ".newChildDependencyBtn", function (j) {
            var h = jQuery(j.currentTarget);
            var k = h.closest("table").find(".dependencyRow").filter(":first");
            var l = k.find('[name="target_dependency"]').val();
            var i = l.split("::");
            var d = i[1];
            var f = true;
            if (h.closest("table").find(".dummyRow").find('[name="target_dependency"]').find("option").filter('[data-block-id="' + d + '"]').length > 0) {
                f = false;
            }
            var g = a.showNewDependencyRow(h.closest("table"), f).addClass("edit_mode");
            g.find('[name="target_dependency"]').find('option:not([data-block-id="' + d + '"])').attr("disabled", "disabled");
            var b = g.find('[name="target_dependency"]').select2("destroy").find("option:not([disabled])").filter(":first");
            g.find('[name="target_dependency"]').val(b.attr("value")).trigger("change");
            vtUtils.showSelect2ElementView(g.find('[name="target_dependency"]'));
            g.find('[name="parentDependencyBlockId"]').val(l);
            k.find('[name="target_dependency"]').attr("disabled", "disabled").select2("destroy");
            vtUtils.showSelect2ElementView(k.find('[name="target_dependency"]'));
        });
    },
    getDependencyRowValue: function (b) {
        var a = {};
        a.fieldid = b.find('[name="fieldname"]').val();
        a.comparator = b.find('[name="comparator"]').val();
        a.value = b.find('[name="value[]"]').val();
        return a;
    },
    getTargetDependencyEle: function (d) {
        var b = d.find('[name="target_dependency"]');
        if (b.length <= 0) {
            b = d.prev().find('[name="target_dependency"]');
        }
        if (b.length <= 0) {
            var a = d.prevUntil('tr:has(select[name="target_dependency"])').prev().andSelf();
            jQuery.each(a, function (g, e) {
                var h = jQuery(e);
                var f = h.find('[name="target_dependency"]');
                if (f.length > 0) {
                    b = f;
                    return false;
                }
            });
        }
        return b;
    },
    getGroupedDependencies: function (f) {
        var d = new Array();
        var e = this.getTargetDependencyEle(f);
        var a = e.closest(".dependencyRow");
        d.push(a);
        var b = a.nextUntil('tr:has(select[name="target_dependency"])').filter(".dependencyRow:not(.hide)");
        jQuery.each(b, function (h, g) {
            d.push(jQuery(g));
        });
        return d;
    },
    saveDependency: function (l) {
        var g = {};
        var p = this;
        var i = l.find(".dependencyRow").filter(":first");
        var k = this.getTargetDependencyEle(i);
        var v = k.find("option:selected");
        if (v.data("type") != "field") {
            var h = k.val();
            var e = h.split("::")[1];
            var f = k.closest("tr");
            var u = f.find(".conditionRow").find('[name="fieldname"]').find('[data-block-id="' + e + '"]').filter(":selected");
            if (u.length > 0) {
                var s = new Array();
                u.each(function (z, y) {
                    s.push(jQuery(y).text());
                });
                jQuery(".saveButton").removeAttr("disabled");
                app.helper.showAlertBox({
                    "message": app.vtranslate("JS_CONDITION_OF_SAME_BLOCK", s.join(" , "), v.text())
                });
                return;
            }
            if (l.data("dependencies-added") != "true") {
                var r = k.closest("table").data("id");
                var b = jQuery("table.editDependencyTable").not('[data-id="' + r + '"]').filter('[data-parent-block-id="' + e + '"]');
                if (b.length > 0) {
                    var o = jQuery(jQuery("#moveChildToBlock").html());
                    var t = o.find(".fieldBadge");
                    b.each(function (z, y) {
                        var A = p.getTargetDependencyEle(jQuery(y).find('[class*="edit_row_"]'));
                        t.clone().html(A.find("option:selected").html()).removeClass("hide").removeClass("fieldBadge").insertAfter(o.find(".fieldBadge"));
                    });
                    app.helper.showModal(o, {
                        "cb": function (y) {
                            jQuery(".saveButton").removeAttr("disabled");
                            y.find(".p-btn").on("click", function (A) {
                                var z = jQuery(A.currentTarget);
                                if (z.data("clicked") == "true") {
                                    return;
                                }
                                jQuery(A.currentTarget).data("clicked", "true");
                                k.attr("disabled", "disabled");
                                b.each(function (E, C) {
                                    var F = jQuery(C);
                                    var B = F.find(".edit_row_" + F.data("id")).clone(true, true);
                                    B.prepend('<td width="5%" class="row_highlighter col_filler" style="border-top:0px;border-bottom:0px;"></td>');
                                    B.find('[name="target_dependency"]').find('option:not([data-block-id="' + e + '"])').attr("disabled", "disabled");
                                    B.find('[name="target_dependency"]').closest("td").removeAttr("colspan").removeClass("row_highlighter ");
                                    B.find("select").select2("destroy");
                                    B.insertBefore(l.find(".newChildDependencyContainer")).removeClass("hide");
                                    B.find('[name="parentDependencyBlockId"]').val(h);
                                    p.applyFieldElementView(B);
                                    var D = B.find(".conditionContainer");
                                    p.toggleConditionDelete(D);
                                    p.toggleAddConditionButton(D);
                                });
                                l.data("ignoreDuplicateCheck", "true");
                                l.data("dependencies-added", "true");
                            });
                        }
                    });
                    return;
                }
            }
        }
        var w = new Array();
        var a = false;
        l.find(".dependencyRow").not(".saveIgnored").find('[name="target_dependency"]').each(function (z, y) {
            var A = jQuery(y).val();
            if (jQuery.inArray(A, w) >= 0) {
                jQuery(".saveButton").removeAttr("disabled");
                app.helper.showAlertBox({
                    "message": app.vtranslate("JS_SAME_DEPENDENT_FIELD")
                });
                a = true;
                return false;
            }
            w.push(A);
        });
        if (a) {
            return;
        }
        var n = false;
        var j = false;
        l.find(".dependencyRow").not(".saveIgnored").each(function (D, G) {
            var I = {};
            var H = new Array();
            var A = jQuery(G);
            var F = p.getTargetDependencyEle(A);
            var K = F.val();
            if (K == null || K.length <= 0) {
                return true;
            }
            var J = K.split("::")[1];
            var z = F.find("option:selected").data("fieldName");
            if (z == "firstname") {
                if (A.find(".conditionRow").find('[name="fieldname"]').find("option:selected").filter('[data-field-name="salutationtype"]').length > 0) {
                    j = true;
                    jQuery(".saveButton").removeAttr("disabled");
                    var E = F.find("option:selected").text();
                    var y = A.find(".conditionRow").find('[name="fieldname"]').find("option:selected").filter('[data-field-name="salutationtype"]').text();
                    app.helper.showAlertBox({
                        "message": app.vtranslate("JS_FIRST_NAME_AND_SALUTATION_CANNOT_BE_SELECTED", E, y)
                    });
                    return false;
                }
            }
            A.find(".conditionRow").each(function (N, P) {
                var O = jQuery(P);
                var M = p.getDependencyRowValue(O);
                if (M.fieldid == J) {
                    jQuery(".saveButton").removeAttr("disabled");
                    n = true;
                    return false;
                }
                H.push(M);
            });
            if (n) {
                app.helper.showAlertBox({
                    "message": app.vtranslate("JS_SAME_TARGET_AND_DESTINATION")
                });
                jQuery(".saveButton").removeAttr("disabled");
                return false;
            }
            I.conditions = H;
            I.mandatory = "0";
            I.action = A.find('[name="action"]').filter(":visible").val();
            if (I.action == "showandmandatory") {
                I.action = "show";
                I.mandatory = "1";
            } else {
                if (I.action == "mandatory") {
                    I.mandatory = "1";
                }
            }
            if (K.split("::")[0] == "B") {
                I.mandatory = "0";
            }
            if (typeof g[K] != "undefined") {
                L = g[K];
            } else {
                var L = {};
                var C = F.find("option:selected");
                if (C.data("type") == "field") {
                    L.target_fieldid = K;
                } else {
                    L.target_blockid = K;
                }
                L.parentDependencyBlockId = A.find('[name="parentDependencyBlockId"]').val();
                L.id = A.find('[name="id"]').val();
                var B = A.find('[name="parent_dependency"]').val();
                if (B.length > 0) {
                    L.parent_dependency = B;
                }
                L.actionConditionDetails = new Array();
            }
            L.actionConditionDetails.push(I);
            g[K] = L;
        });
        if (n) {
            jQuery(".saveButton").removeAttr("disabled");
            return;
        }
        if (j) {
            return false;
        }
        var m = l.find('input[name="containerMode"]').val();
        var q = JSON.parse(jQuery('input[name="existingFieldDetails"]').val());
        var d = k.closest("table").data("id");
        var x = {};
        x.module = app.getModuleName();
        x.parent = app.getParentModuleName();
        x.action = "Dependency";
        x.mode = "duplicateCheck";
        x.targetFieldId = w;
        x.sourceModule = jQuery("#selectedModuleName").val();
        if (m == "Edit") {
            x.dependencyMode = m;
            x.oldFieldIds = q;
            x.dependencyId = d;
        }
        if (l.data("ignoreDuplicateCheck") == "true") {
            x.ignoreDuplicateCheck = "Yes";
        }
        app.request.post({
            "data": x
        }).then(function (z, y) {
            if (y) {
                var A = {};
                A.module = app.getModuleName();
                A.parent = app.getParentModuleName();
                A.action = "Dependency";
                A.mode = "save";
                A.save_values = g;
                A.sourceModule = jQuery("#selectedModuleName").val();
                app.helper.showProgress();
                app.request.post({
                    "data": A
                }).then(function (B, C) {
                    jQuery(".saveButton").removeAttr("disabled");
                    var D = jQuery("#dependentFieldsTabContainer");
                    p.showDependentFields(D);
                    l.find('input[name="mode"]').remove();
                    app.helper.hideProgress();
                });
            } else {
                if (z) {
                    app.helper.showAlertBox({
                        "message": app.vtranslate(z.code)
                    });
                    jQuery(".saveButton").removeAttr("disabled");
                    return false;
                }
            }
        });
    },
    registerSaveDependency: function () {
        return;
        var a = this;
        this.getDependencyContainer().on("click", ".saveButton", function (d) {
            var b = jQuery(d.currentTarget).closest(".editDependencyTable");
            a.saveDependency(b);
        });
    },
    registerEditDependency: function () {
        var a = this;
        this.getDependencyContainer().on("click", '[data-edit-id^="dependency_edit"]', function (f) {
            jQuery("#addDependency").attr("disabled", "disabled");
            var d = jQuery(f.currentTarget);
            if (typeof d.attr("disabled") != "undefined") {
                return true;
            }
            var b = d.closest("table");
            b.find('tr[class*="edit_row_"]').removeClass("hide");
            b.find(".edit_mode").removeClass("hide");
            a.applyFieldElementView(b.find('tr[class*="edit_row_"]'));
            b.find(".dependencyRowDetail").addClass("hide");
            b.find('tr[class*="edit_row_"]').each(function (h, e) {
                var i = jQuery(e);
                var g = i.find(".conditionContainer");
                a.toggleConditionDelete(g);
                a.toggleAddConditionButton(g);
            });
            b.closest("form").vtValidate({
                submitHandler: function () {
                    b.append('<input type="hidden" name="containerMode" value="Edit"/>');
                    a.saveDependency(b);
                }
            });
        });
    },
    registerDeleteDependency: function () {
        var a = this;
        this.getDependencyContainer().on("click", ".deletelink", function (g) {
            var d = jQuery(g.currentTarget);
            var b = d.data("id");
            var f = app.vtranslate("JS_LBL_ARE_YOU_SURE_YOU_WANT_TO_DELETE_DEPENDENCY");
            if (d.closest("td").hasClass("block_row")) {
                if (d.closest("table").find(".dependencyRowDetail").find(".field_row").length >= 1) {
                    f = app.vtranslate("JS_LBL_ARE_YOU_SURE_YOU_WANT_TO_DELETE_DEPENDENCY_AND_CHILD");
                }
            }
            app.helper.showConfirmationBox({
                "message": f
            }).then(function () {
                var e = {
                    "module": app.getModuleName(),
                    "parent": app.getParentModuleName(),
                    "action": "Dependency",
                    "mode": "delete",
                    "dependencyId": b
                };
                app.request.post({
                    "data": e
                }).then(function (h, i) {
                    if (i) {
                        var j = jQuery("#dependentFieldsTabContainer");
                        a.showDependentFields(j);
                    }
                });
            });
        });
    },
    registerCancelBtnClick: function () {
        this.getDependencyContainer().on("click", ".cancelLink", function (b) {
            jQuery("#addDependency").removeAttr("disabled");
            jQuery('[data-edit-id^="dependency_edit"]').removeAttr("disabled").removeClass("hide");
            var a = jQuery(b.currentTarget).closest("table");
            if (a.hasClass("create_mode")) {
                a.remove();
            } else {
                a.find('tr[class*="edit_row_"]').addClass("hide");
                a.find(".edit_mode").addClass("hide");
                a.find(".dependencyRowDetail").removeClass("hide");
                a.find("select").select2("destroy");
            }
            jQuery(".noDependenciesContainer").removeClass("hide");
        });
    },
    registerActionDelete: function () {
        var a = this;
        this.getDependencyContainer().on("click", ".dependencyActionDelete", function (f) {
            var b = jQuery(f.currentTarget);
            var d = app.vtranslate("JS_LBL_ARE_YOU_SURE_YOU_WANT_TO_DELETE_DEPENDENCY_RULE");
            app.helper.showConfirmationBox({
                "message": d
            }).then(function () {
                var e = {};
                e.module = app.getModuleName(), e.parent = app.getParentModuleName(), e.action = "Dependency";
                e.mode = "actionDelete";
                e.actionId = b.data("id");
                app.request.post({
                    "data": e
                }).then(function (g, h) {
                    if (!g) {
                        var i = jQuery("#dependentFieldsTabContainer");
                        a.showDependentFields(i);
                    }
                });
            });
        });
    },
    registerRuleCompromisedPopUpMessage: function () {
        var a = '<div class="popover" role="tooltip"><div class="arrow"></div>\n                                   <div class="popover-content"></div>\n                               </div>';
        this.getDependencyContainer().find(".ruleCompromised").each(function (b, e) {
            var d = jQuery(e);
            d.popover({
                "placement": "bottom",
                "trigger": "hover",
                "template": a
            });
        });
    },
    registerInactivePopUpMessage: function () {
        var a = '<div class="popover" role="tooltip"><div class="arrow"></div>\n                                   <div class="popover-content"></div>\n                               </div>';
        this.getDependencyContainer().find(".inactivePopupMessage").each(function (b, e) {
            var d = jQuery(e);
            d.popover({
                "placement": "bottom",
                "trigger": "hover",
                "template": a
            });
        });
    },
    registerDependencyEvents: function () {
        this.registerAddNewDependency();
        this.registerEditDependency();
        this.registerDeleteDependency();
        this.trigererFieldChangeEvent();
        this.dependencyActionChangeEvent();
        this.dependencyTargetElementChangeEvent();
        this.registerSaveDependency();
        this.registerAddNewCondition();
        this.registerAddNewAction();
        this.registerAddChildNewDependency();
        this.registerCancelBtnClick();
        this.registerDeleteCondition();
        this.registerActionDelete();
        this.registerRuleCompromisedPopUpMessage();
        this.registerInactivePopUpMessage();
        this.trigererDependencyRowFieldValueChangeEvent();
    },
    fieldListTabClicked: false,
    triggerFieldListTabClickEvent: function () {
        var b = this;
        var a = jQuery("#layoutEditorContainer").find(".contents");
        a.find(".detailViewTab").click(function (f) {
            var d = a.find("#detailViewLayout");
            b.showFieldsListUI(d, f).then(function (e) {
                if (!b.fieldListTabClicked) {
                    b.registerBlockEvents();
                    b.registerFieldEvents();
                    b.setInactiveFieldsList();
                    b.setHeaderFieldsCount();
                    b.setHeaderFieldsMeta();
                    b.setFieldCounts();
                    b.setNameFields();
                    b.registerAddCustomBlockEvent();
                    b.registerFieldSequenceSaveClick();
                    b.registerSwitchActionOnFieldProperties();
                    b.registerAddCustomField();
                    app.helper.showVerticalScroll(jQuery(".addFieldTypes"), {
                        "height": "350px",
                        "windowScroll": true
                    });
                    vtUtils.enableTooltips();
                    b.fieldListTabClicked = true;
                }
            });
        });
    },
    showFieldsListUI: function (f, h) {
        var b = jQuery.Deferred();
        var g = f.find(".fieldsListContainer");
        var a = jQuery(h.currentTarget).find("a");
        var i = a.data("mode");
        var d = a.data("url") + "&sourceModule=" + jQuery("#selectedModuleName").val() + "&mode=" + i;
        jQuery(".selectedMode").val(i);
        if (g.length == 0) {
            app.helper.showProgress();
            app.request.pjax({
                "url": d
            }).then(function (e, j) {
                if (e === null) {
                    app.helper.hideProgress();
                    f.html(j);
                    b.resolve(f);
                } else {
                    b.reject(e);
                }
            });
        } else {
            window.history.pushState("fieldUiContainer", "", d);
            b.resolve();
        }
        return b.promise();
    },
    triggerDuplicationTabClickEvent: function () {
        var b = this;
        var a = jQuery("#layoutEditorContainer").find(".contents");
        a.find(".duplicationTab").click(function (f) {
            var d = a.find("#duplicationContainer");
            b.showDuplicationHandlingUI(d, f).then(function (i) {
                var h = jQuery(".duplicateHandlingForm");
                var e = h.find(".duplicateHandlingContainer");
                var k = h.find(".duplicateCheck");
                if (k.length > 0) {
                    if (k.data("currentRule") == 1) {
                        k.prop("checked", false);
                        e.removeClass("show").addClass("hide");
                    } else {
                        k.prop("checked", true);
                        e.removeClass("hide").addClass("show");
                    }
                }
                var g = h.find("#fieldsList");
                h.off("change");
                h.on("change", ".duplicateCheck", function (m) {
                    var l = jQuery(m.currentTarget).is(":checked");
                    if (l == true) {
                        e.removeClass("hide").addClass("show");
                        g.removeAttr("data-validation-engine").attr("data-validation-engine", "validate[required]");
                        h.find(".rule").val("0");
                    } else {
                        e.removeClass("show").addClass("hide");
                        g.removeAttr("data-validation-engine");
                        g.val("").trigger("liszt:updated").trigger("change", false);
                        h.find(".formFooter").removeClass("show").addClass("hide");
                        h.find(".rule").val("1");
                        if (k.data("currentRule") != "1") {
                            h.submit();
                        }
                    }
                });
                h.find(".footerDependentField").on("change", function () {
                    h.find(".formFooter").addClass("show").removeClass("hide");
                });
                h.find(".cancelLink").on("click", function () {
                    d.html("");
                    a.find(".duplicationTab").trigger("click");
                });
                vtUtils.showSelect2ElementView(h.find("select").addClass("select2"), {
                    maximumSelectionSize: 3
                });
                vtUtils.enableTooltips();
                var j = {
                    submitHandler: function (l) {
                        var l = jQuery(l);
                        var m = l.serializeFormData();
                        if ((typeof m["fieldIdsList[]"] == "undefined") && (typeof m["fieldIdsList"] == "undefined")) {
                            m["fieldIdsList"] = "";
                        }
                        app.helper.showProgress();
                        app.request.post({
                            "data": m
                        }).then(function (n, p) {
                            app.helper.hideProgress();
                            if (n == null) {
                                var o = app.vtranslate("JS_DUPLICATE_HANDLING_SUCCESS_MESSAGE");
                                if (m.rule == 1) {
                                    o = app.vtranslate("JS_DUPLICATE_CHECK_DISABLED");
                                }
                                app.helper.showSuccessNotification({
                                    "message": o
                                });
                                k.data("currentRule", m.rule);
                                l.find(".formFooter").removeClass("show").addClass("hide");
                            } else {
                                app.helper.showErrorNotification({
                                    "message": app.vtranslate("JS_DUPLICATE_HANDLING_FAILURE_MESSAGE")
                                });
                            }
                        });
                        return false;
                    }
                };
                h.vtValidate(j);
            });
        });
    },
    showDuplicationHandlingUI: function (h, g) {
        var d = jQuery.Deferred();
        var a = h.find(".duplicateHandlingDiv");
        var b = jQuery(g.currentTarget).find("a");
        var i = b.data("mode");
        var f = b.data("url") + "&sourceModule=" + jQuery("#selectedModuleName").val() + "&mode=" + i;
        jQuery(".selectedMode").val(i);
        if (a.length == 0) {
            app.helper.showProgress();
            app.request.pjax({
                "url": f
            }).then(function (e, j) {
                if (e === null) {
                    app.helper.hideProgress();
                    h.html(j);
                    d.resolve(h);
                } else {
                    d.reject(e);
                }
            });
        } else {
            window.history.pushState("duplicateUiContainer", "", f);
            d.resolve();
        }
        return d.promise();
    },
    //start layout editor
    registerTranslate: function () {
        jQuery(document).on('click', '.modalTranslateSaveButton', function () {
            var langVariableVal = jQuery('#langVariable');
            var langTranslationVal = jQuery('#langTranslation');
            if (langVariableVal.val().length == 0) {
                if ($(".langVariableVal")[0]) {
                    langVariableVal.focus();
                } else {
                    langVariableVal.after('<span class="langVariableVal text-danger">' + app.vtranslate('JS_PLEASE_ENTER_VALID_VALUE') + '</span>');
                    langVariableVal.focus();
                }
            } else {
                $(".langVariableVal").remove();

                if (langTranslationVal.val().length == 0) {
                    if ($(".langTranslationVal")[0]) {
                        langTranslationVal.focus();
                    } else {
                        langTranslationVal.after('<span class="langTranslationVal text-danger">' + app.vtranslate('JS_PLEASE_ENTER_VALID_VALUE') + '</span>');
                        langTranslationVal.focus();
                    }
                } else {
                    $(".langTranslationVal").remove();

                    var form = jQuery('#newTranslateForm');
                    var formData = form.serializeFormData();
                    var progressIndicatorElement = jQuery.progressIndicator({
                        'message': '',
                        'position': 'html',
                        'blockInfo': {
                            'enabled': true
                        }
                    });

                    var params = {};
                    params['module'] = 'ParsVT';
                    params['action'] = 'ActionAjax';
                    params['mode'] = 'SaveLayoutEditor';
                    params['data'] = formData;
                    AppConnector.request(params).then(
                        function (data) {
                            progressIndicatorElement.progressIndicator({'mode': 'hide'});
                            if (data.success) {
                                if (data.result.success == true) {
                                    app.helper.showSuccessNotification({'message': data.result.message});
                                } else {
                                    app.helper.showErrorNotification({'message': data.result.message});
                                }
                            } else {
                                app.helper.showErrorNotification({'message': 'Error'});
                            }
                        },
                        function (error) {
                            progressIndicatorElement.progressIndicator({'mode': 'hide'});
                            app.helper.showErrorNotification({'message': 'Error'});
                        }
                    );
                    app.helper.hideModal();

                    setTimeout(function () {
                        window.location.reload(1);
                    }, 3000);
                }
            }
        });
    },
    initLayoutEditor: function () {
        var thisInstance = this;
        var container = jQuery('#layoutEditorContainer');
        var url = 'index.php?module=ParsVTExtras&action=ActionAjax&mode=LayoutEditorRelation';
        app.request.get({'url': url}).then(
            function (err, data) {
                if (err === null) {
                    $(".relatedListContainer div:eq(0)").before(data);
                    var relatedList = jQuery('#relatedTabOrder');
                    thisInstance.registerAddRelationBtnClick(relatedList);
                }
            }
        );
    },
    intervalLayoutEditor: function (interval) {
        var thisInstance = this;
        if (jQuery('.relatedTabModulesList').length > 0) {
            thisInstance.initLayoutEditor();
            if (interval) {
                clearInterval(interval);
            }
        }
    },
    registerLayoutEditor: function () {
        var thisInstance = this;
        var interval = null;
        if (app.getModuleName() == 'LayoutEditor' && app.getParentModuleName() == 'Settings') {
            if (jQuery('.relatedTabModulesList').length > 0) {
                thisInstance.initLayoutEditor();
            } else {
                interval = setInterval(function () {
                    thisInstance.intervalLayoutEditor(interval);
                }, 2000);
            }


            /*
            *     LoadEditor: function () {
        setTimeout(function () {
            var textAreaElement = jQuery('#faxdescription');
            var ckEditorInstance = new Vtiger_CkEditor_Js();
            ckEditorInstance.loadCkEditor(textAreaElement);
        }, 3000);
    },
            * */
            /*if (jQuery('#layoutEditorContainer').length > 0) {
                thisInstance.initLayoutEditor();
                thisInstance.registerTranslate();
                var container = jQuery('#layoutEditorContainer');
                container.on('change', '[name="layoutEditorModules"]', function (e) {
                    setInterval(function () {
                        thisInstance.initLayoutEditor();
                        thisInstance.registerTranslate();
                    }, 2000);
                });
            }*/
        }
    },
    //end layout editor
    //utils

    /*relations*/
    registerEvents: function () {
        this.registerUninstaller();
        this.registerLayoutEditor();
    }
});
var ParsVTExtrasXLS={
    displaySelectWizard:function(massActionUrl,module){
        var massActionUrl="index.php"
        var listInstance = Vtiger_List_Js.getInstance();
        var validationResult = listInstance.checkListRecordSelected();
        if(validationResult != true){
            var progressIndicatorElement = jQuery.progressIndicator();
            // Compute selected ids, excluded ids values, along with cvid value and pass as url parameters
            var selectedIds = listInstance.readSelectedIds(true);
            var excludedIds = listInstance.readExcludedIds(true);
            var cvId = listInstance.getCurrentCvId();
            var postData = {
                "viewname" : cvId,
                "selected_ids":selectedIds,
                "excluded_ids" : excludedIds
            };

            var listViewInstance = Vtiger_List_Js.getInstance();
            var searchValue = listViewInstance.getListSelectAllParams(true);

            if((typeof searchValue !== "undefined") && (searchValue.length > 0)) {
                postData['search_key'] = listViewInstance.getAlphabetSearchField();
                postData['search_value'] = searchValue;
                postData['operator'] = "s";
            }

            postData.search_params = JSON.stringify(listInstance.getListSearchParams());

            var actionParams = {
                "type":"POST",
                "url":massActionUrl,
                "dataType":"application/x-msexcel",
                "data" : postData
            };
            //can't use AppConnector to get files with a post request so we add a form to the body and submit it

            var form = $('<form method="POST" class="hide" action="' + massActionUrl + '">');
            form.append($('<input />', {  name: "module", value:"ParsVTExtras" }));
            form.append($('<input />', {  name: "targetmodule", value:app.getModuleName() }));
            form.append($('<input />', {  name: "action", value:"ViewToSheet" }));
            if(typeof csrfMagicName !== 'undefined'){
                form.append($('<input />', {  name: csrfMagicName, value:csrfMagicToken}));
            }
            $.each(actionParams.data, function(k, v) {
                form.append($('<input />', {  name: k, value:v }));
            });
            $('body').append(form);
            form.submit();
            bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i>'+app.vtranslate('Making your spreadsheet . . .')+'</div>' })
            progressIndicatorElement.progressIndicator({'mode' : 'hide'});
            setTimeout(function(){
                bootbox.hideAll();
            }, 3000);
        } else {
            listInstance.noRecordSelectedAlert();
        }
    }
}


Vtiger.Class('ParsVTExportXLS_Export_Js', {

    getInstance: function() {
        return new ParsVTExportXLS_Export_Js();
    },
    updateSelectedIds: function(params) {
        const listInstance = window.app.controller(),
            recordSelectTrackerInstance = listInstance.getRecordSelectTrackerInstance(),
            exportParams = recordSelectTrackerInstance.getSelectedAndExcludedIds(true);

        if(exportParams) {
            jQuery.extend(params, exportParams);
        } else {
            params['selected_ids'] = '';
        }

        return params
    },
    getList: function () {
        return Vtiger_List_Js.getInstance();
    },
    /**
     * @param e
     * @param source_module
     */
    triggerExportAction: function(e, source_module) {
        let postData = this.getDefaultParams();
        const self = this,
            params = {
                'selectedModule': source_module,
                'view': 'Export',
            };

        postData = jQuery.extend(postData, params);
        let listSelectAllParams = self.getListSelectAllParams(true);
        listSelectAllParams['search_params'] = JSON.stringify(self.getList().getListSearchParams());
        listSelectAllParams['tag_params'] = JSON.stringify(self.getList().getListTagParams());

        postData = jQuery.extend(postData, listSelectAllParams);
        postData = self.updateSelectedIds(postData);

        app.helper.showProgress();
        app.request.get({data: postData}).then(function(error, data) {
            app.helper.loadPageContentOverlay(data).then(function(container) {
                container.find('form#exportToXLSForm').on('submit', function() {
                    jQuery(this).
                    find('button[type="submit"]').
                    attr('disabled', 'disabled');
                    app.helper.hidePageContentOverlay();
                });
            });

            app.helper.hideProgress();
        });
    },

    getDefaultParams: function() {
        const container = jQuery('#listViewContent');

        return {
            'module': 'ParsVTExtras',
            'parent': app.getParentModuleName(),
            'page': container.find('#pageNumber').val(),
            'view': 'List',
            'viewname': container.find('[name="cvid"]').val(),
            'orderby': container.find('[name="orderBy"]').val(),
            'sortorder': container.find('[name="sortOrder"]').val(),
            'app': container.find('#appName').val(),
        };
    },

    /**
     * @param jsonDecode
     * @returns {boolean|{viewname: *, selected_ids: string, excluded_ids: *}}
     */
    getListSelectAllParams: function(jsonDecode) {
        const recordSelectTrackerInstance = this.getRecordSelectTrackerInstance(),
            params = recordSelectTrackerInstance.getSelectedAndExcludedIds(jsonDecode);

        params.search_params = {};

        return params;
    },

    getRecordSelectTrackerInstance: function() {
        let recordSelectTrackerInstance = Vtiger_RecordSelectTracker_Js.getInstance();
        recordSelectTrackerInstance.setCvId(jQuery('#listViewContent').find('[name="cvid"]').val());

        return recordSelectTrackerInstance;
    },


}, {
    getLink: function() {
        return jQuery('#' + app.getModuleName() + '_listView_massAction_Export_To_XLS');
    },
    registerEvents: function() {
        if ('List' === app.getViewName()) {
            const self = this,
                aElement = self.getLink(),
                liElement = aElement.parent('li');

            liElement.attr('class', 'selectFreeRecords');
            self.registerLinkShow();
        }
    },
    registerLinkEvent: function() {
        const self = this,
            massActions = jQuery('.listViewMassActions button:first');

        massActions.on('click', function() {
            self.getLink().parents('li').removeClass('hide');
        });
    },
    registerLinkShow: function() {
        const self = this;

        self.registerLinkEvent();

        app.event.on('post.listViewFilter.click', function() {
            self.registerLinkEvent();
        });
    },
});


jQuery(document).ready(function () {
    var ParsVTExtrasHelperJsInstance = new ParsVTExtrasHelper_Js();
    ParsVTExtrasHelperJsInstance.registerEvents();
})
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
Settings_Vtiger_Edit_Js("Settings_RecordCreator_Edit_Js", {
}, {
   RecordCreatorInstance : false,
   
    
    
   registerEventForShowModuleFilterCondition: function () {
      var thisInstance = this;
      var record = jQuery('#record').val();
        jQuery('#priamry_module_name,#target_module_name').on('change', function (e) {
            var targetModule = jQuery('#target_module_name').val();
            var primaryModule = jQuery('#priamry_module_name').val();
            if(primaryModule == "" && targetModule == ""){
            }else if (primaryModule == targetModule){

                jQuery('#test').hide();
                app.helper.showErrorNotification({"message":app.vtranslate('Module can not be same')});
                return;
            }
            var params = {
                'module' : 'RecordCreator',
                'parent' : 'Settings',
                'view' : 'EditAjax',
                'mode' : 'getLinkId',
                'module_name' : targetModule,
                'primary_module' : primaryModule,
            }
            AppConnector.request(params).then(
                function(data) {
                    if(record){
                    } else {
                        if(data.result.success == "Ok"){
                            jQuery('#test').hide();
                            app.helper.showErrorNotification({"message":app.vtranslate('Please Select Another Module')});
                            return;
                        } else {
                            jQuery('#test').show();
                        }
                    }
                }
            );
            
            var params = {
                'module' : 'RecordCreator',
                'parent' : 'Settings',
                'view' : 'EditAjax',
                'mode' : 'getInventoryModules',
                'module_name' : targetModule,
                'primary_module' : primaryModule,
            }
            AppConnector.request(params).then(
                function(data) {
                    if(record){
                    } else {
                        if(data.result.success == "Success"){
                            var select1 = jQuery("#target_view").find('option[value=None]');
                            jQuery("#target_view").select2('val', select1.val());
                            jQuery('select option[value=Popup]').attr('disabled', 'disabled').hide();
                        } else if (data.result.success == "Error" ){
                        
                            jQuery('select option[value=Popup]').removeAttr('disabled').show();
                        }
                    }
                }
            );

            var params = {
                'module': 'RecordCreator',
                'parent': 'Settings',
                'view': 'EditAjax',
                'mode': 'getMappingConditions',
                'record': jQuery("input[name='record']").val(),
                'module_name': targetModule,
                'primary_module' : primaryModule,
            }
         
            if(targetModule !='' && primaryModule !=''){
                 app.helper.showProgress();
                app.request.get({data: params}).then(function (error, data) {
                    app.helper.hideProgress();
                    jQuery('#mapping_condition').html(data);
                    
                    vtUtils.applyFieldElementsView(jQuery('#mapping_condition'));
                    thisInstance.RecordCreatorInstance = RecordCreator_Js.getInstance(jQuery('.fieldMappingEditPageDiv' ));
                });
                
            }
           
        });
        jQuery('#target_module_name').trigger('change');
   },
   

    registerNext: function (data) {
        jQuery('#test').on('click',function(){
            if (jQuery("#priamry_module_name").val() == "") {
                app.helper.showErrorNotification({"message":app.vtranslate("Please select Source Module")});
                return;
            }
            if (jQuery("#target_module_name").val() == "") {
                app.helper.showErrorNotification({"message":app.vtranslate("Please select Target Module")});
                return;
            }
            if (jQuery("#target_view").val() == "None") {
                app.helper.showErrorNotification({"message":app.vtranslate("Please select Target Module View")});
                return;
            }
            if(jQuery.trim(jQuery('input[name=display_text]').val()) == ''){
                app.helper.showErrorNotification({"message":app.vtranslate("Display Text can not empty!")});
                return;
            }
            $('#step1').hide();
            $('#steplabel1').removeClass('active');
            $('#steplabel1').removeClass('inactive');
            $('#step2').show();
            $('#steplabel2').addClass('active');
        });
    },

   registerBackStepClickEvent : function(){
        var thisInstance = this;
        jQuery('.backStep').on('click', function(e) {
            
            var record = jQuery('#record').val();
            var url = "index.php?module="+app.getModuleName()+"&parent=Settings&view=Edit";
            
            if(record){
                window.location.href=url+"&record="+record;
            }else{
                window.location.href=url;
            }   
        });
    },

    registerAppTriggerEvent : function() {
        jQuery('.app-menu').removeClass('hide');
        var toggleAppMenu = function(type) {
            var appMenu = jQuery('.app-menu');
            var appNav = jQuery('.app-nav');
            appMenu.appendTo('#page');
            appMenu.css({
                'top' : appNav.offset().top + appNav.height(),
                'left' : 0
            });
            if(typeof type === 'undefined') {
                type = appMenu.is(':hidden') ? 'show' : 'hide';
            }
            if(type == 'show') {
                appMenu.show(200, function() {});
            } else {
                appMenu.hide(200, function() {});
            }
        };

        jQuery('.app-trigger, .app-icon, .app-navigator').on('click',function(e){
            e.stopPropagation();
            toggleAppMenu();
        });

        jQuery('html').on('click', function() {
            toggleAppMenu('hide');
        });

        jQuery(document).keyup(function (e) {
            if (e.keyCode == 27) {
                if(!jQuery('.app-menu').is(':hidden')) {
                    toggleAppMenu('hide');
                }
            }
        });

        jQuery('.app-modules-dropdown-container').hover(function(e) {
            var dropdownContainer = jQuery(e.currentTarget);
            jQuery('.dropdown').removeClass('open');
            if(dropdownContainer.length) {
                if(dropdownContainer.hasClass('dropdown-compact')) {
                    dropdownContainer.find('.app-modules-dropdown').css('top', dropdownContainer.position().top - 8);
                } else {
                    dropdownContainer.find('.app-modules-dropdown').css('top', '');
                }
                dropdownContainer.addClass('open').find('.app-item').addClass('active-app-item');
            }
        }, function(e) {
            var dropdownContainer = jQuery(e.currentTarget);
            dropdownContainer.find('.app-item').removeClass('active-app-item');
            setTimeout(function() {
                if(dropdownContainer.find('.app-modules-dropdown').length && !dropdownContainer.find('.app-modules-dropdown').is(':hover') && !dropdownContainer.is(':hover')) {
                    dropdownContainer.removeClass('open');
                }
            }, 500);

        });

        jQuery('.app-item').on('click', function() {
            var url = jQuery(this).data('defaultUrl');
            if(url) {
                window.location.href = url;
            }
        });

        jQuery(window).resize(function() {
            jQuery(".app-modules-dropdown").mCustomScrollbar("destroy");
            app.helper.showVerticalScroll(jQuery(".app-modules-dropdown").not('.dropdown-modules-compact'), {
                setHeight: $(window).height(),
                autoExpandScrollbar: true
            });
            jQuery('.dropdown-modules-compact').each(function() {
                var element = jQuery(this);
                var heightPer = parseFloat(element.data('height'));
                app.helper.showVerticalScroll(element, {
                    setHeight: $(window).height()*heightPer - 3,
                    autoExpandScrollbar: true,
                    scrollbarPosition: 'outside'
                });
            });
        });
        app.helper.showVerticalScroll(jQuery(".app-modules-dropdown").not('.dropdown-modules-compact'), {
            setHeight: $(window).height(),
            autoExpandScrollbar: true,
            scrollbarPosition: 'outside'
        });
        jQuery('.dropdown-modules-compact').each(function() {
            var element = jQuery(this);
            var heightPer = parseFloat(element.data('height'));
            app.helper.showVerticalScroll(element, {
                setHeight: $(window).height()*heightPer - 3,
                autoExpandScrollbar: true,
                scrollbarPosition: 'outside'
            });
        });
    },

    registerEvents: function () {
        $('#step2').hide();
        this.registerEventForShowModuleFilterCondition();
        this.registerNext();
        this.registerBackStepClickEvent();
        this.registerAppTriggerEvent();
    }
});


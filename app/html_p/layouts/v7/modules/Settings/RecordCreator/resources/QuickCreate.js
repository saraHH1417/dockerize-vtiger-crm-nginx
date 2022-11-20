/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
	jQuery.Class("QuickCreate_Js",{
	
	linkResponseCache : {},

	triggerCreateRecord : function(url) {
		var thisInstance = this;
		QuickCreate_Js.getModuleLinkData(url).then(
			function(response) {
				var js = new Vtiger_Index_Js();
				var splitData = response.split("&")[0];
				var moduleData = splitData.split("?");
				var moduleName = splitData.split("=");
				js.getQuickCreateForm(response,moduleName[1],{}).then(function(data){
				app.helper.hideProgress();
				var callbackparams = {
					'cb' : function (container){
						js.registerPostReferenceEvent(container);
						app.event.trigger('post.QuickCreateForm.show',form);
						app.helper.registerLeavePageWithoutSubmit(form);
						app.helper.registerModalDismissWithoutSubmit(form);
					},
					backdrop : 'static',
					keyboard : false
					}

				app.helper.showModal(data, callbackparams);
				var form = jQuery('form[name="QuickCreate"]');
				var moduleName = form.find('[name="module"]').val();
				app.helper.showVerticalScroll(jQuery('form[name="QuickCreate"] .modal-body'), {'autoHideScrollbar': true});

				var targetInstance = thisInstance;
				var moduleInstance = Vtiger_Edit_Js.getInstanceByModuleName(moduleName);
				if(typeof(moduleInstance.quickCreateSave) === 'function'){
					targetInstance = moduleInstance;
					targetInstance.registerBasicEvents(form);
				}

				vtUtils.applyFieldElementsView(form);
				thisInstance.quickCreateSave(form,{});
				thisInstance.registerPostQuickCreateEvent();
				app.helper.hideProgress();
			});
			}
		);
	},
	
	getModuleLinkData : function(url) {
		var aDeferred = jQuery.Deferred();
			app.request.get({"url":url}).then(
				function(err,data) {
					QuickCreate_Js.linkResponseCache = data;
					aDeferred.resolve(QuickCreate_Js.linkResponseCache);
				}
			);
		
		return aDeferred.promise();
	},

	quickCreateSave : function(form,invokeParams){
		var params = {
			submitHandler: function(form) {
				jQuery("button[name='saveButton']").attr("disabled","disabled");
				if(this.numberOfInvalids() > 0) {
					return false;
				}
				var formData = jQuery(form).serialize();
				app.request.post({data:formData}).then(function(err,data){
					app.event.trigger("post.QuickCreateForm.save",data,jQuery(form).serializeFormData());
					if(err === null) {
						app.helper.hideModal();
						app.helper.showSuccessNotification({"message":''});
						window.onbeforeunload = null;
					}else{
						app.helper.showErrorNotification({"message":err});
					}
				});
			},
			validationMeta: quickcreate_uimeta
		};
		form.vtValidate(params);
	},

	registerPostQuickCreateEvent : function(){
		var thisInstance = this;

		app.event.on("post.QuickCreateForm.show",function(event,form){
			form.find('#goToFullForm').on('click', function(e) {
				window.onbeforeunload = true;
				var form = jQuery(e.currentTarget).closest('form');
				var editViewUrl = jQuery(e.currentTarget).data('editViewUrl');
				if (typeof goToFullFormCallBack != "undefined") {
					goToFullFormCallBack(form);
				}
				thisInstance.quickCreateGoToFullForm(form, editViewUrl);
			});
		});
	},

	quickCreateGoToFullForm: function(form, editViewUrl) {
		var formData = form.serializeFormData();
		//As formData contains information about both view and action removed action and directed to view
		delete formData.module;
		delete formData.action;
		delete formData.picklistDependency;
		var formDataUrl = jQuery.param(formData);
		var completeUrl = editViewUrl + "&" + formDataUrl;
		window.location.href = completeUrl;
	},

	
},{
	registerEvents : function(){
		//this.registerQuickCreateEvent();
	}
});
jQuery(document).ready(function(){
  var instance = new QuickCreate_Js();
  instance.registerEvents();
})
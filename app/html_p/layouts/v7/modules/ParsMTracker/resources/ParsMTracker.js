jQuery.Class('ParsMTracker_Js', {}, {
	registerActiveEvent : function() {
		var modTrackerContainer = jQuery('#modTrackerContainer');
		modTrackerContainer.on('change', '.activeModTracker', function(e) {
            app.helper.showProgress();
			var currentTarget = jQuery(e.currentTarget);
			var tr = currentTarget.closest('tr');
			var params = {};
			params['module'] = app.getModuleName();
			params['parent'] = app.getParentModuleName();
			params['action'] = 'Save';
			params['mode'] = 'changeActiveStatus';
			params['id'] = tr.data('id');
			params['status'] = currentTarget.attr('checked') == 'checked';

			AppConnector.request(params).then(
				function(data) {
                    app.helper.hideProgress();
                    app.helper.showSuccessNotification({
                        message: app.vtranslate(data.result.message)
                    });
				},
				function(error) {
                    app.helper.hideProgress();
                    app.helper.showErrorNotification({
                        message: app.vtranslate(error)
                    });
				}
			);
		});
	},
	
	/**
	 * Function to register events
	 */
	registerEvents : function(){
		this.registerActiveEvent();
	}
})
jQuery(document).ready(function () {
	var ParsMTrackerInstance = new ParsMTracker_Js();
	ParsMTrackerInstance.registerEvents();
    Vtiger_Index_Js.getInstance().registerEvents();
})
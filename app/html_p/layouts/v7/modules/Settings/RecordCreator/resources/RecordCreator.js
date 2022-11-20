/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

jQuery.Class("RecordCreator_Js",{
     instance:false,
    getInstance: function(){
        if(RecordCreator_Js.instance == false){
            var instance = new RecordCreator_Js();
            RecordCreator_Js.instance = instance;
            return instance;
        }
        return RecordCreator_Js.instance;
    }
},{
    registerEventForAddingNewMapping : function(){
        jQuery('#addMapping').live('click', function (e) {
            var addmappingrow = jQuery('#convertMapping');
            var lastSequenceNumber = addmappingrow.find('tr:not(.newMapping):last').attr('sequence-number');
            if(!lastSequenceNumber){
                lastSequenceNumber = 0;
            }
            var targetModule = jQuery('#targetModule').val();
            var primaryModule = jQuery('#primaryModule').val();
            var newSequenceNumber = parseInt(lastSequenceNumber) + 1;
            var newMapping = jQuery('.newMapping').clone(true,true);
            newMapping.attr('sequence-number',newSequenceNumber);
			newMapping.find('select.PrimaryFields.newSelect').attr("name",'mapping['+newSequenceNumber+']['+primaryModule+']');
			newMapping.find('select.TargetFields.newSelect').attr("name",'mapping['+newSequenceNumber+']['+targetModule+']');
            newMapping.removeClass('hide newMapping');
            newMapping.appendTo(addmappingrow);
            newMapping.find('.newSelect').removeClass('newSelect').addClass('select2');
            var select2Elements = newMapping.find('.select2');
            vtUtils.showSelect2ElementView(select2Elements);
            jQuery('select.PrimaryFields.select2',newMapping).trigger('change',false);
			jQuery('select.TargetFields.select2',newMapping).trigger('change',false);
        })
    },
    registerEventToDeleteMapping : function(){
        jQuery('i.deleteMapping').live('click', function (e){
             $(this).closest('tr.listViewEntries').remove();
        });
    },
        

    registerEvents : function() {
        this.registerEventForAddingNewMapping();
        this.registerEventToDeleteMapping();
    }
});

jQuery(document).ready(function() {
    var RecordCreatorInstance  =  new RecordCreator_Js();
    RecordCreatorInstance.registerEvents();
});
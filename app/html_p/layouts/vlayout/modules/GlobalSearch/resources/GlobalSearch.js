/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

jQuery(document).ready(function () {

    jQuery(document).find("#globalSearchValue").unbind("keypress");

    var basicSearchModulesList = jQuery('#basicSearchModulesList');

    // Add Emails to search
    var targetOptions = new jQuery();
    basicSearchModulesList.find("option[value='Emails']").each(function() {
        jQuery(this).remove();
    });
    basicSearchModulesList.append('<option class="globalSearch_module_Emails" value="Emails">Emails</option>');
    basicSearchModulesList.find('option').each(function(i,e) {
        targetOptions = targetOptions.add(jQuery(e));
    });
    basicSearchModulesList.trigger("liszt:updated");

    jQuery(document).on("keypress","#globalSearchValue", function(e) {
        if (e.which == 13) {
            e.preventDefault();
            var currentTarget = jQuery(e.currentTarget);
            var val = currentTarget.val();
            var search_module=jQuery('#basicSearchModulesList').val();
            if(val.trim() !='') {
                val = encodeURIComponent(val);
                window.location.href = "index.php?module=GlobalSearch&view=SearchResults&value="+val+"&search_module="+search_module;
            }else{
                Vtiger_Helper_Js.showPnotify('Please type the keyword to search');
            }
        }
        else{
            return;
        }
        e.preventDefault();
    })
});
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<div class="container-fluid">
    <div class="widget_header row-fluid">
        <h3>{vtranslate('Notifications', 'Notifications')}</h3>
    </div>
    <hr>
    <div class="clearfix"></div>
    <div class="summaryWidgetContainer">
        <div class="row-fluid">
	<div class="row">
	            <span class="span2"><h4>{vtranslate('LBL_ENABLE_MODULE', 'Notifications')}</h4></span>
	            <input type="checkbox" name="enable_module" id="enable_module" value="1" {if $ENABLE eq '1'}checked="" {/if}/>
	</div>
        	<div class="row">
	            <span class="span2"><h4>{vtranslate('Sort by :', 'Notifications')}</h4></span>
	            <select  name="sort_by" id="sort_by"  data-fieldtype="picklist" class="inputElement select2" type="picklist" style="width: 120px">
		                    <option value="ASC" {if $SORT_BY eq 'ASC'}selected{/if}>{vtranslate('Oldest', 'Notifications')}</option>
		                    <option value="DESC" {if $SORT_BY eq 'DESC'}selected{/if}>{vtranslate('Latest', 'Notifications')}</option>            </select>
        	</div>
         </div>    
    </div>
    <div class="clearfix"></div>
    <div>
        <div style="padding: 10px; text-align: justify; font-size: 14px; border: 1px solid #ececec; border-left: 5px solid #2a9bbc; border-radius: 5px; overflow: hidden;">
            <h4 style="color: #2a9bbc; margin: 0px -15px 10px -15px; padding: 0px 15px 8px 15px; border-bottom: 1px solid #ececec;"><i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate('LBL_INFO_BLOCK', 'Notifications')}</h4>
            {vtranslate('LBL_INFO_BLOCK_ON_SETTING_PAGE', 'Notifications')}
        </div>
    </div>
</div>
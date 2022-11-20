{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{strip}
    {if !empty($NO_PICKLIST_FIELDS) }
        <label style="padding-top: 40px;"> 
            <b>
                {vtranslate($SELECTED_MODULE_NAME,$SELECTED_MODULE_NAME)} {vtranslate('do not have any picklist fields',$QUALIFIED_NAME)}. &nbsp; 
            </b>
        </label>
    {else}
        <div class="row-fluid">
            <label class="fieldLabel col-lg-3 col-md-3 col-sm-3"><strong>{vtranslate('Select Picklist in ',$QUALIFIED_MODULE)}&nbsp;{vtranslate($SELECTED_MODULE_NAME,$SELECTED_MODULE_NAME)}</strong></label>
            <div class="span6 fieldValue">
                <select class="inputElement" id="modulePickList">
                    <optgroup>
                        {foreach key=PICKLIST_FIELD item=FIELD_MODEL from=$PICKLIST_FIELDS}
                            <option value="{$FIELD_MODEL->getId()}">{vtranslate($FIELD_MODEL->get('label'),$SELECTED_MODULE_NAME)}</option>
                        {/foreach}	
                    </optgroup>
                </select>
            </div>
        </div><br>
    {/if}
{/strip}
<SCRIPT>
jQuery(document).ready(function(){
	vtUtils.enableTooltips();
});
</SCRIPT>
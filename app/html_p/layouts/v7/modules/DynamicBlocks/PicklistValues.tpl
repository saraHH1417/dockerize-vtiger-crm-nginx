{*
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
*}
    <label class="control-label col-sm-2">{vtranslate('LBL_VALUES',$QUALIFIED_MODULE)}</label>
    <div class="col-sm-10">
        <select class="select2 col-sm-8" id="values" multiple="true" name="values[]">
            <option value="__blank__" {if $BLANK_SELECTED eq 1}selected=""{/if}>{vtranslate('NO_VALUE_SELECTED',$QUALIFIED_MODULE)}</option>
            {foreach from=$SELECTED_PICKLISTFIELD_ALL_VALUES key=PICKLIST_VALUE_KEY item=PICKLIST_VALUE}
                <option {if in_array(Vtiger_Util_Helper::toSafeHTML($PICKLIST_VALUE), $BLOCK_DATA['picklist_values'])} selected="" {/if} value="{Vtiger_Util_Helper::toSafeHTML($PICKLIST_VALUE)}" data-id={$PICKLIST_VALUE_KEY}>{vtranslate($PICKLIST_VALUE,$SELECTED_MODULE_NAME)}</option>
            {/foreach}
        </select>
    </div>



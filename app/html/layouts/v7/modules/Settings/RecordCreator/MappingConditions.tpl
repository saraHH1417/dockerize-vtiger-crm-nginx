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
    <div class="fieldMappingEditPageDiv">
        <div class="col-sm-12 col-xs-12">
            <div class="editViewContainer ">
                <form id="fieldMapping" method="POST">
                    <div class="editViewBody ">
                        <div class="editViewContents table-container" >
                            <table class="table listview-table-norecords" width="100%" id="convertMapping">
                                <input type="hidden" id="index" name="index" value= "0">
                                <input type="hidden" id="targetModule" value="{$TARGET_MODULE_NAME}">
                                <input type="hidden" id="primaryModule" value="{$PRIMARY_MODULE_NAME}">
                                <input type="hidden" id="old_mapping" value='{ZEND_JSON::encode($MODULEMODEL)}'>
                                <tbody>

                                    <tr>
                                        <td width="5%"><strong>{vtranslate('LBL_ACTIONS', $QUALIFIED_MODULE)}</strong></td>
                                        <td width="5%"><strong>{vtranslate('LBL_PRIMARY_FIELD', $QUALIFIED_MODULE)}</strong></td>
                                        <td width="5%"><strong>{vtranslate('LBL_TARGET_FIELD', $QUALIFIED_MODULE)}</strong></td>
                                    </tr>
                                  {foreach key=MAPPING_ID item=MAPPING_ARRAY from=$MODULEMODEL name="mappingLoop"}
                                  <tr class="listViewEntries" sequence-number="{$smarty.foreach.mappingLoop.iteration}">
                                            <td width="5%">
                                                {foreach item=LINK_MODEL from=$MAPPING_MODEL->getMappingLinks()}
                                                    <div class="table-actions">
                                                        <span class="actionImages">
                                                            <i title="{vtranslate($LINK_MODEL->getLabel(), $MODULE)}" class="fa fa-trash deleteMapping"></i>
                                                        </span>
                                                    </div>
                                                {/foreach}
                                            </td>  
                                            <td width="10%">
                                                <input type="hidden" name="mapping[{$smarty.foreach.mappingLoop.iteration}][mappingId]" value="{$MAPPING_ID}"/>
                                                <select class="PrimaryFields select2 col-sm-12" style="width:180px" name="mapping[{$smarty.foreach.mappingLoop.iteration}][{$PRIMARY_MODULE_NAME}]">
                                                    <option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
                                                    {foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$PRIMARYRECORDSTRUCTURE}
                                                        <optgroup label='{vtranslate($BLOCK_LABEL, $PRIMARY_MODULE_NAME)}'>{vtranslate($BLOCK_LABEL, $PRIMARY_MODULE_NAME)}
                                                            {foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS}
                                                                {assign var=FIELD_MODULE_NAME value=$FIELD_MODEL->getModule()->getName()}
                                                                <option value="{$FIELD_NAME}" {if trim($MAPPING_ARRAY['primaryfield']) eq trim($FIELD_NAME) } selected {/if} data-field-name="{$FIELD_NAME}">{Vtiger_Util_Helper::toSafeHTML(vtranslate($FIELD_MODEL->get('label'), $PRIMARY_MODULE_NAME))}
                                                                {if $FIELD_MODEL->isMandatory() eq true} <span>*</span> {/if}
                                                                </option>
                                                            {/foreach}
                                                        </optgroup>
                                                    {/foreach}
                                                </select>
                                            </td>   
                                             <td width="10%">
                                                <select class="TargetFields select2 col-sm-12" style="width:180px" name="mapping[{$smarty.foreach.mappingLoop.iteration}][{$TARGET_MODULE_NAME}]" >
                                                <option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
                                                {foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$TARGETRECORDSTRUCTURE}
                                                    <optgroup label='{vtranslate($BLOCK_LABEL, $TARGET_MODULE_NAME)}'>{vtranslate($BLOCK_LABEL, $TARGET_MODULE_NAME)}
                                                        {foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS}
                                                            {assign var=FIELD_MODULE_NAME value=$FIELD_MODEL->getModule()->getName()}
                                                            <option value="{$FIELD_NAME}"{if trim($MAPPING_ARRAY['targetfield']) eq trim($FIELD_NAME) } selected {/if} data-field-name="{$FIELD_NAME}">{Vtiger_Util_Helper::toSafeHTML(vtranslate($FIELD_MODEL->get('label'), $TARGET_MODULE_NAME))}
                                                            {if $FIELD_MODEL->isMandatory() eq true} <span>*</span> {/if}
                                                            </option>
                                                        {/foreach}
                                                    </optgroup>
                                                {/foreach}
                                            </select>
                                            </td>      
                                        </tr>
                                    {/foreach}
                                    <tr class="hide newMapping listViewEntries">
                                        <td width="5%">
                                            {foreach item=LINK_MODEL from=$MAPPING_MODEL->getMappingLinks()}
                                                <div class="table-actions">
                                                    <span class="actionImages">
                                                        <i title="{vtranslate($LINK_MODEL->getLabel(), $MODULE)}" class="fa fa-trash deleteMapping"></i>
                                                    </span>
                                                </div>
                                            {/foreach}
                                        </td>  
                                        <td width="10%">
                                            <select class="PrimaryFields newSelect" style="width:180px">
                                                <option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
                                                {foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$PRIMARYRECORDSTRUCTURE}
                                                    <optgroup label='{vtranslate($BLOCK_LABEL, $PRIMARY_MODULE_NAME)}'>{vtranslate($BLOCK_LABEL, $PRIMARY_MODULE_NAME)}
                                                        {foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS}
                                                            {assign var=FIELD_MODULE_NAME value=$FIELD_MODEL->getModule()->getName()}
                                                            <option value="{$FIELD_NAME}" data-field-name="{$FIELD_NAME}">{Vtiger_Util_Helper::toSafeHTML(vtranslate($FIELD_MODEL->get('label'), $PRIMARY_MODULE_NAME))}
                                                            {if $FIELD_MODEL->isMandatory() eq true} <span>*</span> {/if}
                                                            </option>
                                                        {/foreach}
                                                    </optgroup>
                                                {/foreach}
                                            </select>
                                        </td>   
                                         <td width="10%">
                                            <select class="TargetFields newSelect" style="width:180px">
                                                <option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
                                                {foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$TARGETRECORDSTRUCTURE}
                                                    <optgroup label='{vtranslate($BLOCK_LABEL, $TARGET_MODULE_NAME)}'>{vtranslate($BLOCK_LABEL, $TARGET_MODULE_NAME)}
                                                        {foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS}
                                                            {assign var=FIELD_MODULE_NAME value=$FIELD_MODEL->getModule()->getName()}
                                                            <option value="{$FIELD_NAME}" data-field-name="{$FIELD_NAME}">{Vtiger_Util_Helper::toSafeHTML(vtranslate($FIELD_MODEL->get('label'), $TARGET_MODULE_NAME))}
                                                            {if $FIELD_MODEL->isMandatory() eq true} <span>*</span> {/if}
                                                            </option>
                                                        {/foreach}
                                                    </optgroup>
                                                {/foreach}
                                            </select>
                                        </td>                               
                                    </tr>
                                 </tbody>   
                            </table><hr>
                            <div class="row">
                                <span class="col-sm-4">
                                    <button id="addMapping" class="btn addButton module-buttons" type="button">
                                        <i class="fa fa-plus"></i>&nbsp;&nbsp;{vtranslate('LBL_ADD_MAPPING', $QUALIFIED_MODULE)}
                                    </button>
                                </span>
                            </div>
            </div>
                    </div>
        </form>
            </div>
    </div>
    </div>
{/strip}
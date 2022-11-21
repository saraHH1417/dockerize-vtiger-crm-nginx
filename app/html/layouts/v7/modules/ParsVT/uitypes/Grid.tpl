{* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** *}
{strip}
    {assign var="FIELD_INFO" value=$FIELD_MODEL->getFieldInfo()}
    {assign var="FIELD_ID" value=$FIELD_MODEL->getId()}
    <div class="row grid-div-parent">
        <div class="col-lg-12 col-md-12 col-sm-12" >
            {assign var=HEADERS value=ZEND_JSON::encode(ParsVT_AdvCF_Model::getParameters($FIELD_ID))}
            {assign var=ROWS value=$FIELD_MODEL->getEditViewDisplayValue($FIELD_MODEL->get('fieldvalue'))}
            {*assign var=ROWS value=rtrim($ROWS,'_')*}
            <textarea class="value gridElement" rows="10" class="hide" style="display: none; width: 100%" data-field-type="grid" data-fieldname="{$FIELD_MODEL->getName()}" data-field-id= '{$FIELD_MODEL->get('id')}'
                   name="{$FIELD_MODEL->getName()}" data-headers='{$HEADERS}'
                   {if $FIELD_INFO["mandatory"] eq true} data-rule-gridview_required="true" {/if}/>{$ROWS}
            </textarea>
            <div class="dataTable"></div>
        </div>
    </div>
{/strip}

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
    {assign var="FIELD_INFO" value=$FIELD_MODEL->getFieldInfo()}
    {assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
    {assign var="FIELD_VALUE_LIST" value=explode(',',$FIELD_MODEL->get('fieldvalue'))}
    {*assign var=ALL_ACTIVEUSER_LIST value=ParsVT_AdvCF_Helper::getAllUsers()*}
    {assign var=ALL_ACTIVEUSER_LIST value=$USER_MODEL->getAccessibleUsers()}
    <input type="hidden" name="{$FIELD_MODEL->getFieldName()}" value="{$FIELD_MODEL->get('fieldvalue')}" />
    <select id="{$FIELD_MODEL->getFieldName()}_{$MODULE}_{$smarty.request.view}_fieldName" multiple class="select2" data-name="{$FIELD_MODEL->getFieldName()}" data-fieldtype="multipicklist" style='width:210px;height:30px;'
            {if $FIELD_INFO["mandatory"] eq true} data-rule-required="true" {/if}
            {if count($FIELD_INFO['validator'])}
                data-specific-rules='{ZEND_JSON::encode($FIELD_INFO["validator"])}'
            {/if} >
        <optgroup label="{vtranslate('LBL_USERS')}">
            {foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEUSER_LIST}
                <option value="{$OWNER_ID}" data-picklistvalue= '{$OWNER_NAME}'{foreach item=USER from=$FIELD_VALUE_LIST}{if $USER eq $OWNER_ID } selected {/if}{/foreach}
                        {if array_key_exists($OWNER_ID, $ACCESSIBLE_USER_LIST)} data-recordaccess=true {else} data-recordaccess=false {/if}
                        data-userId="{$CURRENT_USER_ID}">
                    {$OWNER_NAME}
                </option>
            {/foreach}
        </optgroup>
    </select>
{/strip}
{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is: vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
  *
 ********************************************************************************/
-->*}
{strip}
    {if strpos($FIELD_MODEL->getName(), 'cf_pcf_icf') !== false}
        {assign var=FIELD_VALUE value=$FIELD_MODEL->get('fieldvalue')}
        {assign var="FIELD_INFO" value=$FIELD_MODEL->getFieldInfo()}
        {assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
        {if (!$FIELD_NAME)}
            {assign var="FIELD_NAME" value=$FIELD_MODEL->getFieldName()}
        {/if}
        {*Enter Number 1 just for showing IRAN or zero for all countries*}
        {assign var=COUNTRIES_INFO value=Vtiger_Citiesfield_UIType::getCounties(1)}

        <div id="advfieldBlock_{$FIELD_NAME}" {if $FIELD_MODEL->get('fieldvalue') neq '' && !empty($FIELD_MODEL->get('fieldvalue'))}style="display: none"{/if}>
            <div>
                <select name="country_fieldName_{$FIELD_NAME}" data-name="{$FIELD_NAME}" data-fieldname="{$MODULE}_country_fieldName_{$FIELD_NAME}" data-fieldtype="picklist" class="inputElement select2" type="picklist">
                    <optgroup label="{vtranslate('Countries','ParsVT')}">
                        <option value="" seleced>{vtranslate('LBL_NONE',$MODULE)}</option>
                        {foreach key=COUNTRY_ID item=COUNTRY_NAME from=$COUNTRIES_INFO}
                            <option value="{$COUNTRY_ID}" data-picklistvalue= '{$COUNTRY_ID}' {if $SEARCH_INFO['searchValue'] eq $COUNTRY_ID} selected {/if}>
                                {$COUNTRY_NAME}
                            </option>
                        {/foreach}
                    </optgroup>
                </select>
            </div>
            <div style="display: none">
                <select name="city_fieldName_{$FIELD_NAME}" data-name="{$FIELD_NAME}" data-fieldname="{$MODULE}_city_fieldName_{$FIELD_NAME}" data-fieldtype="picklist" class="inputElement select2" type="picklist">
                    <optgroup label="{vtranslate('Cities','ParsVT')}">
                    </optgroup>
                </select>
            </div>
            <div style="display: none">
                <select name="county_fieldName_{$FIELD_NAME}" data-name="{$FIELD_NAME}" data-fieldname="{$MODULE}_county_fieldName_{$FIELD_NAME}" data-fieldtype="picklist" class="inputElement select2" type="picklist">
                    <optgroup label="{vtranslate('Counties','ParsVT')}">
                    </optgroup>
                </select>
            </div>
        </div>
        <div>
            <input id="{$MODULE}_editView_fieldName_{$FIELD_NAME}" type="hidden" data-fieldname="{$FIELD_NAME}"
                   data-fieldtype="string" class="inputElement" name="{$FIELD_NAME}"
                   value="{$FIELD_MODEL->get('fieldvalue')}"/>
            <span id="Show_Advcf_{$FIELD_NAME}" data-country="" data-city="" data-country-id="" data-city-id="">{$FIELD_MODEL->getDisplayValue($FIELD_VALUE)}</span><span class="advfieldChange" data-name="{$FIELD_NAME}" style="margin: 0 10px; cursor: pointer; {if $FIELD_MODEL->get('fieldvalue') eq '' || empty($FIELD_MODEL->get('fieldvalue'))}display: none{/if}"><i class="fa fa-2x fa-edit"></i></span>
        </div>
    {/if}

{/strip}
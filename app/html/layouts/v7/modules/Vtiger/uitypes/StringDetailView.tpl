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

{* TODO: Review the order of parameters - good to eliminate $RECORD->getId, $RECORD should be used *}
{if $FIELD_MODEL->getFieldDataType() eq 'picklist' and $MODULE neq 'Users'}
    {assign var=PICKLIST_COLOR value=Settings_Picklist_Module_Model::getPicklistColorByValue($FIELD_MODEL->getName(), $FIELD_MODEL->get('fieldvalue'))}  
    <span {if !empty($PICKLIST_COLOR)} class="picklist-color" style="background-color: {$PICKLIST_COLOR}; line-height:15px; color: {Settings_Picklist_Module_Model::getTextColor($PICKLIST_COLOR)};" {/if}>
        {**PVTPATCHER-AF98A5BF8F5D5DD8A15C7AFE4C35D257-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=FIELDVAL value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if method_exists('ParsVT_Module_Model', 'FixRTL') && $FIELD_MODEL->getFieldDataType() eq 'string'}{ParsVT_Module_Model::FixRTL($FIELDVAL)}{else}{$FIELDVAL}{/if}
{** REPLACED-AF98A5BF8F5D5DD8A15C7AFE4C35D257// {$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}**}
{**PVTPATCHER-AF98A5BF8F5D5DD8A15C7AFE4C35D257-FINISH**}
    </span>
{else if $FIELD_MODEL->getFieldDataType() eq 'multipicklist' and $MODULE neq 'Users'}
    {assign var=PICKLIST_DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {assign var=MULTI_RAW_PICKLIST_VALUES value=explode('|##|',$FIELD_MODEL->get('fieldvalue'))}
    {assign var=MULTI_PICKLIST_VALUES value=explode(',',$PICKLIST_DISPLAY_VALUE)}
    {foreach item=MULTI_PICKLIST_VALUE key=MULTI_PICKLIST_INDEX from=$MULTI_RAW_PICKLIST_VALUES}
        {assign var=PICKLIST_COLOR value=Settings_Picklist_Module_Model::getPicklistColorByValue($FIELD_MODEL->getName(), trim($MULTI_PICKLIST_VALUE))}
        <span class="picklist-color" {if !empty($PICKLIST_COLOR)} style="background-color: {$PICKLIST_COLOR}; color: {Settings_Picklist_Module_Model::getTextColor($PICKLIST_COLOR)};" {/if}> {trim($MULTI_PICKLIST_VALUES[$MULTI_PICKLIST_INDEX])} </span>
        {if $MULTI_PICKLIST_VALUES[$MULTI_PICKLIST_INDEX+1] neq ''},{/if}
    {/foreach} 
{**PVTPATCHER-DE755DA0A1F2571559E1EDB4691D3338-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{elseif $FIELD_MODEL->getFieldDataType() eq 'date' || $FIELD_MODEL->getFieldDataType() eq 'datetime' || $FIELD_MODEL->get('uitype') eq '14'}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ''}
        <i class="fa fa-calendar icon cf_color_field pull-left" aria-hidden="true"></i>
        <span class="text">{$DISPLAY_VALUE}</span>
    {/if}
{elseif $FIELD_MODEL->getFieldDataType() eq 'percentage'}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ''}
        <div class="percentage_wrapper">
            <span class="percentage_value" style="width: {$DISPLAY_VALUE}%;"></span>
            <span class="text">{$DISPLAY_VALUE}</span>
        </div>
    {/if}
{elseif $FIELD_MODEL->getFieldDataType() eq 'url'}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ''}
        <i class="fa fa-external-link icon cf_color_field pull-left" aria-hidden="true"></i>
        <span class="text">{$DISPLAY_VALUE}</span>
    {/if}
{elseif $FIELD_MODEL->getFieldDataType() eq 'email'}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ''}
        <i class="fa fa-envelope-o icon cf_color_field pull-left" aria-hidden="true"></i>
        <span class="text">{$DISPLAY_VALUE}</span>
    {/if}
{elseif $FIELD_MODEL->get('uitype') eq '4'}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ''}
        <i class="vicon-{$MODULE|lower} icon cf_color_field pull-left" aria-hidden="true" style="font-size: 14px"></i>
        <span class="text">{$DISPLAY_VALUE}</span>
    {/if}
{elseif $FIELD_MODEL->get('uitype') eq '117'}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ''}
        <i class="fa fa-money icon cf_color_field pull-left" aria-hidden="true"></i>
        <span class="text">{vtranslate($DISPLAY_VALUE,"Settings:Currency")}</span>
    {/if}
{elseif $FIELD_MODEL->get('uitype') eq '777'}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ''}
        <i class="fa fa-map-o icon cf_color_field pull-left" aria-hidden="true"></i>
        <a class="text" href="https://maps.google.com?q={$DISPLAY_VALUE}" target="_blank">{$DISPLAY_VALUE}</a>
    {/if}
{elseif $FIELD_MODEL->get('uitype') eq '85'}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ''}
        <i class="fa fa-skype icon cf_color_field pull-left" aria-hidden="true"></i>
        <a class="text" href="skype:{$DISPLAY_VALUE}?call">{$DISPLAY_VALUE}</a>
    {/if}
{elseif $FIELD_MODEL->get('uitype') eq '52' || $FIELD_MODEL->get('uitype') eq '53' || $FIELD_MODEL->get('uitype') eq '77' }
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {ParsVT_Utils_Helper::displayOwnerField($FIELD_MODEL->get('fieldvalue'), $DISPLAY_VALUE)}
{elseif $FIELD_MODEL->getFieldDataType() eq 'reference'}
        {assign var=LISTVIEW_ENTRY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $FIELD_MODEL->get('fieldvalue') neq ""}
        {assign var=URL_REGEX value=preg_match("/module=([0-9A-Za-z]*)/",$LISTVIEW_ENTRY_VALUE,$REFERENCE_RECORD_MODULENAME)}
        {assign var=REFERENCE_RECORD_MODULENAME value=$REFERENCE_RECORD_MODULENAME[1]}
        {if $REFERENCE_RECORD_MODULENAME != ""}
            <i class="vicon-{$REFERENCE_RECORD_MODULENAME|lower} icon cf_color_field pull-left" aria-hidden="true"></i>&nbsp;
        {/if}
        <span class="text">{$LISTVIEW_ENTRY_VALUE}</span>
    {/if}
{elseif $FIELD_MODEL->get('uitype') eq '56'  || $FIELD_MODEL->get('uitype') eq '156'}
    {assign var=ENTRY_RAWVALUE value={$FIELD_MODEL->get('fieldvalue')}}
    {assign var=DISPLAY_VALUE value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if $ENTRY_RAWVALUE==1 || $ENTRY_RAWVALUE=="on"}
        <span class="boolean-true"><i class="fa fa-check-circle pull-left" aria-hidden="true"></i>&nbsp;{$DISPLAY_VALUE}</span>
    {else}
        <span class="boolean-false"><i class="fa fa-times-circle pull-left" aria-hidden="true"></i>&nbsp;{$DISPLAY_VALUE}</span>
    {/if}
{elseif $FIELD_MODEL->get('label') eq 'Currency' || $FIELD_MODEL->get('label') eq 'Language' || $FIELD_MODEL->get('uitype') == '26'}
    {vtranslate($DISPLAY_VALUE, $MODULE)}
{elseif $FIELD_MODEL->getFieldDataType() eq 'currency'}
{** REPLACED-DE755DA0A1F2571559E1EDB4691D3338// {else if $FIELD_MODEL->getFieldDataType() eq 'currency'}**}
{**PVTPATCHER-DE755DA0A1F2571559E1EDB4691D3338-FINISH**}
    {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
    {assign var=SYMBOL_PLACEMENT value=$CURRENT_USER_MODEL->get('currency_symbol_placement')}
    {if ($FIELD_MODEL->get('uitype') eq '72') && ($FIELD_MODEL->getName() eq 'unit_price')}
        {assign var=CURRENCY_SYMBOL value=$BASE_CURRENCY_SYMBOL}
    {else if $FIELD_MODEL->get('uitype') eq '71'}
        {assign var=CURRENCY_INFO value=getCurrencySymbolandCRate($CURRENT_USER_MODEL->get('currency_id'))}
        {assign var=CURRENCY_SYMBOL value=$CURRENCY_INFO['symbol']}
    {/if}
    {if $SYMBOL_PLACEMENT eq '$1.0'}
        {$CURRENCY_SYMBOL}&nbsp;<span class="currencyValue">{$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'))}</span>
    {else}
        <span class="currencyValue">{$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'))}</span>&nbsp;{$CURRENCY_SYMBOL}
    {/if}
{else if  $FIELD_MODEL->get('name') eq 'signature'}
	{decode_html($FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD))}
{else}
    {**PVTPATCHER-AF98A5BF8F5D5DD8A15C7AFE4C35D257-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=FIELDVAL value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
    {if method_exists('ParsVT_Module_Model', 'FixRTL') && $FIELD_MODEL->getFieldDataType() eq 'string'}{ParsVT_Module_Model::FixRTL($FIELDVAL)}{else}{$FIELDVAL}{/if}
{** REPLACED-AF98A5BF8F5D5DD8A15C7AFE4C35D257// {$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}**}
{**PVTPATCHER-AF98A5BF8F5D5DD8A15C7AFE4C35D257-FINISH**}
{/if}

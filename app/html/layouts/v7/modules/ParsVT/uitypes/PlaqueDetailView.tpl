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

{assign var=FIELDVAL value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'), $RECORD->getId(), $RECORD)}
{assign var="PLAQUE_VALUE" value=Vtiger_Plaque_UIType::getPlaqueValue($FIELDVAL)}
{assign var="PLAQUE_LIST" value=Vtiger_Plaque_UIType::getCustomPlaques()}
{if $PLAQUE_VALUE}
    {if isset($PLAQUE_LIST[$PLAQUE_VALUE[1]])}
        {assign var="PLAQUE_IMAGE" value=$PLAQUE_LIST[$PLAQUE_VALUE[1]]['image']}
        {assign var="PLAQUE_COLOR" value=$PLAQUE_LIST[$PLAQUE_VALUE[1]]['color']}
        {assign var="PLAQUE_BGCOLOR" value=$PLAQUE_LIST[$PLAQUE_VALUE[1]]['bgcolor']}
    {else}
        {assign var="PLAQUE_IMAGE" value=$PLAQUE_LIST['O']['image']}
        {assign var="PLAQUE_COLOR" value=$PLAQUE_LIST['O']['color']}
        {assign var="PLAQUE_BGCOLOR" value=$PLAQUE_LIST['O']['bgcolor']}
    {/if}
    <link type="text/css" rel="stylesheet" href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Plaque/Plaque.css" media="all"/>
    <div class="w-middle plaque-pay col-sm-4">
        <div class="form-group">
            <div class="text">
                <label>
                    {vtranslate('Plaque','ParsVT')}
                </label>
            </div>

            <div class="input">
                <div class="Plaque">
                    <div class="in pic1 col-xs-2" style="border: 1px #0b0b0b solid">
                        <img src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Plaque/{$PLAQUE_IMAGE}.png" alt="">
                        <div class="displayPlaque" style="color: #{$PLAQUE_COLOR}; background-color: #{$PLAQUE_BGCOLOR}">
                            {Vtiger_Plaque_UIType::convertNumbers($PLAQUE_VALUE[3])}
                        </div>
                    </div>

                    <div class="in plaque-ins col-xs-8" style="border: 1px #0b0b0b solid">
                        <div class="displayPlaque" style="color: #{$PLAQUE_COLOR}; background-color: #{$PLAQUE_BGCOLOR}; {if $PLAQUE_VALUE[1] eq "D" || $PLAQUE_VALUE[1] eq "S"}direction: ltr{else}direction: rtl{/if}">
                            {if $PLAQUE_VALUE[1] eq "D" || $PLAQUE_VALUE[1] eq "S"}
                                {Vtiger_Plaque_UIType::convertNumbers($PLAQUE_VALUE[0])} {$PLAQUE_VALUE[1]} {Vtiger_Plaque_UIType::convertNumbers($PLAQUE_VALUE[2])}
                            {else}
                                {Vtiger_Plaque_UIType::convertNumbers($PLAQUE_VALUE[2])}{if $PLAQUE_VALUE[1] neq "ژ"} {$PLAQUE_VALUE[1]} {else} <img src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Plaque/disabled.png" alt="" style="width: 25px;"> {/if}{Vtiger_Plaque_UIType::convertNumbers($PLAQUE_VALUE[0])}
                            {/if}
                        </div>
                        <div class="pic2">
                            <img src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Plaque/pelak.png" alt="">
                        </div>

                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
{/if}

{* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** *}
{strip}
    <script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/masked-input/jquery.maskedinput.js"></script>
    <link type="text/css" rel="stylesheet" href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Plaque/Plaque.css" media="all"/>
    {assign var="FIELD_INFO" value=$FIELD_MODEL->getFieldInfo()}
    {assign var="PLAQUEMIDDLECHARS" value=Vtiger_Plaque_UIType::getPlaqueMiddleChars()}
    {assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
    {assign var="PLAQUE_VALUE" value=Vtiger_Plaque_UIType::getPlaqueValue($FIELD_MODEL->get('fieldvalue'))}

    {if (!$FIELD_NAME)}
        {assign var="FIELD_NAME" value=$FIELD_MODEL->getFieldName()}
    {/if}
    <input id="{$MODULE}_editView_fieldName_{$FIELD_NAME}" type="hidden" data-fieldname="{$FIELD_NAME}"
           data-fieldtype="string" class="inputElement {if $FIELD_MODEL->isNameField()}nameField{/if}"
           name="{$FIELD_NAME}" value="{$FIELD_MODEL->get('fieldvalue')}"
           {if !empty($SPECIAL_VALIDATOR)}data-validator="{Zend_Json::encode($SPECIAL_VALIDATOR)}"{/if}
            {if $FIELD_INFO["mandatory"] eq true} data-rule-required="true" {/if}
            {if count($FIELD_INFO['validator'])}
                data-specific-rules='{ZEND_JSON::encode($FIELD_INFO["validator"])}'
            {/if}
    />

    <div class="w-middle plaque-pay col-sm-4">
        <div class="form-group">
            <div class="text">
                <label>
                    {vtranslate('Plaque','ParsVT')}
                </label>
            </div>
            <div class="input">
                <div class="Plaque">
                    <div class="in pic1 col-xs-2">
                        <img src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Plaque/iran.png" alt="">
                        <input type="text" tabindex="4" class="form-control en" dir="ltr" id="{$FIELD_NAME}_plaquePart4"  value="{if $PLAQUE_VALUE}{$PLAQUE_VALUE[3]}{/if}">
                    </div>

                    <div class="in plaque-ins col-xs-3">
                        <input type="text" tabindex="3" class="form-control en" dir="ltr" id="{$FIELD_NAME}_plaquePart3"  value="{if $PLAQUE_VALUE}{$PLAQUE_VALUE[2]}{/if}">
                    </div>

                    <div class="in plaque-ins col-xs-3">
                        <select tabindex="2" class="form-control" id="{$FIELD_NAME}_plaquePart2">
                            <option value="">...</option>
                            {foreach  key=INDEX item=VALUE from=$PLAQUEMIDDLECHARS}
                                <option {if $PLAQUE_VALUE}{if $INDEX eq $PLAQUE_VALUE[1]}selected{/if}{/if} value="{$INDEX}">{$VALUE}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="in plaque-ins col-xs-4">
                        <input type="text" tabindex="1" class="form-control en" dir="ltr" id="{$FIELD_NAME}_plaquePart1" value="{if $PLAQUE_VALUE}{$PLAQUE_VALUE[0]}{/if}">
                        <div class="pic2">
                            <img src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Plaque/pelak.png" alt="">
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#{$FIELD_NAME}_plaquePart4').mask("99", { placeholder: "--" });
            $('#{$FIELD_NAME}_plaquePart1').mask("99", { placeholder: "--" });
            $('#{$FIELD_NAME}_plaquePart3').mask("999", { placeholder: "---" });

            $("#{$FIELD_NAME}_plaquePart1").keyup(function () {
                var char = $(this).val();
                char = char.replace("-", "");
                if (char.length == 2) {
                    updatePlaqueValue('{$FIELD_NAME}');
                    $(this).closest(".in").prev().find("select").focus();
                }
            });

            $("#{$FIELD_NAME}_plaquePart4").keyup(function () {
                var char = $(this).val();
                char = char.replace("-", "");
                if (char.length == 2) {
                    updatePlaqueValue('{$FIELD_NAME}');
                }
            });

            $("#{$FIELD_NAME}_plaquePart2").on("change", function () {
                updatePlaqueValue('{$FIELD_NAME}');
                $(this).closest(".in").prev().find("input").focus();
            });

            $("#{$FIELD_NAME}_plaquePart3").keyup(function () {
                var char = $(this).val();
                char = char.replace("-", "");
                if (char.length == 3) {
                    updatePlaqueValue('{$FIELD_NAME}');
                    $(this).closest(".in").prev().find('input').focus();
                }
            });
            
            function updatePlaqueValue(target) {
                var _plaquePart1 = $("#"+target+"_plaquePart1").val();
                var _plaquePart2 = $("#"+target+"_plaquePart2").val();
                var _plaquePart3 = $("#"+target+"_plaquePart3").val();
                var _plaquePart4 = $("#"+target+"_plaquePart4").val();
                if (_plaquePart3.length == 3 && _plaquePart1.length == 2 && _plaquePart4.length == 2 && _plaquePart2 != ''){
                    $('[name='+target+']').val(_plaquePart1+'-'+_plaquePart2+'-'+_plaquePart3+'-'+_plaquePart4);
                }
            }
        });
    </script>
{/strip}

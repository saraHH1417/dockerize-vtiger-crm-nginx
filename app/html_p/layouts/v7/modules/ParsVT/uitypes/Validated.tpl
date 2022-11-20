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
    {assign var="FIELD_ID" value=$FIELD_MODEL->getId()}
    {assign var="FIELD_PARAMETERS" value=ParsVT_AdvCF_Model::getParameters($FIELD_ID)}
    {if (!$FIELD_NAME)}
        {assign var="FIELD_NAME" value=$FIELD_MODEL->getFieldName()}
    {/if}

    {if (!$MASKEDINPUT)}
        <script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/masked-input/jquery.maskedinput.js"></script>
        {assign var="MASKEDINPUT" value=true}
    {/if}
    <input id="{$MODULE}_editView_fieldName_{$FIELD_NAME}" type="text" data-fieldname="{$FIELD_NAME}"
           data-fieldtype="string" class="inputElement {if $FIELD_MODEL->isNameField()}nameField{/if}"
           name="{$FIELD_NAME}" value="{$FIELD_MODEL->get('fieldvalue')}"
           {if !empty($SPECIAL_VALIDATOR)}data-validator="{Zend_Json::encode($SPECIAL_VALIDATOR)}"{/if}
            {if $FIELD_INFO["mandatory"] eq true} data-rule-required="true" {/if}
           data-rule-{$FIELD_NAME}="true"
            {if count($FIELD_INFO['validator'])}
                data-specific-rules='{ZEND_JSON::encode($FIELD_INFO["validator"])}'
            {/if} />
{/strip}
<script>
    $(document).ready(function () {
        {if $FIELD_PARAMETERS['validation_pattern']}
        jQuery.validator.addMethod("{$FIELD_NAME}", function (value, element) {
            return this.optional(element) || /{$FIELD_PARAMETERS['validation_pattern']}/.test(value);
        }, app.vtranslate("{if $FIELD_PARAMETERS['mask_message']}{$FIELD_PARAMETERS['mask_message']}{else}JS_PLEASE_ENTER_VALID_VALUE{/if}"));
        {/if}
        {if $FIELD_PARAMETERS['input-mask'] && !empty($FIELD_PARAMETERS['input-mask'])}
        $("#{$MODULE}_editView_fieldName_{$FIELD_NAME}").mask("{$FIELD_PARAMETERS['input-mask']}", {
            autoclear: {if !empty($FIELD_PARAMETERS['mask_autoclear']) && $FIELD_PARAMETERS['mask_autoclear'] eq 'on'}true{else}false{/if},
            placeholder: {if !empty($FIELD_PARAMETERS['mask_placeholder'])}'{$FIELD_PARAMETERS['mask_placeholder']}'
            {else}'_'{/if},
            incomplete: function (mask) {
                this.attr('aria-invalid', 'true');
                this.addClass('input-error');
                var msg = app.vtranslate('{if $FIELD_PARAMETERS['mask_message']}{$FIELD_PARAMETERS['mask_message']}{else}JS_PLEASE_ENTER_VALID_VALUE{/if}');
                var params = {};
                params.position = {
                    my: 'bottom left',
                    at: 'top left',
                    container: jQuery("#detailView")
                };
                vtUtils.showValidationMessage(this, msg, params);
                {if !empty($FIELD_PARAMETERS['mask_autoclear']) && $FIELD_PARAMETERS['mask_autoclear'] eq 'on'}
                    if (this.val() == '' || this.attr('data-focustext') == this.val()) {
                        vtUtils.hideValidationMessage(this);
                        this.attr('aria-invalid', 'false');
                        this.val('');
                    }
                {/if}
            },
            completed: function () {
                {if $FIELD_PARAMETERS['validation_pattern']}
                if (/{$FIELD_PARAMETERS['validation_pattern']}/.test(this.val())) {
                    vtUtils.hideValidationMessage(this);
                    this.attr('aria-invalid', 'false');
                }
            {else}
                vtUtils.hideValidationMessage(this);
                this.attr('aria-invalid', 'false');
            {/if}
            }
        });
        {/if}
    });
</script>

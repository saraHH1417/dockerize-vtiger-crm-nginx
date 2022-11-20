{*<!--
/*********************************************************************************
 ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
********************************************************************************/
-->*}
{strip}
    {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
   <div id="finger_{$MODULE}_editView_fieldName_{$FIELD_NAME}">
		<textarea id="finger_{$MODULE}_editView_fieldName_{$FIELD_NAME}_value"
                  class="fieldValue hide inputElement {if $FIELD_MODEL->isNameField()}nameField{/if}" name="{$FIELD_NAME}"
                  {if !empty($SPECIAL_VALIDATOR)}data-validator='{Zend_Json::encode($SPECIAL_VALIDATOR)}'{/if}
                {if $FIELD_INFO["mandatory"] eq true} data-rule-required="true" {/if}
                {if count($FIELD_INFO['validator'])}
                    data-specific-rules='{ZEND_JSON::encode($FIELD_INFO["validator"])}'
                {/if}
		>{$FIELD_MODEL->get('fieldvalue')}</textarea>
        <p>
            <img id="finger_{$MODULE}_editView_fieldName_{$FIELD_NAME}_display" class="img" src="{$FIELD_MODEL->get('fieldvalue')}">
        </p>
        <input id="finger_{$MODULE}_editView_fieldName_{$FIELD_NAME}_delete" type="button" value="{vtranslate('LBL_DELETE','Vtiger')}"
                {if empty($FIELD_MODEL->get('fieldvalue'))} disabled {/if}
               class="btn btn btn-danger btn-delete">
        <input type="button" value="{vtranslate('LBL_ADD','Vtiger')}" class="btn btn-info btn-add">
    </div>
    <script type="text/javascript">
        $("#finger_{$MODULE}_editView_fieldName_{$FIELD_NAME} .btn-add").click(function () {
            var module_futronic = 'Vtiger';
            var field_name_futronic = "finger_{$MODULE}_editView_fieldName_{$FIELD_NAME}";
            var url = "modules/ParsVT/resources/futronic/?module="+module_futronic+"&view=Futronic&field=" + field_name_futronic+"&language={$CURRENT_USER_MODEL->get('language')}" ;
            window.open(url, module_futronic, "width=270,height=400,toolbar=no,menubar=no,location=no,status=no,scrollbars=no,resizable=no,left=822,top=340");
        });
        $("#finger_{$MODULE}_editView_fieldName_{$FIELD_NAME}_delete").click(function () {
            $('#finger_{$MODULE}_editView_fieldName_{$FIELD_NAME}_value').html('');
            $('#finger_{$MODULE}_editView_fieldName_{$FIELD_NAME}_display').attr('src','');
            $(this).attr('disabled',true);
        });
    </script>
{/strip}
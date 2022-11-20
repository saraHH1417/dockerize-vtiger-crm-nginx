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
    <div id="signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}">
		<textarea id="signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_value"
                  class="fieldValue hide inputElement {if $FIELD_MODEL->isNameField()}nameField{/if}"
                  name="{$FIELD_NAME}"
                  {if !empty($SPECIAL_VALIDATOR)}data-validator='{Zend_Json::encode($SPECIAL_VALIDATOR)}'{/if}
                {if $FIELD_INFO["mandatory"] eq true} data-rule-required="true" {/if}
                {if count($FIELD_INFO['validator'])}
                    data-specific-rules='{ZEND_JSON::encode($FIELD_INFO["validator"])}'
                {/if}
		>{$FIELD_MODEL->get('fieldvalue')}</textarea>
        <p>
            <span id="signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg"></span>
            <br>
            <img style="width: 50%;" id="signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_display" class="img"
                 src="{$FIELD_MODEL->get('fieldvalue')}">
        </p>
        <input id="signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_delete" type="button"
               value="{vtranslate('LBL_DELETE','Vtiger')}"
                {if empty($FIELD_MODEL->get('fieldvalue'))} disabled {/if}
               class="btn btn btn-danger btn-delete">
        <input type="button" value="{vtranslate('LBL_ADD','Vtiger')}" class="btn btn-info btn-add">
    </div>
    <script type="text/javascript">
        var websocketSignotec;
        $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg').html('');
        $("#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME} .btn-add").click(function () {
            if (typeof websocketSignotec !== 'undefined') {
                {literal}
                var close = '{"TOKEN_TYPE": "TOKEN_TYPE_REQUEST", "TOKEN_CMD": "TOKEN_CMD_CLOSE_PAD", "TOKEN_PARAM_PAD_INDEX": "0"}';
                {/literal}
                websocketSignotec.send(close);
            }
            var wsUri = "wss://127.0.0.1:49494/";
            websocketSignotec = new WebSocket(wsUri);
            websocketSignotec.onopen = function (ev) {
                websocketSignotec.onmessage = function (ev) {
                    var result = ev.data;
                    var obj = JSON.parse(result);
                    if (obj.TOKEN_CMD_ORIGIN === "TOKEN_CMD_API_DEVICE_OPEN") {
                        if (obj.TOKEN_PARAM_RETURN_CODE == 0) {
                            {literal}
                            var start = '{"TOKEN_TYPE":"TOKEN_TYPE_REQUEST","TOKEN_CMD":"TOKEN_CMD_SIGNATURE_START","TOKEN_PARAM_PAD_ENCRYPTION":"FALSE","TOKEN_PARAM_FIELD_NAME":"امضاء دیجیتال","TOKEN_PARAM_CUSTOM_TEXT":"لطفا تایپ کنید .."}';
                            {/literal}
                            websocketSignotec.send(start);
                            $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg').css('color', 'green');
                            $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg').html("{vtranslate('Starting ...','ParsVT')}");
                        } else {
                            $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg').css('color', 'red');
                            $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg').html("{vtranslate('Unable to connect','ParsVT')}");
                        }
                    }
                    if (obj.TOKEN_CMD === "TOKEN_CMD_SIGNATURE_RETRY") {
                        {literal}
                        var retry = '{"TOKEN_TYPE":"TOKEN_TYPE_REQUEST","TOKEN_CMD":"TOKEN_CMD_SIGNATURE_RETRY"}';
                        websocketSignotec.send(retry);
                        {/literal}
                    }
                    if (obj.TOKEN_CMD === "TOKEN_CMD_SIGNATURE_CANCEL") {
                        {literal}
                        var cancel = '{"TOKEN_TYPE":"TOKEN_TYPE_REQUEST","TOKEN_CMD":"TOKEN_CMD_SIGNATURE_CANCEL"}';
                        websocketSignotec.send(cancel);
                        {/literal}
                        {literal}
                        var close = '{"TOKEN_TYPE": "TOKEN_TYPE_REQUEST", "TOKEN_CMD": "TOKEN_CMD_CLOSE_PAD", "TOKEN_PARAM_PAD_INDEX": "0"}';
                        {/literal}
                        websocketSignotec.send(close);
                    }
                    if (obj.TOKEN_CMD === "TOKEN_CMD_SIGNATURE_CONFIRM") {
                        {literal}
                        var confirm = '{"TOKEN_TYPE":"TOKEN_TYPE_REQUEST","TOKEN_CMD":"TOKEN_CMD_SIGNATURE_CONFIRM"}';
                        websocketSignotec.send(confirm);
                        setTimeout(function () {
                            var img = '{"TOKEN_TYPE": "TOKEN_TYPE_REQUEST", "TOKEN_CMD": "TOKEN_CMD_SIGNATURE_IMAGE", "TOKEN_PARAM_FILE_TYPE": "1", "TOKEN_PARAM_PEN_WIDTH": "0"}';
                            websocketSignotec.send(img);
                            var close = '{"TOKEN_TYPE": "TOKEN_TYPE_REQUEST", "TOKEN_CMD": "TOKEN_CMD_CLOSE_PAD", "TOKEN_PARAM_PAD_INDEX": "0"}';
                            websocketSignotec.send(close);
                        }, 1000);
                        {/literal}
                    }
                    if (obj.TOKEN_CMD_ORIGIN === "TOKEN_CMD_SIGNATURE_IMAGE") {
                        $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg').html('');
                        $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_display').attr('src', 'data:image/png;base64,' + obj.TOKEN_PARAM_FILE);
                        $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_value').text('data:image/png;base64,' + obj.TOKEN_PARAM_FILE);
                        $("#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_delete").removeAttr("disabled");
                    }
                };
                {literal}
                var open = '{"TOKEN_TYPE":"TOKEN_TYPE_REQUEST","TOKEN_CMD":"TOKEN_CMD_API_DEVICE_OPEN","TOKEN_PARAM_INDEX":"0","TOKEN_PARAM_ERASE_DISPLAY":false}';
                {/literal}
                websocketSignotec.send(open);
            };
            websocketSignotec.onclose = function (ev) {
                $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg').css('color', 'red');
                $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_msg').html("{vtranslate('Disconnected','ParsVT')}");
            };
        });
        $("#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_delete").click(function () {
            $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_value').html('');
            $('#signotec_{$MODULE}_editView_fieldName_{$FIELD_NAME}_display').attr('src', '');
            $(this).attr('disabled', true);
        });
    </script>
{/strip}
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
{assign var=CURRENT_USER_ID value=$CURRENT_USER_MODEL->get('id')}
{strip}
    <div id="AsteriskModal" class="modal-dialog  {if $MODE eq 'EDITASTERISKSERVER'}modal-lg{/if}">
    <div class="modal-header">
        <div class="clearfix">
            <div class="pull-right " >
                <button type="button" class="close" aria-label="Close" data-dismiss="modal">
                    <span aria-hidden="true" class='fa fa-close'></span>
                </button>
            </div>
            <h4 class="pull-left">
              {vtranslate($TITLE, $QUALIFIED_MODULE)} {if $name}({$name}){/if}
            </h4>
        </div>
    </div>
        <div class="modal-content">
                <div class="quickCreateContent">
                    {if $MODE eq 'EDITASTERISKSERVER'}
                    {/if}
                    <div class="modal-body " >
                        {if $MODE eq 'EDITASTERISKSERVER'}
                            <div class="alert alert-warning" style="text-align: center">
                                {vtranslate("Notice: The Asterisk server should be accessible through Connector IP address and AMI's read and write permissions must be applied",$QUALIFIED_MODULE)}
                            </div>
                            <form class="form-horizontal" id="editasteriskserver" name="editasteriskserver" method="post" novalidate="novalidate">
                                <input type="hidden" name="id" value="{$PBXMANAGER_RECORD_ID}">
                                <table class="massEditTable table no-border" >
                                    <tr>
                                        {assign var=COUNTER value=0}
                                        {foreach key=FIELD_NAME item=FIELD_MODEL from=$FIELDS}
                                            {if $FIELD_NAME eq 'id' || $FIELD_NAME eq 'webappurl' }
                                                <input type=hidden name="{if  $FIELD_NAME eq 'id'}record{else}{$FIELD_NAME}{/if}" value='{$FIELD_MODEL[1]}' />
                                                {continue}
                                            {/if}
                                            {if $COUNTER eq 2}
                                            </tr><tr>
                                            {assign var=COUNTER value=1}
                                            {else}
                                            {assign var=COUNTER value=$COUNTER+1}
                                            {/if}
                                            <td class='fieldLabel col-lg-2 control-label'>
                                                <label>{if isset($LABELS[$FIELD_NAME])}{vtranslate($LABELS[$FIELD_NAME],$QUALIFIED_MODULE)}{else}{vtranslate($FIELD_NAME|ucfirst,$QUALIFIED_MODULE)}{/if}{if in_array($FIELD_NAME,$REQUIRED)}<span class="redColor">*</span>{/if}
                                                </label>
                                            </td>
                                            <td class="fieldValue col-lg-4">
                                                {if $FIELD_MODEL[0] eq 'select'}
                                                    <select class="inputElement fieldValue select2 {if in_array($FIELD_NAME,$REQUIRED)}required{/if}" style="max-width: 300px" id="{$FIELD_NAME}"  name="{$FIELD_NAME}"   {if in_array($FIELD_NAME,$REQUIRED)}required   data-rule-required="true" data-validation-engine="validate[required]" aria-required="true"{/if}>{${$FIELD_NAME|upper}S}</select>
                                                {elseif $FIELD_MODEL[0] eq 'checkbox'}
                                                    <input name="{$FIELD_NAME}" id="{$FIELD_NAME}" {if {$FIELD_MODEL[1]} eq '1'}checked="checked"{/if} type="checkbox" value="{$FIELD_MODEL[1]}" data-fieldtype="{$FIELD_MODEL[0]}" data-fieldname="{$FIELD_NAME}" data-name="{$FIELD_NAME}"  {if in_array($FIELD_NAME,$REQUIRED)}required data-rule-required="true" data-validation-engine="validate[required]" aria-required="true"{/if}>
                                                {else}
                                                    <input class="inputElement fieldValue {if in_array($FIELD_NAME,$REQUIRED)}required{/if}" id="{$FIELD_NAME}" style="direction: ltr; text-align: left; max-width: 300px" type="{$FIELD_MODEL[0]}"  data-fieldtype="{$FIELD_MODEL[0]}" data-fieldname="{$FIELD_NAME}" data-name="{$FIELD_NAME}" name="{$FIELD_NAME}" value="{$FIELD_MODEL[1]}" data-fieldtype="string" {if in_array($FIELD_NAME,$REQUIRED)}required data-rule-required="true" data-validation-engine="validate[required]" aria-required="true"{/if}>
                                                {/if}
                                                {if isset($EXTRALABELS[$FIELD_NAME])}<span  style="font-size: 80%">
                                                    {if  $FIELD_MODEL[0] neq 'checkbox'}<br />{/if}
                                                    {vtranslate($EXTRALABELS[$FIELD_NAME],$QUALIFIED_MODULE)}</span>{/if}
                                            </td>
                                        {/foreach}
                                    </tr>
                                </table>
                            </form>
                    {elseif $MODE eq 'CHECKASTERISKSERVER'}
                            {if  $RECORD}
                                    <div class="alert alert-{if $RECORD_MODEL['type'] eq "Local Server"}warning{else}info{/if}" style="text-align: center">
                                        {vtranslate("Type",$QUALIFIED_MODULE)}: {vtranslate($RECORD_MODEL['type'], $QUALIFIED_MODULE)}
                                        <br />
                                        {vtranslate("Notice: The Asterisk server should be accessible through Connector IP address and AMI's read and write permissions must be applied",$QUALIFIED_MODULE)}
                                    </div>
                                    <div class="row-fluid">
                                        <div class="col-md-12 alert alert-{$AMI_RESPONSE[0]}">
                                            {vtranslate("Asterisk Server AMI Response:",$QUALIFIED_MODULE)}
                                            <p style="direction: ltr; text-align: left">{$AMI_RESPONSE[1]}</p>
                                        </div>
                                        <div id="wsresponse" class="col-md-12 alert alert-warning">
                                            {vtranslate("Connector WebSocket Response:",$QUALIFIED_MODULE)}
                                            <p id="websocketresponse" style="direction: ltr; text-align: left"></p>
                                        </div>
                                         {if $WSSTATUS}
                                            <div id="wsresponse1" class="col-md-12 alert alert-warning">
                                                {vtranslate("Internal WebSocket Response:",$QUALIFIED_MODULE)}
                                                <p id="websocketresponse1" style="direction: ltr; text-align: left"></p>
                                            </div>
                                        {/if}
                                    </div>
                                {else}
                                    <div class="alert alert-danger" style="text-align: center">
                                        {vtranslate("LBL_RECORD_PERMISSION_DENIED",$QUALIFIED_MODULE)}
                                    </div>
                                {/if}
                        {/if}
                        <div style="clear: both"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <center>
                        {if $MODE eq 'EDITASTERISKSERVER'}
                        <button class="btn btn-success modalSaveButton" type="button" name="saveButton">
                            <strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
                        {/if}
                        <a href="#" class="cancelLink" type="reset"
                           data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
                    </center>
                </div>
        </div>
    </div>
{/strip}
<script>
    {if $MODE eq 'EDITASTERISKSERVER'}
    {literal}
    $(document).ready(function () {
        app.helper.showVerticalScroll(jQuery('.modal-body'), {setHeight: (window.innerHeight - 200) + "px" , autoHideScrollbar: true});
        jQuery("#editasteriskserver").on("change","input,select", function () {
            if ($(this).hasClass('required')) {
                if ($(this).val() != "") {  // If not empty do nothing
                    $(this).removeClass('has-error input-error');
                } else {
                    $(this).addClass('has-error input-error');
                }
            }
        });
        $("#editasteriskserver").submit(function(e){
            return false;
        });

        $(".modalSaveButton").click(function(event){
            var params = {};
            var check = AsteriskCTI_Modules_Js.CheckRequired();
            if (check == false) {
                event.preventDefault();
                return;
            } else {
                var params1 = $('#editasteriskserver').serializeArray();
                for (var i = 0; i < params1.length; i++) {
                    params[params1[i]['name']] = params1[i]['value'];
                }
                event.preventDefault();
                app.helper.showProgress();
                params['module'] = 'ParsVT';
                params['action'] = 'SavePBX';
                params['mode'] = 'saveRecord';
                params['parent'] = 'Settings';
                app.request.post({'data': params}).then(
                    function (err, data) {
                        app.helper.hideProgress();
                        jQuery('.myModal').modal('toggle');
                        if (err === null) {
                            if (data) {
                                app.helper.showSuccessNotification({'message': '{/literal}{vtranslate('Settings Saved successfully!','ParsVT')}{literal}'});
                            } else {
                                app.helper.showErrorNotification({'message': '{/literal}{vtranslate('Unknown Error',$MODULE)}{literal}'});
                            }
                        } else {
                            app.helper.showErrorNotification({'message': err.message});
                        }
                    });
                setTimeout(function () {
                    window.location.reload(1);
                }, 2000);
            }
        });
    });
    $(function() {
        $('#type').change(function(){
            if($('#type').val() == 'Local Server') {
                $('#remoteuri').val("");
            } else {
                AsteriskCTI_Modules_Js.setRemoteURI();
            }
        });
        $('#type').change(function(){
            AsteriskCTI_Modules_Js.setRemoteURI();
        });
        $("#server, #connectorip").on('keyup change', function (){
            AsteriskCTI_Modules_Js.setRemoteURI();
        });
    });
    {/literal}
    {elseif $MODE eq 'CHECKASTERISKSERVER' && $RECORD}
    {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
    {assign var=CURRENT_USER_ID value=$CURRENT_USER_MODEL->get('id')}
    $(document).ready(function () {
        setTimeout(function () {
            app.helper.showVerticalScroll(jQuery('.modal-body'), { setHeight: (window.innerHeight - 200) + "px" , autoHideScrollbar: true });
            AsteriskCTI_Modules_Js.WebSocketTest('{$RECORD_MODEL['connectorip']}', '{$RECORD_MODEL['wsport']}',false);
            {if $WSSTATUS}
            AsteriskCTI_Modules_Js.WebSocketTest('{$WSSERVER}', '{$WSPORT}','{$CURRENT_USER_ID}');
            {/if}
        }, 2000);
    });
    {/if}
</script>
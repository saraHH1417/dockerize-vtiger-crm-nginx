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
{assign var="dateFormat" value=$CURRENT_USER_MODEL->get('date_format')}
{strip}
    <div class="modal-dialog">
    <div class="modal-header">
        <div class="clearfix">
            <div class="pull-right " >
                <button type="button" class="close" aria-label="Close" data-dismiss="modal">
                    <span aria-hidden="true" class='fa fa-close'></span>
                </button>
            </div>
            <h4 class="pull-left">
              {vtranslate('Modify Customer Portal User', $QUALIFIED_MODULE)} {if $name}({$name}){/if}
            </h4>
        </div>
    </div>
        <div class="modal-content">
            <form class="form-horizontal" id="ParsCPUserModify" name="ParsCPUserModify" method="post" novalidate="novalidate">
                <div class="quickCreateContent">
                    <div class="modal-body ">
                        {if $RES}

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('User Name', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-sm-6">
                                <div class="input-group inputElement" style="margin-bottom: 3px">
                                <input type="hidden" name="cprecord" value="{$customerid}">
                                <input type="text" name="cusername" id="cusername" class="span8 inputElement"
                                       maxlength="50" value="{$user_name}"
                                       data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                       data-validator={Zend_Json::encode([['name'=>'cusername']])}>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('LBL_PASSWORD', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-xs-6">
                                <div class="input-group inputElement" style="margin-bottom: 3px">
                                <input type="{if $cryptmode}password{else}text{/if}" name="cppassword" id="cppassword" class="span8 inputElement"
                                       maxlength="50" value="{if !$cryptmode}{$user_password}{/if}"
                                       data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                       data-validator={Zend_Json::encode([['name'=>'cppassword']])}>
                                </div>
                                <div class="input-group inputElemet" style="margin-bottom: 3px">
                                        {vtranslate('If you have not changed the default password, leave this field blank', $QUALIFIED_MODULE)}&nbsp;
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Support Start Date', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-xs-6">
                                <div class="input-group inputElement" style="margin-bottom: 3px">
                                    <input id="Contacts_editView_fieldName_support_start_date" type="text" class="dateField form-control {if $IGNOREUIREGISTRATION}ignore-ui-registration{/if}" data-fieldname="support_start_date" data-fieldtype="date" name="support_start_date" data-date-format="{$dateFormat}"
                                           value="{Vtiger_Date_UIType::getDisplayDateValue($support_start_date)}" {literal}data-validator='[{"name":"lessThanDependentField","params":["support_end_date"]}]'
                                    data-rule-required="true"
                                    data-specific-rules='[{"name":"lessThanDependentField","params":["support_end_date"]}]'{/literal}
                                    data-rule-date="true" />
                                    <span class="input-group-addon"><i class="fa fa-calendar "></i></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Support End Date', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-xs-6">
                                <div class="input-group inputElement" style="margin-bottom: 3px">
                                <input id="Contacts_editView_fieldName_support_end_date" type="text" class="dateField form-control {if $IGNOREUIREGISTRATION}ignore-ui-registration{/if}" data-fieldname="support_end_date" data-fieldtype="date" name="support_end_date" data-date-format="{$dateFormat}"
                                       value="{Vtiger_Date_UIType::getDisplayDateValue($support_end_date)}" {literal}data-validator='[{"name":"greaterThanDependentField","params":["support_start_date"]}]'
                                        data-rule-required="true"
                                        data-specific-rules='[{"name":"greaterThanDependentField","params":["support_start_date"]}]'{/literal}
                                        data-rule-date="true" />
                                <span class="input-group-addon"><i class="fa fa-calendar "></i></span>
                                </div>
                            </div>
                        </div>
                        {else}
                            <div class="form-group">
                                <label class="control-label fieldLabel col-sm-11">
                                    {vtranslate("This contact doesn't have Customer Portal account", $QUALIFIED_MODULE)}&nbsp;
                                </label>
                            </div>
                        {/if}

                    </div>
                </div>
                <div class="modal-footer">
                    <center>
                        {if $RES}
                        <button class="btn btn-success modalSaveCPUserButton" type="button" name="saveButton">
                            <strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
                        {/if}
                        <a href="#" class="cancelLink" type="reset"
                           data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
                    </center>
                </div>
            </form>
        </div>
    </div>
{/strip}
<script>
    {literal}
    $(".modalSaveCPUserButton").click(function(event){
        var params = {};
        var params1 = $('#ParsCPUserModify').serializeArray();
        for (var i = 0; i < params1.length; i++){
            params[params1[i]['name']] = params1[i]['value'];
        }
        event.preventDefault();
        var progressIndicatorElement = jQuery.progressIndicator({
            'message': '',
            'position': 'html',
            'blockInfo': {
                'enabled': true
            }
        });
        params['module'] = 'ParsCPUsers';
        params['action'] = 'ModifyCPUser';
        AppConnector.request(params).then(
            function (data) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
                jQuery('.myModal').modal('toggle');
                if (data.success && data.success == true) {
                    app.helper.showSuccessNotification({'message': data.result});
                } else if (data.error) {
                    app.helper.showErrorNotification({'message': 'Unknown Error'});
                }
            },
            function (error) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
                app.helper.showErrorNotification({'message': 'Unknown Error'});
            }
        );
        setTimeout(function () {
            window.location.reload(1);
        }, 4000);
    });
    {/literal}
</script>
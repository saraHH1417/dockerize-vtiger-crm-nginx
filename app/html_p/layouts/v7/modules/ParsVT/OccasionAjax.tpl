{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{if !class_exists('Vtiger_Datetime_UIType')}
    {include_php file='modules/Vtiger/uitypes/Date.php'}
{/if}
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
                {if $RECORD}
                        {vtranslate('Edit Occasion', $QUALIFIED_MODULE)}
                {else}
                    {vtranslate('Add Occasion', $QUALIFIED_MODULE)}
                {/if}
            </h4>
        </div>
    </div>
        <div class="modal-content">
            <form class="form-horizontal" id="ParsOccasionModify" name="ParsOccasionModify" method="post" novalidate="novalidate">
                <div class="quickCreateContent">
                    <div class="modal-body ">

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Occasional Title', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-sm-6">
                                <div class="input-group inputElement" style="margin-bottom: 3px">
                                <input type="hidden" name="record" value="{$RECORD}">
                                <input type="text" name="title" id="title" class="span8 inputElement"
                                       maxlength="50" value="{$OCCASION['title']}"
                                       data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                       data-validator={Zend_Json::encode([['name'=>'cusername']])}>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Occasional Date', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-xs-6">
                                <div class="input-group inputElement" style="margin-bottom: 3px">
                                    <input type="text" class="dateField form-control" data-fieldname="date" data-fieldtype="date" name="date" data-date-format="{$dateFormat}"
                                           value="{Vtiger_Date_UIType::getDisplayDateValue($OCCASION['date'])}"
                                    data-rule-required="true"
                                    data-rule-date="true" />
                                    <span class="input-group-addon"><i class="fa fa-calendar "></i></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Select as Holiday', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-xs-6">
                                    <input type="hidden" name="holiday" value="{if $OCCASION['holiday'] eq '1'}1{else}0{/if}">
                                    <input class="inputElement" style="width:15px;height:15px;" data-fieldname="holiday" data-fieldtype="checkbox" type="checkbox" name="holiday" {if $OCCASION['holiday'] eq '1'}checked="true"{/if}>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Recurring', $QUALIFIED_MODULE)}&nbsp;
                            </label>
                            <div class="controls col-xs-6">
                                    <input type="hidden" name="recurring" value="{if $OCCASION['recurring'] eq '1'}1{else}0{/if}">
                                    <input class="inputElement" style="width:15px;height:15px;" data-fieldname="recurring" data-fieldtype="checkbox" type="checkbox" name="recurring" {if $OCCASION['recurring'] eq '1'}checked="true"{/if}>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="modal-footer">
                    <center>
                        <button class="btn btn-success modalSaveOccasion" type="button" name="saveButton">
                            <strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
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
    $(".modalSaveOccasion").click(function(event){
        var params = {};
        var params1 = $('#ParsOccasionModify').serializeArray();
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
        params['module'] = 'ParsVT';
        params['action'] = 'PersianPack';
        params['mode'] = 'setOccasion';
        AppConnector.request(params).then(
            function (data) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
                jQuery('.myModal').modal('toggle');
                if (data.success && data.success == true) {
                    app.helper.showSuccessNotification({'message': data.result.message});
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
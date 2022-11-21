{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{assign var=ltr value=array('file','url','browseros','oslanguage')}

{strip}
    <div class="modal-dialog">
        <div class="modal-header">
            <div class="clearfix">
                <div class="pull-right ">
                    <button type="button" class="close" aria-label="Close" data-dismiss="modal">
                        <span aria-hidden="true" class='fa fa-close'></span>
                    </button>
                </div>
                <h4 class="pull-left">
                    {if $TYPE eq 'List'}
                        {vtranslate('Attack Details', $QUALIFIED_MODULE)}
                    {elseif $TYPE eq 'BanList'}
                        {vtranslate('Attack Details', $QUALIFIED_MODULE)}
                    {else}
                        {vtranslate('Add Ban', $QUALIFIED_MODULE)}
                    {/if}
                </h4>
            </div>
        </div>
        <div class="modal-content">
            <div class="quickCreateContent">
                <div class="modal-body form-horizontal">
                    {if $TYPE neq 'AddBan'}
                        {if $RESULT}
                            {foreach key=key item=item from=$RESULT}
                                <div class="form-group">
                                    <label class="control-label fieldLabel col-sm-5">
                                        {vtranslate($key, $QUALIFIED_MODULE)}&nbsp;
                                    </label>
                                    <div class="controls col-xs-6">
                                        <div style="margin-bottom: 3px; word-wrap: break-word; {if in_array($key, $ltr)}direction: ltr; text-align: left{/if}">
                                            {if $key eq 'date'}
                                                {Vtiger_Datetime_UIType::getDisplayDateTimeValue($item)}
                                            {else}
                                                {vtranslate($item, $QUALIFIED_MODULE)}
                                            {/if}
                                            &nbsp;
                                        </div>

                                    </div>
                                </div>
                            {/foreach}
                        {else}
                            <div class="form-group">
                                <label class="control-label fieldLabel col-sm-11">
                                    {vtranslate("LBL_NO_RECORDS_FOUND", $QUALIFIED_MODULE)}&nbsp;
                                </label>
                            </div>
                        {/if}
                    {else}
                    <form class="form-horizontal" id="ParsAddBan" name="ParsAddBan" method="post" novalidate="novalidate">
                    <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('IP Address', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-sm-6">
                                <div class="input-group inputElement" style="margin-bottom: 3px">
                                    <input type="text" name="guardip" id="guardip" class="span8 inputElement"
                                           maxlength="15" required
                                           data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                           data-validator={Zend_Json::encode([['name'=>'guardip']])}>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Reason', $QUALIFIED_MODULE)}&nbsp;
                                <span class="redColor">*</span>
                            </label>
                            <div class="controls col-sm-6">
                                <div style="margin-bottom: 3px">
                                    <textarea rows="5" class="inputElement " name="guardreason" id="guardreason" required></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('Redirect', $QUALIFIED_MODULE)}&nbsp;
                            </label>
                            <div class="controls col-sm-6">
                                <div style="margin-bottom: 3px">
                                    <select class="select2 col-md-4" name="guardredirect" id="guardredirect" style="min-width: 150px;">
                                        <option value="No">{vtranslate('No', $QUALIFIED_MODULE)}</option>
                                        <option value="Yes">{vtranslate('Yes', $QUALIFIED_MODULE)}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-5">
                                {vtranslate('URL', $QUALIFIED_MODULE)}&nbsp;
                            </label>
                            <div class="controls col-sm-6">
                                <div class="input-group inputElement" style="margin-bottom: 3px">
                                    <input style="direction: ltr; text-align: left" type="text" name="guardurl" id="guardurl" class="span8 inputElement"
                                           maxlength="100" required
                                           data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
                                           data-validator={Zend_Json::encode([['name'=>'guardurl']])}>
                                </div>
                            </div>
                        </div>
                    </form>
                    {/if}
                </div>
            </div>
            <div class="modal-footer">
                <center>
                    {if $TYPE neq 'AddBan'}
                        <button class="btn btn-info" type="reset" data-dismiss="modal">
                            <strong>{vtranslate('LBL_OK', "Settings::ModuleManager")}</strong></button>
                    {else}
                    <button class="btn btn-success modalSaveAddBanButton" type="button" name="saveButton">
                        <strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
                    <a href="#" class="cancelLink" type="reset"
                       data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
                    {/if}
                </center>
            </div>
        </div>
    </div>
{/strip}
<script>
    {literal}
    $(".modalSaveAddBanButton").click(function (event) {
        var params = {};
        var params1 = $('#ParsAddBan').serializeArray();
        for (var i = 0; i < params1.length; i++) {
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
        params['module'] = 'ParsGuard';
        params['action'] = 'ActionAjax';
        params['parent'] = 'Settings';
        params['mode'] = 'AddBan';
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
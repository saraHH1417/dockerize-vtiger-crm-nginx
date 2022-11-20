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
    <div class="modal-dialog">
        <div class="modal-header">
            <div class="clearfix">
                <div class="pull-right ">
                    <button type="button" class="close" aria-label="Close" data-dismiss="modal">
                        <span aria-hidden="true" class='fa fa-close'></span>
                    </button>
                </div>
                <h4 class="pull-left">
                        {vtranslate('Test Configuration', $QUALIFIED_MODULE)}
                </h4>
            </div>
        </div>
        <div class="modal-content">
            <div class="quickCreateContent">
                <div class="modal-body form-horizontal">
                    <div class="row form-group">
                        <div class="col-lg-4 control-label fieldLabel">
                            <label>{vtranslate('User Name', 'Users')}</label>
                        </div>
                        <div class="col-lg-4 input-group">
                            <input type="text" class="inputElement" id="ldaptestuser" value="">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-4 control-label fieldLabel">
                            <label>{vtranslate('Password', 'Users')}</label>
                        </div>
                        <div class="col-lg-4 input-group">
                            <input type="password" class="inputElement" id="ldaptestpass" value="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <center>
                    <button class="btn btn-info modalCheckLDAPButton" type="button">
                        <strong>{vtranslate('Check', $MODULE)}</strong></button>
                    <a href="#" class="cancelLink" type="reset"
                       data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
                </center>
            </div>
        </div>
    </div>
{/strip}
<script>
    {literal}
    $(".modalCheckLDAPButton").click(function (event) {
        var params = {};
        var progressIndicatorElement = jQuery.progressIndicator({
            'message': '',
            'position': 'html',
            'blockInfo': {
                'enabled': true
            }
        });
        params['module'] = 'ParsLDAP';
        params['action'] = 'ActionAjax';
        params['parent'] = 'Settings';
        params['mode'] = 'testLDAP';
        params['user_name'] = $('#ldaptestuser').val();
        params['user_password'] = $('#ldaptestpass').val();
        AppConnector.request(params).then(
            function (data) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
                jQuery('.myModal').modal('toggle');
                if (data.success && data.success == true) {
                    if (data.result[0])
                        app.helper.showSuccessNotification({'message': data.result[1]});
                    else
                        app.helper.showErrorNotification({'message': data.result[1]});
                } else if (data.error) {
                    app.helper.showErrorNotification({'message': 'Unknown Error'});
                }
            },
            function (error) {
                progressIndicatorElement.progressIndicator({'mode': 'hide'});
                app.helper.showErrorNotification({'message': 'Unknown Error'});
            }
        );
    });
    {/literal}
</script>
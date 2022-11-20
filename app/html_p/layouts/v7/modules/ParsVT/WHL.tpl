{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
{strip}
<div class=" col-lg-12 col-md-12 col-sm-12">
<h3>{vtranslate('White Label Version Settings',$QUALIFIED_MODULE)}</h3>
</div>
    <div class=" col-lg-12 col-md-12 col-sm-12">
        <input type="hidden" id="supportedImageFormats"
               value='{ZEND_JSON::encode(ParsVT_WhiteLabel_Model::$logoSupportedFormats)}'/>
        <div class="clearfix">
            <div class="btn-group pull-right editbutton-container">
                <button id="updateCompanyDetails"
                        class="btn btn-default ">{vtranslate('LBL_EDIT',$QUALIFIED_MODULE)}</button>
            </div>
        </div>
        {assign var=WIDTHTYPE value=$CURRENT_USER_MODEL->get('rowheight')}
        <div id="CompanyDetailsContainer" class=" detailViewContainer {if !empty($ERROR_MESSAGE)}hide{/if}">
            <div class="block">
                <div>
                    <h4>{vtranslate('LBL_COMPANY_LOGO',$QUALIFIED_MODULE)}</h4>
                </div>
                <hr>
                <div class="blockData">
                    <table class="table detailview-table no-border">
                        <tbody>
                        <tr>
                            <td class="fieldLabel">
                                <div class="companyLogo">
                                    {if $MODULE_MODEL->getLogoPath()}
                                        <img src="{$MODULE_MODEL->getLogoPath()}" class="alignMiddle"
                                             style="max-width:700px;"/>
                                    {else}
                                        {vtranslate('LBL_NO_LOGO_EDIT_AND_UPLOAD', $QUALIFIED_MODULE)}
                                    {/if}
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <div class="block">
                <div>
                    <h4>{vtranslate('LBL_COMPANY_INFORMATION',$QUALIFIED_MODULE)}</h4>
                </div>
                <hr>
                <div class="blockData">
                    <table class="table detailview-table no-border">
                        <tbody>
                        {foreach from=$MODULE_MODEL->getFields() item=FIELD_TYPE key=FIELD}
                            {if $FIELD neq 'logoname' && $FIELD neq 'logo' }
                                <tr>
                                    <td class="{$WIDTHTYPE} fieldLabel" style="width:25%">
                                        <label>{vtranslate($FIELD,$QUALIFIED_MODULE)}</label></td>
                                    <td class="{$WIDTHTYPE}" style="word-wrap:break-word;">
                                        {if $FIELD eq 'status'}
                                            {if $MODULE_MODEL->get($FIELD) eq 1}{vtranslate("Active",$QUALIFIED_MODULE)}{else}{vtranslate("Inactive",$QUALIFIED_MODULE)}{/if}
                                        {else}
                                            {decode_html($MODULE_MODEL->get($FIELD))}
                                        {/if}
                                    </td>
                                </tr>
                            {/if}
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <div class="editViewContainer">
            <form class="form-horizontal {if empty($ERROR_MESSAGE)}hide{/if}" id="updateCompanyDetailsForm"
                  method="post" action="index.php" enctype="multipart/form-data">
                <input type="hidden" name="module" value="ParsVT"/>
                <input type="hidden" name="parent" value="Settings"/>
                <input type="hidden" name="action" value="CDSave"/>
                <input type="hidden" name="type" value="WHL"/>
                <div class="form-group companydetailsedit">
                    <label class="col-sm-2 fieldLabel control-label"> {vtranslate('LBL_COMPANY_LOGO',$QUALIFIED_MODULE)}</label>
                    <div class="fieldValue col-sm-5">
                        <div class="company-logo-content">
                            <img src="{$MODULE_MODEL->getLogoPath()}" class="alignMiddle" style="max-width:700px;"/>
                            <br>
                            <hr>
                            <input type="file" name="logo" id="logoFile"/>
                        </div>
                        <br>
                        <div class="alert alert-info">
                            {vtranslate('LBL_LOGO_RECOMMENDED_MESSAGE',$QUALIFIED_MODULE)}
                        </div>
                    </div>
                </div>
                {foreach from=$MODULE_MODEL->getFields() item=FIELD_TYPE key=FIELD}
                    {if $FIELD neq 'logoname' && $FIELD neq 'logo' }
                        <div class="form-group companydetailsedit">
                            <label class="col-sm-2 fieldLabel control-label ">
                                {vtranslate($FIELD,$QUALIFIED_MODULE)}
                                    <span class="redColor">*</span>
                            </label>
                            <div class="fieldValue col-sm-5">
                                {if $FIELD eq 'website' || $FIELD eq 'supporturl'}
                                    <input type="text" class="inputElement" data-rule-url="true" name="{$FIELD}" value="{$MODULE_MODEL->get($FIELD)}"/>
                               {elseif $FIELD eq 'status'}
                                    <input type="checkbox" value="1" name="{$FIELD}" {if $MODULE_MODEL->get($FIELD) eq 1} checked {/if}/>
                                {else}
                                    <input type="text" data-rule-required="true" class="inputElement" name="{$FIELD}" value="{$MODULE_MODEL->get($FIELD)}"/>
                                {/if}
                            </div>
                        </div>
                    {/if}
                {/foreach}

                <div class="modal-overlay-footer clearfix">
                    <div class="row clearfix">
                        <div class="textAlignCenter col-lg-12 col-md-12 col-sm-12">
                            <button type="submit"
                                    class="btn btn-success saveButton">{vtranslate('LBL_SAVE', $MODULE)}</button>&nbsp;&nbsp;
                            <a class="cancelLink" data-dismiss="modal" href="#">{vtranslate('LBL_CANCEL', $MODULE)}</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
{/strip}
<script type="text/javascript">
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
    var CD_Detail_Js = {
        DeleteID: function () {
            var progressIndicatorElement = jQuery.progressIndicator({
                'message': '',
                'position': 'html',
                'blockInfo': {
                    'enabled': true
                }
            });
            var params = { };
            params['module'] = 'ParsVT';
            params['action'] = 'PersianPack';
            params['mode'] = 'DeleteWHLLogo';
            AppConnector.request(params).then(
                function (data) {
                    progressIndicatorElement.progressIndicator({ 'mode': 'hide'  });
                    if (data.success && data.success == true) {
                        app.helper.showSuccessNotification({ 'message': data.result.message });
                        $('.signIMG').attr('src', '');
                        $('.signDelete').hide();
                    } else if (data.error) {
                        app.helper.showErrorNotification({ 'message': 'Unknown Error' });
                    }
                },
                function (error) {
                    progressIndicatorElement.progressIndicator({ 'mode': 'hide' });
                    app.helper.showErrorNotification({ 'message': 'Unknown Error' });
                }
            );

        },
    };
</script>
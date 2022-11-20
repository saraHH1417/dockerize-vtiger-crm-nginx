<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:0px;">
    <h4>{vtranslate('3CX Settings', $QUALIFIED_MODULE)}</h4>
    <hr>
</div>
<div class="col-lg-12" style="margin-top: 10px">
    {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
    {if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
        <p class="alert alert-warning">
            {vtranslate('PARSVT_PBX_NOTICE', $MODULE)}
        </p>
    {/if}
    {if $PBXMANAGER}
                <table class="table table-bordered blockContainer showInlineTable equalSplit">
                    <thead>
                    <tr class>
                        <th class="" colspan="4">{vtranslate('Manual', $MODULE)}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="fieldLabel medium" style="width: 30%">
                            <label class="muted pull-right marginRight10px">{vtranslate('PBXManager', $MODULE)}</label>
                        </td>
                        <td  class="text-center">
                            <div>
                                <a href="http://license.aweb.co/download/PBX/PBXManager.zip" target="_blank">
                                    {if $PBXMODULE}
                                        {vtranslate("Update PBXManager Module",$QUALIFIED_MODULE)}
                                    {else}
                                        {vtranslate("Download PBXManager Module & Install or Update on VtigerCRM",$QUALIFIED_MODULE)}
                                    {/if}
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel medium" style="width: 30%">
                            <label class="muted pull-right marginRight10px">{vtranslate('3CX Integration', $MODULE)}</label>
                        </td>
                        <td  class="text-center">
                            <div>
                                <a href="https://www.dropbox.com/s/sgsc68rp1cka6g6/ParsVTCRM.xml?dl=0" target="_blank">
                                    {vtranslate("Download 3CX CRM Integration & Install on 3CX Server",$QUALIFIED_MODULE)}
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel medium" style="width: 30%">
                            <label class="muted pull-right marginRight10px">{vtranslate('Need help', $MODULE)}</label>
                        </td>
                        <td  class="text-center">
                            <div>
                                <a href="http://vtfarsi.ir/vtigercrm-3cx-integration-manual/" target="_blank">
                                    {vtranslate("More Information",$QUALIFIED_MODULE)}
                                </a>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>


        <form id="MyModal" class="form-horizontal" action='index.php' method='POST'>
            <input type="hidden" name="module" value="ParsVT"/>
            <input type="hidden" name="action" value="SavePBX"/>
            <input type="hidden" name="parent" value="Settings"/>
            <input type="hidden" name="mode" value="Save3CX"/>
            <div class="blockData">
                <table class="table table-bordered blockContainer showInlineTable equalSplit">
                    <thead>
                    <tr class="active">
                        <th class="" colspan="4"><a href="http://vtfarsi.ir/vtigercrm-3cx-integration-manual/" target="_blank"><img src="layouts/{vglobal('default_layout')}/modules/ParsVT/images/helpinfo.png"></a> &nbsp;{vtranslate('3CX Settings', $MODULE)}</th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach item=FIELD_VALUE key=FIELD_NAME from=$FIELDS}
                        <tr {if $FIELD_NAME eq 'vtigersecretkey' or $FIELD_NAME eq 'webappurl'}class="hide" {/if}>
                            <td class="fieldLabel control-label" style="width:25%">
                                <label>{vtranslate($FIELD_NAME, $MODULE)}</label></td>
                            <td style="word-wrap:break-word;">
                                <input class="inputElement fieldValue"  style="direction: ltr; text-align: left; max-width: 300px" type="{$FIELD_VALUE[0]}"
                                       name="{$FIELD_NAME}" data-rule-required="true"  value="{if $FIELD_NAME eq 'vtigersecretkey'}{if !empty($FIELD_VALUE[1])}{$FIELD_VALUE[1]}{else}{PBXManager_Server_Model::generateVtigerSecretKey()}{/if}{elseif $FIELD_NAME eq 'webappurl'}{vglobal('site_URL')}modules/ParsVT/ws/API/V2/PBX/Simotel/{else}{$FIELD_VALUE[1]}{/if}"/>
                            </td>
                        </tr>
                    {/foreach}

                    <tr id="prefix">
                        <td class="fieldLabel control-label" style="width:25%">{vtranslate('Prefix Dial Number',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium">
                            <input class="inputElement fieldValue" style="direction: ltr; text-align: left; max-width: 300px" type="number" name="prefix" value="{$prefix}">
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel control-label"
                            style="width:25%">{vtranslate('Fix Phone Numbers',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium">
                            <select class="inputElement fieldValue select2" style="max-width: 300px" id="fixnumber"
                                    name="fixnumber">{$Listfixnumber}</select>
                        </td>
                    </tr>
                    <tr id="citycode">
                        <td class="fieldLabel control-label"
                            style="width:25%">{vtranslate('City Code',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium">
                            <input class="inputElement fieldValue"
                                   style="direction: ltr; text-align: left; max-width: 300px" type="number"
                                   name="citycode" value="{$citycode}" required>
                        </td>
                    </tr>
                    <tr id="countrycode">
                        <td class="fieldLabel control-label"
                            style="width:25%">{vtranslate('Country Code',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium">
                            <input class="inputElement fieldValue"
                                   style="direction: ltr; text-align: left; max-width: 300px" type="number"
                                   name="countrycode" value="{$countrycode}" required>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel control-label"
                            style="width:25%">{vtranslate('3CX VtigerCRM URL',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium">
                            <input class="inputElement fieldValue"
                                   style="direction: ltr; text-align: left;" type="text"
                                   value="{rtrim(vglobal('site_URL'),"/")}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel control-label"
                            style="width:25%">{vtranslate('3CX VtigerCRM Username',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium">
                            <input class="inputElement fieldValue"
                                   style="direction: ltr; text-align: left;" type="text"
                                   value="{$CURRENT_USER_MODEL->get('user_name')}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel control-label"
                            style="width:25%">{vtranslate('3CX VtigerCRM Password',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium">
                            <input class="inputElement fieldValue"
                                   style="direction: ltr; text-align: left;" type="text"
                                   value="{$CURRENT_USER_MODEL->get('accesskey')}" readonly>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-overlay-footer clearfix">
                <div class="row clearfix">
                    <div class="textAlignCenter col-lg-12 col-md-12 col-sm-12">
                        <button type="submit"
                                class="btn btn-success saveButton">{vtranslate('LBL_SAVE', $MODULE)}</button>&nbsp;&nbsp;
                    </div>
                </div>
            </div>
        </form>
    {else}
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
            <div class="contents">
                <div class="alert alert-danger"
                     style="text-align: center; margin: 20px 0;">{vtranslate('PBXManager is not active!',$MODULE)}</div>
            </div>
        </div>
    {/if}
</div>
<script>
    jQuery(document).ready(function (e) {
        Vtiger_Index_Js.getInstance().registerEvents();
        displayfixnumber();
        $('#fixnumber').change(function () {
            displayfixnumber();
        });

        function displayfixnumber() {
            if ($('#fixnumber').val() == 'Active') {
                $('#citycode').show();
                $('#countrycode').show();
            } else {
                $('#citycode').hide();
                $('#countrycode').hide();
            }
        }
    });
</script>
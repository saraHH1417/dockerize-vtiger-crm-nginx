{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
{strip}
	{include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
    {if !$CheckParsFax}
        <div class="col-lg-12">
            <br />
            <p class="alert alert-danger text-center">
                {vtranslate("ParsFax module is not avaliable.",$QUALIFIED_MODULE)}</p>
        </div>
    {/if}
    <div class="col-lg-12" style="margin-top: 10px">
        {if $SUCCESS}
            <table class="table table-bordered blockContainer showInlineTable equalSplit">
                <thead>
                <tr class="active">
                    <th class="" colspan="4">{vtranslate('HylaFax Server Information', $MODULE)}</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Message', $MODULE)}</label>
                        </td>
                        <td  class="alert alert-success text-center" colspan="3">
                            <div>
                                {vtranslate({$MESSAGE},$QUALIFIED_MODULE)}
                            </div>
                        </td>
                    </tr>
                    {assign var=COUNTER value=0}
                    {foreach key=LABEL item=VALUE from=$SERVER_INFO}
                    {if $COUNTER%2 eq 0 AND $COUNTER neq 0}
                    </tr>
                    <tr>
                    {/if}
                    <td class="fieldLabel" style="width: 20%">
                        <label class="muted pull-right marginRight10px">{vtranslate($LABEL,$QUALIFIED_MODULE)}</label>
                    </td>
                    <td class="fieldValue" style="width: 30%">
                        <div class="row-fluid"><span class="span10" style="{if $LABEL eq 'HylaFax Status' && $VALUE eq "Running"}color:green{elseif $LABEL eq 'HylaFax Status'}color:red{/if}">
                                    {vtranslate($VALUE,$QUALIFIED_MODULE)}
                            </span></div>
                    </td>
                        {assign var=COUNTER value=$COUNTER+1}
                        {if $VALUE@last &&  $COUNTER%2 neq 0}
                        <td></td>
                        <td></td>
                    {/if}
                    {/foreach}
                    </tr>
                    {if $LINE_NUMBER eq '' || !$LINE_NUMBER|array_key_exists:$ALLLINENUMBER}
                        <tr>
                            <td class="fieldLabel medium">
                                <label class="muted pull-right marginRight10px">{vtranslate('Notification', $MODULE)}</label>
                            </td>
                            <td  class="alert alert-warning text-center" colspan="3">
                                <div>
                                    {vtranslate("Please Select Your Fax Line!",$QUALIFIED_MODULE)}
                                </div>
                            </td>
                        </tr>
                    {/if}

                </tbody>
            </table>
        {else}
            <table class="table table-bordered blockContainer showInlineTable equalSplit">
                <thead>
                <tr class="active">
                    <th class="" colspan="2" style="color:#d9534f">{vtranslate("Error", $MODULE)}</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="fieldLabel medium" style="width: 30%">
                        <label class="muted pull-right marginRight10px">{vtranslate('Error Message', $MODULE)}</label>
                    </td>
                    <td  class="alert alert-warning text-center">
                        <div>
                            {vtranslate({$MESSAGE},$QUALIFIED_MODULE)}
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        {/if}
    </div>
    <div class="col-lg-12">
        <div class="container-fluid editViewContainer">
            <form class="form-horizontal faxConfigInfo" id="faxConfigInfo">
                <input type="hidden" name="module" value="HylaFax">
                <input type="hidden" name="action" value="ActionAjax">
                <input type="hidden" name="mode" value="SaveFaxInfo">
                <input type="hidden" name="parent" value="Settings">
                <br>
                <table class="table table-bordered blockContainer showInlineTable equalSplit">
                    <thead>
                    <tr class="active">
                        <th class="" colspan="4">{vtranslate('HylaFax Settings', $MODULE)}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Protocol', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <select class="inputElement select2 select2-offscreen" id="protocol" name="protocol" dir="ltr" {if $CHECKWEBSERVICE neq false}disabled="disabled"{/if}>
                                <option {if $PROTOCOL eq "HTTP"}selected{/if} value="HTTP">http</option>
                                <option {if $PROTOCOL eq "HTTPS"}selected{/if} value="HTTPS">https</option>
                            </select>
                        </td>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Host IP', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input {if $CHECKWEBSERVICE neq false}disabled="disabled"{/if} id="elastix_ip" type="text" class="input-large listSearchContributor inputElement" name="elastix_ip" value="{$ELASTIX_IP}" placeholder="" dir="ltr"></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Username', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input {if $CHECKWEBSERVICE neq false}disabled="disabled"{/if} id="username" type="text" class="input-large listSearchContributor inputElement" name="username" value="{$USERNAME}" placeholder="" dir="ltr"></span></div>
                        </td>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Password', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input {if $CHECKWEBSERVICE neq false}disabled="disabled"{/if} id="password" type="password" class="input-large listSearchContributor inputElement" name="password" value="{$PASSWORD}" placeholder="" dir="ltr"></span></div>
                        </td>
                    </tr>
                    <tr {if !$CHECKWEBSERVICE}style="display: none" {/if}>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Line Number', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10">
                                                        <select class="inputElement select2 select2-offscreen" name="line_number" id="line_number" dir="ltr" {if $CHECKWEBSERVICE eq false}disabled="disabled" {/if} class="inputElement select2 select2-offscreen">
                                                            <option value="">{vtranslate('Please select at least one option', $MODULE)}</option>
                                                            {foreach $ALLLINENUMBER as $key=>$val}
                                                            <option {if $LINE_NUMBER eq $key}selected{/if} value="{$key}">{$val}</option>
                                                            {/foreach}
                                                        </select>
                                                    </span>
                            </div>
                        </td>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Prefix', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input id="prefix" type="number" class="input-large listSearchContributor inputElement" name="prefix" value="{$PREFIX}" placeholder="" style="max-width: 100px"></span></div>
                        </td>
                    </tr>

                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Fax file mode',$QUALIFIED_MODULE)}</label></td>
                        <td class="fieldValue medium">
                            <select class="inputElement select2 select2-offscreen" name="filemode" id="filemode"
                                    data-validation-engine="validate[ required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]">
                                <option value=""></option>
                                <option {if $FILEMODE eq 'Attach'}selected{/if} value="Attach">{vtranslate('Attach',$QUALIFIED_MODULE)}</option>
                                <option {if $FILEMODE eq 'Link'}selected{/if} value="Link">{vtranslate('Link',$QUALIFIED_MODULE)}</option>
                            </select>

                        </td>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Fix Phone Numbers',$QUALIFIED_MODULE)}</label></td>
                        <td class="fieldValue medium">
                            <select class="inputElement select2 select2-offscreen" id="fixnumber" name="fixnumber">{$Listfixnumber}</select>

                        </td>

                    </tr>

                    <tr id="fixnumbertr"{$DisplayTable}>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Country Code',$QUALIFIED_MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <input style="max-width: 100px" class="inputElement" type="number" name="countrycode" value="{$COUNTRYCODE}" required>
                        </td>
                        <td class="fieldLabel medium">
                            <label class="citycode muted pull-right marginRight10px" {if $FIXNUMBER != "Active"}style="display: none" {/if}>{vtranslate('City Code',$QUALIFIED_MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <input style="max-width: 100px; {if $FIXNUMBER != "Active"}display: none"{/if}" class="citycode inputElement" type="number" name="citycode" value="{$CITYCODE}"  required>
                        </td>

                    </tr>

                    </tbody>
                </table>
                <br>
                <div class="row-fluid">
                    <div class="pull-right">
                        {if $CheckParsFax && !$CheckParsFaxProvider}
                            <button class="btn btn-primary setupProvider" type="button">
                                <strong>{vtranslate('Install ParsFax Provider', $MODULE)}</strong></button>
                        {/if}
                        <button class="btn btn-success setFaxInfo" type="button"><strong>{vtranslate('Save', $MODULE)}</strong></button>
                        {if $CHECKWEBSERVICE neq false}
                            <button class="btn btn-danger revokeFaxInfo" type="button"><strong>{vtranslate('Revoke', $MODULE)}</strong></button>
                            <a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('Cancel', $MODULE)}</a></div>
                        {/if}
                    <div class="clearfix"></div>
                </div>
                <br>
            </form>
        </div>
    </div>
    <script>
        $(function() {
            $('#fixnumber').change(function(){
                if($('#fixnumber').val() == 'Active') {
                    $('#fixnumbertr').show();
                    $('.citycode').show();
                } else {
                    $('#fixnumbertr').hide();
                    $('.citycode').hide();
                }
            });
        });
    </script>
{/strip}

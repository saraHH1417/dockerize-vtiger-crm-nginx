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
    {assign var="dateFormat" value=$USER_MODEL->get('date_format')}
    {assign 'format' ["yyyy-mm-dd"=>"Y-m-d","mm-dd-yyyy"=>"m-d-Y","dd-mm-yyyy"=>"d-m-Y"]}
    <input type="hidden" id="pvt_date_format" value="{$dateFormat}" />
    <input type="hidden" id="pvt_today" value="{Vtiger_Date_UIType::getDisplayValue(date($format[$dateFormat]))}" />

    <div class="col-lg-12" id='FaxListDiv' style="margin-top:10px">
        <div class="container-fluid editViewContainer">
            <form class="form-horizontal faxConfigInfo" id="faxConfigInfo">
                <input type="hidden" name="module" value="HylaFax">
                <input type="hidden" name="action" value="SaveFaxInfo">
                <input type="hidden" name="parent" value="Settings">
                <br>
                <table class="table table-bordered blockContainer showInlineTable equalSplit">
                    <thead>
                    <tr>
                        <th class="blockHeader" colspan="4">{vtranslate('Setting', $MODULE)} HylaFax</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Protocol', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <select class="input-large select2" id="protocol" name="protocol" dir="ltr" {if $ALLLINENUMBER neq false}disabled="disabled"{/if}>
                                <option {if $PROTOCOL eq "HTTP"}selected{/if} value="HTTP">HTTP</option>
                                <option {if $PROTOCOL eq "HTTPS"}selected{/if} value="HTTPS">HTTPS</option>
                            </select>
                        </td>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Host IP', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input {if $ALLLINENUMBER neq false}readonly{/if} id="elastix_ip" type="text" class="input-large " name="elastix_ip" value="{$IP}" placeholder="" dir="ltr"></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Username', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input {if $ALLLINENUMBER neq false}readonly{/if} id="username" type="text" class="input-large " name="username" value="{$USERNAME}" placeholder="" dir="ltr"></span></div>
                        </td>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Password', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input {if $ALLLINENUMBER neq false}readonly{/if} id="password" type="password" class="input-large " name="password" value="{$PASSWORD}" placeholder="" dir="ltr"></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Line Number', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10">
                                                        <select class="input-large select2" name="line_number" id="line_number" dir="ltr" {if $ALLLINENUMBER eq false}disabled="disabled" {/if}>
                                                            <option value="">{vtranslate('Default', $MODULE)}</option>
                                                            {foreach $ALLLINENUMBER as $key=>$val}
                                                            <option {if $LINENUMBER eq $val['key']}selected{/if} value="{$val['key']}">{$val['value']}</option>
                                                            {/foreach}
                                                        </select>
                                                    </span>
                            </div>
                        </td>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Prefix', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input {if $ALLLINENUMBER eq false}readonly{/if} id="prefix" type="number" class="input-large " name="prefix" value="{$PREFIX}" placeholder="" dir="ltr"></span></div>
                        </td>
                    </tr>

                    </tbody>
                </table>
                <br>
                <div class="row-fluid">
                    <div class="pull-right">
                        <button class="btn btn-success setFaxInfo" type="button"><strong>{vtranslate('Save', $MODULE)}</strong></button><button class="btn btn-danger revokeFaxInfo" type="button"><strong>{vtranslate('Revoke', $MODULE)}</strong></button><a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('Cancel', $MODULE)}</a></div>
                    <div class="clearfix"></div>
                </div>
                <br>
            </form>
        </div>
    </div>
{/strip}

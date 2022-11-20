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
    {if $smarty.request.error}
        <div class="col-lg-12">
            <br />
            <p class="alert alert-danger text-center">
                {vtranslate($smarty.request.error,$QUALIFIED_MODULE)}</p>
        </div>
    {/if}
    {if $smarty.request.msg}
        <div class="col-lg-12">
            <br />
            <p class="alert alert-success text-center">
                {vtranslate($smarty.request.msg,$QUALIFIED_MODULE)}</p>
        </div>
    {/if}
    <div class="col-lg-12">
        <div class="container-fluid editViewContainer">
            <form class="form-horizontal faxConfigInfo" id="faxConfigInfo" enctype="multipart/form-data" action="index.php" method="post">
                <input type="hidden" name="module" value="HylaFax">
                <input type="hidden" name="action" value="SendFaxAction">
                <input type="hidden" name="view" value="SendFax">
                <input type="hidden" name="parent" value="Settings">
                <br>
                <table class="table table-bordered blockContainer showInlineTable equalSplit">
                    <thead>
                    <tr class="active">
                        <th class="" colspan="2">{vtranslate('Send Fax', $MODULE)}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Fax Number', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input type="phone" id="numbers" name="numbers" class="inputElement" style="max-width: 300px"></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldLabel medium">
                            <label class="muted pull-right marginRight10px">{vtranslate('Fax File (PDF)', $MODULE)}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input id="file_message" name="file_message" type="file"  accept="application/pdf"></span></div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <br>
                <div class="row-fluid">
                    <div class="pull-right">
                        <button class="btn btn-success setFaxInfo" type="submit"><strong> {vtranslate('Submit Fax', $MODULE)} </strong></button>
                        <a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('LBL_CANCEL', $MODULE)}</a></div>
                    <div class="clearfix"></div>
                </div>
                <br>
            </form>
        </div>
    </div>
{/strip}
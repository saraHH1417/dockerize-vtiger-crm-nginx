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
    {assign  var="date_start" value=$smarty.get.date_start}
    {assign  var="direction" value=$smarty.get.direction}
    {assign  var="offset" value=$smarty.get.offset}
    {assign  var="limit" value=$smarty.get.limit}
    <div class="col-lg-12" id='FaxListDiv' style="margin-top:10px">
        <div class="container-fluid editViewContainer">

            <form id="faxListInfo" action="index.php" method="get">
                <input type="hidden" name="module" value="HylaFax">
                <input type="hidden" name="parent" value="Settings">
                <input type="hidden" name="view" value="FaxList">
                <table class="table table-bordered listViewEntriesTable">
                    <thead>
                    <tr class="listViewHeaders active">
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Date', $MODULE)}</a></th>
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Direction', $MODULE)}</a></th>
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Offset', $MODULE)}</a></th>
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Limit', $MODULE)}</a></th>
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('LBL_ACTIONS', $MODULE)}</a></th>
                    </tr>
                    </thead>
                    <tr>
                        <td class="fieldValue medium">
                            <div class="row-fluid">
                                <span class="span10">
                                    <div class="input-append row-fluid">
                                        <div class="span12 row-fluid date">
                                            <input type="text" id="date_start" class="dateField listSearchContributor inputElement" name="date_start" autocomplete="off" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" value="{$date_start}"/>
                                            <span class="add-on"><i class="icon-calendar"></i></span>
                                        </div>
                                    </div>
                                </span>
                            </div>
                        </td>
                        <td class="fieldValue medium">
                            <select name="direction" id="direction" dir="ltr" class="inputElement select2 select2-offscreen">
                                <option value="">{vtranslate('All', $MODULE)}</option>
                                <option {if {$direction} eq "out"}selected{/if} value="out">{vtranslate('Outgoing', $MODULE)}</option>
                                <option {if {$direction} eq "in"}selected{/if} value="in">{vtranslate('Incoming', $MODULE)}</option>
                            </select>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input id="offset" type="number" class="input-large listSearchContributor inputElement" name="offset" value="{$offset}" placeholder="" dir="ltr"></span></div>
                        </td>
                        <td class="fieldValue medium">
                            <input id="limit" type="number" class="input-large listSearchContributor inputElement" name="limit" value="{if $limit}{$limit}{else}50{/if}" placeholder="" dir="ltr">
                        </td>
                        <td class="fieldValue medium">
                            <input type="submit" class="btn btn_search btn-success" value="{vtranslate('Search', $MODULE)}">
                        </td>

                    </tr>
                </table>
            </form>
            <br>

            <table dir="ltr" class="table table-bordered blockContainer showInlineTable equalSplit" id="faxTable">
                <thead>
                <tr class="active">
                    <th class="">{vtranslate('Id', $MODULE)}</th>
                    <th class="">{vtranslate('Type', $MODULE)}</th>
                    <th class="">{vtranslate('File', $MODULE)}</th>
                    <th class="">{vtranslate('Company Name', $MODULE)}</th>
                    <th class="">{vtranslate('Company Fax', $MODULE)}</th>
                    <th class="">{vtranslate('Fax Destiny', $MODULE)}</th>
                    <th class="">{vtranslate('Fax Date', $MODULE)}</th>
                    <th class="">{vtranslate('Status', $MODULE)}</th>
                    <th class="">{vtranslate('LBL_ACTIONS', $MODULE)}</th>
                </tr>
                </thead>
                <tbody>
                {if $FAXLIST['success']}
                    {foreach $FAXLIST['result'] as $record}
                        <tr>
                            <td class="fieldValue medium">
                                <label class="muted pull-right marginRight10px">{$record['id']}</label>
                            </td>
                            <td class="fieldValue medium">
                                <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['fax_direction']}</span></label></div>
                            </td>

                            <td class="fieldValue medium">
                                <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['pdf_file']}</span></label></div>
                            </td>
                            <td class="fieldValue medium">
                                <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['company_name']}</label></span></div>
                            </td>
                            <td class="fieldValue medium">
                                <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['src_number']}</label></span></div>
                            </td>

                            <td class="fieldValue medium">
                                <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['dest_number']}</label></span></div>
                            </td>
                            <td class="fieldValue medium">
                                <label class="muted pull-right marginRight10px">{$record['date']}</label>
                            </td>
                            <td class="fieldValue medium">
                                <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['status']}</label></span></div>
                            </td>
                            <td class="fieldLabel medium">
                                <span class="btn_deleteFax text-danger" data-id="{$record['id']}"><i class="fa fa-trash"></i></span>&nbsp;&nbsp;&nbsp;
                                <a class="margin0px" href="{$record['url']}"><i class="fa fa-download"></i></a></span>
                            </td>
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td class="fieldLabel medium" colspan="2">
                            <label class="muted pull-right marginRight10px">{vtranslate('Message', $MODULE)}</label>
                        </td>
                        <td  class="alert alert-warning text-center" colspan="7">
                            <div>
                                {vtranslate($FAXLIST['message'],$QUALIFIED_MODULE)}
                            </div>
                        </td>
                    </tr>
                {/if}
                </tbody>
            </table>
        </div>
    </div>
{/strip}

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
    {assign  var="date_start" value=$smarty.get.date_start}
    {assign  var="direction" value=$smarty.get.direction}
    {assign  var="offset" value=$smarty.get.offset}
    {assign  var="limit" value=$smarty.get.limit}
    <input type="hidden" id="pvt_date_format" value="{$dateFormat}" />
    <input type="hidden" id="pvt_today" value="{Vtiger_Date_UIType::getDisplayValue(date($format[$dateFormat]))}" />

    <div class="col-lg-12" id='FaxListDiv' style="margin-top:10px">
        <div class="container-fluid editViewContainer">

            <form id="faxListInfo" action="index.php" method="get">
                <input type="hidden" name="module" value="HylaFax">
                <input type="hidden" name="parent" value="Settings">
                <input type="hidden" name="view" value="FaxList">
                <table class="table table-bordered listViewEntriesTable">
                    <thead>
                    <tr class="listViewHeaders">
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Start Date', $MODULE)}</a></th>
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Direction', $MODULE)}</a></th>
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Offset', $MODULE)}</a></th>
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Limit', $MODULE)}</a></th>
                        <th nowrap><a href="javascript:void(0);" class="listViewHeaderValues" data-nextsortorderval="ASC">{vtranslate('Operate', $MODULE)}</a></th>
                    </tr>
                    </thead>
                    <tr>
                        <td class="fieldValue medium">
                            <div class="row-fluid">
                                <span class="span10">
                                    <div class="input-append row-fluid">
                                        <div class="span12 row-fluid date">
                                            <input type="text" id="date_start" class="dateField" name="date_start" autocomplete="off" data-validation-engine="validate[required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" value="{$date_start}{*{Vtiger_Date_UIType::getDisplayValue($DATE)}*}"/>
                                            <span class="add-on"><i class="icon-calendar"></i></span>
                                        </div>
                                    </div>
                                </span>
                            </div>
                        </td>
                        <td class="fieldValue medium">
                            <select name="direction" id="direction" dir="ltr" class="input-large select2">
                                <option value="">{vtranslate('All', $MODULE)}</option>
                                <option {if {$direction} eq "out"}selected{/if} value="out">{vtranslate('Outgoing', $MODULE)}</option>
                                <option {if {$direction} eq "in"}selected{/if} value="in">{vtranslate('Incoming', $MODULE)}</option>
                            </select>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><input id="offset" type="number" class="input-large " name="offset" value="{$offset}" placeholder="" dir="ltr"></span></div>
                        </td>
                        <td class="fieldValue medium">
                            <input id="limit" type="number" class="input-large " name="limit" value="{$limit}" placeholder="" dir="ltr">
                        </td>
                        <td class="fieldValue medium">
                            <input type="submit" class="btn btn_search" value="{vtranslate('Search', $MODULE)}">
                        </td>

                    </tr>
                </table>
            </form>
            <br>

            <table dir="ltr" class="table table-bordered blockContainer showInlineTable equalSplit" id="faxTable">
                <thead>
                <tr>
                    <th class="blockHeader">{vtranslate('Id', $MODULE)}</th>
                    <th class="blockHeader">{vtranslate('Type', $MODULE)}</th>
                    <th class="blockHeader">{vtranslate('File', $MODULE)}</th>
                    <th class="blockHeader">{vtranslate('Company Name', $MODULE)}</th>
                    <th class="blockHeader">{vtranslate('Company Fax', $MODULE)}</th>
                    <th class="blockHeader">{vtranslate('Fax Destiny', $MODULE)}</th>
                    <th class="blockHeader">{vtranslate('Fax Date', $MODULE)}</th>
                    <th class="blockHeader">{vtranslate('Status', $MODULE)}</th>
                    <th class="blockHeader">{vtranslate('Operate', $MODULE)}</th>
                </tr>
                </thead>
                <tbody dir="ltr">
                {foreach $FAXLIST as $record}
                    <tr>
                        <td class="fieldValue medium">
                            <label class="muted pull-right marginRight10px">{$record['id']}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['type']}</span></label></div>
                        </td>

                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['pdf_file']}</span></label></div>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['company_name']}</label></span></div>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['company_fax']}</label></span></div>
                        </td>

                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['destiny_name']}</label></span></div>
                        </td>
                        <td class="fieldValue medium">
                            <label class="muted pull-right marginRight10px">{if $record['date'] eq null}{$record['date']}{else}{Vtiger_DateTime_UIType::getDisplayValue($record['date'])}{/if}</label>
                        </td>
                        <td class="fieldValue medium">
                            <div class="row-fluid"><span class="span10"><label dir="ltr">{$record['status']}</label></span></div>
                        </td>
                        <td class="fieldLabel medium">
                            <span class="btn_deleteFax" data-id="{$record['id']}"><i class="fa fa-trash"></i></span>&nbsp;&nbsp;&nbsp;
                            <a class="margin0px" href="{$record['url']}"><i class="fa fa-download"></i></a></span>
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/strip}

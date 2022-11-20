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
    <div class="col-lg-12">
        <div class="container-fluid editViewContainer">
                <table class="table table-bordered blockContainer showInlineTable equalSplit text-center" id="requirements" style="text-align: center">
                    <thead>
                    <tr class="active">
                        <th class="text-center" colspan="1">{vtranslate('#', $MODULE)}</th>
                        <th class="text-center" colspan="1">{vtranslate('Description', $MODULE)}</th>
                        <th class="text-center" colspan="3">{vtranslate('Download', $MODULE)}</th>
                    </tr>
                    </thead>
                    <tbody>
                    {assign var=counter value='1'}
                    {foreach item=VALUE key=KEY from=$RUNTIMES}
                    <tr>
                        <td class="fieldValue medium text-center">
                                <span class="span10">{$counter++}</span>
                        </td>
                        <td class="fieldLabel medium text-center" colspan="1">
                           {vtranslate($KEY, $MODULE)}
                        </td>
                        <td class="fieldLabel medium text-center" colspan="3">
                            <a href="{$VALUE[2]}" target="_blank"><i class="fa fa-2x fa-download"></i></a>
                            {if $VALUE[0]}
                                <br />
                                {vtranslate('Please copy & run the following command in asterisk server', $MODULE)}<br />
                                <textarea style="direction: ltr; text-align: left; height: 100px; width: 100%;" readonly>
                                    {$VALUE[1]}
                                </textarea>
                            {/if}
                        </td>

                    </tr>
                    {/foreach}
                    </tbody>
                </table>
        </div>
    </div>
{/strip}

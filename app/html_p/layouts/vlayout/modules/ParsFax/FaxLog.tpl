{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<div class="container-fluid">
    <div class="contents">
        <div class="clearfix"></div>
        <div class="listViewContentDiv" id="listViewContents">
            <div class="listViewEntriesDiv" style="overflow-x:auto;">
                <table class="table table-bordered table-condensed listViewEntriesTable">
                    <thead>
                    <tr class="listViewHeaders">
                        <th nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="providertype">{vtranslate('Id', $MODULE)}</a></th>
                        <th nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="isactive">{vtranslate('Provider Name', $MODULE)}</a></th>
                        <th nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="isactive">{vtranslate('File Name', $MODULE)}</a></th>
                        <th nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="isactive">{vtranslate('Numbers', $MODULE)}</a></th>
                        <th nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="isactive">{vtranslate('File Page Count', $MODULE)}</a></th>
                        <th nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="isactive">{vtranslate('Status', $MODULE)}</a></th>
                        {*<th nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="action">{vtranslate('Options', $MODULE)}</a></th>*}
                    </tr>
                    </thead>
                    <tbody>
                    {if $LISTCOUNT > 0}
                        {foreach item=LogItem from=$LOG}
                            <tr class="listViewEntries">
                                <td class="listViewEntryValue medium" nowrap="">&nbsp;{$LogItem['id']}</td>
                                <td class="listViewEntryValue medium" nowrap="">&nbsp;{$LogItem['provider']}</td>
                                <td class="listViewEntryValue medium" nowrap="">&nbsp;{$LogItem['filename']}</td>
                                <td class="listViewEntryValue medium" nowrap="">&nbsp;{$LogItem['numbers']}</td>
                                <td class="listViewEntryValue medium" nowrap="">&nbsp;{$LogItem['filepagecount']}</td>
                                <td class="listViewEntryValue medium" nowrap="">&nbsp;{$LogItem['status']}</td>
                                {*<td nowrap="" class="medium">*}
                                    {*<div class="pull-right actions"><span class="actionImages">&nbsp;&nbsp;<a  onclick="window.location.replace('index.php?module=ParsFax&parent=Settings&view=FaxLog&action=FaxLogDelete&id={$LogItem["id"]}')"><i class="icon-trash alignMiddle" title="{vtranslate('Delete', $MODULE)}"></i></a></span></div>*}
                                {*</td>*}
                            </tr>
                        {/foreach}
                    {else}
                        <tr>
                            <td colspan="5" align="center" style="text-align:center">
                                {vtranslate('No provider Set', $MODULE)}
                            </td>
                        </tr>

                    {/if}
                    </tbody>
                </table>
                <!--added this div for Temporarily -->
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
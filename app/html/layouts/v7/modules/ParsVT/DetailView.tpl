{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='Head.tpl'|@vtemplate_path:$MODULE}
<div class="listViewPageDiv">
    <div class="container-fluid">
        <div class="row">

            <div class="col-lg-12" style="padding-top: 14px">
                <div class="pull-left">
                    <label>
                        <h3><span class="glyphicon glyphicon-calendar"></span>	{vtranslate("Events on %s (%s)", $MODULE ,$DAY,$DATE)}</h3>
                    </label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">

                <table class="table table-bordered table-striped table-hover table-responsive">
                    <thead>

                        <tr>
                            <th style="width:33.33%">
                                <span class="glyphicon glyphicon-bullhorn"></span> {vtranslate("Solar events", $MODULE)}
                            </th>
                            <th style="width:33.33%">
                                <span class="glyphicon glyphicon-bullhorn"></span> {vtranslate("Hijri events", $MODULE)}
                            </th>
                            <th style="width:33.33%">
                                <span class="glyphicon glyphicon-bullhorn"></span> {vtranslate("World events", $MODULE)}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width:33.33%">
                                   {$JC}
                            </td>
                            <td style="width:33.33%">
                                   {$IC}
                            </td>
                            <td style="width:33.33%">
                                   {$WC}
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>

        <br />
        <div class="row">
            <div class="col-lg-12" style="padding-top: 14px">
                <div class="pull-left">
                    <label>
                        <h3><span class="glyphicon glyphicon-calendar"></span>	{vtranslate("%s Events", $MODULE ,vtranslate($MN, $MODULE))}</h3>
                    </label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <table class="table table-bordered table-striped table-hover table-responsive">
                    <thead>
                        <tr>
                            <th colspan="2">
                                <span class="glyphicon glyphicon-bullhorn"></span> {vtranslate("Events List", $MODULE)}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
               {if $MEXISTS}
                   {foreach item="EVENT" from=$ME}
                        <tr {if $EVENT['today']}style="background-color: #a5e8a5b0;"{/if}>
                            <td style="width:100px">
                                {$EVENT['date']}
                            </td>
                            <td>
                                {$EVENT['desc']}
                            </td>
                        </tr>
                    {/foreach}
               {else}
                        <tr>
                            <td colspan="2">
                              {vtranslate("No events found", $MODULE)}
                            </td>
                        </tr>
               {/if}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
{/strip}
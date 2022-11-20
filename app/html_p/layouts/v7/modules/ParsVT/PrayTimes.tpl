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
<style>
    .Qibla * {
        text-align: center;
    }
    
    .blink_me {
        animation: blinker 3s linear infinite;
        font-weight: bold;
    }
    
    @keyframes blinker {
        50% {
            opacity: 0;
        }
    }
    #listViewContent > div.listViewPageDiv > div > div > div > div > label > h3 > a {
         font-size: inherit;
    }
</style>
<div class="listViewPageDiv">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12" style="padding-top: 14px">
                <div class="pull-left">
                    <label>
                        <h3><span class="glyphicon glyphicon-calendar"></span>	{vtranslate("%s Prayer Timings Today", $MODULE ,$LOCATION)} - {$YEAR[0]}</h3>
                    </label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">

                <table class="table table-bordered table-striped table-hover table-responsive Qibla">
                    <thead>

                        <tr>
                            {foreach item=TITLE from=$HOWGHAT2}
                            <th>
                                <span class="glyphicon glyphicon-bullhorn"></span> {vtranslate($TITLE, $MODULE)}
                            </th>
                            {/foreach}
                            <th>
                                <span class="glyphicon glyphicon-certificate"></span> {vtranslate('Qibla', $MODULE)}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            {foreach item=VALUE from=$TODAYOWGHAT}
                            <td {if $VALUE eq $NEXTSALAH}class="alert alert-warning blink_me"{/if}>
                                {vtranslate($VALUE, $MODULE)}
                            </td>
                            {/foreach}
                            <td>
                                {vtranslate('Cardinal direction:', $MODULE)} {$CDIRECTION}
                                <br />
                                <img src="{ParsVT_Module_Model::getTemplatePath()}resources/Qibla.php?d={$GIBLADIRECTION}&_={uniqid()}" style="max-height: 150px;">
                                <br /> {vtranslate('Qiblah direction is %s degrees from north clocklwise', $MODULE ,$GIBLADIRECTION)}
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-lg-12" style="padding-top: 14px">
                <div class="pull-left">
                    <label>
                        <h3><span class="glyphicon glyphicon-calendar"></span>	{vtranslate("%s Prayer times in %s", $MODULE ,$YEAR[1],$LOCATION)}</h3>
                    </label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <table class="table table-bordered table-striped table-hover table-responsive Qibla">
                    <thead>
                        <tr>
                            {foreach item=TITLE from=$HOWGHAT}
                            <th>
                                {vtranslate($TITLE, $MODULE)}
                            </th>
                            {/foreach}
                        </tr>
                    </thead>
                    <tbody>
                        {foreach item=VALUE key=key from=$OWGHAT} {assign var=COUNTER value=0}
                        <tr {if $EMROOZ eq $key}class="blink_me" style="background-color: #a5e8a5b0;" {/if}>
                            {foreach item=SUBVALUE from=$VALUE}
                            <td {if $COUNTER eq $CalType}style="background-color: #d9edf7;" {/if}>
                                {$SUBVALUE}
                            </td>
                            {assign var=COUNTER value=$COUNTER+1} {/foreach}
                        </tr>

                        {/foreach}

                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
{/strip}
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='SettingsHeader.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<div class="container-fluid">
    <div class="contents">
        {if $ISINSTALLED}
            <form class="form-horizontal"
                  action='index.php?module=ParsGuard&parent=Settings&view=Settings&action=SaveSettings' method='POST'>
                <table class="table table-condensed">
                    <thead>
                    <tr class="blockHeader">
                        <th colspan="2" class="medium">{vtranslate('Guard Settings',$QUALIFIED_MODULE)}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td width="30%" class="medium">{vtranslate('ParsvtGuardStatus',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium"><select id="GuardStatus" class="select2 col-md-4"
                                                             name="GuardStatus">{$ListParsvtGuard}</select></td>
                    </tr>
                    </tbody>
                </table>
                <table id="GuardOptions" class="table table-condensed" {$DisplayTable}>
                    <tbody>
                    <tr>
                        <td width="30%" class="medium">{vtranslate('Proxy',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium"><select class="select2 col-md-4"
                                                             name="PROXY">{$ListParsvtProxy}</select></td>
                    </tr>
                    <tr>
                        <td width="30%" class="medium">{vtranslate('Spam',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium"><select class="select2 col-md-4"
                                                             name="SPAM">{$ListParsvtSpam}</select></td>
                    </tr>
                    <tr>
                        <td width="30%" class="medium">{vtranslate('SQL Injection',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium"><select class="select2 col-md-4"
                                                             name="SQL">{$ListParsvtSQL}</select></td>
                    </tr>
                    <tr>
                        <td width="30%" class="medium">{vtranslate('DDoS',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium"><select class="select2 col-md-4"
                                                             name="DDOS">{$ListParsvtDDoS}</select></td>
                    </tr>
                    <tr>
                        <td width="30%" class="medium">{vtranslate('Auto ban',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium"><select class="select2 col-md-4" name="AUTOBAN">{$AUTOBAN}</select>
                        </td>
                    </tr>
                    <tr>
                        <td width="30%" class="medium">{vtranslate('Number of attacks to ban',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium"><input type="number" name="BANTIMES" value="{$BANTIMES}" required>
                            <small>{vtranslate("A number between 3 and 10000",$QUALIFIED_MODULE)}</small>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="widget_header row-fluid">
                    <div class="span4 btn-toolbar">
                        <div>
                            <button class="btn btn-success saveButton" type="submit" title="{vtranslate("Save",$QUALIFIED_MODULE)}">
                                <strong>{vtranslate("Save",$QUALIFIED_MODULE)}</strong></button>
                        </div>
                    </div>
                </div>
            </form>
        {else}
            <div class="row-fluid">
            <p class="col-lg-12 alert alert-warning text-center">
                {vtranslate("Pars Guard is not installed on the CRM software",$QUALIFIED_MODULE)}<br />
                <a onclick="ParsGuard_Actions_Js.Install();;if (event.stopPropagation){ event.stopPropagation(); } else { event.cancelBubble = true; }"><strong>{vtranslate("Click here to install the firewall",$QUALIFIED_MODULE)}</strong></a><br />
            </p>
            </div>
        {/if}
    </div>
</div>
<script>
    $(function () {
        $('#GuardStatus').change(function () {
            if ($('#GuardStatus').val() == 'Active') {
                $('#GuardOptions').show();
            } else {
                $('#GuardOptions').hide();
            }
        });
    });
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the WebHook ("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is AWEBICT.NET
 * Portions created by AWEBICT.NET. are Copyright(C) AWEBICT.NET.
 * All Rights Reserved.
 * ****************************************************************************** */
-->*} 
<div class="container-fluid">
    <div class="contents">
        <form class="form-horizontal" action='index.php?module=WebHook&parent=Settings&view=Settings&action=SaveSettings' method='POST'>
            <table class="table table-bordered table-condensed themeTableColor">
                <thead>
                    <tr class="blockHeader">
                        <th colspan="2" class="medium">{vtranslate('WebHook Settings', 'WebHook')}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('Sending Method','WebHook')}</td>
                        <td class="row-fluid medium">
                            <select id="status" class="inputbox chzn-select" name="sendingmethod">{$SENDMETHOD}</select>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" class="medium">{vtranslate('Allow to Manually Re-run Launched Webhooks','WebHook')}</td>
                        <td class="row-fluid medium">
                            <select  class="inputbox chzn-select" name="run_manually">{$RUNMANUALLY}</select>
                        </td>
                    </tr>

                </tbody>
            </table>
            <div class="widget_header row-fluid">
                <div class="span4 btn-toolbar">
                    <div>
                        <button class="btn btn-success saveButton" type="submit" title="{vtranslate("Save", "WebHook")}"><strong>{vtranslate("Save", 'WebHook')}</strong></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<div class="container-fluid" style="margin-top:10px;" id="OfflineInfo">
    <h3>{vtranslate('Offline License', $MODULE)}</h3>&nbsp;{vtranslate('Activate, upgrade and manage Offline license', $MODULE)}
    <hr>


    <br/>
    <div class="row-fluid">
        {if !$INTERNET}
            <div class="control-group alert alert-danger">
                <div>
                        <span>
                            {vtranslate('Unable to connect to the internet. This may be a temporary network issue. Check your network and try again. If the problem persists, contact network administrator',$QUALIFIED_MODULE)}
                        </span>
                </div>
            </div>
        {/if}


        <div class="control-group alert alert-warning">
            <div>
                        <span>
                            {vtranslate('OFFLINE_LICENSE_DISCLIMER2',$QUALIFIED_MODULE)}
                        </span>
            </div>
        </div>

        <div id="licenseinfo">
            {$OFFLINEINFO}
        </div>

    </div>

</div>
<script type="text/javascript">
    var PVTErrors = {
        EMPTYLICENSEKEY: "{vtranslate('License Key cannot be empty', $MODULE)}",
        OFFLINEEMPTYLICENSEKEY: "{vtranslate('OFFLINE_LICENSE_DISCLIMER', $MODULE)}",
        INVALIDLICENSEKEY: "{vtranslate('Invalid License Key', $MODULE)}"
    };
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
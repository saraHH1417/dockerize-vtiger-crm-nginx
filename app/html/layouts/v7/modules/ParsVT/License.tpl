{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<div class="container-fluid" style="margin-top:10px;" id="LicenseInfo">
    <h3>{vtranslate('Manage License', $MODULE)}</h3>&nbsp;{vtranslate('Manage all settings related to your license', $MODULE)}
    <hr>


    <br/>
    <div class="row-fluid">

        <div class="control-group alert alert-info">
            <div>
                        <span>
                            {vtranslate('You can reissue your license from our client area without any manual intervention from us',$QUALIFIED_MODULE)}
                        </span>
            </div>
        </div>


        <table class="table table-bordered table-condensed themeTableColor">
            <thead>
            <tr class="blockHeader">
                <th colspan="2" class="mediumWidthType">
                    <span class="alignMiddle">{vtranslate('License Settings', {$QUALIFIED_MODULE})}</span>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td width="25%"><label
                            class="muted pull-right marginRight10px">{vtranslate('License Key:', {$QUALIFIED_MODULE})}
                        <br>
                        <span id="licenseagreement" style="cursor: pointer; color: #5cb85c;">{vtranslate('License agreement',$MODULE)}</span>
                    </label>


                </td>
                <td style="border-left: none;">

                    <div id="divgroup1" class="btn-group pull-left paddingLeft10px">
                        <input type="hidden" id="licensestatus" value="{$result}">
                        <input type="text" id="license_key" name="licensekey" value="{$LICENSEKEY}"
                               {if $result eq "Ok"}disabled="disabled"{/if} required="required"
                               class="inputElement text-left" style="min-width: 300px;">
                        {if $result eq "Ok"}
                            <button id='valid' type='button' class='btn btn-success'>{vtranslate('Valid',$MODULE)} ({vtranslate('Show Information',$MODULE)})</button>
                            <button id='{$inverse}' type='button' class='btn btn-inverse'>{vtranslate($Modify,$MODULE)}</button>
                        {/if}
                        <input value="{vtranslate('Update or Install New Key',$MODULE)}" id="checkkey" name="checkkey"
                               class="btn btn-danger" type="button" style='width: 180px;{if $result eq "Ok"}display:none;{/if}'>
                        {if $OFFLINE}
                        <input id="offlinekey" value="{vtranslate('Convert to Offline License',$MODULE)}" class="btn btn-primary" type="button" style='width: 180px;'>
                        {/if}
                        {if $DONGLE}
                        <input id="usbdongle" value="{vtranslate('Enable Hardware Dongle',$MODULE)}" class="btn btn-{if $OFFLINE}default{else}primary{/if} " type="button" style='width: 180px;'>
                        {/if}
                        {if !$INTERNET}
                            <button class="btn btn-warning" id="activateoffline" type="button" onclick="window.location.href='index.php?module={$QUALIFIED_MODULE}&parent=Settings&view=OfflineActivation'">
                                <strong>{vtranslate('Activate Offline', $QUALIFIED_MODULE)}</strong></button>&nbsp;
                        {/if}
                    </div>

                </td>
            </tr>
            </tbody>
        </table>
        <br/>

        {if !$INTERNET}
            <div class="control-group alert alert-danger">
                <div>
                        <span>
                            {vtranslate('Unable to connect to the internet. This may be a temporary network issue. Check your network and try again. If the problem persists, contact network administrator',$QUALIFIED_MODULE)}
                        </span>
                </div>
            </div>
        {/if}


        <div class="control-group alert alert-warning" style="display:none" id="licwarning">
            <div>
                        <span>
                            {vtranslate('Warning: Entering invalid key causes your module will be deactivate',$QUALIFIED_MODULE)}
                        </span>
            </div>
        </div>

        <div id="licenseinfo">
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
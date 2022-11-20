{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/masked-input/jquery.maskedinput.js"></script>
<div class="container-fluid" style="margin-top:10px;" id="OfflineInfo">
    <h3>{vtranslate('Activate Offline', $MODULE)}</h3>&nbsp;
        {vtranslate('Activate, upgrade and manage Offline license', $MODULE)}
    <hr>


    <br/>
    <div class="row-fluid">
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
            $(".offlineactivationlicensekey").mask("ParsVT-******************", {
                autoclear: true,
                placeholder: '_',
                incomplete: function (mask) {
                    this.attr('aria-invalid', 'true');
                    this.addClass('input-error');
                    var msg = app.vtranslate('JS_PLEASE_ENTER_VALID_VALUE');
                    var params = {};
                    params.position = {
                        my: 'bottom left',
                        at: 'top left',
                        container: jQuery("#detailView")
                    };
                    vtUtils.showValidationMessage(this, msg, params);
                    if (this.val() == '' || this.attr('data-focustext') == this.val()) {
                        vtUtils.hideValidationMessage(this);
                        this.attr('aria-invalid', 'false');
                        this.val('');
                    }
                },
                completed: function () {
                vtUtils.hideValidationMessage(this);
                this.attr('aria-invalid', 'false');
                }
        });
    });
</script>
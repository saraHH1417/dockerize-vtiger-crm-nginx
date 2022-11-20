{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<style>
    {literal}.parsvtbadge_settings_container{margin:0 10% auto}.parsvtbadge_container{margin-top:20px}.parsvtbadge_badge_color{margin:10px;padding:20px}.parsvtbadge_badge_submit{margin:30px}{/literal}
</style>
<div class="col-sm-12 col-xs-12">
    <div class="row">
        <div class="col-lg-12">
            <div class='parsvtbadge_settings_container'>
                {if $smarty.request.saved eq true}
                    <div id='parsvtbadge_settings_notification' class='alert alert-success'
                         style='text-align: center;'>{vtranslate('Settings Successfully Stored', $MODULE)} <i
                                class='fa fa-times-circle-o fa-lg' style='float: right; top: 3px; position: relative;'
                                onclick='jQuery("#parsvtbadge_settings_notification").hide()'></i></div>
                {/if}
                <div class='parsvtbadge_header'>
                    <h2><i class='fa fa-envelope-o fa-lg'> </i> <span
                                style='padding-left: 5px;'> {vtranslate($MODULE_NAME, $MODULE)} </span></h2>
                </div>
                <div class='parsvtbadge_container'>
                    <form action='index.php?module={$MODULE_NAME}&action=SaveSettings' method='POST'
                          name='badge_settings'>
                        <div>
                            <input type='checkbox' name='badge_status' id='badge_status' {$BADGE_STATUS}
                                   style="margin: 0 10px">
                            <label for="badge_status"
                                   style='font-size: 1.5em;'> {vtranslate('Status')} {vtranslate($MODULE_NAME, $MODULE)} </label>
                        </div>
                        <div class='parsvtbadge_badge_color'>
                            <input type='color' name='badge_color' id='badge_color' value='{$BADGE_COLOR}' style="margin: 0 10px">
                            <label for='badge_color' style='float: right;'> {vtranslate('Badge Color', $MODULE)} </label>
                        </div>
                        <div class='parsvtbadge_badge_submit'>
                            <button type='submit' class='btn btn-primary'
                                    onclick='closeColorBox()'> {vtranslate('Save')} </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

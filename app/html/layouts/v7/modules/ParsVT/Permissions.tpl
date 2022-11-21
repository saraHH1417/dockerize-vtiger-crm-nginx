{*<!--
   /* ********************************************************************************
    * The content of this file is subject to the VTFarsi.ir Modules License("License");
    * You may not use this file except in compliance with the License
    * The Initial Developer of the Original Code is VTFarsi.ir
    * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
    * All Rights Reserved.
    * ****************************************************************************** */
-->*}
{strip}
    <div class="modal-dialog">
        <div class="modal-header">
            <div class="clearfix">
                <div class="pull-right ">
                    <button type="button" class="close" aria-label="Close" data-dismiss="modal">
                        <span aria-hidden="true" class='fa fa-close'></span>
                    </button>
                </div>
                <h4 class="pull-left">
                    {vtranslate('Check permissions for required files and folders', $QUALIFIED_MODULE)}
                </h4>
            </div>
        </div>
        <div class="modal-content">
            <div class='form-horizontal'>
                <div class="modal-body ">
                    <div class="form-group" style="margin-bottom: 5px;">
                        <div class="controls col-sm-1"></div>
                        <div class="controls col-sm-3">
                            <span style="font-size:24px;position: relative;bottom: -4px;"></span>{vtranslate('Accessible', $QUALIFIED_MODULE)}
                        </div>
                        <label class="control-label fieldLabel col-sm-7">
                            {vtranslate('Directory Path', $QUALIFIED_MODULE)}
                        </label>

                    </div>
                    {foreach item=HEALTH from=$HEALTHS}
                        <div class="form-group" style="margin-bottom: 0px;">
                            <div class="controls col-sm-1"></div>
                            <div class="controls col-sm-3">
                            <span class="fa {if $HEALTH[1]}fa-check text-success{else}fa-remove text-danger blink_me{/if}"
                                  style="font-size:24px;position: relative;bottom: -4px;"></span>{if !$HEALTH[1]}{vtranslate('LBL_FAILED_PERMISSION', $QUALIFIED_MODULE)}{else}{vtranslate('LBL_TRUE_PERMISSION', $QUALIFIED_MODULE)}{/if}
                            </div>
                            <label class="control-label fieldLabel col-sm-7" style="direction: ltr; text-align: left">
                                {$HEALTH[0]}
                            </label>

                        </div>
                    {/foreach}
                    <div class="form-group" style="margin-top: 15px;">
                        <div class="controls col-sm-1"></div>
                        <div class="controls col-sm-10 alert alert-warning">{vtranslate('If you see an error, some of the files or folders may be unreadable in the above paths', $QUALIFIED_MODULE)}
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <center>
                    <button class="btn btn-info" type="reset" data-dismiss="modal">
                        <strong>{vtranslate('LBL_OK', $MODULE)}</strong></button>
                </center>
            </div>
            </form>
        </div>
    </div>
{/strip}

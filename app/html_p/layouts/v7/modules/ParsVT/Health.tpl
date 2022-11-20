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
                    {vtranslate('Check health of calendar module', $QUALIFIED_MODULE)}
                </h4>
            </div>
        </div>
        <div class="modal-content">
            <div class='form-horizontal'>
                <div class="modal-body " style="min-height: 250px;">
                    {assign var=counter value=1}
                    {foreach item=HEALTH from=$HEALTHS}
                        {if $counter%2 eq 0}
                            <div class="form-group">
                        {/if}
                        <label class="control-label fieldLabel col-sm-3">
                            {vtranslate('Runtime', $QUALIFIED_MODULE)}&nbsp;#{$counter}
                        </label>
                        <div class="controls col-sm-3">
                            <span class="fa {if $HEALTH}fa-check text-success{else}fa-remove text-danger blink_me{/if}"
                                  style="font-size:24px;position: relative;bottom: -4px;"></span>{if !$HEALTH}{vtranslate('Not Installed', $QUALIFIED_MODULE)}{else}{vtranslate('Installed', $QUALIFIED_MODULE)}{/if}
                        </div>
                        {if $counter%2 eq 0}
                            </div>
                        {/if}
                        {assign var=counter value=$counter+1}
                    {/foreach}
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

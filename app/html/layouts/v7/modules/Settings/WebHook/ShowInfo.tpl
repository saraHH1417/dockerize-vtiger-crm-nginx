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
                    {vtranslate('WebHook Details', $QUALIFIED_MODULE)}
                </h4>
            </div>
        </div>
        <div class="modal-content">
            <div class='form-horizontal'>
                <div class="modal-body ">
                    {if !$INFO}
                    <div class="form-group" style="margin-bottom: 5px; text-align: center">
                        <label class="control-label fieldLabel col-sm-11"  style="text-align: center">
                            {vtranslate('No record found', $QUALIFIED_MODULE)}
                        </label>

                    </div>
                    {else}
                    {foreach item=ITEM key=KEY from=$INFO}
                        {assign var=key_name value=ucfirst(str_replace('_',' ',$KEY))}
                        <div class="form-group" style="margin-bottom: 0px;">
                            <div class="controls col-sm-1"></div>
                            <div class="controls col-sm-2">
                                    {vtranslate($key_name, $QUALIFIED_MODULE)}
                            </div>
                            <label class="control-label fieldLabel col-sm-8" style="direction: ltr; text-align: left">
                                {if $KEY eq 'create_date' || $KEY eq 'sent_date'}
                                    {if !empty($ITEM) && $ITEM != '0000-00-00 00:00:00'}
                                    {Vtiger_Datetime_UIType::getDateTimeValue($ITEM)}{/if}
                                {elseif $KEY eq 'type' || $KEY eq 'method'}
                                    {$ITEM|upper}
                                {elseif $KEY eq 'status'}
                                    {if $ITEM eq "Success"}
                                        <span style="color:green">{vtranslate($ITEM,'WebHook')}</span>
                                    {elseif $ITEM eq "Queued"}
                                        <span style="color:darkblue">{vtranslate($ITEM,'WebHook')}</span>
                                    {elseif $ITEM eq "Failed"}
                                        <span style="color:red">{vtranslate($ITEM,'WebHook')}</span>
                                    {else}
                                        {vtranslate($ITEM,'WebHook')}
                                    {/if}
                                {elseif $KEY eq 'logs' || $KEY eq 'request' || $KEY eq 'response'}
                                    <br />
                                    <textarea class='hooktextarea' style="width: 100%" rows="5" readonly>{ZEND_JSON::decode(htmlspecialchars_decode($ITEM))|@print_r:true}</textarea>
                                {else}
                                    {$ITEM}
                                {/if}

                            </label>

                        </div>
                    {/foreach}
                    {/if}
                </div>
            </div>
            <div class="modal-footer">
                <center>
                    <button class="btn btn-info" type="reset" data-dismiss="modal">
                        <strong>{vtranslate('Ok', $MODULE)}</strong></button>
                </center>
            </div>
            </form>
        </div>
    </div>
{/strip}
<script>
    $(document).ready(function() {
        $('.hooktextarea').textareafullscreen({
            overlay: true, // Overlay
            maxWidth: '80%', // Max width
            maxHeight: '80%', // Max height
            key: 'f' // default null, crtl + key to toggle fullscreen
        });
    });
</script>
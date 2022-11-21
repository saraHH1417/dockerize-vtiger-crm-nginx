{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<div class="container-fluid">
	<div class="contents">
<table id="Keys" class="table table-bordered table-condensed themeTableColor" {if $DisplayTable4}style="display:none;"{/if}>
				<tbody>
            <tr><td colspan="2"><textarea id="myCode" name="update" cols="85" rows="4" STYLE="direction:ltr;" READONLY>{vglobal('site_URL')}modules/ReceivedSMS/capture.php?key={$sms_key}&amp;mob=(mobilenumber)&amp;to=(TO)&amp;msg=(smsmessage)
{vtranslate('or',$MODULE)}
{vglobal('site_URL')}receive.php?key={$sms_key}&amp;mob=(mobilenumber)&amp;to=(TO)&amp;msg=(smsmessage)</textarea>
            </td></tr>
            <tr><td colspan="2"><BR />
            <div class="alert alert-info">{vtranslate('for using this feature you need a dedicated recive number and forwarding messages to url in your sms provider',$MODULE)}</div>
            <br />
            <div class="alert alert-warning">
            {vtranslate('Replace text within parenthesis with your desire value.', $MODULE)}<br />
            {vtranslate('also key, mob and msg parameters are required', $MODULE)}<br />
            </div>
            </td></tr>

									</tbody>
			</table>

	
	</div>
</div>
<script>
$(function() {
    {if $accept_sms eq '1'}
    $('#SMSStatus').on('change',function(){
        if($('#SMSStatus').val() == '1') {
            $('#sms_key').show(); 
        } else {
            $('#sms_key').hide(); 
        } 
    });{/if}

});
</script>
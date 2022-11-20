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
		<form class="form-horizontal" action = 'index.php?module=ReceivedSMS&parent=Settings&view=Settings&action=SaveSettings' method = 'POST'>
								<table class="table table-bordered table-condensed themeTableColor">
				<thead>
					<tr class="blockHeader"><th colspan="2" class="medium">{vtranslate('Receive SMS Settings', $MODULE)}</th></tr>
				</thead>
				<tbody>
            <tr><td width="25%" class="medium">{vtranslate('Accept New Incoming SMS',$QUALIFIED_MODULE)}</td><td class="row-fluid medium"><select id="SMSStatus"  data-fieldtype="picklist" class="inputElement select2  select2-offscreen" type="picklist" style="width:200px" name="SMSStatus" >{$ListParsvtSMS}</select></td></tr>
            <tr id="als" {if $accept_sms neq '1'}style="display:none;"{/if}><td width="25%" class="medium">{vtranslate('Accept New Leads via SMS',$QUALIFIED_MODULE)}</td><td class="row-fluid medium"><select id="LeadStatus"  data-fieldtype="picklist" class="inputElement select2  select2-offscreen" type="picklist"   name="LeadStatus"  style="width:200px">{$ListParsvtLEAD}</select></td></tr>
            <tr id="ats" {if $accept_sms neq '1'}style="display:none;"{/if}><td width="25%" class="medium">{vtranslate('Accept Ticket via SMS',$QUALIFIED_MODULE)}</td><td class="row-fluid medium"><select id="HelpDeskStatus"  data-fieldtype="picklist" class="inputElement select2  select2-offscreen" type="picklist"   name="HelpDeskStatus"  style="width:200px">{$ListParsvtTICKET}</select></td></tr>
            <tr id="aas" {if $accept_sms neq '1'}style="display:none;"{/if}><td width="25%" class="medium">{vtranslate('Advanced Mode',$QUALIFIED_MODULE)}</td><td class="row-fluid medium"><select id="AdvModeStatus"  data-fieldtype="picklist" class="inputElement select2  select2-offscreen" type="picklist"   name="AdvModeStatus"  style="width:200px">{$ListParsvtADV}</select></td></tr>
            <tr id="aac" {if $accept_sms neq '1'}style="display:none;"{/if}><td width="25%" class="medium">{vtranslate('Custom URL Mode',$QUALIFIED_MODULE)}</td><td class="row-fluid medium"><select id="CustomStatus" data-fieldtype="picklist" class="inputElement select2  select2-offscreen" type="picklist"    style="width:200px" name="CustomStatus">{$ListCustomMode}</select></td></tr>
									</tbody>
			</table><table id="Keys" class="table table-bordered table-condensed themeTableColor" {if $DisplayTable && $DisplayTable2 && $DisplayTable3 && $DisplayTable4}style="display:none;"{/if}>
				<tbody>
            <tr id="sms_key" {if $accept_sms neq '1'}style="display:none;"{/if}><td width="25%" class="medium">{vtranslate('Accept SMS Key', $MODULE)}</td><td class="row-fluid medium"><input type="text" name="sms_key" value="{$sms_key}" minlength="10" maxlength="15"   class="form-control"  style="width:200px"></td></tr>
									</tbody>
			</table>
<table id="FixSMSNumbers" class="table table-bordered table-condensed themeTableColor" {if $DisplayTable && $DisplayTable2 && $DisplayTable3 && $DisplayTable4}style="display:none;"{/if}>
				<tbody>
            <tr id="fixnumbers" {if $accept_sms neq '1'}style="display:none;"{/if}><td width="25%" class="medium">{vtranslate('Fix Numbers', $MODULE)}</td><td class="row-fluid medium"><select id="fix_numbers"  data-fieldtype="picklist" class="inputElement select2  select2-offscreen" type="picklist"   name="fix_numbers"  style="width:200px">{$ListFixNumbers}</select></td></tr>
            <tr id="city_code" {if $accept_sms neq '1' || $fix_numbers neq '1'}style="display:none;"{/if}><td width="25%" class="medium">{vtranslate('City Code', $MODULE)}</td><td class="row-fluid medium"><input type="number" name="city_code" value="{$city_code}" minlength="2" maxlength="3" placeholder="21"   class="form-control" style="width:200px"></td></tr>
            <tr id="country_code" {if $accept_sms neq '1' || $fix_numbers neq '1'}style="display:none;"{/if}><td width="25%" class="medium">{vtranslate('Country Code', $MODULE)}</td><td class="row-fluid medium"><input type="number" name="country_code" value="{$country_code}" minlength="2" maxlength="3"  placeholder="98"  class="form-control" style="width:200px"></td></tr>
									</tbody>
			</table>


			<div class="widget_header row-fluid">
				<div class="span4 btn-toolbar">
					<div>
						<button class="btn btn-success saveButton" type="submit" title="{vtranslate("Save")}"><strong>{vtranslate("Save", $MODULE)}</strong></button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
$(function() {


    {if $accept_sms eq '1'}
    $('#SMSStatus').on('change',function(){
        if($('#SMSStatus').val() == '1') {
            $('#sms_key').show(); 
            $('#als').show(); 
            $('#ats').show(); 
            $('#aas').show(); 
            $('#aac').show(); 
            $('#FixSMSNumbers').show(); 

        } else {
            $('#sms_key').hide(); 
            $('#als').hide(); 
            $('#ats').hide(); 
            $('#aas').hide(); 
            $('#aac').hide(); 
            $('#FixSMSNumbers').hide(); 
        } 
    });
    $('#fix_numbers').on('change',function(){
        if($('#fix_numbers').val() == '1') {
            $('#country_code').show(); 
            $('#city_code').show(); 
        } else {
            $('#country_code').hide(); 
            $('#city_code').hide(); 
        } 
    });

{/if}


});
</script>
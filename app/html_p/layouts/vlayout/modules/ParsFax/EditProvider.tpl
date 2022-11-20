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
      <div class="row-fluid">
         <div class="col-md-10">
            <h3>{if $RECORD_ID}{vtranslate('Edit Provider', $QUALIFIED_MODULE)}{else}{vtranslate('Add New Provider', $QUALIFIED_MODULE)}{/if}</h3>
         </div>
         <div class="col-md-2"></div>
         <hr>
         <div class="clearfix"></div>
         <div class="listViewContentDiv" id="listViewContents">
            <div class="listViewEntriesDiv">
               <form class="form-horizontal" method="POST">
                  <input type=hidden name="module" value="{$MODULE}" />
                  <input type=hidden name="view" value="Provider" />
                  <input type=hidden name="action" value="Provider" />
                  <input type=hidden name="mode" value="Edit" />
                  {if $RECORD_ID}
                  <input type="hidden" value="{$RECORD_ID}" name="record" id="recordId"/>
                  {/if}
                  <table class="table table-bordered table-condensed themeTableColor">
                     <thead>
                        <tr class="blockHeader">
                           <th colspan="2" class="medium">{vtranslate('Provider Settings', $MODULE)}</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td width="25%" class="medium">{vtranslate('Provider',$QUALIFIED_MODULE)}</td>
                           <td class="row-fluid medium">
				<select class="chzn-select providerType" name="Provider" id="Provider" data-validation-engine="validate[ required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]">
							<option></option>
							{foreach key=PROVIDER_NAME item=PROVIDER_DETAILS from=$providerlist}
								<option value="{$PROVIDER_NAME}" {if $PName eq $PROVIDER_NAME} selected {/if}> 
                                                                {vtranslate($PROVIDER_NAME, $QUALIFIED_MODULE_NAME)} 
                                                                 </option> 
							{/foreach}
						</select>

                        </td>
                        </tr>
                        <tr class="providerstatus"  {if $RECORD_ID}{else}style="display:none;"{/if}>
                        <td width="25%" class="medium">{vtranslate('Status',$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium"><select class="inputbox chzn-select" name="status">{$Status}</select></td>
                        </tr>
                        </tbody>
                        </table>



			{assign var=counter value=0} 					
	         	{foreach key=PROVIDER_NAME item=PROVIDER_DETAILS from=$providerlist}
                               <table id="{$PROVIDER_NAME}" class="table table-bordered table-condensed provider" {if $RECORD_ID}{else}style="display:none;"{/if}><tbody>
                        	{foreach item=ENTRY from=$PROVIDER_DETAILS}
                                
                        <tr>
                        <td width="25%" class="medium">{vtranslate($ENTRY,$QUALIFIED_MODULE)}</td>
                        <td class="row-fluid medium">
			<input type="{if $ENTRY eq 'password'}password{else}text{/if}" name="{$PROVIDER_NAME}[{$ENTRY}]" class="span3" data-validation-engine="validate[required]" value="{$serverparams[$PROVIDER_NAME][$counter]}" />
                        </td>
                        </tr>
                                {assign var=counter value=$counter+1} 					
                                {/foreach}
                        	</tbody></table>
                        {/foreach}


			<div class="widget_header row-fluid">
				<div class="span4 btn-toolbar">
					<div>
						<button class="btn btn-success saveButton" type="submit" title="{vtranslate("Save")}" {if $RECORD_ID}{else}style="display:none;"{/if}><strong>{vtranslate("Save", $MODULE)}</strong></button>
                                                <a class="cancelLink" onclick="window.location.replace('index.php?module=ReceivedSMS&parent=Settings&view=Provider')" type="reset">{vtranslate('Cancel', $MODULE)}</a>
					</div>
				</div>
			</div>


               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
$(function() {
    $('#Provider').on('change',function(){
        var provider = $('#Provider').val(); 
            $('.provider').hide(); 
            $('.providerstatus').show(); 
            $('.saveButton').show(); 
            $('#'+provider).show(); 
    });
});
</script>
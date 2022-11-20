<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:0px;">
	<h4>{vtranslate('Analog Connector Settings', $QUALIFIED_MODULE)}</h4>
	<hr>
</div>
<div class="col-lg-12" style="margin-top: 10px">
	{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
	{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
		<p class="alert alert-warning">
			{vtranslate('PARSVT_PBX_NOTICE', $MODULE)}
		</p>
	{/if}
	{if $PBXMANAGER}
			<table class="table table-bordered blockContainer showInlineTable equalSplit">
				<thead>
				<tr class>
					<th class="" colspan="4">{vtranslate('Manual', $MODULE)}</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="fieldLabel medium" style="width: 30%">
						<label class="muted pull-right marginRight10px">{vtranslate('PBXManager', $MODULE)}</label>
					</td>
					<td  class="alert alert-{if $PBXMODULE}success{else}danger{/if} text-center">
						<div>
							<a href="http://license.aweb.co/download/PBX/PBXManager.zip" target="_blank">
								{if $PBXMODULE}
									{vtranslate("Update PBXManager Module",$QUALIFIED_MODULE)}
								{else}
									{vtranslate("Download PBXManager Module & Install or Update on VtigerCRM",$QUALIFIED_MODULE)}
								{/if}
							</a>
						</div>
					</td>
				</tr>
				<tr>
					<td class="fieldLabel medium">
						<label class="muted pull-right marginRight10px">{vtranslate("More Information",$QUALIFIED_MODULE)}</label>
					</td>
					<td  class="alert alert-{$TYPESTATUS[$analogtype][1]} text-center" colspan="3">
						<div>
							{$TYPESTATUS[$analogtype][0]}
							<br />
							<a href="https://vtfarsi.ir" target="_blank">
								{vtranslate("To view the manual & installation guide, refer to the VTFarsi website",$QUALIFIED_MODULE)}
							</a>
						</div>
					</td>
				</tr>
				</tbody>
			</table>


		<form id="MyModal" class="form-horizontal" action='index.php' method='POST'>
			<input type="hidden" name="module" value="ParsVT"/>
			<input type="hidden" name="action" value="SavePBX"/>
			<input type="hidden" name="parent" value="Settings"/>
			<input type="hidden" name="mode" value="Analog"/>
			<div class="blockData">
				<table class="table table-bordered blockContainer showInlineTable equalSplit">
					<thead>
					<tr class="active">
						<th class="" colspan="4"><img src="layouts/{vglobal('default_layout')}/modules/ParsVT/images/helpinfo.png"> &nbsp;{vtranslate('Analog Connector Settings', $MODULE)}</th>
					</tr>
					</thead>
					<tbody>
					<tr><td width="30%" class="fieldLabel control-label">{vtranslate('Connector Status',$QUALIFIED_MODULE)}</td><td class="row-fluid medium">
							<select id="analogstatus" class="inputElement fieldValue select2" name="analogstatus" style="max-width: 300px">
								<option value="Active" class="picklistColor_primary" {if $analogstatus eq "Active"}selected{/if}>{vtranslate('Active',$QUALIFIED_MODULE)}</option>
								<option value="Inactive" class="picklistColor_danger" {if $analogstatus neq "Active"}selected{/if}>{vtranslate('Inactive',$QUALIFIED_MODULE)}</option>
							</select>
						</td></tr>
					<tr><td width="30%" class="fieldLabel control-label">{vtranslate('Connector Type',$QUALIFIED_MODULE)}</td><td class="row-fluid medium"><select id="analogtype" class="inputElement fieldValue select2" name="analogtype" style="max-width: 300px">{$ListTypes}</select></td></tr>
					<tr id="recordingurl"><td width="30%" class="fieldLabel control-label">{vtranslate('Recording URL Template',$QUALIFIED_MODULE)}</td><td class="row-fluid medium">
							<input class="inputElement fieldValue"  style="direction: ltr; text-align: left; max-width: 300px" type="url" placeholder="http://recording_server_name/download.php?file=" name="analogdlserver" value="{$analogdlserver}">
						</td></tr>
					<tr  id="popup"><td width="30%" class="fieldLabel control-label">{vtranslate('Call Popup Users',$QUALIFIED_MODULE)}</td><td class="row-fluid medium">
							{assign var=ALL_ACTIVEUSER_LIST value=$USER_MODEL->getAccessibleUsers()}
							{assign var=ALL_ACTIVEGROUP_LIST value=$USER_MODEL->getAccessibleGroups()}
							{assign var=ACCESSIBLE_USER_LIST value=$USER_MODEL->getAccessibleUsersForModule($MODULE)}
							{assign var=ACCESSIBLE_GROUP_LIST value=$USER_MODEL->getAccessibleGroupForModule($MODULE)}
							<select class="inputElement fieldValue select2 {$ASSIGNED_USER_ID}" data-validation-engine="validate required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" data-name="{$ASSIGNED_USER_ID}" name="analogpopupusers[]" data-fieldinfo='{$FIELD_INFO}'  multiple  style="max-width: 300px">
								<optgroup label="{vtranslate('LBL_USERS')}">
									{foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEUSER_LIST}
										<option value="{$OWNER_ID}" data-picklistvalue= '{$OWNER_NAME}'{foreach item=USER from=$FIELD_VALUE}{if $USER eq $OWNER_ID } selected {/if}{/foreach}
												{if array_key_exists($OWNER_ID, $ACCESSIBLE_USER_LIST)} data-recordaccess=true {else} data-recordaccess=false {/if}
												data-userId="{$CURRENT_USER_ID}">
											{$OWNER_NAME}
										</option>
									{/foreach}
								</optgroup>
								<optgroup label="{vtranslate('LBL_GROUPS')}">
									{foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEGROUP_LIST}
										<option value="{$OWNER_ID}" data-picklistvalue= '{$OWNER_NAME}' {foreach item=USER from=$FIELD_VALUE}{if $USER eq $OWNER_ID } selected {/if}{/foreach}
												{if array_key_exists($OWNER_ID, $ACCESSIBLE_GROUP_LIST)} data-recordaccess=true {else} data-recordaccess=false {/if} >
											{vtranslate($OWNER_NAME)}
										</option>
									{/foreach}
								</optgroup>
							</select>
							<small>{vtranslate("This item specifies for which users Popup will be shown",$QUALIFIED_MODULE)}</small></td></tr>
					</tr>
					<tr id="prefix">
						<td class="fieldLabel control-label" style="width:25%">{vtranslate('Prefix Dial Number',$QUALIFIED_MODULE)}</td>
						<td class="row-fluid medium">
							<input class="inputElement fieldValue" style="direction: ltr; text-align: left; max-width: 300px" type="number" name="prefix" value="{$prefix}">
						</td>
					</tr>
					<tr>
					<td class="fieldLabel control-label" style="width:25%">{vtranslate('Fix Phone Numbers',$QUALIFIED_MODULE)}</td>
					<td class="row-fluid medium">
					<select class="inputElement fieldValue select2" style="max-width: 300px" id="fixnumber" name="fixnumber">{$Listfixnumber}</select>
					</td>
					</tr>
					<tr id="citycode">
					<td class="fieldLabel control-label" style="width:25%">{vtranslate('City Code',$QUALIFIED_MODULE)}</td>
					<td class="row-fluid medium">
					<input class="inputElement fieldValue" style="direction: ltr; text-align: left; max-width: 300px" type="number" name="citycode" value="{$citycode}" required>
					</td>
					<tr id="countrycode">
						<td class="fieldLabel control-label"
							style="width:25%">{vtranslate('Country Code',$QUALIFIED_MODULE)}</td>
						<td class="row-fluid medium">
							<input class="inputElement fieldValue" style="direction: ltr; text-align: left; max-width: 300px" type="number" name="countrycode" value="{$countrycode}" required>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-overlay-footer clearfix">
				<div class="row clearfix">
					<div class="textAlignCenter col-lg-12 col-md-12 col-sm-12">
						<button type="submit"
								class="btn btn-success saveButton">{vtranslate('LBL_SAVE', $MODULE)}</button>&nbsp;&nbsp;
					</div>
				</div>
			</div>
		</form>
	{else}
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
			<div class="contents">
				<div class="alert alert-danger"
					 style="text-align: center; margin: 20px 0;">{vtranslate('PBXManager is not active!',$MODULE)}</div>
			</div>
		</div>
	{/if}
</div>
<script>
	jQuery(document).ready(function (e) {
		Vtiger_Index_Js.getInstance().registerEvents();
		displayfixnumber();
		displayrelatedrows();
		$('#fixnumber').change(function () {
			displayfixnumber();
		});
		$('#analogtype').change(function () {
			displayrelatedrows();
		});

		function displayrelatedrows() {
			var analogdevice = ["Satel", "Telsa", "Taksa", "PosCallerId"];
			if (analogdevice.includes($('#analogtype').val())) {
				$('#popup').show();
				$('#recordingurl').show();
				$('#prefix').hide();
			} else if ($('#analogtype').val() == 'CallTracker') {
				$('#popup').hide();
				$('#recordingurl').hide();
				$('#prefix').hide();
			} else if ($('#analogtype').val() == 'Generic') {
				$('#popup').hide();
				$('#recordingurl').hide();
				$('#prefix').show();
			}
		}
		function displayfixnumber() {
			if ($('#fixnumber').val() == 'Active') {
				$('#citycode').show();
				$('#countrycode').show();
			} else {
				$('#citycode').hide();
				$('#countrycode').hide();
			}
		}
	});
</script>
<style type="text/css">
	.picklistColor_primary {
		color: #004085 !important;
		background-color: #cce5ff !important;
	}
	.picklistColor_danger {
		color: #721c24 !important;
		background-color: #f8d7da !important;
	}
</style>
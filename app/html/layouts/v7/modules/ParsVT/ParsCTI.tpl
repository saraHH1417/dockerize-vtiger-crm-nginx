<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:0px;">
	<h4>{vtranslate('PanasonicCTI', $QUALIFIED_MODULE)} - {vtranslate('Connector Settings', $QUALIFIED_MODULE)}</h4>
	<hr>
</div>
<div class="col-lg-12" style="margin-top: 10px">
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
				</tbody>
			</table>

		{assign var=MDLS value=$MODULES_LIST}
		{assign var=SELECTED_FIELDS value=array()}
		{assign var=MANDATORY_FIELDS value=array()}
		<form id="AsteriskCTIForm" class="form-horizontal" action='index.php' method='POST'>
			<input type="hidden" name="module" value="ParsVT"/>
			<input type="hidden" name="action" value="SavePBX"/>
			<input type="hidden" name="parent" value="Settings"/>
			<input type="hidden" name="mode" value="ParsCTI"/>
			<div class="blockData">
				<table class="table table-bordered blockContainer showInlineTable equalSplit">
					<thead>
					<tr class="active">
						<th class="" colspan="4"><img src="layouts/{vglobal('default_layout')}/modules/ParsVT/images/helpinfo.png"> &nbsp;{vtranslate('Connector Settings', $MODULE)}</th>
					</tr>
					</thead>
					<tbody>
					<tr><td width="30%" class="fieldLabel control-label">{vtranslate('Connector Status',$QUALIFIED_MODULE)}</td><td class="row-fluid medium">
							<input name="analogstatus" id="analogstatus" data-type="analogstatus" style="opacity: 0;" {if $analogstatus neq 1} value='0' {else} value='1' checked{/if}
								   class='cursorPointer bootstrap-switch' type="checkbox"
								   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
								   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
								   data-on-color="primary" data-toggle="toggle"/>
						</td></tr>
					{if $analogstatus eq "1"}
						<tr>
							<td class="fieldLabel control-label"
								style="width:25%">
								{vtranslate('MODULES LIST',$QUALIFIED_MODULE)} <br/>
								<span style="font-size: 80%">
                                {vtranslate('Modules List for Search Phone Fields in PBXManager',$QUALIFIED_MODULE)}
                                </span>
							</td>
							<td class="row-fluid medium">
								{vtranslate('LBL_CHOOSE_COLUMNS',$QUALIFIED_MODULE)} {vtranslate('(Max 5) :', $QUALIFIED_MODULE)}
								<br>
								<select name="MODULESLIST[]"
										data-placeholder="{vtranslate('LBL_ADD_MORE_COLUMNS',$MODULE)}" multiple
										class="inputElement columnsSelect" id="viewColumnsSelect">
									<optgroup label='{vtranslate('MODULES LIST', $SOURCE_MODULE)}'>
										{foreach item=NAME from=$LISTMODULES}
											<option value="{$NAME}"   data-field-name="{$FIELD_NAME}" {if in_array($NAME, $MDLS)} selected {/if}>{vtranslate($NAME, $NAME)}
											</option>
										{/foreach}
									</optgroup>
								</select>
							</td>
						</tr>
						<tr id="popuptime">
							<td class="fieldLabel control-label"
								style="width:25%">{vtranslate('Popup Duration (second)',$QUALIFIED_MODULE)}
							</td>
							<td class="row-fluid medium">
								<input class="inputElement fieldValue" style="direction: ltr; text-align: left; max-width: 300px" type="number"  name="popup_time" value="{$POPUPTIME}">
							</td>
						</tr>
						<tr>
							<td class="fieldLabel control-label"
								style="width:25%">{vtranslate('Popup Request Interval (second)',$QUALIFIED_MODULE)}
							</td>
							<td class="row-fluid medium">
								<input class="inputElement fieldValue" style="direction: ltr; text-align: left; max-width: 300px" type="number"  name="popup_interval" value="{$POPUPINTERVAL}">
							</td>
						</tr>
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
							<td class="fieldLabel control-label"  style="width:25%">
								{vtranslate('Fix Phone Numbers',$QUALIFIED_MODULE)}
							</td>
							<td class="row-fluid medium">
								<input name="fixnumber" id="fixnumber" data-type="fixnumber" style="opacity: 0;" {if $fixnumber neq 1} value='0' {else} value='1' checked{/if}
									   class='cursorPointer bootstrap-switch' type="checkbox"
									   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
									   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
									   data-on-color="primary" data-toggle="toggle"/>
							</td>
						</tr>
						<tr id="citycode">
							<td class="fieldLabel control-label"
								style="width:25%">{vtranslate('City Code',$QUALIFIED_MODULE)}</td>
							<td class="row-fluid medium">
								<input class="inputElement fieldValue"
									   style="direction: ltr; text-align: left; max-width: 300px" type="number"
									   name="citycode" value="{$citycode}" required>
							</td>
						</tr>
						<tr id="countrycode">
							<td class="fieldLabel control-label"
								style="width:25%">{vtranslate('Country Code',$QUALIFIED_MODULE)}</td>
							<td class="row-fluid medium">
								<input class="inputElement fieldValue"
									   style="direction: ltr; text-align: left; max-width: 300px" type="number"
									   name="countrycode" value="{$countrycode}" required>
							</td>
						</tr>
						<tr>
							<td class="fieldLabel control-label"  style="width:25%">
								{vtranslate('PBXManager Widgets on Dashboard',$QUALIFIED_MODULE)}
							</td>
							<td class="row-fluid medium">
								<input name="PBXManagerWidgets"
									   data-type="PBXManagerWidgets"
									   style="opacity: 0;" {if $PBXManagerWidgets neq 1} value='0' {else} value='1' checked{/if}
									   class='cursorPointer bootstrap-switch' type="checkbox"
									   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
									   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
									   data-on-color="primary" data-toggle="toggle"/>
							</td>
						</tr>
						<tr>
							<td class="fieldLabel control-label"  style="width:25%">
								{vtranslate('Call Simulator Widget',$QUALIFIED_MODULE)}
							</td>
							<td class="row-fluid medium">
								<input name="CallSimulator"
									   data-type="CallSimulator"
									   style="opacity: 0;" {if $CallSimulator neq 1} value='0' {else} value='1' checked{/if}
									   class='cursorPointer bootstrap-switch' type="checkbox"
									   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
									   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
									   data-on-color="primary" data-toggle="toggle"/>
							</td>
						</tr>
						<tr>
							<td class="fieldLabel control-label"  style="width:25%">
								{vtranslate('Use WebSocket',$QUALIFIED_MODULE)}
								<br />
								<a href="https://license.aweb.co/download/PBX/SocketServer.zip" target="_blank" style="font-size: 80%">{vtranslate('Download SocketServer Software',$QUALIFIED_MODULE)}</a>

							</td>
							<td class="row-fluid medium">
								<input name="socket_active" id="socket_active"
									   data-type="socket_active"
									   style="opacity: 0;" {if !$SOCKET_ACTIVE} value='0' {else} value='1' checked{/if}
									   class='cursorPointer bootstrap-switch' type="checkbox"
									   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
									   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
									   data-on-color="primary" data-toggle="toggle"/>
							</td>
						</tr>
						<tr id="wshost">
							<td class="fieldLabel control-label"
								style="width:25%">{vtranslate('PBXManager WebSocket Host',$QUALIFIED_MODULE)}
								<span style="font-size: 80%"><br />
                                {vtranslate('This hostname used in PBXManager for call popup inside CRM',$QUALIFIED_MODULE)}
                                </span>
							</td>
							<td class="row-fluid medium">
								<input class="inputElement fieldValue" style="direction: ltr; text-align: left; max-width: 300px" type="text"  name="wshost" value="{$WSHOST}">
							</td>
						</tr>
						<tr id="wsport">
							<td class="fieldLabel control-label"
								style="width:25%">{vtranslate('PBXManager WebSocket Port',$QUALIFIED_MODULE)}
								<span style="font-size: 80%"><br />
                                {vtranslate('This port number used in PBXManager  for call popup inside CRM',$QUALIFIED_MODULE)}
                                </span>
							</td>
							<td class="row-fluid medium">
								<input class="inputElement fieldValue" style="direction: ltr; text-align: left; max-width: 300px" type="number"  name="wsport" value="{$WSPORT}">
							</td>
						</tr>
						<tr>
							<td width="30%" class="fieldLabel control-label">{vtranslate('PBX Model',$QUALIFIED_MODULE)}</td>
							<td class="row-fluid medium"><select id="pbxmodel" class="inputElement fieldValue select2" style="max-width: 300px">{$ListTypes}</select></td>
						</tr>
						<td class="fieldLabel control-label"
							style="width:25%">{vtranslate('Panasonic API URL',$QUALIFIED_MODULE)}</td>
						<td class="row-fluid medium">
							<input id="baseurl" type="hidden" value="{vglobal('site_URL')}modules/ParsVT/ws/API/V2/PBX/Panasonic/ProcessCDR/" >
							<input class="inputElement fieldValue"  id="apiurl" style="direction: ltr; text-align: left;" type="text" value="" readonly>
						</td>
						</tr>
						<td class="fieldLabel control-label"
							style="width:25%">{vtranslate('vtigersecretkey',$QUALIFIED_MODULE)}</td>
						<td class="row-fluid medium">
							<input class="inputElement fieldValue"
								   style="direction: ltr; text-align: left;" type="text"
								   value="{$SECRETKEY}" readonly>
						</td>
						</tr>
					{/if}
					</tbody>
				</table>
			</div>
			<br /><br /><br />
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
<input type="hidden" id="targetmode" value="{$smarty.get.mode}">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:0px;">
    <h4>{vtranslate($ASTERISKCTI_TITLE, $MODULE)}</h4><br>
    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
        <li id="ParsGeneralSettings"><a
                    href="index.php?module={$MODULE}&view=AsteriskCTI&parent=Settings&mode=GeneralSettings">{vtranslate('General Settings', $MODULE)}</a>
        </li>
        <li id="ParsConnectorSettings"><a
                    href="index.php?module={$MODULE}&parent=Settings&view=AsteriskCTI&mode=ConnectorSettings">{vtranslate('Connector Settings', $MODULE)}</a>
        </li>
        <li id="ParsManual"><a href="index.php?module={$MODULE}&parent=Settings&view=AsteriskCTI&mode=Manual">{vtranslate('Manual', $MODULE)}</a>
        </li>
    </ul>
</div>
{if $MODE eq 'GENERAL'}
    <div class="col-lg-12" style="margin-top: 20px">
        {assign var=MDLS value=$MODULES_LIST}
        {assign var=SELECTED_FIELDS value=array()}
        {assign var=MANDATORY_FIELDS value=array()}
        {if $PBXMANAGER}
            <table class="table table-bordered blockContainer showInlineTable equalSplit">
                <thead>
                <tr class>
                    <th class="" colspan="4">{vtranslate('PBXManager', $MODULE)}</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="fieldLabel medium" style="width: 30%">
                        <label class="muted pull-right marginRight10px">{vtranslate('PBXManager', $MODULE)}</label>
                    </td>
                    <td class="alert alert-{if $PBXMODULE}success{else}danger{/if} text-center">
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
            <form id="AsteriskCTIForm" class="form-horizontal" action='index.php' method='POST'>
                <input type="hidden" name="module" value="ParsVT"/>
                <input type="hidden" name="action" value="SavePBX"/>
                <input type="hidden" name="parent" value="Settings"/>
                <input type="hidden" name="mode" value="Asterisk"/>
                <input type="hidden" id="columnslist" name="columnslist" value='{ZEND_JSON::encode($SELECTED_FIELDS)}'/>
                <input type="hidden" id="selectedColumnsList" name="selectedColumnsList"  value='{ZEND_JSON::encode($MDLS)}'/>
                <div class="blockData">
                    <table class="table table-bordered blockContainer showInlineTable equalSplit">
                        <thead>
                        <tr class="active">
                            <th class="" colspan="4">{vtranslate('Asterisk General Settings', $MODULE)}</th>
                        </tr>
                        </thead>
                        <tbody>
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
                        <tr id="prefix">
                            <td class="fieldLabel control-label"
                                style="width:25%">{vtranslate('Prefix Dial Number',$QUALIFIED_MODULE)}</td>
                            <td class="row-fluid medium">
                                <input class="inputElement fieldValue"
                                       style="direction: ltr; text-align: left; max-width: 300px" type="number"
                                       name="prefix" value="{$prefix}">
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldLabel control-label"  style="width:25%">
                                {vtranslate('Fix Phone Numbers',$QUALIFIED_MODULE)}
                            </td>
                            <td class="row-fluid medium">
                                <input name="fixnumber" id="fixnumber"
                                       data-type="fixnumber"
                                       style="opacity: 0;" {if $fixnumber neq 1} value='0' {else} value='1' checked{/if}
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
                            <td colspan="2">
                               <br /><br />
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
{elseif $MODE eq 'CONNECTOR'}
    <div class="col-lg-12" style="margin-top: 20px">
        {if $PBXMANAGER}
            <div class="listview-actions-container">
                <div class="row">
                    <div class=" col-md-3">
                        <button onclick="javascript:AsteriskCTI_Modules_Js.showEditAsteriskModal('');" id="ASTERISK_LBL_ADD_RECORD" type="button" class="btn addButton btn-default module-buttons" ><div class="fa fa-plus" aria-hidden="true"></div>&nbsp;&nbsp;{vtranslate('LBL_ADD_RECORD','Vtiger')}</button>
                    </div>
                    <div class=" col-md-6"></div>
                    <div class=" col-md-3">
                        <div class="btn-group pull-right">
                            {assign var="NextPageNumber" value=$PAGE_NUMBER+1}
                            {assign var="PreviousPageNumber" value=$PAGE_NUMBER-1}
                            <button type="button" id="PreviousPageButton" class="btn btn-default" {if $PAGE_NUMBER <= 1 || $TOTAL_PAGES == 1}disabled=""{else} onclick="app.helper.showProgress(); window.location.href='index.php?module={$MODULE}&parent={$smarty.request.parent}&view={$smarty.request.view}&mode={$smarty.request.mode}&page={$PreviousPageNumber}'" {/if}><i class="fa fa-caret-left"></i></button>
                            <button type="button" id="NextPageButton" class="btn btn-default" {if $PAGE_NUMBER >= $TOTAL_PAGES || $TOTAL_PAGES <= 1 }disabled=""{else}onclick="app.helper.showProgress(); window.location.href='index.php?module={$MODULE}&parent={$smarty.request.parent}&view={$smarty.request.view}&mode={$smarty.request.mode}&page={$NextPageNumber}'"{/if}><i class="fa fa-caret-right"></i></button>
                        </div>
                        <div class="listview-pagenum pageNumbers  pull-right" style="position:relative;top:7px;">
                            <span>{vtranslate('LBL_PAGE',$moduleName)}</span>&nbsp;
                            <strong><span>{$PAGE_NUMBER}</span></strong>&nbsp;
                            <span>{vtranslate('LBL_OF',$moduleName)}</span>&nbsp;
                            <strong><span>{$TOTAL_PAGES}</span></strong>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div id="table-content" class="table-container" style="padding-top:0px !important;">
                <table id="listview-table" class="table listview-table">
                    <thead>
                    <tr class="listViewContentHeader">
                        <th style="width:25%">{vtranslate('LBL_ACTIONS', $MODULE)}</th>
                        <th nowrap=""><a class="listViewHeaderValues cursorPointer">{vtranslate('Asterisk IP', $MODULE)}</a>&nbsp;</th>
                        <th nowrap=""><a class="listViewHeaderValues cursorPointer">{vtranslate('AMI Username', $MODULE)}</a>&nbsp;</th>
                        <th nowrap=""><a class="listViewHeaderValues cursorPointer">{vtranslate('AMI Port', $MODULE)}</a>&nbsp;</th>
                        <th nowrap=""><a class="listViewHeaderValues cursorPointer">{vtranslate('Connector IP', $MODULE)}</a>&nbsp;</th>
                        <th nowrap=""><a class="listViewHeaderValues cursorPointer">{vtranslate('Type', $MODULE)}</a>&nbsp;</th>
                        <th nowrap=""><a class="listViewHeaderValues cursorPointer">{vtranslate('Default', $MODULE)}</a>&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody class="overflow-y">
                    {foreach item=RECORD from=$RECORDS}
                        <tr class="listViewEntries" data-id="{$RECORD['id']}">
                            <td width="25%" style="padding: 0 10px;">
                                <div class="table-actions" style="width: 150px;">
                                    <a onclick="javascript:AsteriskCTI_Modules_Js.openLink('index.php?module={$MODULE}&parent=Settings&action=SavePBX&mode=DownloadXML&record={$RECORD['id']}', true);"  ><i class="fa fa-download" data-toggle="tooltip" title="{vtranslate('Download XML Configuration File',$MODULE)}"></i></a>
                                    <a onclick="javascript:AsteriskCTI_Modules_Js.downloadJavaConnector('{$RECORD['id']}');"><i class="fa fa-cloud-download" data-toggle="tooltip" title="{vtranslate('Download Java Connector',$MODULE)}"></i></a>
                                    <a onclick="javascript:AsteriskCTI_Modules_Js.openLink('index.php?module={$MODULE}&parent=Settings&action=SavePBX&mode=DownloadWin&record={$RECORD['id']}', false);"><i class="fa fa-windows" data-toggle="tooltip" title="{vtranslate('Download Windows Connector',$MODULE)}"></i></a>
                                    {if $SOCKET_ACTIVE}<a onclick="javascript:AsteriskCTI_Modules_Js.downloadSocketServer('{$RECORD['id']}');"><i class="fa fa-cubes" data-toggle="tooltip" title="{vtranslate('Download Socket Server',$MODULE)}"></i></a>{/if}
                                    {if $RECORD['isdefault'] neq "1"}<a  onclick="javascript:AsteriskCTI_Modules_Js.setAsDefault('{$RECORD['id']}');"><i class="fa fa-flag" data-toggle="tooltip" title="{vtranslate('Set as Default',$MODULE)}"></i></a>{/if}
                                    <a  onclick="javascript:AsteriskCTI_Modules_Js.showCheckAsteriskModal('{$RECORD['id']}');"><i class="fa fa-refresh" data-toggle="tooltip" title="{vtranslate('Check Connector',$MODULE)}"></i></a>
                                    <a onclick="javascript:AsteriskCTI_Modules_Js.showEditAsteriskModal('{$RECORD['id']}');"><i class="fa fa-pencil" data-toggle="tooltip" title="{vtranslate('LBL_EDIT',$MODULE)}"></i></a>
                                    <a  onclick="javascript:AsteriskCTI_Modules_Js.deleteRecord('{$RECORD['id']}');"><i class="fa fa-trash" data-toggle="tooltip" title="{vtranslate('LBL_DELETE',$MODULE)}"></i></a>
                                </div>
                            </td>
                            <td class="listViewEntryValue textOverflowEllipsis " width="%"
                                nowrap="">{$RECORD['server']}</td>
                            <td class="listViewEntryValue textOverflowEllipsis " width="%" nowrap="">{$RECORD['username']}</td>
                            <td class="listViewEntryValue textOverflowEllipsis " width="%" nowrap="">{$RECORD['port']}</td>
                            <td class="listViewEntryValue textOverflowEllipsis " width="%" nowrap="">{$RECORD['connectorip']}</td>
                            <td class="listViewEntryValue textOverflowEllipsis " width="%" nowrap="">{vtranslate($RECORD['type'],$MODULE)}</td>
                            <td class="listViewEntryValue textOverflowEllipsis " width="%" nowrap="">{if $RECORD['isdefault'] eq 1}{vtranslate('LBL_YES', $MODULE)}{else}{vtranslate('LBL_NO', $MODULE)}{/if}</td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
            </div>
        {else}
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                <div class="contents">
                    <div class="alert alert-danger"
                         style="text-align: center; margin: 20px 0;">{vtranslate('PBXManager is not active!',$MODULE)}</div>
                </div>
            </div>
        {/if}
    </div>
{elseif $MODE eq 'MANUAL'}
    <div class="col-lg-12" style="margin-top: 20px">
        <table id="InstallModule" class="table table-bordered table-condensed themeTableColor">
            <thead>
            <tr class="blockHeader"><th colspan="2" class="medium">
                    {vtranslate('More info',$QUALIFIED_MODULE)}
                </th></tr>
            </thead>
            <tbody>
            <tr>
                <td width="100%" class="medium">
                    <img src="layouts/v7/skins/images/help.png">
                    <a href="http://vtfarsi.ir/%d8%b1%d8%a7%d9%87%d9%86%d9%85%d8%a7%db%8c-%d8%a7%d8%aa%d8%b5%d8%a7%d9%84-%d9%88%db%8c%d8%aa%d8%a7%db%8c%da%af%d8%b1-%d8%a8%d9%87-%d8%a7%d8%b3%d8%aa%d8%b1%db%8c%d8%b3%da%a9/" target="_blank"> {vtranslate('Please visit module documentation page for more information',$QUALIFIED_MODULE)}</a>
                    <br />
                    <img src="modules/Mobile/resources/images/iconza/yellow/download_24x24.png">
                    <a href="https://license.aweb.co/download/PBX/SocketServer.zip" target="_blank">{vtranslate('Download SocketServer Software',$QUALIFIED_MODULE)}</a>
                    <br />
                    <img src="modules/Mobile/resources/images/iconza/yellow/download_24x24.png">
                    <a href="https://license.aweb.co/download/PBX/ParsVoIPCTI.exe" target="_blank">{vtranslate('Download ParsVoIPCTI Software',$QUALIFIED_MODULE)}</a>
                    <br />
                    <img src="modules/Mobile/resources/images/iconza/royalblue/download_24x24.png">
                    <a href="https://chrome.google.com/webstore/detail/parsvt-asterisk-connector/oejekcmlccpmnakekbpjcejffnfibado" target="_blank"> {vtranslate('ParsVT Asterisk Connector Chrome extension',$QUALIFIED_MODULE)}</a>
                    <br />
                    <img src="modules/Mobile/resources/images/iconza/royalblue/download_24x24.png">
                    <a href="https://addons.mozilla.org/en-US/firefox/addon/parsvt-asterisk-connector/" target="_blank"> {vtranslate('ParsVT Asterisk Connector FireFox extension',$QUALIFIED_MODULE)}</a>
                    <br />
                    <img src="modules/Mobile/resources/images/iconza/royalblue/download_24x24.png">
                    <a href="https://chrome.google.com/webstore/detail/parsvtcrm-click2dial-chro/fmoobdhodlgbliglljkbheinodiglbhj" target="_blank"> {vtranslate('ParsVTCRM Click2Dial Chrome extension',$QUALIFIED_MODULE)}</a>
                    <br />
                    <img src="modules/Mobile/resources/images/iconza/royalblue/download_24x24.png">
                    <a href="https://addons.mozilla.org/en-US/firefox/addon/parsvtcrm-click2dial-extension/" target="_blank"> {vtranslate('ParsVTCRM Click2Dial FireFox extension',$QUALIFIED_MODULE)}</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
{/if}

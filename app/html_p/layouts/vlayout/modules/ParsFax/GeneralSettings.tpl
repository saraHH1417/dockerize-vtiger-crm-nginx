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
            <div class="listViewContentDiv" id="listViewContents">
                <div class="listViewEntriesDiv">
                    <form class="form-horizontal" method="POST" id="GeneralSettingsForm">
                        <input type=hidden name="module" value="{$MODULE}"/>
                        <input type=hidden name="view" value="GeneralSettings"/>
                        <input type=hidden name="action" value="SaveGeneralSettings"/>
                        <table class="table table-bordered table-condensed themeTableColor">
                            <thead>
                            <tr class="blockHeader">
                                <th colspan="2" class="medium">{vtranslate('General Settings', $MODULE)}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td width="25%" class="medium">{vtranslate('Fax file uploaded count',$QUALIFIED_MODULE)}</td>
                                <td class="row-fluid medium">
                                    <input type="text" id="fileCount" name="fileCount" placeholder="0" value="{$FILEUPLOADCOUNT}">
                                </td>
                            </tr>
                            <tr>
                                <td width="25%" class="medium">{vtranslate('Fax file mode',$QUALIFIED_MODULE)}</td>
                                <td class="row-fluid medium">
                                    <select class="chzn-select providerType" name="fileMode" id="fileMode"
                                            data-validation-engine="validate[ required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]">
                                        <option value=""></option>
                                        <option {if $FILEMODE eq 'Attach'}selected{/if} value="Attach">{vtranslate('Attach',$QUALIFIED_MODULE)}</option>
                                        <option {if $FILEMODE eq 'Link'}selected{/if} value="Link">{vtranslate('Link',$QUALIFIED_MODULE)}</option>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="widget_header row-fluid">
                            <div class="span4 btn-toolbar">
                                <div>
                                    <button class="btn btn-success saveButton" type="button" title="{vtranslate("Save")}" <strong>{vtranslate("Save", $MODULE)}</strong></button>
                                    <a class="cancelLink"
                                       onclick="window.location.replace('index.php?module=ParsFax&parent=Settings&view=GeneralSettings')"
                                       type="reset">{vtranslate('Cancel', $MODULE)}</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
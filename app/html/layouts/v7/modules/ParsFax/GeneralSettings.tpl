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
                        <table class="table table-bordered table-condensed listViewEntriesTable">
                            <thead>
                            <tr class="active">
                                <th colspan="2" class="medium">{vtranslate('General Settings', $MODULE)}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td width="25%" class="medium">{vtranslate('Fax file uploaded count',$QUALIFIED_MODULE)}</td>
                                <td class="row-fluid medium">
                                    <div class="col-md-4">
                                        <input class="listSearchContributor inputElement" type="text" id="fileCount" name="fileCount" placeholder="0" value="{$FILEUPLOADCOUNT}">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="modal-overlay-footer clearfix">
                            <div class="row clearfix">
                                <div class="textAlignCenter col-lg-12 col-md-12 col-sm-12 ">
                                    <button class="btn btn-success saveButton settingSaveButton" type="button"><strong>{vtranslate('Save', $MODULE)}</strong>
                                    </button>&nbsp;&nbsp;
                                    <a class="cancelLink" type="reset"
                                       onclick="javascript:window.history.back();">{vtranslate('Cancel', $MODULE)}</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
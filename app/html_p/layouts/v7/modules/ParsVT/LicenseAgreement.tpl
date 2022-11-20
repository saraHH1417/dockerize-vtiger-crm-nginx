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


<div class="modal-dialog" style="min-width: 800px">


{include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=vtranslate('End-user license agreement', $MODULE)}
    <div class="modal-content">
        <div class="form-horizontal">
            <div class="modal-body">
                <div class="form-group">
                    <div class="col-lg-12">
                        <p>{vtranslate('License agreement', $MODULE)}</p>
                    </div>
                    <div class="col-lg-12">
                        <div style="background: #eee;padding: 20px;box-sizing: border-box;height: 350px;overflow-y: scroll;">
                            <p>{$LICENSEAGREEMENT}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <div class="row-fluid">
                <button class="btn btn-success" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" >{vtranslate('LBL_CLOSE', $MODULE)}</button>
            </div>
        </div>
    </div>
</div>

{/strip}

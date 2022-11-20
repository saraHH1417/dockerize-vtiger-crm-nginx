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
                    {vtranslate('Install SQL Reports Module', $QUALIFIED_MODULE)}
                </h4>
            </div>
        </div>
        <div class="modal-content">
            <div class="padding1per" style="border:1px solid #ccc;padding: 1%;">
                <label>
                    <strong>{sprintf(vtranslate('Welcome to the %s Installation Wizard',$QUALIFIED_MODULE),vtranslate("SQL Reports Module",$QUALIFIED_MODULE))}</strong>
                </label>
                <div id="InstallModule">
                    <input type="hidden" name="installtype" value="download_src"/>
                    <div class="controls">
                        <div>
                            <strong> {vtranslate('To finish installation steps, You have to compelete this step.',$QUALIFIED_MODULE)}</strong><br />
                        </div>
                        <br>
                        <div class="clearfix">
                        </div>
                    </div>

                    <div class="controls">
                        <div>
                            {sprintf(vtranslate('Click on Download button to download and install <strong>ParsVTSQLReports</strong> module. Please be patient it may take a while.<br /><br />In case that you are unable to automatically download ParsVTSQLReports, you can donwload it manually from <pre>%s</pre> and install that via <a href="index.php?module=ModuleManager&parent=Settings&view=List" target="_blank">ModuleManager</a><pre>%s</pre>',$QUALIFIED_MODULE),$SQL_File,$MODULE_MANAGER_URL)}
                            {if $MB_STRING_EXISTS eq 'false'}
                                <br>{vtranslate('LBL_MB_STRING_ERROR','PDFMaker')}
                            {/if}
                        </div>
                        <br>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="controls" style="text-align: center;">
                        <button type="button" id="download_button" class="btn btn-success" onclick="ParsVTMisc.downloadSQLReports();"><strong>{vtranslate('Install/Update Module',$MODULE)}</strong></button>&nbsp;&nbsp;
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <center>
                    <button class="btn btn-info" type="reset" data-dismiss="modal">
                        <strong>{vtranslate('LBL_OK', $MODULE)}</strong></button>
                </center>
            </div>
            </form>
        </div>
    </div>
{/strip}

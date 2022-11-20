{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<div class="padding1per" style="border:1px solid #ccc;padding: 1%;">
   <label>
   <strong>{sprintf(vtranslate('Welcome to the %s Installation Wizard',$QUALIFIED_MODULE),vtranslate($QUALIFIED_MODULE,$QUALIFIED_MODULE))}</strong>
   </label>
   <div class="control-group">
      <div>
         <span>
         {vtranslate('To finish installation steps, You have to compelete this step.',$QUALIFIED_MODULE)}
         </span>
         <br>
         <table id="InstallModule" class="table table-bordered table-condensed themeTableColor">
            <thead>
               <tr class="blockHeader">
                  <th colspan="2" class="medium">{vtranslate('Update PBXManager Module',$QUALIFIED_MODULE)}</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td width="60%" class="medium">{vtranslate('For receive popup calls, you need to install new PBXManager module!',$MODULE)}</td>
                  <td class="row-fluid medium" style="text-align:center;">
                     <span id="installed" style="display:none;"><span style="color:red;">{vtranslate('Runtime Module Installed!',$MODULE)}</span><br />
                     <button type='button' class='runtime btn btn-large btn-inverse'>{vtranslate('Update Module Again',$MODULE)}</button></span>
                     <button id='newinstall' type='button' class='runtime btn btn-large btn-info'>{vtranslate('Install/Update Module',$MODULE)}</button>
                     <br/>
                  </td>
               </tr>
            </tbody>
         </table>
        <form name="EditWorkflow" action="index.php" method="post" id="installation_step3" class="form-horizontal" style="display:none">
            <input type="hidden" name="step" value="{$STEP+1}" />
            <input type="hidden" class="step" name="current_step" value="{$STEP}" />
            <input type="hidden" name="module" value="{$QUALIFIED_MODULE}" />
            <input type="hidden" name="parent" value="Settings" />
            <input type="hidden" name="view" value="License" />
                <div class="control-group" style="text-align: center;"><br />
                     <button class="btn btn-success" id="step3" type="submit"><strong>{vtranslate('Next Step', $QUALIFIED_MODULE)}</strong></button><br /><br />
                </div>
        </form>

      </div>
   </div>
</div>
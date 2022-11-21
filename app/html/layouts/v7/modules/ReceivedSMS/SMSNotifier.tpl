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
<div class="padding1per" style="border:1px solid #ccc;padding: 1%;">
   <label>
   <strong>{vtranslate('SMSNotifier',$QUALIFIED_MODULE)}</strong>
   </label>
   <div class="control-group">
      <div>
         <span>
         {vtranslate('If you use are sending SMS feature; it\'s strongly suggested to apply ParsVtiger Service Providers settings in order to send SMS message from CRM',$QUALIFIED_MODULE)}
         </span>
         <br>
         <table id="InstallModule" class="table table-bordered table-condensed themeTableColor">
            <thead>
               <tr class="blockHeader">
                  <th colspan="2" class="medium">{vtranslate('Install ParsVtiger Provider and Update SMSNotifier Module',$QUALIFIED_MODULE)}</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td width="60%" class="medium">{vtranslate($PROVIDERMESSAGE,$MODULE)}</td>
                  <td class="row-fluid medium" style="text-align:center;">
                     {if $AWEBSMS eq '1'}
                     <button type='button' class='btn btn-danger'  onclick="window.location.replace('index.php?module=ModuleManager&parent=Settings&view=List')">{vtranslate('VTLIB_LBL_MODULE_MANAGER','Settings:Vtiger')}</button>
                     {elseif $AWEBSMS eq '2'}
                     <button type='button' class='btn btn-info'  onclick="window.location.replace('index.php?module=SMSNotifier&parent=Settings&view=List')">{vtranslate('SMSNotifier Settings',$MODULE)}</button>
                     {elseif $AWEBSMS eq '3'}
                     <button id='newinstall' type='button' class='runtime btn btn-inverse'>{vtranslate('Install Provider',$MODULE)}</button>
                     {/if}
                     <br/>
                  </td>
               </tr>
            </tbody>
         </table>

      </div>
   </div>
</div>


	</div>
</div>
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='SettingsHeader.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<div class="container-fluid">
   <div class="contents">
      <div class="row-fluid">
         <span class="span12 btn-toolbar">
               <button class="btn addButton" type="button" onclick="window.location.replace('index.php?module={$QUALIFIED_MODULE}&parent=Settings&view=Provider&mode=Edit')"><i class="icon-plus"></i>&nbsp;<strong>{vtranslate('New Provider', $QUALIFIED_MODULE)}</strong></button>
         </span>
      </div>
      <div class="clearfix"></div>
      <div class="listViewContentDiv" id="listViewContents">
         <div class="listViewEntriesDiv" style="overflow-x:auto;">
            <table class="table table-bordered table-condensed listViewEntriesTable">
               <thead>
                  <tr class="listViewHeaders">
                     <th  class="medium">{vtranslate('LBL_ACTIONS', $MODULE)}</th>
                     <th nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="providertype">{vtranslate('Provider', $MODULE)}</a></th>

                     <th  nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="username">{vtranslate('User Name', $MODULE)}</a></th>

                     <th  nowrap="" class="medium"><a class="listViewHeaderValues cursorPointer" data-nextsortorderval="ASC" data-columnname="isactive">{vtranslate('Status', $MODULE)}</a></th>

                  </tr>
               </thead>
               <tbody>
                 {if $serverset}
	      	{foreach item=server from=$serverlist}

                  <tr class="listViewEntries" data-id="{$server[0]}">
                     <td nowrap="" class="medium">
<div class="table-actions" style="width:60px; text-align:center;">
                    <a onclick="window.location.replace('index.php?module={$QUALIFIED_MODULE}&parent=Settings&view=Provider&mode=Edit&id={$server[0]}')">
            <i class="fa fa-pencil" title="{vtranslate('Edit', $MODULE)}"></i>
        </a>
                    &nbsp;&nbsp;
                            <a onclick="window.location.replace('index.php?module={$QUALIFIED_MODULE}&view=Provider&action=Provider&mode=Delete&id={$server[0]}')">
            <i class="fa fa-trash" title="{vtranslate('Delete', $MODULE)}"></i>
        </a>
            </div>
                     </td>
                     <td class="listViewEntryValue medium" width="33%" nowrap="">&nbsp;{$server[1]}</td>

                     <td class="listViewEntryValue medium" width="33%" nowrap="">&nbsp;{$server[2]}</td>

                     <td class="listViewEntryValue medium" width="33%" nowrap="">&nbsp;{if $server[3] eq '1'}{vtranslate('Active', $MODULE)}{else}{vtranslate('Inactive', $MODULE)}{/if}</td>

                  </tr>
		{/foreach}
                  {else}
			<tr>
				<td colspan="4" align="center" style="text-align:center">
					{vtranslate('No provider Set', $MODULE)}
				</td>
			</tr>

                  {/if}
               </tbody>
            </table>
            <!--added this div for Temporarily -->
         </div>
      </div>
   </div>
</div>
      <div class="clearfix"></div>
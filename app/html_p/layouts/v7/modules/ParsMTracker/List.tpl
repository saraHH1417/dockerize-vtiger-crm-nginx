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
    <div  id="modTrackerContainer" class="editContainer container-fluid" style="padding-left: 3%;padding-right: 3%; margin-top: 20px;">
		<div class="row">
			<div class="col-lg-10 col-md-10 col-sm-10"><h3>{vtranslate('LBL_MODTRACKER_SETTINGS', $QUALIFIED_MODULE)}</h3>{vtranslate('LBL_MODTRACKER_SETTINGS_DESCRIPTION', $QUALIFIED_MODULE)}</div>
			<div class="col-lg-2 col-md-2 col-sm-2"></div>
		</div>
		<hr>
		<div class="contents">
			<div class="contents tabbable">
				<table class="table table-striped table-hover listViewEntriesTable">
					<thead>
						<tr class="blockHeader">
							<th><strong>{vtranslate('LBL_MODULE',$QUALIFIED_MODULE)}</strong></th>
							<th><strong>{vtranslate('LBL_ACTIVE',$QUALIFIED_MODULE)}</strong></th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$MODULE_MODEL->getModTrackerModules() item=item key=key}
							<tr data-id="{$item.id}">
								<td>{vtranslate($item.module,$item.module)}</td>
								<td>
									<input class="activeModTracker" type="checkbox" name="active" value="1" {if $item.active}checked=""{/if}>
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
			<div class="clearfix"></div>
		</div>	
	</div>
{/strip}
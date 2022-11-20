{strip}
	<div id="modTrackerContainer">
		<div class="widget_header row">
			<div class="col-md-10"><h3>{vtranslate('LBL_MODTRACKER_SETTINGS', $QUALIFIED_MODULE)}</h3>{vtranslate('LBL_MODTRACKER_SETTINGS_DESCRIPTION', $QUALIFIED_MODULE)}</div>
			<div class="col-md-2"></div>
		</div>
		<hr>
		<div class="contents">
			<div class="contents tabbable">
				<table class="table table-bordered table-condensed listViewEntriesTable">
					<thead>
						<tr class="blockHeader">
							<th><strong>{vtranslate('LBL_MODULE',$QUALIFIED_MODULE)}</strong></th>
							<th><strong>{vtranslate('LBL_ACTIVE',$QUALIFIED_MODULE)}</strong></th>
							{*<th><strong>{vtranslate('LBL_TOOLS',$QUALIFIED_MODULE)}</strong></th>*}
						</tr>
					</thead>
					<tbody>
						{foreach from=$MODULE_MODEL->getModTrackerModules() item=item key=key}
							<tr data-id="{$item.id}">
								<td>{vtranslate($item.module,$item.module)}</td>
								<td>
									<input class="activeModTracker" type="checkbox" name="active" value="1" {if $item.active}checked=""{/if}>
								</td>
								{*<td></td>*}
							</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
			<div class="clearfix"></div>
		</div>	
	</div>
{/strip}
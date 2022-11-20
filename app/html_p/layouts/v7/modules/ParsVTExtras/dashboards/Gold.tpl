{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<div class="dashboardWidgetHeader">
    {include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME}
</div>


<div class="dashboardWidgetContent">
    {if is_array($PRICES)}
        <div class="dashboardTitle" style="font-weight:bold">
            {vtranslate('Updated on', $MODULE_NAME)} {Vtiger_Datetime_UIType::getDisplayDateTimeValue($PRICES['update'])}
        </div>
        <div style="min-width: 330px; max-width: 330px; height: 200px; margin: 10px auto;">
            {if $ISCURRENCY}<marquee style="height:185px;" direction="up" behavior="scroll" scrollamount="2"  onmouseover="this.stop();" onmouseout="this.start();">{/if}
				{foreach from=$PRICES['items']  key=name item=value}
					<div class="row">
						<div class="col-md-6 text-info">{$name}</div>
						<div class="col-md-6 text-dark">{$value}</div>
					</div>
				{/foreach}
			{if $ISCURRENCY}</marquee>{/if}
		</div>
    {else}
        <div style="min-width: 330px; max-width: 330px; height: 200px; margin: 0 auto;">
            {$PRICES}
        </div>
    {/if}
</div>

<div class="widgeticons dashBoardWidgetFooter">
    <div class="filterContainer">
    </div>
    <div class="footerIcons pull-right">
        {if !$WIDGET->isDefault()}
            <a name="dclose" class="widget" data-url="{$WIDGET->getDeleteUrl()}">
                <i class="fa fa-remove" hspace="2" border="0" align="absmiddle" title="{vtranslate('LBL_REMOVE')}" alt="{vtranslate('LBL_REMOVE')}"></i>
            </a>
        {/if}
    </div>
</div>

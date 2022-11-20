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
    <div style='padding:5px'>
        {assign var="announcement" value=$ANNOUNCEMENT->get('announcement')}
        {if !empty($announcement)}
            <marquee style="height:185px;" direction="up" behavior="scroll" scrollamount="2"   onmouseover="this.stop();" onmouseout="this.start();">
                {$announcement}
            </marquee>
        {else}
            {vtranslate('LBL_NO_RECORDS_FOUND',$MODULE)}
            {/if}
    </div>
</div>

<div class="widgeticons dashBoardWidgetFooter">
    <div class="footerIcons pull-right">
        {include file="dashboards/DashboardFooterIcons.tpl"|@vtemplate_path:$MODULE_NAME}
    </div>
</div>
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{if $content}
<div class="dashboardWidgetHeader">
	{include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME}
</div>
<div class="dashboardWidgetContent IranianEvents" style="padding-top:15px;height:196px;">
{/if}

    <div style='padding:0 5px; text-align:right'>

     {$EMROOZ}

    </div>
{if $content}

</div>

<div class="widgeticons dashBoardWidgetFooter">
    <div class="footerIcons pull-right">
        {include file="dashboards/DashboardFooterIcons.tpl"|@vtemplate_path:$MODULE_NAME}
    </div>
</div>
{/if}

<script>
jQuery(document).ready(function(){
var parent = $(".dashboardWidgetContent");
var contentContainer = $(".IranianEvents");
contentContainer.mCustomScrollbar('destroy');
app.helper.showVerticalScroll(contentContainer,{ });
contentContainer.height(function (index, height) {
    return (height + 40);
});
vtUtils.enableTooltips();
});
</script>
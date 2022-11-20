{*
<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<style>
    .btn-outline-success {
        color: #28a745;
        background-color: transparent;
        background-image: none;
        border-color: #28a745;
    }
    .btn-outline-success:hover {
         color: #ffffff;
         background-color: #28a745;
         border-color: #28a745;
     }
</style>
<div class="dashboardWidgetHeader">
    {include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME}
</div>
<div class="dashboardWidgetContent">
    <div class="parsvt_updates" style="padding-top:5px;height:180px;">
        {if count($UPDATES) > 0}
            <div>
                <div class='row'>
                    <table class='table updatetable'>
                        <thead class="text-center">
                        <tr class="text-center">
                            <th class="text-center">
                                {vtranslate('Module Name','ParsVT')}
                            </th>
                            <th class="text-center">
                                {vtranslate('Release Date',$MODULE_NAME)}
                            </th>
                            <th class="text-center">
                                {vtranslate('Version',$MODULE_NAME)}
                            </th>
                            <th class="text-center">
                                {vtranslate('Detail & Update',$MODULE_NAME)}
                            </th>
                        </tr>
                        </thead>
                        <tbody class="text-center">
                        {foreach from=$UPDATES key=k item=MODEL }
                            <tr class="text-center">
                                <td>
                                    {vtranslate($UPDATES[$k]['module'],$UPDATES[$k]['module'])}
                                </td>
                                <td>
                                    {$UPDATES[$k]['patch']}
                                </td>
                                <td>
                                    {$UPDATES[$k]['version']}
                                </td>
                                <td>
                                    <a class="btn btn-outline-success" href="index.php?parent=Settings&module={$UPDATES[$k]['module']}&view=Upgrade" target="_blank">
                                        {vtranslate('LBL_UPGRADE',$MODULE_NAME)}
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        {else}
            <span class="noDataMsg">
		{vtranslate('No updates available', $MODULE_NAME)}</span> {/if}
    </div>
</div>
<div class="widgeticons dashBoardWidgetFooter">
    <div class="footerIcons pull-right">
        {if !$WIDGET->isDefault()}
            <a name="dclose" class="widget" data-url="{$WIDGET->getDeleteUrl()}">
                <i class="fa fa-remove" hspace="2" border="0" align="absmiddle" title="{vtranslate('LBL_REMOVE')}" alt="{vtranslate('LBL_REMOVE')}"></i>
            </a>
        {/if}
    </div>
</div>
<script>
    jQuery(document).ready(function() {
        var parent = $(".dashboardWidgetContent");
        var contentContainer = $(".parsvt_updates");
        contentContainer.mCustomScrollbar('destroy');
        app.helper.showVerticalScroll(contentContainer, {});
        contentContainer.height(function(index, height) {
            return (height + 40);
        });
        vtUtils.enableTooltips();
    });
</script>
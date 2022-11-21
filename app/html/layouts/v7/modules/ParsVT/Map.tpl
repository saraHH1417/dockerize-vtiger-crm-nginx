{*<!--
   /* ********************************************************************************
    * The content of this file is subject to the VTFarsi.ir Modules License("License");
    * You may not use this file except in compliance with the License
    * The Initial Developer of the Original Code is VTFarsi.ir
    * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
    * All Rights Reserved.
    * ****************************************************************************** */
   -->*}
<input type=hidden name=LATITUDE value="{$LATITUDE}"/>
<input type=hidden name=LONGITUDE value="{$LONGITUDE}"/>
<input type=hidden name=MAPZOOM value="{$MAPZOOM}"/>
<input type=hidden name=MAPTITLE value="{$smarty.request.title}"/>
<input type=hidden name=MAPRECORDID value="{$smarty.request.recordid}"/>
<input type=hidden name=SOURCE_MODULE value="{$smarty.request.source_module}"/>
<input type=hidden name=SINGLEMAPVIEW value="{$smarty.request.ll}"/>
<input type=hidden id="viewname" value="{$smarty.request.viewname}"/>

{strip}
<style>
    #ParsVTMap {
        height: 100vh;
        margin-top: -30px;
    }
</style>
{assign var=LEFTPANELHIDE value=$USER_MODEL->get('leftpanelhide')}
<div class="essentials-toggle" title="{vtranslate('LBL_LEFT_PANEL_SHOW_HIDE', 'Vtiger')}">
    <span class="essentials-toggle-marker fa {if $LEFTPANELHIDE eq '1'}fa-chevron-right{else}fa-chevron-left{/if} cursorPointer"></span>
</div>
<div style="clear:both">
    {if $ContainCoordinateField}
        <div id="ParsVTMap"></div>
    {else}
        {assign var=MESSAGE value=vtranslate("This module has no geographical coordinates field","ParsVT")}
        {include file="OperationNotPermitted.tpl"|@vtemplate_path:$MODULE_NAME}
    {/if}
    {/strip}
<script>
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the WebHook ("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is AWEBICT.NET
 * Portions created by AWEBICT.NET. are Copyright(C) AWEBICT.NET.
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='Head.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<style>
    code, pre {
        direction: ltr;
        text-align: left;
        background-color: #f7f7f9;
        word-wrap: break-word;
    }
    .formatted code {
        color: #d14;
        padding: 2px 4px;
        font-family: monospace;
        font-size: small;
    }
</style>
<div class="container-fluid">
    <div class="contents formatted">
            {$PARSEDOWN->text($Manual)}
    </div>
</div>
<script>
    jQuery(document).ready(function() {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
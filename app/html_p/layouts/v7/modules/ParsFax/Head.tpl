{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<script>
$(function() {
$("#Pars{$smarty.get.view}").addClass("active");
});
</script>
<style>
    #lngeditor * {
        text-align: center;
    }

    #lngeditor {
        table-layout: fixed;
        word-wrap: break-word;
    }

    .pvtdash dt {
        padding: 0 40px;
    }

    .pvtdash li, #tablelists * {
        #font-size: 90% !important;
    }

    .confTable * {
        #font-size: 90% !important;
        direction: ltr;
        text-align: center;
    }

    .confTable2 * {
        #font-size: 90% !important;
        text-align: center;
        font-weight: normal !important;
    }

    .backupTable tr td label {
        #font-size: 90% !important;
        text-align: center;
    }

    .blink_me {
        animation: blinker 3s linear infinite;
        font-weight: bold;
    }

    @keyframes blinker {
        50% {
            opacity: 0.25;
        }
    }

    .vtToolBox {
        background-color: #ffffff;
        border: 1px solid #000;
        padding: 5px;
        margin: 5px;
    }

    .vtToolBox legend {
        padding: 5px;
        font-size: 14px;
        width: auto;
        border: none;
        margin-bottom: 0;
        line-height: 130%;
    }

    div.select2-drop {
        z-index: 30000;
    }

    .box-info {
        background-color: #fff;
        padding: 20px;
        border: 1px solid #eeeff2;
        margin-left: 1px;
        padding-top: 5px;
    }

    .needattention {
        color: #a94442 !important;
        background-color: #f2dede !important;
        border-color: #ebccd1 !important;
    }

    .needoptimize {
        color: #8a6d3b !important;
        background-color: #fcf8e3 !important;
        border-color: #faebcc !important;
    }

    .okattention {
        color: #3c763d !important;
        background-color: #dff0d8 !important;
        border-color: #d6e9c6 !important;

    }

    .normalattention {
        color: #31708f !important;
        background-color: #d9edf7 !important;
        border-color: #bce8f1 !important;
    }

    .codecolor > li.active > a, .codecolor > li.active > a:hover, .codecolor > li.active > a:focus {
        color: black;
        background-color: #fcd900;
    }

    #datatable_filter > label > input[type="search"] {
        border-radius: 1px;
        box-shadow: none;
        border: 1px solid #cccccc;
        margin-right: 0.5em;
    }

    .dataTables_wrapper .dataTables_filter {
        float: left !important;
    }

    .lngcolor {
        border-color: #a4aaab;
        box-shadow: 0 0 5px #a4aaab;
    }

    .lngjscolor {
        border-color: #ad8b8b;
        box-shadow: 0 0 5px #a4aaab;
    }

    .lng:focus {
        border-color: #cfdc00;
        box-shadow: 0 0 2px #fcd900, inset 0 0 101px #fcd900;
    }

    {if $CURRENT_USER_MODEL->get('language') neq 'fa_ir'}
    .bootstrap-switch-container {
        min-width: 130px;
    }

    {/if}

    .blink_me {
        animation: blinker 3s linear infinite;
    }

    @keyframes blinker {
        50% {
            opacity: 0;
        }
    }
</style>

<div class="" style="margin:20px;">
    <h3>{vtranslate('ParsFax Settings', $MODULE)}</h3>
    {if $RELEASE_NOTIF}
        <div class="blink_me" id="backupmsg" style=" margin:0 auto;text-align: center;"><a href='index.php?parent=Settings&module={$MODULE}&view=Upgrade'><span class="btn btn-info">{$RELEASE_NOTIF}</span></a>
        </div>
    {/if}
	<ul id="tabs" class="nav  nav-pills nav-tabs" data-tabs="tabs">
		<li id="ParsProvider"><a href="index.php?module=ParsFax&parent=Settings&view=Provider">{vtranslate('Provider Options', $MODULE)}</a></li>
		<li id="ParsFaxModules"><a href="index.php?module=ParsFax&parent=Settings&view=FaxModules">{vtranslate('Fax Modules Settings', $MODULE)}</a></li>
		<li id="ParsGeneralSettings"><a href="index.php?module=ParsFax&parent=Settings&view=GeneralSettings">{vtranslate('General Settings', $MODULE)}</a></li>
		<li id="ParsFaxLog"><a href="index.php?module=ParsFax&parent=Settings&view=FaxLog">{vtranslate('Fax Log', $MODULE)}</a></li>
	</ul>

</div>
<script>
    var ParsVTErrors = {
        UNKNOWNERR: "{vtranslate('Unknown Error!', $MODULE)}",
        OPFAILED: "{vtranslate('Operation Failed : Error !', $MODULE)}",
        NO: "{vtranslate('LBL_NO', $MODULE)}",
        YES: "{vtranslate('LBL_YES', $MODULE)}",
    };
    jQuery(document).ready(function() {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
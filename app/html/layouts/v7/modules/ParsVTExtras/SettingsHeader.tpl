{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<script type="text/javascript">
    $(function () {
        $("#Pars{$smarty.get.view}").addClass("active");
        var activetab = $(location).attr('href').split("#");
        if ("1" in activetab) {
            $("#allLanguages").removeClass("active");
            $("#allLanguagesMenu").removeClass("active");
            $("#MiscGereral").removeClass("active");
            $("#MiscGereralMenu").removeClass("active");
            $("#DataBaseGereral").removeClass("active");
            $("#DataBaseGereralMenu").removeClass("active");
            $("#" + activetab[1]).addClass("active");
            $("#" + activetab[1] + "Menu").addClass("active");
        }
        {if $smarty.get.mode eq 'backup'}
        $("#DataBaseGereral").removeClass("active");
        $("#DataBaseGereralMenu").removeClass("active");
        $("#DataBaseBackup").addClass("active");
        $("#DataBaseBackupMenu").addClass("active");
        {/if}
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
</style>


<div class="row">
    <div class=" col-md-9">
        {if $RELEASE_NOTIF}
            <div class="col-lg-12 col-md-12 col-sm-12 blink_me text-center">
                <a href='index.php?parent=Settings&module=ParsVT&view=Upgrade'>
                            <span class="btn btn-info">
                               {$RELEASE_NOTIF}
                            </span>
                </a>
            </div>
        {/if}
    </div>
    <div class=" col-md-2">
        <div class="btn-group listViewActionsContainer" role="group" aria-label="..." style="float:left">
            <div class="btn-group pull-right" role="group">
                <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
                    {vtranslate('LBL_ACTIONS',$MODULE)}&nbsp;
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    {foreach item=SettingLink from=$MODULE_MODEL->getSettingLinks()}
                        {if $SettingLink['linklabel'] eq 'Module Settings'}{continue}{/if}
                        {if $SettingLink['linklabel'] eq 'Uninstall Module'}
                            <li class="divider"></li>
                        {/if}
                        <li><a href="javascript:void(0);"
                               onclick='window.location.href="{$SettingLink['linkurl']}"'>{vtranslate($SettingLink['linklabel'], $MODULE)}</a>
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>
    <div class=" col-md-1"></div>
</div>


<div class="" style="margin-top:0px;">
    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
        <li id="ParsSettings"><a
                    href="index.php?module=ParsVTExtras&view=Settings&parent=Settings">{vtranslate('ParsVT Extras Settings', $MODULE)}</a>
        </li>
        {if $MENTION || $smarty.request.view eq 'Mention'}
            <li id="ParsMention"><a
                        href="index.php?module=ParsVTExtras&view=Mention&parent=Settings">{vtranslate('Mention Users', $MODULE)}</a>
            </li>
        {/if}
        {if $LTV || $smarty.request.view eq 'LTVEdit' || $smarty.request.view eq 'LTVSettings'}
            <li id="{if $smarty.request.view eq 'LTVEdit'}ParsLTVEdit{else}ParsLTVSettings{/if}"><a
                        href="index.php?module=ParsVTExtras&view=LTVSettings&parent=Settings">{vtranslate('LifeTime value Calculator', $MODULE)}</a>
            </li>
        {/if}
        {if $EXPORTTOEXCEL || $smarty.request.view eq 'Excel'}
            <li id="ParsExcel"><a
                        href="index.php?module=ParsVTExtras&view=Excel&parent=Settings">{vtranslate('Export To Excel', $MODULE)}</a>
            </li>
        {/if}
        <li id="ParsRelatedFields"><a
                    href="index.php?module=ParsVTExtras&view=RelatedFields&parent=Settings">{vtranslate('Related Field Generator', $MODULE)}</a>
        </li>
        {if $ARIANATTS || $smarty.request.view eq 'TTS'}
            <li id="ParsTTS"><a
                        href="index.php?module=ParsVTExtras&view=TTS&parent=Settings">{vtranslate('Ariana TTS', $MODULE)}</a>
            </li>
        {/if}
        <li id="ParsUpgrade"><a target="_blank"
                    href="index.php?module=ParsVTExtras&view=Upgrade&parent=Settings">{vtranslate('Vtiger Updater', $MODULE)}</a>
        </li>
    </ul>
</div>
<script type="text/javascript">
    var ParsVTErrors = {
        UNKNOWNERR: "{vtranslate('Unknown Error!', $MODULE)}",
        OPFAILED: "{vtranslate('Operation Failed : Error !', $MODULE)}",
        NO: "{vtranslate('LBL_NO', $MODULE)}",
        YES: "{vtranslate('LBL_YES', $MODULE)}",
    };
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>

{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
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
            {if $smarty.get.view neq 'RestAPI'}
            $("#" + activetab[1]).addClass("active");
            $("#" + activetab[1] + "Menu").addClass("active");
            {/if}
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
       text-align:center;
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
    .parsvtfeatures {
        background-position: {if $RTLCSS}20px{else}right{/if} center;
        background-repeat: no-repeat;
        {literal}background-image: url(data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iMTI4cHgiIGhlaWdodD0iMTI4cHgiPgo8Zz4KCTxnPgoJCTxwYXRoIGQ9Ik00MzcuMzMzLDE5MmgtMzJ2LTQyLjY2N0M0MDUuMzMzLDY2Ljk5LDMzOC4zNDQsMCwyNTYsMFMxMDYuNjY3LDY2Ljk5LDEwNi42NjcsMTQ5LjMzM1YxOTJoLTMyICAgIEM2OC43NzEsMTkyLDY0LDE5Ni43NzEsNjQsMjAyLjY2N3YyNjYuNjY3QzY0LDQ5Mi44NjUsODMuMTM1LDUxMiwxMDYuNjY3LDUxMmgyOTguNjY3QzQyOC44NjUsNTEyLDQ0OCw0OTIuODY1LDQ0OCw0NjkuMzMzICAgIFYyMDIuNjY3QzQ0OCwxOTYuNzcxLDQ0My4yMjksMTkyLDQzNy4zMzMsMTkyeiBNMjg3LjkzOCw0MTQuODIzYzAuMzMzLDMuMDEtMC42MzUsNi4wMzEtMi42NTYsOC4yOTIgICAgYy0yLjAyMSwyLjI2LTQuOTE3LDMuNTUyLTcuOTQ4LDMuNTUyaC00Mi42NjdjLTMuMDMxLDAtNS45MjctMS4yOTItNy45NDgtMy41NTJjLTIuMDIxLTIuMjYtMi45OS01LjI4MS0yLjY1Ni04LjI5Mmw2LjcyOS02MC41MSAgICBjLTEwLjkyNy03Ljk0OC0xNy40NTgtMjAuNTIxLTE3LjQ1OC0zNC4zMTNjMC0yMy41MzEsMTkuMTM1LTQyLjY2Nyw0Mi42NjctNDIuNjY3czQyLjY2NywxOS4xMzUsNDIuNjY3LDQyLjY2NyAgICBjMCwxMy43OTItNi41MzEsMjYuMzY1LTE3LjQ1OCwzNC4zMTNMMjg3LjkzOCw0MTQuODIzeiBNMzQxLjMzMywxOTJIMTcwLjY2N3YtNDIuNjY3QzE3MC42NjcsMTAyLjI4MSwyMDguOTQ4LDY0LDI1Niw2NCAgICBzODUuMzMzLDM4LjI4MSw4NS4zMzMsODUuMzMzVjE5MnoiIGZpbGw9IiNlZDk0NzQiLz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K);
    }{/literal}

</style>



        <div class = "row">
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
{if $EXTRAS_RELEASE_NOTIF}
    <div class="col-lg-12 col-md-12 col-sm-12 blink_me text-center">
                        <a href='index.php?parent=Settings&module=ParsVTExtras&view=Upgrade' target="_blank">
                            <span class="btn btn-info">
                               {$EXTRAS_RELEASE_NOTIF}
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
                                <li><a href="javascript:void(0);" onclick='window.location.href="{$SettingLink['linkurl']}"'>{vtranslate($SettingLink['linklabel'], $MODULE)}</a></li>
				{/foreach}
                        </ul>
                    </div>
            </div>
            </div>
            <div class=" col-md-1"></div>
            </div>


<div class="" style="margin-top:0px;">
    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
        <li id="ParsPersianPack"><a
                    href="index.php?module=ParsVT&view=PersianPack&parent=Settings">{vtranslate('Persian Pack Settings', $MODULE)}</a>
        </li>
        <li id="ParsVTCalendar"><a
                    href="index.php?module=ParsVT&view=VTCalendar&parent=Settings">{vtranslate('Calendar Settings', $MODULE)}</a>
        </li>
        <li id="ParsDatabase"><a
                    href="index.php?module=ParsVT&view=Database&parent=Settings">{vtranslate('Database Tools', $MODULE)}</a>
        </li>
        <li id="ParsLanguageEditor" {if $smarty.get.view eq 'EditLanguage'}class="active"{/if}><a
                    href="index.php?module=ParsVT&view=LanguageEditor&parent=Settings">{vtranslate('Language Editor', $MODULE)}</a>
        </li>
        <li id="ParsMisc"><a
                    href="index.php?module=ParsVT&view=Misc&parent=Settings">{vtranslate('Miscellaneous Settings', $MODULE)}</a>
        </li>
        {if $RESTAPI eq 1}
        <li id="ParsRestAPI"><a
                    href="index.php?module=ParsVT&view=RestAPI&parent=Settings">{vtranslate('Rest API', $MODULE)}</a></li>
        {/if}
        {if !$WHITELABEL}
        <li id="ParsDevelopment"><a href="index.php?module=ParsVT&view=Development&parent=Settings">{vtranslate('Development', $MODULE)}</a></li>
        <li id="ParsManual"><a href="index.php?module=ParsVT&view=Manual&parent=Settings">{vtranslate('Manual', $MODULE)}</a></li>
        <li id="ParsMoreInfo"><a href="index.php?module=ParsVT&view=MoreInfo&parent=Settings">{vtranslate('More Information', $MODULE)}</a>
        </li>
        {/if}

    </ul>
</div>
<script type="text/javascript">
    var ParsVTErrors = {
        SELECTBACKUPFILE: "{vtranslate('Please select a backup file', $MODULE)}",
        RESTORECONFIRM: "{vtranslate('Are you sure want to restore database file?', $MODULE)}",
        LANGUAGECONFIRM: "{vtranslate('Are you sure want to change default language?', $MODULE)}",
        LOGINCONFIRM: "{vtranslate('Are you sure want to change login language?', $MODULE)}",
        CALENDARCONFIRM: "{vtranslate('Are you sure want to change default calendar?', $MODULE)}",
        TIMEZONECONFIRM: "{vtranslate('Are you sure want to change default TimeZone?', $MODULE)}",
        CURRENCYCONFIRM: "{vtranslate('Are you sure want to change default Currency?', $MODULE)}",
        CONVERTDATACONFIRM: "{vtranslate('Are you sure you want to continue?', $MODULE)}",
        ADMINPASSWORD: "{vtranslate('Admin password can not be left blank', $MODULE)}",
        UNKNOWNERR: "{vtranslate('Unknown Error!', $MODULE)}",
        DELETECONFIRM: "{vtranslate('Are you sure want to delete file?', $MODULE)}",
        OPFAILED: "{vtranslate('Operation Failed : Error !', $MODULE)}",
        DEFLANG: "{vglobal('default_language')}",
        DEFTIMEZONE: "{vglobal('default_timezone')}",
        DEFCAL: "{if vglobal('default_system_date')}{vglobal('default_system_date')}{else}gregorian{/if}",
        DEFLOGIN: "{if vglobal('default_system_date')}{vglobal('default_system_date')}{else}gregorian{/if}",
        DEFCUR: "{vglobal('currency_name')}",
        NO: "{vtranslate('LBL_NO', $MODULE)}",
        YES: "{vtranslate('LBL_YES', $MODULE)}",
    };
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>

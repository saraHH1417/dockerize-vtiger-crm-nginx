<?php /* Smarty version Smarty-3.1.7, created on 2022-11-29 17:03:12
         compiled from "/var/www/html/includes/runtime/../../layouts/v7/modules/ParsVT/SettingsHeader.tpl" */ ?>
<?php /*%%SmartyHeaderCode:43377065663860a18e70597-61472674%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5cac4bbc221f4e543f721de5fb687d1b68ad4c54' => 
    array (
      0 => '/var/www/html/includes/runtime/../../layouts/v7/modules/ParsVT/SettingsHeader.tpl',
      1 => 1669728714,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '43377065663860a18e70597-61472674',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CURRENT_USER_MODEL' => 0,
    'RTLCSS' => 0,
    'RELEASE_NOTIF' => 0,
    'EXTRAS_RELEASE_NOTIF' => 0,
    'MODULE' => 0,
    'MODULE_MODEL' => 0,
    'SettingLink' => 0,
    'RESTAPI' => 0,
    'WHITELABEL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_63860a18ea43e',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_63860a18ea43e')) {function content_63860a18ea43e($_smarty_tpl) {?>
<?php $_smarty_tpl->tpl_vars['CURRENT_USER_MODEL'] = new Smarty_variable(Users_Record_Model::getCurrentUserModel(), null, 0);?>
<script type="text/javascript">
    $(function () {
        $("#Pars<?php echo $_GET['view'];?>
").addClass("active");
        var activetab = $(location).attr('href').split("#");
        if ("1" in activetab) {
            $("#allLanguages").removeClass("active");
            $("#allLanguagesMenu").removeClass("active");
            $("#MiscGereral").removeClass("active");
            $("#MiscGereralMenu").removeClass("active");
            $("#DataBaseGereral").removeClass("active");
            $("#DataBaseGereralMenu").removeClass("active");
            <?php if ($_GET['view']!='RestAPI'){?>
            $("#" + activetab[1]).addClass("active");
            $("#" + activetab[1] + "Menu").addClass("active");
            <?php }?>
        }
        <?php if ($_GET['mode']=='backup'){?>
        $("#DataBaseGereral").removeClass("active");
        $("#DataBaseGereralMenu").removeClass("active");
        $("#DataBaseBackup").addClass("active");
        $("#DataBaseBackupMenu").addClass("active");
        <?php }?>
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
    <?php if ($_smarty_tpl->tpl_vars['CURRENT_USER_MODEL']->value->get('language')!='fa_ir'){?>
    .bootstrap-switch-container {
        min-width: 130px;
    }
    <?php }?>
    .parsvtfeatures {
        background-position: <?php if ($_smarty_tpl->tpl_vars['RTLCSS']->value){?>20px<?php }else{ ?>right<?php }?> center;
        background-repeat: no-repeat;
        background-image: url(data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iMTI4cHgiIGhlaWdodD0iMTI4cHgiPgo8Zz4KCTxnPgoJCTxwYXRoIGQ9Ik00MzcuMzMzLDE5MmgtMzJ2LTQyLjY2N0M0MDUuMzMzLDY2Ljk5LDMzOC4zNDQsMCwyNTYsMFMxMDYuNjY3LDY2Ljk5LDEwNi42NjcsMTQ5LjMzM1YxOTJoLTMyICAgIEM2OC43NzEsMTkyLDY0LDE5Ni43NzEsNjQsMjAyLjY2N3YyNjYuNjY3QzY0LDQ5Mi44NjUsODMuMTM1LDUxMiwxMDYuNjY3LDUxMmgyOTguNjY3QzQyOC44NjUsNTEyLDQ0OCw0OTIuODY1LDQ0OCw0NjkuMzMzICAgIFYyMDIuNjY3QzQ0OCwxOTYuNzcxLDQ0My4yMjksMTkyLDQzNy4zMzMsMTkyeiBNMjg3LjkzOCw0MTQuODIzYzAuMzMzLDMuMDEtMC42MzUsNi4wMzEtMi42NTYsOC4yOTIgICAgYy0yLjAyMSwyLjI2LTQuOTE3LDMuNTUyLTcuOTQ4LDMuNTUyaC00Mi42NjdjLTMuMDMxLDAtNS45MjctMS4yOTItNy45NDgtMy41NTJjLTIuMDIxLTIuMjYtMi45OS01LjI4MS0yLjY1Ni04LjI5Mmw2LjcyOS02MC41MSAgICBjLTEwLjkyNy03Ljk0OC0xNy40NTgtMjAuNTIxLTE3LjQ1OC0zNC4zMTNjMC0yMy41MzEsMTkuMTM1LTQyLjY2Nyw0Mi42NjctNDIuNjY3czQyLjY2NywxOS4xMzUsNDIuNjY3LDQyLjY2NyAgICBjMCwxMy43OTItNi41MzEsMjYuMzY1LTE3LjQ1OCwzNC4zMTNMMjg3LjkzOCw0MTQuODIzeiBNMzQxLjMzMywxOTJIMTcwLjY2N3YtNDIuNjY3QzE3MC42NjcsMTAyLjI4MSwyMDguOTQ4LDY0LDI1Niw2NCAgICBzODUuMzMzLDM4LjI4MSw4NS4zMzMsODUuMzMzVjE5MnoiIGZpbGw9IiNlZDk0NzQiLz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K);
    }

</style>



        <div class = "row">
            <div class=" col-md-9">
<?php if ($_smarty_tpl->tpl_vars['RELEASE_NOTIF']->value){?>
    <div class="col-lg-12 col-md-12 col-sm-12 blink_me text-center">
                        <a href='index.php?parent=Settings&module=ParsVT&view=Upgrade'>
                            <span class="btn btn-info">
                               <?php echo $_smarty_tpl->tpl_vars['RELEASE_NOTIF']->value;?>

                            </span>
                        </a>
                    </div>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['EXTRAS_RELEASE_NOTIF']->value){?>
    <div class="col-lg-12 col-md-12 col-sm-12 blink_me text-center">
                        <a href='index.php?parent=Settings&module=ParsVTExtras&view=Upgrade' target="_blank">
                            <span class="btn btn-info">
                               <?php echo $_smarty_tpl->tpl_vars['EXTRAS_RELEASE_NOTIF']->value;?>

                            </span>
                        </a>
                    </div>
<?php }?>
	    </div>
            <div class=" col-md-2">
            <div class="btn-group listViewActionsContainer" role="group" aria-label="..." style="float:left">
                    <div class="btn-group pull-right" role="group">
                        <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
                            <?php echo vtranslate('LBL_ACTIONS',$_smarty_tpl->tpl_vars['MODULE']->value);?>
&nbsp;
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
        			<?php  $_smarty_tpl->tpl_vars['SettingLink'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['SettingLink']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['MODULE_MODEL']->value->getSettingLinks(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['SettingLink']->key => $_smarty_tpl->tpl_vars['SettingLink']->value){
$_smarty_tpl->tpl_vars['SettingLink']->_loop = true;
?>
				<?php if ($_smarty_tpl->tpl_vars['SettingLink']->value['linklabel']=='Module Settings'){?><?php continue 1?><?php }?>
				<?php if ($_smarty_tpl->tpl_vars['SettingLink']->value['linklabel']=='Uninstall Module'){?>
				<li class="divider"></li>
				<?php }?>
                                <li><a href="javascript:void(0);" onclick='window.location.href="<?php echo $_smarty_tpl->tpl_vars['SettingLink']->value['linkurl'];?>
"'><?php echo vtranslate($_smarty_tpl->tpl_vars['SettingLink']->value['linklabel'],$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a></li>
				<?php } ?>
                        </ul>
                    </div>
            </div>
            </div>
            <div class=" col-md-1"></div>
            </div>


<div class="" style="margin-top:0px;">
    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
        <li id="ParsPersianPack"><a
                    href="index.php?module=ParsVT&view=PersianPack&parent=Settings"><?php echo vtranslate('Persian Pack Settings',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a>
        </li>
        <li id="ParsVTCalendar"><a
                    href="index.php?module=ParsVT&view=VTCalendar&parent=Settings"><?php echo vtranslate('Calendar Settings',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a>
        </li>
        <li id="ParsDatabase"><a
                    href="index.php?module=ParsVT&view=Database&parent=Settings"><?php echo vtranslate('Database Tools',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a>
        </li>
        <li id="ParsLanguageEditor" <?php if ($_GET['view']=='EditLanguage'){?>class="active"<?php }?>><a
                    href="index.php?module=ParsVT&view=LanguageEditor&parent=Settings"><?php echo vtranslate('Language Editor',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a>
        </li>
        <li id="ParsMisc"><a
                    href="index.php?module=ParsVT&view=Misc&parent=Settings"><?php echo vtranslate('Miscellaneous Settings',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a>
        </li>
        <?php if ($_smarty_tpl->tpl_vars['RESTAPI']->value==1){?>
        <li id="ParsRestAPI"><a
                    href="index.php?module=ParsVT&view=RestAPI&parent=Settings"><?php echo vtranslate('Rest API',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a></li>
        <?php }?>
        <?php if (!$_smarty_tpl->tpl_vars['WHITELABEL']->value){?>
        <li id="ParsDevelopment"><a href="index.php?module=ParsVT&view=Development&parent=Settings"><?php echo vtranslate('Development',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a></li>
        <li id="ParsManual"><a href="index.php?module=ParsVT&view=Manual&parent=Settings"><?php echo vtranslate('Manual',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a></li>
        <li id="ParsMoreInfo"><a href="index.php?module=ParsVT&view=MoreInfo&parent=Settings"><?php echo vtranslate('More Information',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a>
        </li>
        <?php }?>

    </ul>
</div>
<script type="text/javascript">
    var ParsVTErrors = {
        SELECTBACKUPFILE: "<?php echo vtranslate('Please select a backup file',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        RESTORECONFIRM: "<?php echo vtranslate('Are you sure want to restore database file?',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        LANGUAGECONFIRM: "<?php echo vtranslate('Are you sure want to change default language?',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        LOGINCONFIRM: "<?php echo vtranslate('Are you sure want to change login language?',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        CALENDARCONFIRM: "<?php echo vtranslate('Are you sure want to change default calendar?',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        TIMEZONECONFIRM: "<?php echo vtranslate('Are you sure want to change default TimeZone?',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        CURRENCYCONFIRM: "<?php echo vtranslate('Are you sure want to change default Currency?',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        CONVERTDATACONFIRM: "<?php echo vtranslate('Are you sure you want to continue?',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        ADMINPASSWORD: "<?php echo vtranslate('Admin password can not be left blank',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        UNKNOWNERR: "<?php echo vtranslate('Unknown Error!',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        DELETECONFIRM: "<?php echo vtranslate('Are you sure want to delete file?',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        OPFAILED: "<?php echo vtranslate('Operation Failed : Error !',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        DEFLANG: "<?php echo vglobal('default_language');?>
",
        DEFTIMEZONE: "<?php echo vglobal('default_timezone');?>
",
        DEFCAL: "<?php if (vglobal('default_system_date')){?><?php echo vglobal('default_system_date');?>
<?php }else{ ?>gregorian<?php }?>",
        DEFLOGIN: "<?php if (vglobal('default_system_date')){?><?php echo vglobal('default_system_date');?>
<?php }else{ ?>gregorian<?php }?>",
        DEFCUR: "<?php echo vglobal('currency_name');?>
",
        NO: "<?php echo vtranslate('LBL_NO',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
        YES: "<?php echo vtranslate('LBL_YES',$_smarty_tpl->tpl_vars['MODULE']->value);?>
",
    };
    jQuery(document).ready(function () {
        Vtiger_Index_Js.getInstance().registerEvents();
    });
</script>
<?php }} ?>
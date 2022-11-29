<?php /* Smarty version Smarty-3.1.7, created on 2022-11-29 17:03:12
         compiled from "/var/www/html/includes/runtime/../../layouts/v7/modules/ParsVT/PersianPack.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7464515763860a18d23144-35653139%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b2bb99b2731c30757a86d1adf1b43fab1ab33175' => 
    array (
      0 => '/var/www/html/includes/runtime/../../layouts/v7/modules/ParsVT/PersianPack.tpl',
      1 => 1669728714,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7464515763860a18d23144-35653139',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'QUALIFIED_MODULE' => 0,
    'DBSTATUS' => 0,
    'BASICLANG' => 0,
    'RTLCSS' => 0,
    'WHITELABEL' => 0,
    'VIDEOS' => 0,
    'TOUR' => 0,
    'IS_DATA_POPULATED' => 0,
    'DEFAULTCURRENCY' => 0,
    'TOMANCURRENCY' => 0,
    'ISUSEDTOMANCURRENCY' => 0,
    'AFNCURRENCY' => 0,
    'ISUSEDAFNCURRENCY' => 0,
    'DEFAULTLANGUAGE' => 0,
    'LOGINLANGUAGE' => 0,
    'CHECKLAYOUT' => 0,
    'CHECKLNGHNDLR' => 0,
    'EMAILTEMPLATES' => 0,
    'SYSTEMWORKFLOWS' => 0,
    'CHECKREPORTS' => 0,
    'FIXNUMS' => 0,
    'FIXCHARS' => 0,
    'CHECKCKEDITOR' => 0,
    'DESKTOPNOTIFICATIONS' => 0,
    'CUSTOMKEYBOARD' => 0,
    'FULLMODULE' => 0,
    'FEATUREMESSAGE' => 0,
    'TCPDF' => 0,
    'ADVCF' => 0,
    'LANGEDITOR' => 0,
    'DBBACKUP' => 0,
    'SPEECH' => 0,
    'RESTAPI' => 0,
    'KANBANGRID' => 0,
    'KANBAN' => 0,
    'PDFOFFICIALBILL' => 0,
    'PDFLINK' => 0,
    'PDFWATERMARK' => 0,
    'PDFLOGO' => 0,
    'PDFSIGN' => 0,
    'PDFCOMMENT' => 0,
    'PDFLONGPCODE' => 0,
    'PDFUNIT' => 0,
    'PDFLAYOUTS' => 0,
    'PDFMAKERSTATUS' => 0,
    'PDFMAKER' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_63860a18e6808',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_63860a18e6808')) {function content_63860a18e6808($_smarty_tpl) {?>﻿
<?php echo $_smarty_tpl->getSubTemplate (vtemplate_path('SettingsHeader.tpl',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php $_smarty_tpl->tpl_vars['FEATUREMESSAGE'] = new Smarty_variable(vtranslate('This feature is currently not available in current package!',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value), null, 0);?>

<div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="PersianPack">
    <div>
        <div>
            <div class="container-fluid">
                <div class="contents">
                    <br>
                </div>
                <div class="container-fluid">
                    <div class="related-tabs">
                        <div class="row form-group">
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend><?php echo vtranslate('Primary Version',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('MySQL Full Unicode Support',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <a href="index.php?module=<?php echo $_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value;?>
&view=Database&parent=Settings<?php if ($_smarty_tpl->tpl_vars['DBSTATUS']->value){?>#DataBaseNeedAttention<?php }?>"
                                               target="_blank" <?php if ($_smarty_tpl->tpl_vars['DBSTATUS']->value){?>class="blink_me"
                                               style="color:#a94442"<?php }else{ ?> style="color:#3c763d"<?php }?>>
                                                <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['DBSTATUS']->value){?> value='0' <?php }else{ ?> value='1' checked<?php }?>
                                                       disabled readonly
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                       data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                       data-on-color="primary" data-toggle="toggle"/>
                                                <?php echo vtranslate('MySQL Full Unicode Support',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Persian Core Language Pack',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['BASICLANG']->value){?> value='1' checked disabled<?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle"  data-type="BasicPersian"/>
                                            <a id="FarsiCoreLanguagePack"> <?php echo vtranslate('Persian Core Language Pack',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</a></li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Right-to-Left(RTL) Layout',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['RTLCSS']->value){?> value='1'  checked<?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="RTLStyle"/>
                                            <?php echo vtranslate('Right-to-Left(RTL) Layout',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                        <?php if (!$_smarty_tpl->tpl_vars['WHITELABEL']->value){?>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('View Tutorial Videos',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['VIDEOS']->value){?> value='1'  checked<?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="VIDEOS"/>
                                            <?php echo vtranslate('View Tutorial Videos',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                        <?php }?>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('View Training Tour',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['TOUR']->value){?> value='1'  checked<?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="TOUR"/>
                                            <?php echo vtranslate('View Training Tour',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                        <?php if (!$_smarty_tpl->tpl_vars['WHITELABEL']->value){?>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['IS_DATA_POPULATED']->value){?><?php echo vtranslate('Clear demo records in all modules.',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }else{ ?><?php echo vtranslate('Load demo data in all modules.',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input id="demodatas" style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['IS_DATA_POPULATED']->value){?> value='1'  checked<?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-title="<?php if ($_smarty_tpl->tpl_vars['IS_DATA_POPULATED']->value){?><?php echo vtranslate('Clear demo records in all modules.',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }else{ ?><?php echo vtranslate('Load demo data in all modules.',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>"
                                                    data-language="<?php if ($_smarty_tpl->tpl_vars['IS_DATA_POPULATED']->value){?><?php echo vtranslate('Are you sure you want to clear demo data in all modules?',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

<?php echo vtranslate("Demo records can be added by clicking the Add Demo Data button.",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

<br>
<br>
<?php echo vtranslate('This process may take several minutes. Please wait while CRM installs demo records on your system.',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }else{ ?><?php echo vtranslate('Are you sure you want to add demo records to all modules?',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

<?php echo vtranslate('Demo records can be deleted by clicking the Clear Demo Data button.',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

<br>
<br>
<?php echo vtranslate('This process may take several minutes. Please wait while CRM installs demo records on your system.',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>"  data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
" data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
" data-on-color="danger" data-toggle="toggle" data-type="DemoData"/>
                                            <?php if ($_smarty_tpl->tpl_vars['IS_DATA_POPULATED']->value){?><?php echo vtranslate('Clear Demo Data',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }else{ ?><?php echo vtranslate('Add Demo Data',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?></li>
                                        <?php }?>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Change Default Currency',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <select class="select2 row" id="defaultcurrency" data-language="<?php echo vtranslate('Default System Currency',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"><?php echo $_smarty_tpl->tpl_vars['DEFAULTCURRENCY']->value;?>
</select>
                                            <a href="index.php?parent=Settings&module=Currency&view=List" target="_blank"><?php echo vtranslate('Default System Currency',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Iran Toman currency',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['TOMANCURRENCY']->value){?> value='1'  checked <?php if ($_smarty_tpl->tpl_vars['ISUSEDTOMANCURRENCY']->value){?> disabled <?php }?><?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="TOMANCURRENCY"/>
                                            <a href="index.php?parent=Settings&module=Currency&view=List" target="_blank"><?php echo vtranslate('Iran Toman currency',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Afghanistan Afghani currency',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['AFNCURRENCY']->value){?> value='1'  checked <?php if ($_smarty_tpl->tpl_vars['ISUSEDAFNCURRENCY']->value){?> disabled <?php }?><?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="AFNCURRENCY"/>
                                            <a href="index.php?parent=Settings&module=Currency&view=List" target="_blank"><?php echo vtranslate('Afghanistan Afghani currency',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</a>
                                        </li>
                                    </ul>
                                </fieldset>
                                <fieldset class="vtToolBox">
                                    <legend><?php echo vtranslate('Advanced Version',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Change Default Language',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <select class="select2 row" id="defaultlanguage" data-language="<?php echo vtranslate('Default System Language',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"><?php echo $_smarty_tpl->tpl_vars['DEFAULTLANGUAGE']->value;?>
</select>
                                            <?php echo vtranslate('Default System Language',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
 <?php echo vtranslate('(English is recommended)',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Login Page Language',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <select class="select2 row" id="loginlanguage"
                                                    data-language="<?php echo vtranslate('Login Page Language',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"><?php echo $_smarty_tpl->tpl_vars['LOGINLANGUAGE']->value;?>
</select>
                                            <?php echo vtranslate('Login Page Language',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Fix Layout Translation',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['CHECKLAYOUT']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FixLayout"/>
                                            <?php echo vtranslate('Fix Layout Translation',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Persian Full Language Pack',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['CHECKLNGHNDLR']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FullPack"/>
                                            <?php echo vtranslate('Persian Full Language Pack',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Translate Email Templates to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['EMAILTEMPLATES']->value){?> value='1' checked  disabled readonly<?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle"
                                                   data-type="EmailTemplates"/>
                                            <?php echo vtranslate('Translate Email Templates to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Translate System Workflows to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['SYSTEMWORKFLOWS']->value){?> value='1' checked  disabled readonly<?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle"
                                                   data-type="SystemWorkflows"/>
                                            <?php echo vtranslate('Translate System Workflows to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Translate Reports to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['CHECKREPORTS']->value){?> value='1' checked  disabled readonly<?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="Reports"/>
                                            <?php echo vtranslate('Translate Reports to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
 <?php echo vtranslate('(Not Recomeneded)',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Convert Persian/Arabic Numbers Into English',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['FIXNUMS']->value){?> value='1' checked <?php }else{ ?> value='0' <?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FixNums"/>
                                            <?php echo vtranslate('Convert Persian/Arabic Numbers Into English',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Convert Arabic Characters Into Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['FIXCHARS']->value){?>  value='1' checked <?php }else{ ?> value='0' <?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FixChars"/>
                                            <?php echo vtranslate('Convert Arabic Characters Into Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Multi-language support for CKEditor (including Persian)',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['CHECKCKEDITOR']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="CKEditor"/>
                                            <?php echo vtranslate('Multi-language support for CKEditor (including Persian)',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('HTML5 Desktop Notifications',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['DESKTOPNOTIFICATIONS']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="Notifications"/>
                                            <?php echo vtranslate('HTML5 Desktop Notifications',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('Add Persian Keyboard to Inputs of All Pages',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['CUSTOMKEYBOARD']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?>
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="Keyboard"/>
                                            <?php echo vtranslate('Persian Keyboard on Fields',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</li>
                                    </ul>
                                </fieldset>
                                <fieldset class="vtToolBox  <?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?>parsvtfeatures<?php }?>">
                                    <legend <?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?>class="text-danger"<?php }?>><?php echo vtranslate('Full Version',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</legend>
                                    <ul class="list-unstyled pvtdash " style="line-height:200%">
                                        <li <?php if (!$_smarty_tpl->tpl_vars['FULLMODULE']->value){?>id='checkpermissions'<?php }?> data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate('Check permissions for required files and folders',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>" style="cursor: pointer">
                                            <span class="fa fa-cog text-info"
                                                  style="font-size:24px;position: relative;bottom: -4px;"></span>
                                            <?php echo vtranslate('Check permissions for required files and folders',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Change Default PDF Output Based on Persian Language",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['TCPDF']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDF"/>
                                            <?php echo vtranslate("Change Default PDF Output Based on Persian Language",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Advanced Custom Fields",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
 - <?php echo vtranslate("(Include Gregorian date, Iranian National Number, Iranian Legal National Number, Iranian VAT ID, Iranian Tax File Number, Iranian Postal Code, Barcode, QR Code Iranian Mobile Number, Whatsapp, Telegram, RTF Field, Assign To Field, Users List, Advanced Date Field, DateTime Field, Iranian Cities Field, Digital Signature, IBAN Code, Upload Single & Multiple Field, Password Field, Credit Card Number, Currency name, Coordinate, Rating & Customer Satisfaction Field, Color Picker , Repeater Field , Instagram & Twitter Field , Voice Recorder Field , Grid Field , Weather Field and Related Field)",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['ADVCF']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="AdvancedCustomFields"/>
                                            <?php echo vtranslate("Advanced Custom Fields",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate('Language Editor',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <a href="index.php?module=<?php echo $_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value;?>
&view=LanguageEditor&parent=Settings"
                                               target="_blank">
                                                <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['LANGEDITOR']->value){?> value='1' checked<?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                       disabled readonly
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                       data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                       data-on-color="primary" data-toggle="toggle"/>
                                                <?php echo vtranslate('Language Editor',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate('Backup and Restore Database',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                                <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['DBBACKUP']->value==0){?> value='0' <?php }else{ ?> value='1' checked<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                       data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                       data-on-color="primary" data-toggle="toggle" data-type="DBBACKUP"/>
                                            <a href="index.php?module=<?php echo $_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value;?>
&view=Database&parent=Settings&mode=backup"
                                               target="_blank">
                                                <?php echo vtranslate('Backup and Restore Database',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate('Type with your voice',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                                <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['SPEECH']->value==0){?> value='0' <?php }else{ ?> value='1' checked<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                       data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                       data-on-color="primary" data-toggle="toggle" data-type="Speech"/>
                                                <?php echo vtranslate('Online Speech Recognition',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
 (<?php echo vtranslate('Google Chrome Only',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
)
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate('ParsVT Restful API',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['RESTAPI']->value==0){?> value='0' <?php }else{ ?> value='1' checked<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="RESTAPI"/>
                                            <?php echo vtranslate('ParsVT Restful API',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <?php if ($_smarty_tpl->tpl_vars['KANBANGRID']->value){?>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate('Kanban & Grid View',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['KANBAN']->value==1){?> value='1' checked <?php }else{ ?>  value='0'  <?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="KanbanGrid"/>
                                            <?php echo vtranslate('Kanban & Grid View',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <?php }?>
                                        
                                    </ul>
                                </fieldset>

                                <?php if ($_smarty_tpl->tpl_vars['TCPDF']->value){?>
                                <fieldset class="vtToolBox <?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?>parsvtfeatures<?php }?>">
                                    <legend <?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?>class="text-danger"<?php }?>><?php echo vtranslate('PDF Export Settings',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Change Default PDF Output Based on Iran's Ministry of Finance Official Invoice",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFOFFICIALBILL']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFOFFICIALBILL"/>
                                            <?php echo vtranslate("Change Default PDF Output Based on Iran's Ministry of Finance Official Invoice",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Output link field of the PDF record",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFLINK']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFLINK"/>
                                            <?php echo vtranslate("Output link field of the PDF record",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <?php if ($_smarty_tpl->tpl_vars['PDFOFFICIALBILL']->value){?>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Company information for use in official invoice",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" value='1' checked readonly disabled
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle"/>
                                            <a href="index.php?module=ParsVT&parent=Settings&view=CD" target="_blank"><?php echo vtranslate("Company information for use in official invoice",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</a>
                                        </li>
                                        <?php }?>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Show WaterMark Status",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFWATERMARK']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFWATERMARK"/>
                                            <?php echo vtranslate("Show WaterMark Status",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Display Logo",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFLOGO']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFLOGO"/>
                                            <?php echo vtranslate("Display Logo",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <?php if ($_smarty_tpl->tpl_vars['PDFOFFICIALBILL']->value){?>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Display Signature in Official Invoice",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFSIGN']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFSIGN"/>
                                            <?php echo vtranslate("Display Signature in Official Invoice",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <?php }?>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Show Product/Service Comments",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFCOMMENT']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFCOMMENT"/>
                                            <?php echo vtranslate("Show Product/Service Comments",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Increase Product/Service Code Column length",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFLONGPCODE']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFLONGPCODE"/>
                                            <?php echo vtranslate("Increase Product/Service Code Column length",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("Show Product/Service Usage Unit",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFUNIT']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFUNIT"/>
                                            <?php echo vtranslate("Show Product/Service Usage Unit",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <li data-toggle="tooltip"
                                            title="<?php echo vtranslate('PDF Page Layout',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
">
                                            <select class="select2 row" id="pdfpagelayout" data-language="<?php echo vtranslate('PDF Page Layout',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"><?php echo $_smarty_tpl->tpl_vars['PDFLAYOUTS']->value;?>
</select>
                                            <?php echo vtranslate('PDF Page Layout',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <?php if ($_smarty_tpl->tpl_vars['PDFMAKERSTATUS']->value){?>
                                        <li data-toggle="tooltip"
                                            title="<?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?><?php echo $_smarty_tpl->tpl_vars['FEATUREMESSAGE']->value;?>
<?php }else{ ?><?php echo vtranslate("PDF Maker integration via custom functions",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?>">
                                            <input style="opacity: 0;" <?php if ($_smarty_tpl->tpl_vars['PDFMAKER']->value){?> value='1' checked <?php }else{ ?> value='0'<?php }?> <?php echo $_smarty_tpl->tpl_vars['FULLMODULE']->value;?>

                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="<?php echo vtranslate('Active',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-off-text="<?php echo vtranslate('Inactive',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFMAKER"/>
                                            <?php echo vtranslate("PDF Maker integration via custom functions",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        </li>
                                        <?php }?>
                                    </ul>
                                </fieldset>
                                <?php }?>



                            </div>
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;<?php echo vtranslate("Primary Version Features",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                    </legend>
                                    <p><?php echo vtranslate('MySQL Full Unicode Support',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Add Persian Language to VTigerCRM',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Vtiger 7 RTL Layout',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                      </p>
                                </fieldset>
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;<?php echo vtranslate("Advanced Version Features",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                    </legend>
                                    <p>
                                        <?php echo vtranslate('All Features of Basic Version',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Fix Layout Translation',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Translate Email Templates to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Translate System Workflows to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Translate Reports to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                        <?php echo vtranslate('(Not Recomeneded)',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Choose Web Fonts for Vtiger Layout',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Translate Vtiger Default Editor to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Change Layout for Other Languages (RTL & LTR)',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate("Correcting Arabic letters and converting Persian letters, with no need to install or change keyboard in the user's system",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Convert Persian/Arabic Numbers Into English',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Translate System Charts to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Add Persian Keyboard to Inputs of All Pages',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('HTML5 Desktop Notifications',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Persian Keyboard on Fields',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                    </p>
                                </fieldset>
                                <fieldset class="vtToolBox">
                                    <legend  <?php if ($_smarty_tpl->tpl_vars['FULLMODULE']->value){?>class="text-danger"<?php }?>>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;<?php echo vtranslate("Full Version Features",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                    </legend>
                                    <p>
                                        <?php echo vtranslate('All Features of Pro and Calendar Version',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Support Vtiger Calendar Module',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Change Translations Based on Common Business Terms through Admin Panel (Administrators Only)',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Translate PDF Outputs in Purchase Order, Sales Order, Quotations and Invoices to Persian',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate("Change Default PDF Output Based on Iran's Ministry of Finance Official Invoice",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate('Support Persian PDF in Customer Portal',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<br/>
                                        <?php echo vtranslate("Advanced Custom Fields",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
 - <?php if (!$_smarty_tpl->tpl_vars['WHITELABEL']->value){?> <a href="http://vtfarsi.ir/vtiger-custom-fields/" target="_blank"><?php }?><?php echo vtranslate("(Include Gregorian date, Iranian National Number, Iranian Legal National Number, Iranian VAT ID, Iranian Tax File Number, Iranian Postal Code, Barcode, QR Code Iranian Mobile Number, Whatsapp, Telegram, RTF Field, Assign To Field, Users List, Advanced Date Field, DateTime Field, Iranian Cities Field, Digital Signature, IBAN Code, Upload Single & Multiple Field, Password Field, Credit Card Number, Currency name, Coordinate, Rating & Customer Satisfaction Field, Color Picker , Repeater Field , Instagram & Twitter Field , Voice Recorder Field , Grid Field , Weather Field and Related Field)",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
 (<?php echo vtranslate("Compatible with PDF Maker",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
) <?php if (!$_smarty_tpl->tpl_vars['WHITELABEL']->value){?></a><?php }?> <br/>
                                        <?php echo vtranslate("Online voice to text converter. Type with your voice.",$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>

                                    </p>
                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
<?php }} ?>
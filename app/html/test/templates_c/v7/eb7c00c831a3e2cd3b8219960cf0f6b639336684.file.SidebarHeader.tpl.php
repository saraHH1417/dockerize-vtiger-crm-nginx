<?php /* Smarty version Smarty-3.1.7, created on 2022-11-13 11:43:56
         compiled from "/var/www/html/includes/runtime/../../layouts/v7/modules/Vtiger/partials/SidebarHeader.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7013942956370d87c930847-51528606%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'eb7c00c831a3e2cd3b8219960cf0f6b639336684' => 
    array (
      0 => '/var/www/html/includes/runtime/../../layouts/v7/modules/Vtiger/partials/SidebarHeader.tpl',
      1 => 1668339522,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7013942956370d87c930847-51528606',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'SELECTED_MENU_CATEGORY' => 0,
    'MODULE' => 0,
    'APP_IMAGE_MAP' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_6370d87c93929',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_6370d87c93929')) {function content_6370d87c93929($_smarty_tpl) {?>

<?php $_smarty_tpl->tpl_vars['APP_IMAGE_MAP'] = new Smarty_variable(Vtiger_MenuStructure_Model::getAppIcons(), null, 0);?>

<div class="col-sm-1 col-xs-2 app-indicator-icon-container app-<?php echo $_smarty_tpl->tpl_vars['SELECTED_MENU_CATEGORY']->value;?>
">
	<div class="row" title="<?php if ($_smarty_tpl->tpl_vars['MODULE']->value=='Home'||!$_smarty_tpl->tpl_vars['MODULE']->value){?> <?php echo vtranslate('LBL_DASHBOARD');?>
 <?php }else{ ?><?php echo vtranslate("LBL_".($_smarty_tpl->tpl_vars['SELECTED_MENU_CATEGORY']->value));?>
<?php }?>">
		<span class="app-indicator-icon fa <?php if ($_smarty_tpl->tpl_vars['MODULE']->value=='Home'||!$_smarty_tpl->tpl_vars['MODULE']->value){?>fa-dashboard<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['APP_IMAGE_MAP']->value[$_smarty_tpl->tpl_vars['SELECTED_MENU_CATEGORY']->value];?>
<?php }?>"></span>
	</div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ("modules/Vtiger/partials/SidebarAppMenu.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>
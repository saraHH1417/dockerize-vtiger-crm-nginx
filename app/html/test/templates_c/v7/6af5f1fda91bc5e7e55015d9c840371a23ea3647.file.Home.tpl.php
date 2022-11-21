<?php /* Smarty version Smarty-3.1.7, created on 2022-11-21 11:50:41
         compiled from "/var/www/html/includes/runtime/../../layouts/v7/modules/Rooms/Home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:72157357637b34d98a4a28-29171855%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6af5f1fda91bc5e7e55015d9c840371a23ea3647' => 
    array (
      0 => '/var/www/html/includes/runtime/../../layouts/v7/modules/Rooms/Home.tpl',
      1 => 1669018825,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '72157357637b34d98a4a28-29171855',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CURRENT_USER' => 0,
    'RELATED_MODULES' => 0,
    'CURRENT_USER_AVATAR' => 0,
    'FAVORITE_ROOM_COUNT' => 0,
    'FAVORITE_ROOMS' => 0,
    'FAVORITE_ROOM' => 0,
    'CHANNEL_ROOM_COUNT' => 0,
    'CHANNEL_ROOMS' => 0,
    'CHANNEL_ROOM' => 0,
    'DIRECT_MESSAGE_ROOM_COUNT' => 0,
    'DIRECT_MESSAGE_ROOMS' => 0,
    'DIRECT_MESSAGE_ROOM' => 0,
    'PRIVATE_GROUP_ROOM_COUNT' => 0,
    'PRIVATE_GROUP_ROOMS' => 0,
    'PRIVATE_GROUP_ROOM' => 0,
    'ARCHIVED_ROOM_COUNT' => 0,
    'ARCHIVED_ROOMS' => 0,
    'ARCHIVED_ROOM' => 0,
    'USER_LIST' => 0,
    'USER' => 0,
    'JS_LANGUAGES' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_637b34d98ff91',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_637b34d98ff91')) {function content_637b34d98ff91($_smarty_tpl) {?>
<script type="text/javascript" src="layouts/vlayout/modules/Rooms/resources/emoticons.js" />
<script type="text/javascript" src="libraries/jquery/colorpicker/js/colorpicker.js" />

<div id="collaboration-container" class="collaboration-<?php echo $_smarty_tpl->tpl_vars['CURRENT_USER']->value->get('theme');?>
">
    <input type="hidden" value='<?php echo Zend_Json::encode($_smarty_tpl->tpl_vars['RELATED_MODULES']->value);?>
' id="list-related-modules" />
    <div class="c-panel">
        <div class="c-me">
            <div class='avatar'>
                <?php if ($_smarty_tpl->tpl_vars['CURRENT_USER_AVATAR']->value['id']==null){?>
                    <span style="background-color: <?php echo $_smarty_tpl->tpl_vars['CURRENT_USER_AVATAR']->value['alias_bg'];?>
"><?php echo $_smarty_tpl->tpl_vars['CURRENT_USER_AVATAR']->value['alias_html'];?>
</span>
                <?php }else{ ?>
                    <img src="<?php echo $_smarty_tpl->tpl_vars['CURRENT_USER_AVATAR']->value['path'];?>
_<?php echo $_smarty_tpl->tpl_vars['CURRENT_USER_AVATAR']->value['name'];?>
">
                <?php }?>
            </div>
            <div class="full-name" title="<?php echo $_smarty_tpl->tpl_vars['CURRENT_USER']->value->getName();?>
"><h4><?php echo $_smarty_tpl->tpl_vars['CURRENT_USER']->value->getName();?>
</h4></div>
        </div>
        <div class="clearfix"></div>
        <div class="c-panel-subs c-panel-sub-available">
            <div class="c-panel-favorites">
                <h4><?php echo vtranslate('LBL_FAVORITES','Rooms');?>
</h4>
                <ul>
                    <?php if ($_smarty_tpl->tpl_vars['FAVORITE_ROOM_COUNT']->value>0){?>
                        <?php  $_smarty_tpl->tpl_vars['FAVORITE_ROOM'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['FAVORITE_ROOM']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['FAVORITE_ROOMS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['FAVORITE_ROOM']->key => $_smarty_tpl->tpl_vars['FAVORITE_ROOM']->value){
$_smarty_tpl->tpl_vars['FAVORITE_ROOM']->_loop = true;
?>
                            <li data-record="<?php echo $_smarty_tpl->tpl_vars['FAVORITE_ROOM']->value['roomsid'];?>
" class="c-panel-room-title">
                                <span><?php echo $_smarty_tpl->tpl_vars['FAVORITE_ROOM']->value['name'];?>
</span>
                            </li>
                        <?php } ?>
                    <?php }?>
                </ul>
            </div>
            <div class="c-panel-channel">
                <h4><?php echo vtranslate('LBL_CHANNELS','Rooms');?>
<i class="fa fa-plus-circle pull-right" data-type="channel" title="<?php echo vtranslate('LBL_CREATE_NEW_ROOM','Rooms');?>
"></i></h4>
                <div class="channel-list">
                <?php if ($_smarty_tpl->tpl_vars['CHANNEL_ROOM_COUNT']->value>0){?>
                    <ul>
                        <?php  $_smarty_tpl->tpl_vars['CHANNEL_ROOM'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['CHANNEL_ROOM']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['CHANNEL_ROOMS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['CHANNEL_ROOM']->key => $_smarty_tpl->tpl_vars['CHANNEL_ROOM']->value){
$_smarty_tpl->tpl_vars['CHANNEL_ROOM']->_loop = true;
?>
                            <li data-room-type="<?php echo $_smarty_tpl->tpl_vars['CHANNEL_ROOM']->value['room_type'];?>
" data-record="<?php echo $_smarty_tpl->tpl_vars['CHANNEL_ROOM']->value['roomsid'];?>
" data-record-user="<?php echo $_smarty_tpl->tpl_vars['CHANNEL_ROOM']->value['roomsusersid'];?>
" class="c-panel-room-title">
                                <span><?php echo $_smarty_tpl->tpl_vars['CHANNEL_ROOM']->value['name'];?>
</span><label class="room-unread-number unread-number-<?php echo $_smarty_tpl->tpl_vars['CHANNEL_ROOM']->value['roomsid'];?>
"></label>
                                <i class="fa fa-power-off pull-right hide room-leave-btn" title="<?php echo vtranslate('LBL_LEAVE_TOOLTIP_TITLE','Rooms');?>
"></i>
                                <i class="fa fa-eye-slash pull-right hide room-archive-btn" title="<?php echo vtranslate('LBL_ARCHIVE_TOOLTIP_TITLE','Rooms');?>
"></i>
                            </li>
                        <?php } ?>
                    </ul>
                    <span class="c-panel-channel-more group-more" data-type="Channel">
                        <?php echo vtranslate('LBL_MORE_CHANNELS','Rooms');?>

                    </span>
                <?php }else{ ?>
                    <ul></ul>
                    <?php echo vtranslate('LBL_NO_CHANNELS','Rooms');?>

                <?php }?>
                </div>
            </div>
            <div class="c-panel-direct-message">
                <h4><?php echo vtranslate('LBL_DIRECT_MESSAGES','Rooms');?>
<i class="fa fa-plus-circle pull-right" data-type="direct-message" title="<?php echo vtranslate('LBL_CREATE_NEW_ROOM','Rooms');?>
"></i></h4>
                <div class="direct-message-list">
                    <?php if ($_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM_COUNT']->value>0){?>
                    <ul>
                        <?php  $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOMS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->key => $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->value){
$_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->_loop = true;
?>
                        <li data-room-type="<?php echo $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->value['room_type'];?>
" data-record="<?php echo $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->value['roomsid'];?>
" data-record-user="<?php echo $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->value['roomsusersid'];?>
" class="c-panel-room-title">
                            <span><?php echo $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->value['name'];?>
</span><label class="room-unread-number unread-number-<?php echo $_smarty_tpl->tpl_vars['DIRECT_MESSAGE_ROOM']->value['roomsid'];?>
"></label>
                            <i class="fa fa-power-off pull-right hide room-leave-btn" title="<?php echo vtranslate('LBL_LEAVE_TOOLTIP_TITLE','Rooms');?>
"></i>
                            <i class="fa fa-eye-slash pull-right hide room-archive-btn" title="<?php echo vtranslate('LBL_ARCHIVE_TOOLTIP_TITLE','Rooms');?>
"></i>
                        </li>
                        <?php } ?>
                    </ul>
                    <span class="c-panel-direct-message-more group-more" data-type="Direct Message">
                        <?php echo vtranslate('LBL_MORE_DIRECT_MESSAGES','Rooms');?>

                    </span>
                    <?php }else{ ?>
                        <ul></ul>
                        <?php echo vtranslate('LBL_NO_DIRECT_MESSAGES','Rooms');?>

                    <?php }?>
                </div>
            </div>
            <div class="c-panel-private-group">
                <h4><?php echo vtranslate('LBL_PRIVATE_GROUPS','Rooms');?>
<i class="fa fa-plus-circle pull-right" data-type="private-group" title="<?php echo vtranslate('LBL_CREATE_NEW_ROOM','Rooms');?>
"></i></h4>
                <div class="private-group-list">
                    <?php if ($_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM_COUNT']->value>0){?>
                    <ul>
                        <?php  $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOMS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->key => $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->value){
$_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->_loop = true;
?>
                            <li data-room-type="<?php echo $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->value['room_type'];?>
" data-record="<?php echo $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->value['roomsid'];?>
" data-record-user="<?php echo $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->value['roomsusersid'];?>
" class="c-panel-room-title">
                                <span><?php echo $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->value['name'];?>
</span><label class="room-unread-number unread-number-<?php echo $_smarty_tpl->tpl_vars['PRIVATE_GROUP_ROOM']->value['roomsid'];?>
"></label>
                                <i class="fa fa-power-off pull-right hide room-leave-btn" title="<?php echo vtranslate('LBL_LEAVE_TOOLTIP_TITLE','Rooms');?>
"></i>
                                <i class="fa fa-eye-slash pull-right hide room-archive-btn" title="<?php echo vtranslate('LBL_ARCHIVE_TOOLTIP_TITLE','Rooms');?>
"></i>
                            </li>
                        <?php } ?>
                    </ul>
                    <span class="c-panel-private-group-more group-more" data-type="Private Group">
                        <?php echo vtranslate('LBL_MORE_PRIVATE_GROUPS','Rooms');?>

                    </span>
                    <?php }else{ ?>
                        <ul></ul>
                        <?php echo vtranslate('LBL_NO_PRIVATE_GROUPS','Rooms');?>

                    <?php }?>
                </div>
            </div>
            <div class="c-panel-archived">
                <h4><?php echo vtranslate('LBL_ARCHIVE','Rooms');?>
</h4>
                <div class="archived-list">
                    <?php if ($_smarty_tpl->tpl_vars['ARCHIVED_ROOM_COUNT']->value>0){?>
                        <ul>
                            <?php  $_smarty_tpl->tpl_vars['ARCHIVED_ROOM'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ARCHIVED_ROOMS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->key => $_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->value){
$_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->_loop = true;
?>
                                <li data-room-type="<?php echo $_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->value['room_type'];?>
" data-record="<?php echo $_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->value['roomsid'];?>
" data-record-user="<?php echo $_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->value['roomsusersid'];?>
" class="c-panel-room-title">
                                    <span><?php echo $_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->value['name'];?>
</span><label class="room-unread-number unread-number-<?php echo $_smarty_tpl->tpl_vars['ARCHIVED_ROOM']->value['roomsid'];?>
"></label>
                                    <i class="fa fa-power-off pull-right hide room-leave-btn" title="<?php echo vtranslate('LBL_LEAVE_TOOLTIP_TITLE','Rooms');?>
"></i>
                                    <i class="fa fa-eye pull-right hide room-restore-archive-btn" title="<?php echo vtranslate('LBL_REMOVE_ARCHIVE_TOOLTIP_TITLE','Rooms');?>
"></i>
                                </li>
                            <?php } ?>
                        </ul>
                        <span class="c-panel-archived-more group-more" data-type="Archived">
                        <?php echo vtranslate('LBL_MORE_ARCHIVE','Rooms');?>

                    </span>
                    <?php }else{ ?>
                        <ul></ul>
                        <?php echo vtranslate('LBL_NO_ARCHIVE','Rooms');?>

                    <?php }?>
                </div>
            </div>
            <div class="c-panel-history">
                <h4><?php echo vtranslate('LBL_HISTORY','Rooms');?>
</h4>
            </div>
        </div>
        <div class="c-panel-subs c-panel-sub-form">
            <div class="c-panel-sub-form-child c-panel-channel-form">
                <h4><?php echo vtranslate('LBL_CREATE_CHANEL','Rooms');?>
</h4>
                <div class="input-line">
                    <label for="channel-name"><?php echo vtranslate('LBL_ROOM_NAME','Rooms');?>
</label>
                    <input type="text" id="channel-name" class="required">
                </div>
                <div class="input-submit">
                    <button class="btn btn-success" type="button" data-type="channel"><strong><?php echo vtranslate('LBL_SAVE','Rooms');?>
</strong></button>
                    <button class="cancelLink btn btn-warning" type="button"><?php echo vtranslate('LBL_CANCEL','Rooms');?>
</button>
                </div>
            </div>
            <div class="c-panel-sub-form-child c-panel-direct-message-form">
                <h4><?php echo vtranslate('LBL_CREATE_DIRECT_MESSAGE','Rooms');?>
</h4>
                <div class="input-line">
                    <label for="who"><?php echo vtranslate('LBL_WITH_WHOM','Rooms');?>
</label>
                    <select name="who" class="inputElement select2" id="who" data-placeholder="<?php echo vtranslate('LBL_MEMBERS','Rooms');?>
">
                        <?php  $_smarty_tpl->tpl_vars['USER'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['USER']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['USER_LIST']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['USER']->key => $_smarty_tpl->tpl_vars['USER']->value){
$_smarty_tpl->tpl_vars['USER']->_loop = true;
?>
                            <option value="<?php echo $_smarty_tpl->tpl_vars['USER']->value['id'];?>
" class="user-status status-<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['USER']->value['log_status_class'];?>
<?php $_tmp1=ob_get_clean();?><?php echo $_tmp1;?>
"><?php echo $_smarty_tpl->tpl_vars['USER']->value['fullname'];?>
</option>
                        <?php } ?>
                    </select>
                </div>
                <div class="input-submit">
                    <button class="btn btn-success" type="button" data-type="direct-message"><strong><?php echo vtranslate('LBL_SAVE','Rooms');?>
</strong></button>
                    <button class="cancelLink btn btn-warning" type="button"><?php echo vtranslate('LBL_CANCEL','Rooms');?>
</button>
                </div>
            </div>
            <div class="c-panel-sub-form-child c-panel-private-group-form">
                <h4><?php echo vtranslate('LBL_CREATE_PRIVATE_GROUP','Rooms');?>
</h4>
                <div class="input-line">
                    <label for="private-group-name"><?php echo vtranslate('LBL_ROOM_NAME','Rooms');?>
</label>
                    <input type="text" id="private-group-name" class="required">
                </div>
                <div class="input-line">
                    <label for="group-members"><?php echo vtranslate('LBL_MEMBERS','Rooms');?>
</label>
                    <select name="private-group-members" class="inputElement select2" id="private-group-members" multiple="multiple" data-placeholder="<?php echo vtranslate('LBL_MEMBERS','Rooms');?>
" >
                        <?php  $_smarty_tpl->tpl_vars['USER'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['USER']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['USER_LIST']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['USER']->key => $_smarty_tpl->tpl_vars['USER']->value){
$_smarty_tpl->tpl_vars['USER']->_loop = true;
?>
                            <option value="<?php echo $_smarty_tpl->tpl_vars['USER']->value['id'];?>
" class="user-status status-<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['USER']->value['log_status_class'];?>
<?php $_tmp2=ob_get_clean();?><?php echo $_tmp2;?>
"><?php echo $_smarty_tpl->tpl_vars['USER']->value['fullname'];?>
</option>
                        <?php } ?>
                    </select>
                </div>
                <div class="input-submit">
                    <button class="btn btn-success" type="button" data-type="private-group"><strong><?php echo vtranslate('LBL_SAVE','Rooms');?>
</strong></button>
                    <button class="cancelLink btn btn-warning" type="button"><?php echo vtranslate('LBL_CANCEL','Rooms');?>
</button>
                </div>
            </div>
        </div>
        <div class="c-panel-subs c-panel-sub-all">
            <div class="c-panel-all-rooms">
            </div>
        </div>
    </div>
    <div class="c-details">
        <?php echo vtranslate('LBL_COLLABORATION_HOME','Rooms');?>

    </div>
    <div id="collaboration_js_strings" class="hide noprint"><?php echo Zend_Json::encode($_smarty_tpl->tpl_vars['JS_LANGUAGES']->value);?>
</div>
</div>

<?php }} ?>
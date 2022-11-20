{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}

{strip}
        <div class="row-fluid">
            <div class="span2">{vtranslate('Application key','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="app_key" value="{$TASK_OBJECT->app_key}" /><span><small>{vtranslate("You can find your key on the settings section of your application inside the developer portal.",'PushNotification')}</small></span>
                <input type="hidden" name="target_type" value="app" />  {*$TASK_OBJECT->target_type*}
                <input type="hidden" name="content_type" value="{$TASK_OBJECT->content_type}" />
                <input type="hidden" name="content_extra" value="{$TASK_OBJECT->content_extra}" />
                <input type="hidden" name="target_alias" value="{$TASK_OBJECT->target_alias}" />
                <input type="hidden" name="access_token" value="{$TASK_OBJECT->access_token}" />
                <input type="hidden" name="pushed_id" value="{$TASK_OBJECT->pushed_id}" />
            </div>
        </div>

        <div class="row-fluid">
            <div class="span2">{vtranslate('Application secret','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="app_secret" value="{$TASK_OBJECT->app_secret}" /><span><small>{vtranslate("You can find your secret on the settings section of your application inside the developer portal.",'PushNotification')}</small></span>
            </div>
        </div>

            <div class="row-fluid">
                <div class="span2">{vtranslate('LBL_ADD_FIELDS',$QUALIFIED_MODULE)}</div>
                <div class="span10">
                    <select class="chzn-select task-fields" style="min-width: 150px;">
                        {$ALL_FIELD_OPTIONS}
                    </select>	
                </div>
                <div class="row-fluid">
                <div class="span2">{vtranslate('Message','PushNotification')}</div>
                    <textarea name="content" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->content}</textarea><span><small>{vtranslate("The maximum length is 140 characters",'PushNotification')}</small></span>
                </div>
            </div>
{/strip}	
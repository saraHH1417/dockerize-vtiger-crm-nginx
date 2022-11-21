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
                <div class="span2">{vtranslate('API URL','PushNotification')}<span class="redColor">*</span></div>
                <div class="span8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[custom[url]]' name="api_url" value="{$TASK_OBJECT->api_url}" style="direction:ltr; text-align:left"/>
                </div>
            </div>

            <div class="row-fluid" style="display:none">
                <div class="span2">{vtranslate('Webhook Bot','PushNotification')}<span class="redColor">*</span></div>
                <div class="span8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[required]' name="username" value="{if $TASK_OBJECT->username neq ''}{$TASK_OBJECT->username}{else}webhookbot{/if}" />
                </div>
            </div>

            <div class="row-fluid">
                <div class="span2">{vtranslate('Channel','PushNotification')}<span class="redColor">*</span></div>
                <div class="span8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[required]' name="channel" value="{$TASK_OBJECT->channel}" />
                </div>
            </div>
            <div class="row-fluid">
                <div class="span2">{vtranslate('Icon Emoji','PushNotification')}</div>
                <div class="span8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[required]' name="icon_emoji" value="{$TASK_OBJECT->icon_emoji}" />
                </div>
            </div>

            <div class="row-fluid">
                <div class="span2">{vtranslate('LBL_ADD_FIELDS',$QUALIFIED_MODULE)}</div>
                <div class="span10">
                    <select class="select2 task-fields" style="min-width: 150px;">
                        {$ALL_FIELD_OPTIONS}
                    </select>	
                </div>
                <div class="row-fluid">
                <div class="span2">{vtranslate('Message','PushNotification')}</div>
                    <textarea name="text" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->text}</textarea>
                </div>
            </div>
{/strip}
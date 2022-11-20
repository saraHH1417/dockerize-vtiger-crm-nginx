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
    <div class="row">
        <div class="col-lg-9">
            <div class="row form-group">
                <div class="col-lg-2">{vtranslate('API URL','PushNotification')}<span class="redColor">*</span></div>
                <div class="col-lg-8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[custom[url]]' name="api_url" value="{$TASK_OBJECT->api_url}" style="direction:ltr; text-align:left"/>
                </div>
            </div>

            <div class="row form-group" style="display:none">
                <div class="col-lg-2">{vtranslate('Webhook Bot','PushNotification')}<span class="redColor">*</span></div>
                <div class="col-lg-8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[required]' name="username" value="{if $TASK_OBJECT->username neq ''}{$TASK_OBJECT->username}{else}webhookbot{/if}" />
                </div>
            </div>

            <div class="row form-group">
                <div class="col-lg-2">{vtranslate('Channel','PushNotification')}<span class="redColor">*</span></div>
                <div class="col-lg-8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[required]' name="channel" value="{$TASK_OBJECT->channel}" />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-2">{vtranslate('Icon Emoji','PushNotification')}</div>
                <div class="col-lg-8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[required]' name="icon_emoji" value="{$TASK_OBJECT->icon_emoji}" />
                </div>
            </div>

            <div class="row form-group">
                <div class="col-lg-2">{vtranslate('LBL_ADD_FIELDS',$QUALIFIED_MODULE)}</div>
                <div class="col-lg-10">
                    <select class="select2 task-fields" style="min-width: 150px;">
                        {$ALL_FIELD_OPTIONS}
                    </select>	
                </div>
                <div class="col-lg-2"> &nbsp; </div>
                <div class="col-lg-10"> &nbsp; </div>
                <div class="col-lg-2">{vtranslate('Message','PushNotification')}</div>
                <div class="col-lg-6">
                    <textarea name="text" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->text}</textarea>
                </div>
            </div>
        </div>
    </div>
{/strip}
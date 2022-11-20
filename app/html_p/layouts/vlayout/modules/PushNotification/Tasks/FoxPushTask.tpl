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
{assign var=ISACTIVE value=$TASK_OBJECT->IsActive()}

{strip}

        {if !$ISACTIVE}
        <div class="row-fluid">
            <div class="alert alert-danger">
                {vtranslate('Web Push settings are not set correctly!','PushNotification')} <br /> <a href="index.php?module=PushNotification&parent=Settings&view=Settings" target="_blank">{vtranslate('You may have to manually configure the Web Push settings.','PushNotification')}</a>
            </div>
        </div>
        {/if}

        <div class="row-fluid">
            <div class="span2">{vtranslate('Name','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="name" value="{$TASK_OBJECT->name}" /><span><small>{vtranslate("Campaign Name",'PushNotification')}</small></span>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span2">{vtranslate('Title','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" maxlength="32"  class="inputElement" data-validation-engine='validate[required]' name="title" value="{$TASK_OBJECT->title}" />
            </div>
        </div>


        <div class="row-fluid">
            <div class="span2">{vtranslate('Url','PushNotification')}</div>
            <div class="span10">
                <input type="text" class="inputElement"  data-validation-engine='validate[custom[url]]' name="url" value="{$TASK_OBJECT->url}" />
            </div>
        </div>


        <div class="row-fluid">
            <div class="span2">{vtranslate('Icon','PushNotification')}</div>
            <div class="span10">
                <input type="text" class="inputElement"  data-validation-engine='validate[custom[url]]' name="icon" value="{$TASK_OBJECT->icon}" /><span><small>{vtranslate("Icon Url Address",'PushNotification')}</small></span>
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
                    <textarea name="message" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->message}</textarea><span><small>{vtranslate("The maximum length is 80 characters",'PushNotification')}</small></span>
                </div>
            </div>
{/strip}	
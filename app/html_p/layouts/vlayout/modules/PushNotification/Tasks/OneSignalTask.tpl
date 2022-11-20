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
            <div class="span2">{vtranslate('Title','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="title" value="{$TASK_OBJECT->title}" />
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
                
                <input type="text" class="inputElement"  data-validation-engine='validate[custom[url]]' name="chrome_web_icon" value="{$TASK_OBJECT->chrome_web_icon}" /><span><small>{vtranslate("Icon Url Address",'PushNotification')} - {vtranslate("Image size must be smaller than 192x192 px",'PushNotification')}</small></span>
                {*
                <input type="text" name="firefox_icon" value="{$TASK_OBJECT->firefox_icon}" />
                <input type="text" name="chrome_web_image" value="{$TASK_OBJECT->chrome_web_image}" />
                *}
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
                    <textarea name="contents" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->contents}</textarea>
                    <input type="hidden" name="included_segments" value="All" />  {*$TASK_OBJECT->included_segments*}
                </div>
            </div>
{/strip}	
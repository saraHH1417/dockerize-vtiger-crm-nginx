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

    <div class="row">
        <div class="col-lg-9">


            {if !$ISACTIVE}
                <div class="row form-group">
                    <div class="col-lg-12">
                        <div class="alert alert-danger">
                            {vtranslate('Web Push settings are not set correctly!','PushNotification')} <br /> <a href="index.php?module=PushNotification&parent=Settings&view=Settings" target="_blank">{vtranslate('You may have to manually configure the Web Push settings.','PushNotification')}</a>
                        </div>
                    </div>
                </div>
            {/if}


            <div class="row form-group">
                <div class="col-lg-2">{vtranslate('Title','PushNotification')}<span class="redColor">*</span></div>
                <div class="col-lg-10">
                    <input type="text" maxlength="100"  class="inputElement" data-validation-engine='validate[required]' name="title" value="{$TASK_OBJECT->title}" />
                    <span><small>{vtranslate("The maximum length is 100 characters",'PushNotification')}</small></span>
                </div>
            </div>


            <div class="row form-group">
                <div class="col-lg-2">{vtranslate('Url','PushNotification')}</div>
                <div class="col-lg-10">
                    <input type="text" class="inputElement"  data-validation-engine='validate[custom[url]]' name="redirect_url" value="{$TASK_OBJECT->redirect_url}" />
                </div>
            </div>


            <div class="row form-group">
                <div class="col-lg-2">{vtranslate('Icon','PushNotification')}</div>
                <div class="col-lg-10">
                    <input type="text" class="inputElement"  data-validation-engine='validate[custom[url]]' name="image" value="{$TASK_OBJECT->image}" /><span><small>{vtranslate("Image Url Address",'PushNotification')}</small></span>
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
                    <textarea name="message" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->message}</textarea><span><small>{vtranslate("The maximum length is 200 characters",'PushNotification')}</small></span>
                </div>
            </div>

            <br /><br /><br /><br />
        </div>
    </div>

{/strip}
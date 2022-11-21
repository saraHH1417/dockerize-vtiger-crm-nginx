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
{assign var=sounds value=$TASK_OBJECT->getSounds()}

<div class="row">
    <div class="col-lg-9">

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Key/API Token','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="token" value="{$TASK_OBJECT->token}" /><span><small>{vtranslate("Your application's API token",'PushNotification')}</small></span>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('User/Group Key','PushNotification')}</div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]'  name="user" value="{$TASK_OBJECT->user}" /><span><small>{vtranslate('The user/group key (not e-mail address) of your user (or you)','PushNotification')}</small></span>
            </div>
        </div>


        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Title','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="title" value="{$TASK_OBJECT->title}" />
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Url','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[custom[url]]' name="url" value="{if $TASK_OBJECT->url neq ''}{$TASK_OBJECT->url}{else}{vglobal('site_URL')}{/if}" style="direction:ltr; text-align:left" />
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Url Title','PushNotification')}</span>
            </div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[funcCall[Vtiger_Base_Validator_Js.invokeValidation]]' name="urltitle" value="{if $TASK_OBJECT->urltitle neq ''}{$TASK_OBJECT->urltitle}{else}{vglobal('HELPDESK_SUPPORT_NAME')}{/if}" />
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Priority','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <select class="task-fields  select2 select2-offscreen" data-validation-engine='validate[required]' name="priority" style="min-width: 150px;">
                    <option value="-2" {if $TASK_OBJECT->priority eq '-2'}selected{/if}>{vtranslate('Lowest Priority','PushNotification')}</option>
                    <option value="-1" {if $TASK_OBJECT->priority eq '-1'}selected{/if}>{vtranslate('Low Priority','PushNotification')}</option>
                    <option value="0" {if $TASK_OBJECT->priority eq '0'}selected{/if}>{vtranslate('Normal Priority','PushNotification')}</option>
                    <option value="1" {if $TASK_OBJECT->priority eq '1'}selected{/if}>{vtranslate('High Priority','PushNotification')}</option>
                    <option value="2" {if $TASK_OBJECT->priority eq '2'}selected{/if}>{vtranslate('Emergency Priority','PushNotification')}</option>
                </select>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Retry (second)','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <select class="task-fields select2 select2-offscreen" data-validation-engine='validate[required]' name="retry" style="min-width: 150px;">
                    <option value="30" {if $TASK_OBJECT->retry eq '30'}selected{/if}>{vtranslate('30 Seconds','PushNotification')}</option>
                    <option value="60" {if $TASK_OBJECT->retry eq '60'}selected{/if}>{vtranslate('60 Seconds','PushNotification')}</option>
                    <option value="120" {if $TASK_OBJECT->retry eq '120'}selected{/if}>{vtranslate('120 Seconds','PushNotification')}</option>
                    <option value="180" {if $TASK_OBJECT->retry eq '180'}selected{/if}>{vtranslate('180 Seconds','PushNotification')}</option>
                    <option value="300" {if $TASK_OBJECT->retry eq '300'}selected{/if}>{vtranslate('300 Seconds','PushNotification')}</option>
                    <option value="600" {if $TASK_OBJECT->retry eq '600'}selected{/if}>{vtranslate('600 Seconds','PushNotification')}</option>
                    <option value="1800" {if $TASK_OBJECT->retry eq '1800'}selected{/if}>{vtranslate('1800 Seconds','PushNotification')}</option>
                    <option value="3600" {if $TASK_OBJECT->retry eq '3600'}selected{/if}>{vtranslate('3600 Seconds','PushNotification')}</option>
                </select>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Expire Retry (second)','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <select class="task-fields select2 select2-offscreen" data-validation-engine='validate[required]' name="expire" style="min-width: 150px;">
                    <option value="1800" {if $TASK_OBJECT->expire eq '1800'}selected{/if}>{vtranslate('30 minutes','PushNotification')}</option>
                    <option value="3600" {if $TASK_OBJECT->expire eq '3600'}selected{/if}>{vtranslate('1 hour','PushNotification')}</option>
                    <option value="7200" {if $TASK_OBJECT->expire eq '7200'}selected{/if}>{vtranslate('2 hour','PushNotification')}</option>
                    <option value="21600" {if $TASK_OBJECT->expire eq '21600'}selected{/if}>{vtranslate('6 hour','PushNotification')}</option>
                    <option value="43200" {if $TASK_OBJECT->expire eq '4300'}selected{/if}>{vtranslate('12 hour','PushNotification')}</option>
                    <option value="86400" {if $TASK_OBJECT->expire eq '86400'}selected{/if}>{vtranslate('24 hour','PushNotification')}</option>
                </select>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Callback Url','PushNotification')}</div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[custom[url]]' name="callbackurl" value="{if $TASK_OBJECT->callbackurl neq ''}{$TASK_OBJECT->callbackurl}{else}{vglobal('site_URL')}{/if}" style="direction:ltr; text-align:left"/>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Sound','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <select class="task-fields select2 select2-offscreen" data-validation-engine='validate[required]' name="sound" style="min-width: 150px;">
                   {foreach from=$sounds key=key item=value}
                    <option value="{$key}" {if $TASK_OBJECT->s eq $key}selected{/if}>{vtranslate($value,'PushNotification')}</option>
                   {/foreach}
                </select>
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
                    <textarea name="content" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->content}</textarea>
                </div>
            </div>

<br /><br /><br /><br />
    </div>
</div>

{/strip}	
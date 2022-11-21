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
            <div class="span2">{vtranslate('Host','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="host" value="{$TASK_OBJECT->host}" />
                <input type="hidden" class="inputElement" name="resource" value="{if $TASK_OBJECT->resource eq ''}xmpphp{else}{$TASK_OBJECT->resource}{/if}" />
                <input type="hidden" class="inputElement" name="timeout" value="10" />
                <input type="hidden" class="inputElement" name="server" value="{$TASK_OBJECT->server}" />

            </div>
        </div>

        <div class="row-fluid">
            <div class="span2">{vtranslate('Port','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="port" value="{if $TASK_OBJECT->port eq ''}5222{else}{$TASK_OBJECT->port}{/if}" />
            </div>
        </div>

        <div class="row-fluid">
            <div class="span2">{vtranslate('XMPP Username','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="username" value="{$TASK_OBJECT->username}" />
            </div>
        </div>

        <div class="row-fluid">
            <div class="span2">{vtranslate('XMPP Password','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="password" class="inputElement" data-validation-engine='validate[required]' name="password" value="{$TASK_OBJECT->password}" />
            </div>
        </div>

        <div class="row-fluid">
            <div class="span2">{vtranslate('Target User','PushNotification')}<span class="redColor">*</span></div>
            <div class="span10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="to" value="{$TASK_OBJECT->to}" /><span><small>{vtranslate("Please enter the username or alias of the person you would like to IM",'PushNotification')}</small></span>
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
                </div>
            </div>
{/strip}	
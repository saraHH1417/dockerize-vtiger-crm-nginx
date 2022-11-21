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
                <div class="span2">{vtranslate('API Token','PushNotification')}<span class="redColor">*</span></div>
                <div class="span8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[required]' name="token" value="{$TASK_OBJECT->token}" />
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
                    <textarea name="content" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->content}</textarea>
                </div>
            </div>
{/strip}
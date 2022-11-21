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
                <div class="col-lg-2">{vtranslate('API Token','PushNotification')}<span class="redColor">*</span></div>
                <div class="col-lg-8">
                 	<input type="text" class="inputElement" data-validation-engine='validate[required]' name="token" value="{$TASK_OBJECT->token}" />
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
        </div>
    </div>
{/strip}
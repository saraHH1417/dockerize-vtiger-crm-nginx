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
{assign var=vibration value=$TASK_OBJECT->getVibration()}

<div class="row">
    <div class="col-lg-9">

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Key','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="k" value="{$TASK_OBJECT->k}" /><span><small>{vtranslate("Private or Alias Key",'PushNotification')}</small></span>
                <input type="hidden" name="d" value="a" />
                <input type="hidden" name="c" value="{$TASK_OBJECT->c}" />
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Title','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[required]' name="t" value="{$TASK_OBJECT->t}" />
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Url Title','PushNotification')}</span>
            </div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[funcCall[Vtiger_Base_Validator_Js.invokeValidation]]' name="ut" value="{if $TASK_OBJECT->ut neq ''}{$TASK_OBJECT->ut}{else}{vglobal('HELPDESK_SUPPORT_NAME')}{/if}" />
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Url','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <input type="text" class="inputElement" data-validation-engine='validate[custom[url]]' name="u" value="{if $TASK_OBJECT->u neq ''}{$TASK_OBJECT->u}{else}{vglobal('site_URL')}{/if}" style="direction:ltr; text-align:left" />
            </div>
        </div>



        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Sound','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <select class="task-fields  select2 select2-offscreen" data-validation-engine='validate[required]' name="s" style="min-width: 150px;">
                   {foreach from=$sounds key=key item=value}
                    <option value="{$key}" {if $TASK_OBJECT->s eq $key}selected{/if}>{vtranslate($value,'PushNotification')}</option>
                   {/foreach}
                </select>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Vibration','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <select class="task-fields  select2 select2-offscreen" data-validation-engine='validate[required]' name="v" style="min-width: 150px;">
                   {foreach from=$vibration key=key item=value}
                    <option value="{$key}" {if $TASK_OBJECT->v eq $key}selected{/if}>{vtranslate($value,'PushNotification')}</option>
                   {/foreach}
                </select>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Icon','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <select class="task-fields select2 select2-offscreen" data-validation-engine='validate[required]' name="i" style="min-width: 150px;">
                    {for $foo=1 to 176}
                    <option value="{$foo}" {if $TASK_OBJECT->i eq $foo}selected{/if}>{vtranslate('Icon','PushNotification')} #{$foo}</option>
                    {/for}
                </select>
            </div>
        </div>



        <div class="row form-group">
            <div class="col-lg-2">{vtranslate('Picture URL','PushNotification')}<span class="redColor">*</span></div>
            <div class="col-lg-10">
                <input type="url" class="inputElement" data-validation-engine='validate[custom[url]]' name="p" value="{$TASK_OBJECT->p}" style="direction:ltr; text-align:left" /><span><small>{vtranslate("Image size must be smaller than 100x100 px",'PushNotification')}</small></span>
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
                    <textarea name="m" class="inputElement fields" style="height: inherit;">{$TASK_OBJECT->m}</textarea>
                </div>
            </div>

<br /><br /><br /><br />
    </div>
</div>

{/strip}	
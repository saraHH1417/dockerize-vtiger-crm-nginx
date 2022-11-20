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
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
{assign var=WHMODULE value=$TASK_OBJECT->getModuleName()}
{assign var=TIMEOUT value=$TASK_OBJECT->getTimeout()}
{assign var=HEADERVALUES value=ZEND_JSON::encode($TASK_OBJECT->header_value_mapping)}
{assign var=UPDATEVALUES value=ZEND_JSON::encode($TASK_OBJECT->update_value_mapping)}
<script src="layouts/vlayout/modules/WebHook/resources/Workflows.js" type="text/javascript" charset="utf-8"></script>
<div class="row-fluid">
    <div class="span2">{vtranslate('Description',$WHMODULE)}<span class="redColor">*</span></div>
    <div class="span10">
        <textarea class="form-control resize-vertical" name="webhook_description" id="webhook_description" data-validation-engine='validate[required]'>{$TASK_OBJECT->webhook_description}</textarea>
    </div>
</div>

    <div class="row-fluid">
        <div class="span2">{vtranslate('HTTP Method',$WHMODULE)}<span class="redColor">*</span></div>
        <div class="span10">
        <select class="task-fields" name="notify_method" data-validation-engine='validate[required]'>
            <option value="" {if $TASK_OBJECT->notify_method eq 'POST'}selected{/if}>{vtranslate('Select Method',$WHMODULE)}</option>
            <option value="POST" {if $TASK_OBJECT->notify_method eq 'POST'}selected{/if}>{vtranslate('POST',$WHMODULE)}</option>
            <option value="PUT" {if $TASK_OBJECT->notify_method eq 'PUT'}selected{/if}>{vtranslate('PUT',$WHMODULE)}</option>
            <option value="GET" {if $TASK_OBJECT->notify_method eq 'GET'}selected{/if}>{vtranslate('GET',$WHMODULE)}</option>
            <option value="DELETE" {if $TASK_OBJECT->notify_method eq 'DELETE'}selected{/if}>{vtranslate('DELETE',$WHMODULE)}</option>
            <option value="PATCH" {if $TASK_OBJECT->notify_method eq 'PATCH'}selected{/if}>{vtranslate('PATCH',$WHMODULE)}</option>
            <option value="OPTIONS" {if $TASK_OBJECT->notify_method eq 'OPTIONS'}selected{/if}>{vtranslate('OPTIONS',$WHMODULE)}</option>
            <option value="HEAD" {if $TASK_OBJECT->notify_method eq 'HEAD'}selected{/if}>{vtranslate('HEAD',$WHMODULE)}</option>
        </select>
        </div>
    </div>

<div class="row-fluid">
    <div class="span2">{vtranslate('URL To Notify',$WHMODULE)}<span class="redColor">*</span></div>
    <div class="span10">
        <input type="text" name="webhook_url" id="webhook_url" value="{$TASK_OBJECT->webhook_url}" data-validation-engine='validate[required]' data-rule-required="true" class="inputElement url" placeholder="{vtranslate('Enter Request Url',$WHMODULE)}" style="width:{if $TASK_OBJECT->content_type neq 'SOAP'}99{else}65{/if}%; direction:ltr; text-align:left;"><input id="getfunctionurls" class="btn" style="width:200px;{if $TASK_OBJECT->content_type neq 'SOAP'}display:none;{/if}" value="{vtranslate('Get list of WSDL url functions', $WHMODULE)}">
        <div id="urlstatus" class="alert alert-danger" style="display:none; text-align:center"></div>
    </div>
</div>


    <div class="row-fluid  padding-bottom1per" id="content_types" {if $TASK_OBJECT->content_type eq ''}style="display:none"{/if}>
        <div class="span2">{vtranslate('Content Type',$WHMODULE)}<span class="redColor">*</span></div>
        <div class="span10">
            <select class="task-fields" name="content_type" data-validation-engine='validate[required]' id="content_type" style="width:30%;height:31px;">
                <option value="FORM" {if $TASK_OBJECT->content_type eq 'FORM' or $WEBHOOK_CONTENT[ 'content_type'] eq ''}selected{/if}>{vtranslate('FORM',$WHMODULE)}</option>
                <option value="JSON" {if $TASK_OBJECT->content_type eq 'JSON'}selected{/if}>{vtranslate('JSON',$WHMODULE)}</option>
                <option value="JSONARRAY" {if $TASK_OBJECT->content_type eq 'JSONARRAY'}selected{/if}>{vtranslate('JSONARRAY',$WHMODULE)}</option>
                <option value="XML" {if $TASK_OBJECT->content_type eq 'XML'}selected{/if}>{vtranslate('XML',$WHMODULE)}</option>
                <option value="SOAP" {if $TASK_OBJECT->content_type eq 'SOAP'}selected{/if}>{vtranslate('SOAP',$WHMODULE)}</option>
            </select>
        </div>
    </div>



    <div class="row-fluid  padding-bottom1per" id="authentication_types" {if $TASK_OBJECT->authentication_type eq ''}style="display:none"{/if}>
        <div class="span2">{vtranslate('Authorization type',$WHMODULE)}<span class="redColor">*</span></div>
        <div class="span10">
            <select class="task-fields" name="authentication_type" id="authentication_type" data-validation-engine='validate[required]' style="width:30%;height:31px;">
                <option value="NO" {if $TASK_OBJECT->authentication_type eq 'NO'}selected{/if}>{vtranslate('No Authentication',$WHMODULE)}</option>
                <option value="BASIC" {if $TASK_OBJECT->authentication_type eq 'BASIC'}selected{/if}>{vtranslate('Basic',$WHMODULE)}</option>
                <option value="NTLM" {if $TASK_OBJECT->authentication_type eq 'NTLM'}selected{/if}>{vtranslate('NTLM',$WHMODULE)}</option>
                <option value="DIGEST" {if $TASK_OBJECT->authentication_type eq 'DIGEST'}selected{/if}>{vtranslate('DIGEST',$WHMODULE)}</option>
                <option value="CUSTOM" {if $TASK_OBJECT->authentication_type eq 'CUSTOM'}selected{/if}>{vtranslate('CUSTOM',$WHMODULE)}</option>
            </select>
        </div>
    </div>

    <div class="row-fluid OauthenticationDiv  padding-bottom1per" {if $TASK_OBJECT->authentication_type neq 'CUSTOM' && $TASK_OBJECT->authentication_type neq '' && $TASK_OBJECT->authentication_type neq 'NO'}{else}style='display: none;'{/if}>
        <div class="span2 padding-bottom1per">{vtranslate('Username',$QUALIFIED_MODULE)}</div>
        <div class="span10 padding-bottom1per">
            <input class="inputElement" data-rule-required="true"  data-validation-engine='validate[required]' name="webhook_username" type="text" value="{$TASK_OBJECT->webhook_username}" placeholder="{vtranslate('Enter User Name', $WHMODULE)}" />
        </div>
        <div class="row-fluid padding-bottom1per">
            <div class="span2">{vtranslate('Password',$WHMODULE)}</div>
            <div class="span10">
                <input class="inputElement" data-rule-required="true" data-validation-engine='validate[required]' name="webhook_password" type="password" value="{$TASK_OBJECT->webhook_password}" placeholder="{vtranslate('Enter Password', $WHMODULE)}" />
            </div>
        </div>
    </div>

    <div class="row-fluid CauthenticationDiv  padding-bottom1per" {if $TASK_OBJECT->authentication_type eq 'CUSTOM'}{else}style='display: none;'{/if}>
        <div class="span2">{vtranslate('Custom Token',$WHMODULE)}</div>
        <div class="span10">
            <input class="inputElement" data-rule-required="true"  data-validation-engine='validate[required]' name="webhook_token" type="text" value="{$TASK_OBJECT->webhook_token}" placeholder="{vtranslate('Enter Custom Token', $WHMODULE)}" />
        </div>
    </div>


    <div class="row-fluid  padding-bottom1per">
        <div class="span2">{vtranslate('Update Fields on Successful Response',$WHMODULE)}<span class="redColor">*</span></div>
        <div class="span10">
            <select class="task-fields" name="use_response" data-validation-engine='validate[required]' id="use_response" style="width:30%;height:31px;">
                <option value="0" {if $TASK_OBJECT->use_response neq '1'}selected{/if}>{vtranslate('No',$WHMODULE)}</option>
                <option value="1" {if $TASK_OBJECT->use_response eq '1'}selected{/if}>{vtranslate('Yes',$WHMODULE)}</option>
            </select>
        </div>
    </div>


<div id="moreinfo" style="{if $TASK_OBJECT->content_type eq 'SOAP' || $TASK_OBJECT->content_type eq ''}display:none;{/if}color:Navy; cursor: pointer;"><strong>{vtranslate('Request Options',$WHMODULE)}</strong></div>
<div id="advoptions">
    <div class="row-fluid  padding-bottom1per">
        <div class="span2">{vtranslate('Disable the SSL check?',$WHMODULE)}</div>
        <div class="span10">
		<input  name="disable_ssl" type="radio" value="Yes" {if $TASK_OBJECT->disable_ssl neq 'No'}checked{/if}/> <span> {vtranslate('Yes', $WHMODULE)}</span>&nbsp;&nbsp;&nbsp;
		<input  name="disable_ssl" type="radio" value="No" {if $TASK_OBJECT->disable_ssl eq 'No'}checked{/if}/> <span> {vtranslate('No', $WHMODULE)}</span>
        </div>
    </div>

    <div class="row-fluid  padding-bottom1per">
        <div class="span2">{vtranslate('Request timeout in seconds',$WHMODULE)}</div>
        <div class="span10">
            <input class="inputElement" data-rule-required="true" name="webhook_timeout"  data-validation-engine='validate[required]' type="number" value="{if $TASK_OBJECT->timeout neq ''}{$TASK_OBJECT->timeout}{else}{$TIMEOUT}{/if}" placeholder="{vtranslate('Timeout in Seconds', $WHMODULE)}" />
        </div>
    </div>
</div>

<div id="soapinfo" style="{if $TASK_OBJECT->content_type eq 'SOAP'}{else}display:none;{/if} color:Navy;cursor: pointer;"><strong>{vtranslate('SOAP Options',$WHMODULE)}</strong></div>
<div id="soapptions">
    <div class="row-fluid  padding-bottom1per">
        <div class="span2">{vtranslate('String to Array Separator',$WHMODULE)}</div>
        <div class="span10">
            <input class="inputElement" data-rule-required="true" name="webhook_separtor" type="text" value="{if $TASK_OBJECT->webhook_separtor neq ''}{$TASK_OBJECT->webhook_separtor}{else}|{/if}" placeholder="{vtranslate('Enter Separator', $WHMODULE)}" />
        </div>
    </div>
    <div class="row-fluid  padding-bottom1per">
        <div class="span2">{vtranslate('Soap Fuction',$WHMODULE)}</div>
        <div class="span10">
            <input class="inputElement" data-rule-required="true"  data-validation-engine='validate[required]' name="webhook_function" id="soapfunction" type="text" value="{$TASK_OBJECT->webhook_function}" placeholder="{vtranslate('Enter Soap Function Name', $WHMODULE)}" /><input id="getfunctionparameters" class="btn" style="width:200px;" value="{vtranslate('Get Function Parameters', $WHMODULE)}">
            <input type="hidden" id="functionValueMapping" name="function_value_mapping" value='{Vtiger_Util_Helper::toSafeHTML($TASK_OBJECT->function_value_mapping)}' />
            <div id="functionlist" class="alert alert-danger" style="display:none; text-align:center"></div>
        </div>
    </div>

</div>




<div id="addfields"  {if $TASK_OBJECT->notify_method eq '' || $TASK_OBJECT->webhook_url eq '' || $TASK_OBJECT->authentication_type eq ''}style="display:none"{/if}>
<hr>
<div class="row-fluid">
    <div class="span2"><strong>{vtranslate('Set Field Values',$WHMODULE)}</strong></div>
</div>
<br>
<div>
    <button type="button" class="btn" id="addFieldBtn">{vtranslate('Add Field',$WHMODULE)}</button>
</div>
<br>
<div class="row-fluid conditionsContainer" id="save_fieldvaluemapping">
    {assign var=FIELD_VALUE_MAPPING value=ZEND_JSON::decode($TASK_OBJECT->field_value_mapping)}
    <input type="hidden" id="fieldValueMapping" name="field_value_mapping" value='{Vtiger_Util_Helper::toSafeHTML($TASK_OBJECT->field_value_mapping)}' />
<div class="row-fluid padding-bottom1per">
    <div class="span2">
    <strong>{vtranslate('Parameters', $WHMODULE)}</strong>
    </div>
</div>
 {foreach from=$FIELD_VALUE_MAPPING item=FIELD_MAP}
    <div class="row-fluid conditionRow padding-bottom1per">

        <span class="span4">
                                <input  class="inputElement" name="fieldname" type="text" data-rule-required="true" value="{$FIELD_MAP['fieldname']}" placeholder="{vtranslate('Parameter Name',$WHMODULE)}" />

				</span>
        <span class="fieldUiHolder span4 marginLeftZero">

                            <input type="text" class="getPopupUi inputElement row-fluid" name="fieldValue" data-rule-required="true" value="{$FIELD_MAP['value']}" placeholder="{vtranslate('Parameter Value',$WHMODULE)}"/>
                            <input type="hidden" name="valuetype" value="{$FIELD_MAP['valuetype']}" />
				</span>
        <span class="cursorPointer span">
					<i class="alignMiddle deleteCondition icon-trash"></i>
				</span>
    </div>
    {/foreach} 
{include file="FieldExpressions.tpl"|@vtemplate_path:$WHMODULE}
</div>
<br>
<div class="row-fluid basicAddFieldContainer hide padding-bottom1per">

    <span class="span4">
                                <input  class="inputElement" name="fieldname" type="text" data-rule-required="true" value="" placeholder="{vtranslate('Parameter Name',$WHMODULE)}" />
			</span>
    <span class="fieldUiHolder span4 marginLeftZero">

                            <input type="text" class="getPopupUi inputElement row-fluid" name="fieldValue" data-rule-required="true" value="" placeholder="{vtranslate('Parameter Value',$WHMODULE)}"/>
                            <input type="hidden" name="valuetype" value="rawtext" />
			</span>
    <span class="cursorPointer span">
				<i class="alignMiddle deleteCondition icon-trash"></i>
			</span>
</div>
</div>




<div id="addheaderfields"  {if $TASK_OBJECT->notify_method eq '' || $TASK_OBJECT->webhook_url eq '' || $TASK_OBJECT->authentication_type eq ''}style="display:none"{/if}>
<hr>
<div class="row-fluid">
    <div class="span2"><strong>{vtranslate('Set Header Values',$WHMODULE)}</strong> - {vtranslate('if needed',$WHMODULE)}</div>
</div>
<br>
<div>
    <button type="button" class="btn" id="addHeaderFieldBtn">{vtranslate('Add Field',$WHMODULE)}</button>
</div>
<br>
<div class="row-fluid conditionsContainer" id="save_headervaluemapping">
    {assign var=HEADER_VALUE_MAPPING value=ZEND_JSON::decode($HEADERVALUES)}
    <input type="hidden" id="headerValueMapping" name="header_value_mapping" value='{Vtiger_Util_Helper::toSafeHTML($HEADERVALUES)}' />
<div class="row-fluid padding-bottom1per">
    <div class="span2">
    <strong>{vtranslate('Parameters', $WHMODULE)}</strong>
    </div>
</div>
 {foreach from=$HEADER_VALUE_MAPPING item=FIELD_MAP}
    <div class="row-fluid conditionRow padding-bottom1per">

        <span class="span4">
                                <input  class="inputElement" name="fieldname" type="text" data-rule-required="true" value="{$FIELD_MAP['fieldname']}" placeholder="{vtranslate('Parameter Name',$WHMODULE)}" />

				</span>
        <span class="fieldUiHolder span4 marginLeftZero">

                            <input type="text" class="getPopupUi inputElement row-fluid" name="fieldValue" data-rule-required="true" value="{$FIELD_MAP['value']}" placeholder="{vtranslate('Parameter Value',$WHMODULE)}"/>
                            <input type="hidden" name="valuetype" value="{$FIELD_MAP['valuetype']}" />
				</span>
        <span class="cursorPointer span">
					<i class="alignMiddle deleteCondition icon-trash"></i>
				</span>
    </div>
    {/foreach} 
{include file="FieldExpressions.tpl"|@vtemplate_path:$WHMODULE}
</div>
<br>
<div class="row-fluid HeaderAddFieldContainer hide padding-bottom1per">

    <span class="span4">
                                <input  class="inputElement" name="fieldname" type="text" data-rule-required="true" value="" placeholder="{vtranslate('Parameter Name',$WHMODULE)}" />
			</span>
    <span class="fieldUiHolder span4 marginLeftZero">

                            <input type="text" class="getPopupUi inputElement row-fluid" name="fieldValue" data-rule-required="true" value="" placeholder="{vtranslate('Parameter Value',$WHMODULE)}"/>
                            <input type="hidden" name="valuetype" value="rawtext" />
			</span>
    <span class="cursorPointer span">
				<i class="alignMiddle deleteCondition icon-trash"></i>
			</span>
</div>
</div>




<div id="addresponsefields"  {if $TASK_OBJECT->use_response neq '1'}style="display:none"{/if}>
<hr>
	<div class="row-fluid">
		<div class="span2"><strong>{vtranslate('Update CRM Fields Values',$WHMODULE)}</strong></div>
	</div><br>
	<div>
		<button type="button" class="btn" id="addUpdateFieldBtn">{vtranslate('Add Field',$WHMODULE)}</button>
	</div><br>
	<div class="row-fluid conditionsContainer" id="save_updatevaluemapping">
		{assign var=UPDATE_VALUE_MAPPING value=ZEND_JSON::decode($UPDATEVALUES)}
		<input type="hidden" id="updatevaluemapping" name="update_value_mapping" value='{Vtiger_Util_Helper::toSafeHTML($UPDATEVALUES)}' />
<div class="row-fluid padding-bottom1per">
    <div class="span2">
    <strong>{vtranslate('Parameters', $WHMODULE)}</strong>
    </div>
</div>
		{foreach from=$UPDATE_VALUE_MAPPING item=FIELD_MAP}
			<div class="row-fluid conditionRow padding-bottom1per">
				<span class="span4">
					<select name="fieldname" class="task-fields" style="min-width: 250px" data-placeholder="{vtranslate('LBL_SELECT_FIELD',$QUALIFIED_MODULE)}">
						<option></option>
						{foreach from=$MODULE_MODEL->getFields() item=FIELD_MODEL}
                            {*if !$FIELD_MODEL->isEditable() or $FIELD_MODEL->getFieldDataType() eq 'reference' or ($MODULE_MODEL->get('name')=="Documents" and in_array($FIELD_MODEL->get('name'),$RESTRICTFIELDS))} 
                                {continue}
                            {/if*}
                            {if !$FIELD_MODEL->isEditable() or $FIELD_MODEL->getFieldDataType() eq 'reference' or ($FIELD_MODEL->getFieldDataType() neq 'text' && $FIELD_MODEL->getFieldDataType() neq 'string') or ($MODULE_MODEL->get('name')=="Documents" and in_array($FIELD_MODEL->get('name'),$RESTRICTFIELDS))} 
                                {continue}
                            {/if}

							{assign var=FIELD_INFO value=$FIELD_MODEL->getFieldInfo()}
							{assign var=MODULE_MODEL value=$FIELD_MODEL->getModule()}
							<option value="{$FIELD_MODEL->get('name')}" {if $FIELD_MAP['fieldname'] eq $FIELD_MODEL->get('name')}selected=""{/if}data-fieldtype="{$FIELD_MODEL->getFieldType()}" data-field-name="{$FIELD_MODEL->get('name')}" data-fieldinfo='{ZEND_JSON::encode($FIELD_INFO)}' >
								{if $SOURCE_MODULE neq $MODULE_MODEL->get('name')}
									({vtranslate($MODULE_MODEL->get('name'), $MODULE_MODEL->get('name'))})  {vtranslate($FIELD_MODEL->get('label'), $MODULE_MODEL->get('name'))}
								{else}
									{vtranslate($FIELD_MODEL->get('label'), $SOURCE_MODULE)}
								{/if}
							</option>
						{/foreach}
					</select>
				</span>
				<span class="fieldUiHolder span4 marginLeftZero">
                                <input type="text" class="inputElement row-fluid" name="fieldValue" data-rule-required="true" value="{$FIELD_MAP['value']}" placeholder="[0]"  style="direction:ltr;text-align:left;"/>
				</span>
				<span class="cursorPointer span">
					<i class="alignMiddle deleteCondition icon-trash"></i>
				</span>
				<span class="fieldUiHolder span2 marginLeftZero"  style="direction:ltr;text-align:right;">$RESPONSE</span>

			</div>
		{/foreach}
		</div><br>
		<div class="row-fluid UpdateAddFieldContainer hide padding-bottom1per">
			<span class="span4">
				<select name="fieldname"  class="task-fields" data-placeholder="{vtranslate('LBL_SELECT_FIELD',$QUALIFIED_MODULE)}" style="min-width: 250px">
					<option></option>
					{foreach from=$MODULE_MODEL->getFields() item=FIELD_MODEL}
                            {*if !$FIELD_MODEL->isEditable() or $FIELD_MODEL->getFieldDataType() eq 'reference' or ($MODULE_MODEL->get('name')=="Documents" and in_array($FIELD_MODEL->get('name'),$RESTRICTFIELDS))} 
                                {continue}
                            {/if*}
                            {if !$FIELD_MODEL->isEditable() or $FIELD_MODEL->getFieldDataType() eq 'reference' or ($FIELD_MODEL->getFieldDataType() neq 'text' && $FIELD_MODEL->getFieldDataType() neq 'string' && $FIELD_MODEL->getFieldDataType() neq 'phone' && $FIELD_MODEL->getFieldDataType() neq 'email') or ($MODULE_MODEL->get('name')=="Documents" and in_array($FIELD_MODEL->get('name'),$RESTRICTFIELDS))} 
                                {continue}
                            {/if}
						{assign var=FIELD_INFO value=$FIELD_MODEL->getFieldInfo()}
						{assign var=MODULE_MODEL value=$FIELD_MODEL->getModule()}
						<option value="{$FIELD_MODEL->get('name')}" data-fieldtype="{$FIELD_MODEL->getFieldType()}" data-field-name="{$FIELD_MODEL->get('name')}" data-fieldinfo='{ZEND_JSON::encode($FIELD_INFO)}' >
							{if $SOURCE_MODULE neq $MODULE_MODEL->get('name')}
								({vtranslate($MODULE_MODEL->get('name'), $MODULE_MODEL->get('name'))})  {vtranslate($FIELD_MODEL->get('label'), $MODULE_MODEL->get('name'))}
							{else}
								{vtranslate($FIELD_MODEL->get('label'), $SOURCE_MODULE)}
							{/if}
						</option>
					{/foreach}
				</select>
			</span>

			<span class="fieldUiHolder span4 marginLeftZero">
                               <input type="text" class="inputElement row-fluid" name="fieldValue" data-rule-required="true" value="" placeholder="[0]" style="direction:ltr;text-align:left;"/>
			</span>
			<span class="cursorPointer span">
				<i class="alignMiddle deleteCondition icon-trash"></i>
			</span>
				<span class="fieldUiHolder span2 marginLeftZero"  style="direction:ltr;text-align:right;">$RESPONSE</span>

		</div>
</div>






<style>
  .ioverlay {
    position: fixed;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    background: rgba(51,51,51,0.7);
    z-index: 1000000;
  }
  .imageHolder {
     left  : 48.2%;
     position: fixed;
     top	  : 45%;
     z-index : 100000;
   }
   {if $CURRENT_USER_MODEL->get('language') == 'fa_ir'  || $CURRENT_USER_MODEL->get('language') == 'fa_af'}
   .modal-body {
    text-align:right !important;
    }
   {/if}
    </style>
<div class='ioverlay' style="display:none;"></div>
{/strip}
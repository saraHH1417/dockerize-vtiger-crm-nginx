{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is: vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
  *
 ********************************************************************************/
-->*}
{strip}
{if strpos($FIELD_MODEL->getName(), 'cf_pcf_dtf') !== false}
	{assign var="FIELD_NAME_TIME" value=$FIELD_MODEL->getName()|cat:'_time'}
	{assign var="FIELD_NAME_DATE" value=$FIELD_MODEL->getName()|cat:'_date'}
	{assign var=DATETIME_VALUE value=$FIELD_MODEL->get('fieldvalue')}
	{assign var=DATE_FIELD_VALUE value=''}
	{assign var=TIME_FIELD_VALUE  value=''}
	{assign var=DATE_VALUE value=$FIELD_MODEL->get('fieldvalue')}
	{assign var="FIELD_INFO" value=$FIELD_MODEL->getFieldInfo()}
	{assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
	{assign var="dateFormat" value=$USER_MODEL->get('date_format')}
	{assign var="TIME_FORMAT" value=$USER_MODEL->get('hour_format')}
	{if (!$FIELD_NAME)}
	  {assign var="FIELD_NAME" value=$FIELD_MODEL->getFieldName()}
	{/if}
	{if $DATE_VALUE neq '' AND $DATE_VALUE neq '0000-00-00 00:00:00'}
		{* Set the date after converting with repsect to timezone *}
		{assign var=DATE_TIME_CONVERTED_VALUE value=DateTimeField::convertToUserTimeZone($DATETIME_VALUE)->format('Y-m-d H:i:s')}
		{assign var=DATE_TIME_COMPONENTS value=explode(' ' ,$DATE_TIME_CONVERTED_VALUE)}
		{assign var=DATE_FIELD_VALUE value=$DATE_TIME_COMPONENTS[0]}
		{assign var=TIME_FIELD_VALUE  value=$DATE_TIME_COMPONENTS[1]}
	{/if}
	<div>
		<div class="input-group inputElement" style="margin-bottom: 3px">
		<input id="{$FIELD_NAME_DATE}" type="text" class="dateField form-control advcdate {if $IGNOREUIREGISTRATION}ignore-ui-registration{/if}" data-fieldname="{$FIELD_NAME_DATE}" data-fieldtype="date" name="{$FIELD_NAME_DATE}" data-date-format="{$dateFormat}" data-key="{$FIELD_NAME}" data-today="{DateTimeField::convertToUserFormat(date("Y-m-d H:i:s"))}"
		    value="{$FIELD_MODEL->getEditViewDisplayValue($DATE_FIELD_VALUE)}" {if !empty($SPECIAL_VALIDATOR)}data-validator='{Zend_Json::encode($SPECIAL_VALIDATOR)}'{/if}
		    {if $FIELD_INFO["mandatory"] eq true} data-rule-required="true" {/if}
		    {if count($FIELD_INFO['validator'])}
		        data-specific-rules='{ZEND_JSON::encode($FIELD_INFO["validator"])}'
		    {/if}  data-rule-date="true" />
		<span class="input-group-addon"><i class="fa fa-calendar "></i></span>
		</div>
	</div>
	<div>
		{assign var=DISPLAY_TIME_FIELD_VALUE value=Vtiger_Customdatetime_UIType::getEditViewDisplayTimeValue($TIME_FIELD_VALUE)}
		<div class="input-group inputElement time">
			<input id="{$FIELD_NAME_TIME}" type="text" data-format="{$TIME_FORMAT}" class="timepicker-default form-control advcdate" value="{$DISPLAY_TIME_FIELD_VALUE}" name="{$FIELD_NAME_TIME}" data-key="{$FIELD_NAME}"
			{if !empty($SPECIAL_VALIDATOR)}data-validator='{Zend_Json::encode($SPECIAL_VALIDATOR)}'{/if}
			{if $FIELD_INFO["mandatory"] eq true} data-rule-required="true" {/if}
			{if count($FIELD_INFO['validator'])}
				data-specific-rules='{ZEND_JSON::encode($FIELD_INFO["validator"])}'
			{/if} data-rule-time="true"/>
			<span class="input-group-addon" style="width: 30px;">
				<i class="fa fa-clock-o"></i>
			</span>
		</div>
	</div>
	<input id="{$MODULE}_editView_fieldName_{$FIELD_NAME}" type="hidden" data-fieldname="{$FIELD_NAME}" data-fieldtype="string" class="inputElement {if $FIELD_MODEL->isNameField()}nameField{/if}" name="{$FIELD_NAME}"  value="{$FIELD_MODEL->getEditViewDisplayValue($FIELD_MODEL->get('fieldvalue'))}"  />
{/if}
{/strip}
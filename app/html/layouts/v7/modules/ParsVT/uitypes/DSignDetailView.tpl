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
{*foreach key=ITER item=IMAGE_INFO from=$RECORD->getJsignDetails()}
	{assign var='imgpath' value="`$IMAGE_INFO.path`_`$IMAGE_INFO.name`"}
	
	{if !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname}) && ($imgpath == $RECORD->get($FIELD_MODEL->getFieldName()))}		
		<img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.name}" data-image-id="{$IMAGE_INFO.id}" width="150" height="80" >
	{/if}
{/foreach *}

{strip}

{assign var="FIELD_INFO" value=Vtiger_Util_Helper::toSafeHTML(Zend_Json::encode($FIELD_MODEL->getFieldInfo()))}
  {assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}

  {if (!$FIELD_NAME)}
    {assign var="FIELD_NAME" value=$FIELD_MODEL->getFieldName()}
  {/if}

  {assign var="WHODID" value=Vtiger_Dsign_UIType::getDisplayNameValue($FIELD_NAME)}

  {if $FIELD_MODEL->get('fieldvalue') != ''}
  <img src="{$FIELD_MODEL->get('fieldvalue')}" width="150" height="80">
    {if $WHODID && !empty($WHODID)}
      <br />
      {vtranslate('Signed by','ParsVT')}: {$WHODID}
    {/if}
  {/if}

{/strip}



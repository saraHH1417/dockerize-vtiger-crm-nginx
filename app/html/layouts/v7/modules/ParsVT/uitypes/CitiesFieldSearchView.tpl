{strip}
{assign var=FIELD_INFO value=$FIELD_MODEL->getFieldInfo()}
{*Enter Number 1 just for showing IRAN or zero for all countries*}
{assign var=COUNTRIES_INFO value=Vtiger_Citiesfield_UIType::getCounties(1)}
{*Change 1 to 2 for showing all cities*}
{assign var=CITIES_INFO value=Vtiger_Citiesfield_UIType::getCities(1)}
{assign var=PICKLIST_VALUES value=$FIELD_INFO['picklistvalues']}
{assign var=FIELD_INFO value=Vtiger_Util_Helper::toSafeHTML(Zend_Json::encode($FIELD_INFO))}
{assign var=SEARCH_VALUES value=explode(',',$SEARCH_INFO['searchValue'])}
<div class="select2_search_div">
<input type="text" class="listSearchContributor inputElement select2_input_element"/>
<select class="select2 listSearchContributor" name="{$FIELD_MODEL->get('name')}" data-fieldinfo='{$FIELD_INFO|escape}' style="display:none; min-width:200px;">
	<option value=" ">{vtranslate('LBL_NONE',$MODULE)}</option>
	<optgroup label="{vtranslate('Countries','ParsVT')}">
		{foreach key=COUNTRY_ID item=COUNTRY_NAME from=$COUNTRIES_INFO}
			<option value="{$COUNTRY_ID}" data-picklistvalue= '{$COUNTRY_ID}' {if $SEARCH_INFO['searchValue'] eq $COUNTRY_ID} selected {/if}>
			{$COUNTRY_NAME}
			</option>
		{/foreach}
	</optgroup>
	<optgroup label="{vtranslate('Cities','ParsVT')}">
		{foreach key=CITY_ID item=CITY_NAME from=$CITIES_INFO}
			<option value="{$CITY_ID}" data-picklistvalue= '{$CITY_ID}' {if $SEARCH_INFO['searchValue'] eq $CITY_ID} selected {/if}>
			{$CITY_NAME}
			</option>
		{/foreach}
	</optgroup>
</select>
</div>
{/strip}
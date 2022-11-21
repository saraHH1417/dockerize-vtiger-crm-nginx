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
<span class="ParsVTCustomizationFieldSignotec">
    {if !empty($FIELD_MODEL->get('fieldvalue'))}
		<img style="width: 100%;" src="{$FIELD_MODEL->get('fieldvalue')}">
	{/if}
    <script>
        $( document ).ready(function() {
			setTimeout(function () {
				var ParsVTCustomizationFieldSignotec = $('span.ParsVTCustomizationFieldSignotec').parent().parent();
				ParsVTCustomizationFieldSignotec.find('span.edit').remove();
				ParsVTCustomizationFieldSignotec.find('span.action').remove();

			},1000);
		});
    </script>
</span>
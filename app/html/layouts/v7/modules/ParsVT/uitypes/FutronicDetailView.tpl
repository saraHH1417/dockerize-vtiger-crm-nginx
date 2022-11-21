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
<span class="ParsVTCustomizationFieldFinger">
    {if !empty($FIELD_MODEL->get('fieldvalue'))}
        <img src="{$FIELD_MODEL->get('fieldvalue')}">
    {/if}
    <script>
        $( document ).ready(function() {
            setTimeout(function () {
                var ParsVTCustomizationFieldFinger = $('span.ParsVTCustomizationFieldFinger').parent().parent();
                ParsVTCustomizationFieldFinger.find('span.edit').remove();
                ParsVTCustomizationFieldFinger.find('span.action').remove();

            },1000);
        });
    </script>
</span>
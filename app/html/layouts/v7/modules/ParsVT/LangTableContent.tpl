{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<tr class="listViewEntries" data-langkey="{$LANGKEY}" data-langtransl="{$LANG_KEYS[$LANGKEY]}">
    <td class="listViewEntryValue medium col-lg-{$LANGTABLEWIDTH} col-md-{$LANGTABLEWIDTH} col-sm-{$LANGTABLEWIDTH}" style="border-right: none">{$LANGKEY}</td>
    <td class="listViewEntryValue medium col-lg-2 col-md-2 col-sm-2"  data-langtranslate="{$EN_LANG_KEYS[$LANGKEY]}">
        {$EN_LANG_KEYS[$LANGKEY]} 
        {if $LANG_KEYS[$LANGKEY] eq "" && $EN_LANG_KEYS[$LANGKEY] neq ""}
            <span class="pull-right copyToTranslationInputAndSave"><i class="icon-arrow-right"></i></span>
        {/if}
    </td>
    {if $NONE neq 'none'}
        <td class="listViewEntryValue medium col-lg-2 col-md-2 col-sm-2"  data-langtranslate="{$PREVIEW_LANG_KEYS['languageStrings'][$LANGKEY]}">
            {$PREVIEW_LANG_KEYS['languageStrings'][$LANGKEY]} {if $LANG_KEYS[$LANGKEY] eq "" && $PREVIEW_LANG_KEYS['languageStrings'][$LANGKEY] neq ""}
                <span class="pull-right copyToTranslationInputAndSave"><i class="icon-arrow-right"></i></span>
            {/if}
        </td>
    {/if}
    <td class="listViewEntryValue medium col-lg-{$LANGTABLEWIDTH} col-md-{$LANGTABLEWIDTH} col-sm-{$LANGTABLEWIDTH}"  data-langtranslate="{$LANG_KEYS[$LANGKEY]}">
        {$LANG_KEYS[$LANGKEY]}
    </td>
    <td class="listViewEntryValue medium col-lg-3 col-md-3 col-sm-3 closestTdWithInput" >
        <input type="text" class="inputElement lng lngcolor" name="lang_{$LANGKEY}" id="lang_{$LANGKEY}" value="{htmlspecialchars($LANG_KEYS[$LANGKEY])}">
    </td>
</tr>
{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<tr class="listViewEntries" data-jslangkey="{$JSLANGKEY}">
    <td class="listViewEntryValue medium col-lg-{$LANGTABLEWIDTH} col-md-{$LANGTABLEWIDTH} col-sm-{$LANGTABLEWIDTH}" style="border-right: none">{$JSLANGKEY}</td>
    <td class="listViewEntryValue medium col-lg-2 col-md-2 col-sm-2"  data-jslangtranslate="{$EN_JSLANG_KEYS[$JSLANGKEY]}">
        {$EN_JSLANG_KEYS[$JSLANGKEY]}
        {if $JS_LANG_KEYS[$JSLANGKEY] eq "" && $EN_JSLANG_KEYS[$JSLANGKEY] neq ""}
            <span class="pull-right copyToTranslationInputAndSave jsLang"><i class="icon-arrow-right"></i></span>
        {/if}
    </td>
    {if $NONE neq 'none'}
        <td class="listViewEntryValue medium col-lg-2 col-md-2 col-sm-2"  data-jslangtranslate="{$PREVIEW_LANG_KEYS['jsLanguageStrings'][$JSLANGKEY]}">
            {$PREVIEW_LANG_KEYS['jsLanguageStrings'][$JSLANGKEY]}
            {if $JS_LANG_KEYS[$JSLANGKEY] eq "" && $PREVIEW_LANG_KEYS['jsLanguageStrings'][$JSLANGKEY] neq ""}
                <span class="pull-right copyToTranslationInputAndSave jsLang"><i class="icon-arrow-right"></i></span>
            {/if}
        </td>
    {/if}
    <td class="listViewEntryValue medium col-lg-{$LANGTABLEWIDTH} col-md-{$LANGTABLEWIDTH} col-sm-{$LANGTABLEWIDTH}"  data-jslangtranslate="{$JS_LANG_KEYS[$JSLANGKEY]}">{$JS_LANG_KEYS[$JSLANGKEY]}</td>
    <td class="listViewEntryValue medium col-lg-3 col-md-3 col-sm-3 closestTdWithInput" >
        <input type="text" class="inputElement lng lngjscolor"  name="jslang_{$JSLANGKEY}" id="jslang_{$JSLANGKEY}" value="{htmlspecialchars($JS_LANG_KEYS[$JSLANGKEY])}">
    </td>
</tr>
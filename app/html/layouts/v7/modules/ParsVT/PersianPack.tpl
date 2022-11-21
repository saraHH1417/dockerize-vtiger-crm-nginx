{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='SettingsHeader.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
{assign var=FEATUREMESSAGE  value=vtranslate('This feature is currently not available in current package!',$QUALIFIED_MODULE)}

<div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="PersianPack">
    <div>
        <div>
            <div class="container-fluid">
                <div class="contents">
                    <br>
                </div>
                <div class="container-fluid">
                    <div class="related-tabs">
                        <div class="row form-group">
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>{vtranslate('Primary Version',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('MySQL Full Unicode Support',$QUALIFIED_MODULE)}">
                                            <a href="index.php?module={$QUALIFIED_MODULE}&view=Database&parent=Settings{if $DBSTATUS}#DataBaseNeedAttention{/if}"
                                               target="_blank" {if $DBSTATUS}class="blink_me"
                                               style="color:#a94442"{else} style="color:#3c763d"{/if}>
                                                <input style="opacity: 0;" {if $DBSTATUS} value='0' {else} value='1' checked{/if}
                                                       disabled readonly
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                       data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                       data-on-color="primary" data-toggle="toggle"/>
                                                {vtranslate('MySQL Full Unicode Support',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Persian Core Language Pack',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $BASICLANG} value='1' checked disabled{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"  data-type="BasicPersian"/>
                                            <a id="FarsiCoreLanguagePack"> {vtranslate('Persian Core Language Pack',$QUALIFIED_MODULE)}</a></li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Right-to-Left(RTL) Layout',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $RTLCSS} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="RTLStyle"/>
                                            {vtranslate('Right-to-Left(RTL) Layout',$QUALIFIED_MODULE)}</li>
                                        {if !$WHITELABEL}
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('View Tutorial Videos',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $VIDEOS} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="VIDEOS"/>
                                            {vtranslate('View Tutorial Videos',$QUALIFIED_MODULE)}</li>
                                        {/if}
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('View Training Tour',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $TOUR} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="TOUR"/>
                                            {vtranslate('View Training Tour',$QUALIFIED_MODULE)}</li>
                                        {if !$WHITELABEL}
                                        <li data-toggle="tooltip"
                                            title="{if $IS_DATA_POPULATED}{vtranslate('Clear demo records in all modules.',$QUALIFIED_MODULE)}{else}{vtranslate('Load demo data in all modules.',$QUALIFIED_MODULE)}{/if}">
                                            <input id="demodatas" style="opacity: 0;" {if $IS_DATA_POPULATED} value='1'  checked{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-title="{if $IS_DATA_POPULATED}{vtranslate('Clear demo records in all modules.',$QUALIFIED_MODULE)}{else}{vtranslate('Load demo data in all modules.',$QUALIFIED_MODULE)}{/if}"
                                                    data-language="{if $IS_DATA_POPULATED}{vtranslate('Are you sure you want to clear demo data in all modules?',$QUALIFIED_MODULE)}
{vtranslate("Demo records can be added by clicking the Add Demo Data button.",$QUALIFIED_MODULE)}
<br>
<br>
{vtranslate('This process may take several minutes. Please wait while CRM installs demo records on your system.',$QUALIFIED_MODULE)}{else}{vtranslate('Are you sure you want to add demo records to all modules?',$QUALIFIED_MODULE)}
{vtranslate('Demo records can be deleted by clicking the Clear Demo Data button.',$QUALIFIED_MODULE)}
<br>
<br>
{vtranslate('This process may take several minutes. Please wait while CRM installs demo records on your system.',$QUALIFIED_MODULE)}{/if}"  data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}" data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}" data-on-color="danger" data-toggle="toggle" data-type="DemoData"/>
                                            {if $IS_DATA_POPULATED}{vtranslate('Clear Demo Data',$QUALIFIED_MODULE)}{else}{vtranslate('Add Demo Data',$QUALIFIED_MODULE)}{/if}</li>
                                        {/if}
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Change Default Currency',$QUALIFIED_MODULE)}">
                                            <select class="select2 row" id="defaultcurrency" data-language="{vtranslate('Default System Currency',$QUALIFIED_MODULE)}">{$DEFAULTCURRENCY}</select>
                                            <a href="index.php?parent=Settings&module=Currency&view=List" target="_blank">{vtranslate('Default System Currency',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Iran Toman currency',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $TOMANCURRENCY} value='1'  checked {if $ISUSEDTOMANCURRENCY} disabled {/if}{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="TOMANCURRENCY"/>
                                            <a href="index.php?parent=Settings&module=Currency&view=List" target="_blank">{vtranslate('Iran Toman currency',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Afghanistan Afghani currency',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $AFNCURRENCY} value='1'  checked {if $ISUSEDAFNCURRENCY} disabled {/if}{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="AFNCURRENCY"/>
                                            <a href="index.php?parent=Settings&module=Currency&view=List" target="_blank">{vtranslate('Afghanistan Afghani currency',$QUALIFIED_MODULE)}</a>
                                        </li>
                                    </ul>
                                </fieldset>
                                <fieldset class="vtToolBox">
                                    <legend>{vtranslate('Advanced Version',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Change Default Language',$QUALIFIED_MODULE)}">
                                            <select class="select2 row" id="defaultlanguage" data-language="{vtranslate('Default System Language',$QUALIFIED_MODULE)}">{$DEFAULTLANGUAGE}</select>
                                            {vtranslate('Default System Language',$QUALIFIED_MODULE)} {vtranslate('(English is recommended)',$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Login Page Language',$QUALIFIED_MODULE)}">
                                            <select class="select2 row" id="loginlanguage"
                                                    data-language="{vtranslate('Login Page Language',$QUALIFIED_MODULE)}">{$LOGINLANGUAGE}</select>
                                            {vtranslate('Login Page Language',$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Fix Layout Translation',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $CHECKLAYOUT} value='1' checked {else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FixLayout"/>
                                            {vtranslate('Fix Layout Translation',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Persian Full Language Pack',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $CHECKLNGHNDLR} value='1' checked {else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FullPack"/>
                                            {vtranslate('Persian Full Language Pack',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Translate Email Templates to Persian',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $EMAILTEMPLATES} value='1' checked  disabled readonly{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"
                                                   data-type="EmailTemplates"/>
                                            {vtranslate('Translate Email Templates to Persian',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Translate System Workflows to Persian',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $SYSTEMWORKFLOWS} value='1' checked  disabled readonly{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"
                                                   data-type="SystemWorkflows"/>
                                            {vtranslate('Translate System Workflows to Persian',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Translate Reports to Persian',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $CHECKREPORTS} value='1' checked  disabled readonly{else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="Reports"/>
                                            {vtranslate('Translate Reports to Persian',$QUALIFIED_MODULE)} {vtranslate('(Not Recomeneded)',$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Convert Persian/Arabic Numbers Into English',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $FIXNUMS} value='1' checked {else} value='0' {/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FixNums"/>
                                            {vtranslate('Convert Persian/Arabic Numbers Into English',$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Convert Arabic Characters Into Persian',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $FIXCHARS}  value='1' checked {else} value='0' {/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="FixChars"/>
                                            {vtranslate('Convert Arabic Characters Into Persian',$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Multi-language support for CKEditor (including Persian)',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $CHECKCKEDITOR} value='1' checked {else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="CKEditor"/>
                                            {vtranslate('Multi-language support for CKEditor (including Persian)',$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('HTML5 Desktop Notifications',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $DESKTOPNOTIFICATIONS} value='1' checked {else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="Notifications"/>
                                            {vtranslate('HTML5 Desktop Notifications',$QUALIFIED_MODULE)}</li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('Add Persian Keyboard to Inputs of All Pages',$QUALIFIED_MODULE)}">
                                            <input style="opacity: 0;" {if $CUSTOMKEYBOARD} value='1' checked {else} value='0'{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="Keyboard"/>
                                            {vtranslate('Persian Keyboard on Fields',$QUALIFIED_MODULE)}</li>
                                    </ul>
                                </fieldset>
                                <fieldset class="vtToolBox  {if $FULLMODULE}parsvtfeatures{/if}">
                                    <legend {if $FULLMODULE}class="text-danger"{/if}>{vtranslate('Full Version',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash " style="line-height:200%">
                                        <li {if !$FULLMODULE}id='checkpermissions'{/if} data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Check permissions for required files and folders',$QUALIFIED_MODULE)}{/if}" style="cursor: pointer">
                                            <span class="fa fa-cog text-info"
                                                  style="font-size:24px;position: relative;bottom: -4px;"></span>
                                            {vtranslate('Check permissions for required files and folders',$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Change Default PDF Output Based on Persian Language",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $TCPDF} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDF"/>
                                            {vtranslate("Change Default PDF Output Based on Persian Language",$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Advanced Custom Fields",$QUALIFIED_MODULE)} - {vtranslate("(Include Gregorian date, Iranian National Number, Iranian Legal National Number, Iranian VAT ID, Iranian Tax File Number, Iranian Postal Code, Barcode, QR Code Iranian Mobile Number, Whatsapp, Telegram, RTF Field, Assign To Field, Users List, Advanced Date Field, DateTime Field, Iranian Cities Field, Digital Signature, IBAN Code, Upload Single & Multiple Field, Password Field, Credit Card Number, Currency name, Coordinate, Rating & Customer Satisfaction Field, Color Picker , Repeater Field , Instagram & Twitter Field , Voice Recorder Field , Grid Field , Weather Field and Related Field)",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $ADVCF} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="AdvancedCustomFields"/>
                                            {vtranslate("Advanced Custom Fields",$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Language Editor',$QUALIFIED_MODULE)}{/if}">
                                            <a href="index.php?module={$QUALIFIED_MODULE}&view=LanguageEditor&parent=Settings"
                                               target="_blank">
                                                <input style="opacity: 0;" {if $LANGEDITOR} value='1' checked{else} value='0'{/if} {$FULLMODULE}
                                                       disabled readonly
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                       data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                       data-on-color="primary" data-toggle="toggle"/>
                                                {vtranslate('Language Editor',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Backup and Restore Database',$QUALIFIED_MODULE)}{/if}">
                                                <input style="opacity: 0;" {if $DBBACKUP eq 0 } value='0' {else} value='1' checked{/if} {$FULLMODULE}
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                       data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                       data-on-color="primary" data-toggle="toggle" data-type="DBBACKUP"/>
                                            <a href="index.php?module={$QUALIFIED_MODULE}&view=Database&parent=Settings&mode=backup"
                                               target="_blank">
                                                {vtranslate('Backup and Restore Database',$QUALIFIED_MODULE)}</a>
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Type with your voice',$QUALIFIED_MODULE)}{/if}">
                                                <input style="opacity: 0;" {if $SPEECH eq 0 } value='0' {else} value='1' checked{/if} {$FULLMODULE}
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                       data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                       data-on-color="primary" data-toggle="toggle" data-type="Speech"/>
                                                {vtranslate('Online Speech Recognition',$QUALIFIED_MODULE)} ({vtranslate('Google Chrome Only',$QUALIFIED_MODULE)})
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('ParsVT Restful API',$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $RESTAPI eq 0 } value='0' {else} value='1' checked{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="RESTAPI"/>
                                            {vtranslate('ParsVT Restful API',$QUALIFIED_MODULE)}
                                        </li>
                                        {if $KANBANGRID}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Kanban & Grid View',$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $KANBAN eq 1 } value='1' checked {else}  value='0'  {/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="KanbanGrid"/>
                                            {vtranslate('Kanban & Grid View',$QUALIFIED_MODULE)}
                                        </li>
                                        {/if}
                                        {*if !$WHITELABEL}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate('Show CRM Implementation & Learning Score',$QUALIFIED_MODULE)}{/if}">
                                                <input style="opacity: 0;" {if $SCORE eq 0 } value='0' {else} value='1' checked{/if} {$FULLMODULE}
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                       data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                       data-on-color="primary" data-toggle="toggle" data-type="Score"/>
                                                {vtranslate('Show CRM Implementation & Learning Score',$QUALIFIED_MODULE)}
                                        </li>
                                        {/if*}
                                    </ul>
                                </fieldset>

                                {if $TCPDF}
                                <fieldset class="vtToolBox {if $FULLMODULE}parsvtfeatures{/if}">
                                    <legend {if $FULLMODULE}class="text-danger"{/if}>{vtranslate('PDF Export Settings',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Change Default PDF Output Based on Iran's Ministry of Finance Official Invoice",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFOFFICIALBILL} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFOFFICIALBILL"/>
                                            {vtranslate("Change Default PDF Output Based on Iran's Ministry of Finance Official Invoice",$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Output link field of the PDF record",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFLINK} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFLINK"/>
                                            {vtranslate("Output link field of the PDF record",$QUALIFIED_MODULE)}
                                        </li>
                                        {if $PDFOFFICIALBILL}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Company information for use in official invoice",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" value='1' checked readonly disabled
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"/>
                                            <a href="index.php?module=ParsVT&parent=Settings&view=CD" target="_blank">{vtranslate("Company information for use in official invoice",$QUALIFIED_MODULE)}</a>
                                        </li>
                                        {/if}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Show WaterMark Status",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFWATERMARK} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFWATERMARK"/>
                                            {vtranslate("Show WaterMark Status",$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Display Logo",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFLOGO} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFLOGO"/>
                                            {vtranslate("Display Logo",$QUALIFIED_MODULE)}
                                        </li>
                                        {if $PDFOFFICIALBILL}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Display Signature in Official Invoice",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFSIGN} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFSIGN"/>
                                            {vtranslate("Display Signature in Official Invoice",$QUALIFIED_MODULE)}
                                        </li>
                                        {/if}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Show Product/Service Comments",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFCOMMENT} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFCOMMENT"/>
                                            {vtranslate("Show Product/Service Comments",$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Increase Product/Service Code Column length",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFLONGPCODE} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFLONGPCODE"/>
                                            {vtranslate("Increase Product/Service Code Column length",$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("Show Product/Service Usage Unit",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFUNIT} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFUNIT"/>
                                            {vtranslate("Show Product/Service Usage Unit",$QUALIFIED_MODULE)}
                                        </li>
                                        <li data-toggle="tooltip"
                                            title="{vtranslate('PDF Page Layout',$QUALIFIED_MODULE)}">
                                            <select class="select2 row" id="pdfpagelayout" data-language="{vtranslate('PDF Page Layout',$QUALIFIED_MODULE)}">{$PDFLAYOUTS}</select>
                                            {vtranslate('PDF Page Layout',$QUALIFIED_MODULE)}
                                        </li>
                                        {if $PDFMAKERSTATUS}
                                        <li data-toggle="tooltip"
                                            title="{if $FULLMODULE}{$FEATUREMESSAGE}{else}{vtranslate("PDF Maker integration via custom functions",$QUALIFIED_MODULE)}{/if}">
                                            <input style="opacity: 0;" {if $PDFMAKER} value='1' checked {else} value='0'{/if} {$FULLMODULE}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle" data-type="PDFMAKER"/>
                                            {vtranslate("PDF Maker integration via custom functions",$QUALIFIED_MODULE)}
                                        </li>
                                        {/if}
                                    </ul>
                                </fieldset>
                                {/if}



                            </div>
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate("Primary Version Features", $QUALIFIED_MODULE)}
                                    </legend>
                                    <p>{vtranslate('MySQL Full Unicode Support',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Add Persian Language to VTigerCRM',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Vtiger 7 RTL Layout',$QUALIFIED_MODULE)}<br/>
                                      </p>
                                </fieldset>
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate("Advanced Version Features", $QUALIFIED_MODULE)}
                                    </legend>
                                    <p>
                                        {vtranslate('All Features of Basic Version',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Fix Layout Translation',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Translate Email Templates to Persian',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Translate System Workflows to Persian',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Translate Reports to Persian',$QUALIFIED_MODULE)}
                                        {vtranslate('(Not Recomeneded)',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Choose Web Fonts for Vtiger Layout',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Translate Vtiger Default Editor to Persian',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Change Layout for Other Languages (RTL & LTR)',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate("Correcting Arabic letters and converting Persian letters, with no need to install or change keyboard in the user's system",$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Convert Persian/Arabic Numbers Into English',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Translate System Charts to Persian',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Add Persian Keyboard to Inputs of All Pages',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('HTML5 Desktop Notifications',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Persian Keyboard on Fields',$QUALIFIED_MODULE)}<br/>
                                    </p>
                                </fieldset>
                                <fieldset class="vtToolBox">
                                    <legend  {if $FULLMODULE}class="text-danger"{/if}>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate("Full Version Features", $QUALIFIED_MODULE)}
                                    </legend>
                                    <p>
                                        {vtranslate('All Features of Pro and Calendar Version',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Support Vtiger Calendar Module',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Change Translations Based on Common Business Terms through Admin Panel (Administrators Only)',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Translate PDF Outputs in Purchase Order, Sales Order, Quotations and Invoices to Persian',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate("Change Default PDF Output Based on Iran's Ministry of Finance Official Invoice",$QUALIFIED_MODULE)}<br/>
                                        {vtranslate('Support Persian PDF in Customer Portal',$QUALIFIED_MODULE)}<br/>
                                        {vtranslate("Advanced Custom Fields",$QUALIFIED_MODULE)} - {if !$WHITELABEL} <a href="http://vtfarsi.ir/vtiger-custom-fields/" target="_blank">{/if}{vtranslate("(Include Gregorian date, Iranian National Number, Iranian Legal National Number, Iranian VAT ID, Iranian Tax File Number, Iranian Postal Code, Barcode, QR Code Iranian Mobile Number, Whatsapp, Telegram, RTF Field, Assign To Field, Users List, Advanced Date Field, DateTime Field, Iranian Cities Field, Digital Signature, IBAN Code, Upload Single & Multiple Field, Password Field, Credit Card Number, Currency name, Coordinate, Rating & Customer Satisfaction Field, Color Picker , Repeater Field , Instagram & Twitter Field , Voice Recorder Field , Grid Field , Weather Field and Related Field)",$QUALIFIED_MODULE)} ({vtranslate("Compatible with PDF Maker",$QUALIFIED_MODULE)}) {if !$WHITELABEL}</a>{/if} <br/>
                                        {vtranslate("Online voice to text converter. Type with your voice.",$QUALIFIED_MODULE)}
                                    </p>
                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

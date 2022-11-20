{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{strip}
    <div class="container-fluid">
        <div class="widget_header">
            <h3>{vtranslate('Edit ParsVT Custom Fields', $QUALIFIED_MODULE)}</h3>
        </div>
        <hr>
        <div class="listViewPageDiv detailViewContainer " id="listViewContent">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-horizontal">
                <br>
                <div class="detailViewInfo">
                    {if $SELECTED_MODULE}
                        <div class="row form-group">
                            <div class="col-lg-3 col-md-3 col-sm-3 control-label fieldLabel">
                                <label class="fieldLabel ">{vtranslate('LBL_SELECT_MODULE',$QUALIFIED_MODULE)} </label>
                            </div>
                            <div class="fieldValue col-sm-3 col-xs-3">
                                <select class="select2 inputElement" id="ListModules" name="pickListModules">
                                    <option value="">{vtranslate('LBL_SELECT_OPTION',$QUALIFIED_MODULE)}</option>
                                    {foreach from=$SUPPORTED_MODULES key=TABID item=SUPPORTED_MODULE}
                                        <option {if $SELECTED_MODULE eq $TABID} selected="selected" {/if}
                                                value="{$TABID}">{vtranslate($SUPPORTED_MODULE,$SUPPORTED_MODULE)}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row form-group">
                            <div class="col-lg-3 col-md-3 col-sm-3 control-label fieldLabel">
                                <label class="fieldLabel ">{vtranslate('LBL_SELECT_FIELD',$QUALIFIED_MODULE)} </label>
                            </div>
                            <div class="fieldValue col-sm-3 col-xs-3">
                                <select class="select2 inputElement" id="ListFields" name="pickListModules">
                                    {foreach from=$SUPPORTED_FIELDS key=FIELDID item=SUPPORTED_FIELD}
                                        <option {if $DEFAULT_FIELD eq $FIELDID} selected="" {/if}
                                                value="{$FIELDID}">{vtranslate($SUPPORTED_FIELD[0],$SUPPORTED_FIELD[1])}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <br>
                        <div id="fieldcontents">
                                {$RESULTS}
                        </div>
                    {else}
                        <div class="row form-group">
                            <div class="col-lg-8 col-md-8 col-sm-8 control-label fieldLabel">
                                {vtranslate('No Field Exists',$QUALIFIED_MODULE)}. <a href="index.php?module=LayoutEditor&parent=Settings&view=Index"><strong>{vtranslate('LBL_MODULE_CUSTOMIZATION',$QUALIFIED_MODULE)}</strong></a>
                            </div>
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/strip}

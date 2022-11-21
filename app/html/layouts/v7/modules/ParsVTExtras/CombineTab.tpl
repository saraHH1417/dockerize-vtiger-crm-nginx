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
    <div id="comnineTabContainer" class="modal-dialog" style='min-width:350px;'>
        <div class='modal-content'>
            {assign var=HEADER_TITLE value={vtranslate('LBL_COMBINE_BLOCKS', $MODULE)}}
            {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
            <form class="form-horizontal contentsBackground" id="submitCombine" method="post" action="index.php">
                <input type="hidden" name="module" value="ParsVTExtras" />
                <input type="hidden" name="action" value="ActionAjax" />
                <input type="hidden" name="mode" value="combineTab" />
                <input type="hidden" name="block_id" id="block_id" value="{$BLOCKID}" />
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-12 control-label" style="text-align: right;">{vtranslate('LBL_COMBINE_INTRO', $MODULE)}</label>
                    </div>
                    <div class="form-group">
                        <label for="block_name" class="col-sm-2 control-label" style="text-align: left;">{vtranslate('LBL_TAB_NAME', $MODULE)}</label>
                        <div class="col-sm-9">
                            <input id="tab_name" name="tab_name" class="form-control col-lg-12" type="text" value="{$TAB_NAME}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tabs_list" class="col-sm-2 control-label" style="text-align: left;">{vtranslate('LBL_TAB_LIST', $MODULE)}</label>
                        <div class="col-sm-9">
                            <select id="tabslist" class="select2 col-sm-12 widgetFilter reloadOnChange" name="tabslist">
                                <option value="0">{vtranslate('LBL_NONE')}</option>
                                {foreach key=LIST_ID item=LIST_NAME from=$TABSLIST}
                                    <option value="{$LIST_NAME}">{$LIST_NAME}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="pull-right cancelLinkContainer" style="margin-top:8px;">
                        <a class="cancelLink" id="cancelLink" type="reset" data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
                    </div>
                    <button class="btn btn-success" type="button" id="btnSaveCombine"><strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
                </div>
            </form>
        </div>
    </div>
{/strip}
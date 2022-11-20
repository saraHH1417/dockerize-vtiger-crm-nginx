{*/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */*}

{strip}

    {foreach from=$BLOCKS_LIST item=BLOCKDATA key=BLOCKID}
        {assign var="RELMODULE_MODEL" value=$BLOCKDATA['relmodule']}
        {assign var="RELMODULE_NAME" value=$RELMODULE_MODEL->getName()}
        {assign var="FIELDS_LIST" value=$BLOCKDATA['fields']}
        <div style="border-radius: 4px 4px 0px 0px;background: white;" data-sequence="{$BLOCKDATA['sequence']}" data-related-block-id="{$BLOCKID}" class="editFieldsTable relatedblock_{$BLOCKID} marginBottom10px border1px related-blockSortable " id="relatedblock_{$BLOCKID}">
            <div class="col-sm-12">
                <div class="layoutBlockHeader row">
                    <div class="blockLabel col-sm-3 padding10 marginLeftZero">
                        <img class="cursorPointerMove" src="{vimage_path('drag.png')}" />&nbsp;&nbsp;
                        <strong class="translatedBlockLabel">{vtranslate($RELMODULE_NAME, $RELMODULE_NAME)} {if $BLOCKDATA['filtervalue'] != '' && $BLOCKDATA['filterfield'] != ''}({$BLOCKDATA['filtervalue']}){/if}</strong>
                    </div>
                    <div class="col-sm-9 padding10 marginLeftZero">
                        {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}

                        <div class="blockActions" style="float:{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}left{else}right{/if} !important;">
                            <span>

                                <i class="fa fa-info-circle" title="{vtranslate('Collapse the block in detail view','Settings:LayoutEditor')}"></i>&nbsp; {vtranslate('LBL_COLLAPSE_BLOCK','Settings:LayoutEditor')}&nbsp;
                                <input style="opacity: 0;" type="checkbox" {if $BLOCKDATA['expand'] eq 1}checked{else}{/if} {if $BLOCKDATA['expand'] eq 1}value='1'{else}value='0'{/if}  class ='cursorPointer bootstrap-switch' name="related-blocks-lists-collapseBlock" data-on-text="{vtranslate('LBL_YES')}" data-off-text="{vtranslate('LBL_NO')}" data-on-color="primary" data-block-id="{$BLOCKID}"/>
                            </span>
                            <button class="blockEditBtn addButton btn btn-default btn-sm" data-related-block-id="{$BLOCKID}" data-url="index.php?module=RelatedBlocksLists&view=MassSettingsAjax&mode=showSettingsForm&type=block&sourceModule={$SOURCE_MODULE}&blockid={$BLOCKID}">{vtranslate('LBL_EDIT')}</button>&nbsp;&nbsp;
                            <button class="blockDeleteBtn addButton btn btn-default btn-sm" data-related-block-id="{$BLOCKID}" data-message-delete="{vtranslate('JS_LBL_ARE_YOU_SURE_YOU_WANT_TO_DELETE', 'RelatedBlocksLists')}">{vtranslate('LBL_DELETE')}</button>
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding:5px;min-height: 27px" class="blockFieldsList row">
                <ul style="list-style-type: none; float: left;min-height: 1px;padding:2px;" class="connectedSortable col-sm-6">
                    {foreach item=FIELD_MODEL from=$FIELDS_LIST name=fieldlist}
                        {if $smarty.foreach.fieldlist.index % 2 eq 0}
                            <li>
                                <div class="row border1px" style="padding: 10px 10px 10px 20px;">
                                    <span class="fieldLabel">
                                        <b>{vtranslate($FIELD_MODEL->get('label'), $RELMODULE_NAME)}</b>&nbsp;
                                        {if $FIELD_MODEL->isMandatory() eq true}<span class="redColor">*</span>{/if}
                                    </span>
                                    <!--<a href="javascript:void(0)" data-source-module="{$RELMODULE_NAME}" data-field-label="{$FIELD_MODEL->get('label')}" data-block-id="{$BLOCKID}" data-field-name="{$FIELD_MODEL->get('name')}" class="related-block-list-editFieldDetails pull-right"><i class="fa fa-pencil" title="Edit"></i></a>-->
                                    {assign var=IS_MANDATORY value=$FIELD_MODEL->isMandatory()}
                                </div>
                            </li>
                        {/if}
                    {/foreach}
                </ul>
                <ul style="list-style-type: none; float: left;min-height: 1px;padding:2px;" class="connectedSortable col-sm-6">
                    {foreach item=FIELD_MODEL from=$FIELDS_LIST name=fieldlist1}
                        {if $smarty.foreach.fieldlist1.index % 2 neq 0}
                            <li>
                                <div class="row border1px" style="padding: 10px 10px 10px 20px;">
                                    <span class="fieldLabel">
                                        <b>{vtranslate($FIELD_MODEL->get('label'), $RELMODULE_NAME)}</b>&nbsp;
                                        {if $FIELD_MODEL->isMandatory() eq true}<span class="redColor">*</span>{/if}
                                    </span>
                                    <!--<a href="javascript:void(0)" data-source-module="{$RELMODULE_NAME}" data-field-label="{$FIELD_MODEL->get('label')}" data-block-id="{$BLOCKID}" data-field-name="{$FIELD_MODEL->get('name')}" class="related-block-list-editFieldDetails pull-right"><i class="fa fa-pencil" title="Edit"></i></a>-->
                                    {assign var=IS_MANDATORY value=$FIELD_MODEL->isMandatory()}
                                </div>
                            </li>
                        {/if}
                    {/foreach}
                </ul>
            </div>
        </div>
    {/foreach}

{/strip}
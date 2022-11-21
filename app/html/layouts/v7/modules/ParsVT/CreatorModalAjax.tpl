{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{strip}
    <div id="creatorModalContainer" class="modal-dialog" style="min-width: 800px">
        {if $RECORDID}
            {assign var=HEADER_TITLE value={vtranslate('Show Record ID Field Settings', $QUALIFIED_MODULE)}}
        {elseif $PHONEFIELDS}
            {assign var=HEADER_TITLE value={vtranslate('Show SMSNotifier Tab in Entity Modules', $QUALIFIED_MODULE)}}
        {else}
            {assign var=HEADER_TITLE value={vtranslate('Show Creator Field Settings', $QUALIFIED_MODULE)}}
        {/if}
        {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
        <div class="modal-content">
            <div class="form-horizontal">
                <div class="modal-body">
                    <form name="linkModulesForm" id="linkModulesForm" method="POST">
                        <table class="table table-bordered equalSplit">
                            {assign var=COUNTER value=0}
                            <tr>
                                {foreach item=MODULE from=$ALL_MODULES}
                                {assign var=MODULE_ID value=$MODULE->id}
                                {assign var=MODULE_NAME value=$MODULE->name}
                                {assign var=MODULE_LABEL value=vtranslate($MODULE->label, $MODULE_NAME)}
                                {assign var=MODULE_ACTIVE value=$CREATOR_FIELDS[$MODULE_ID]['active']}
                                {if $COUNTER eq 2}
                                {assign var=COUNTER value=0}
                            </tr><tr>
                                {/if}
                                <td>
                                    <div>
                                <span class="col-lg-1" style="line-height: 2.5;">
                                    <input type="checkbox" class='{if $RECORDID}recordidfield{elseif $PHONEFIELDS}phonefield{else}creatorfield{/if}_checkbox' name="status" data-tabid="{$MODULE_ID}" data-module="{$MODULE_NAME}" {if $MODULE_ACTIVE}checked{/if} />
                                </span>
                                        <span class="col-lg-7 moduleName">
                                    <h5 style="line-height: 0.5;">{$MODULE_LABEL}</h5>
                                </span>
                                    </div>
                                </td>
                                {assign var=COUNTER value=$COUNTER+1}
                                {/foreach}
                            </tr>
                        </table>
                    </form>


                </div>
            </div>
            <div class="modal-footer">
                <div class="row-fluid">
                    <div class="pull-right">
					<button class="btn btn-info"  aria-label="Close" data-dismiss="modal">
                        <strong>{vtranslate('LBL_CLOSE', $QUALIFIED_MODULE)}</strong>
                    </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/strip}

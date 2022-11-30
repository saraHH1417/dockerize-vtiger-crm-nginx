{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
{* modules/Users/views/DeleteUser.php *}

{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
{strip}
    <div class="modal-dialog modelContainer">
        {**PVTPATCHER-10CF9D85B969E49FCC2F80A1961C0343-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=HEADER_TITLE value={vtranslate('LBL_TRANSFER_RECORDS_TO_USER', 'Users')}}
{** REPLACED-10CF9D85B969E49FCC2F80A1961C0343// {assign var=HEADER_TITLE value={vtranslate('Transfer records to user', $MODULE)}}**}
{**PVTPATCHER-10CF9D85B969E49FCC2F80A1961C0343-FINISH**}
        {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
        <div class="modal-content">
        <form class="form-horizontal" id="deleteUser" name="deleteUser" method="post" action="index.php">
            <input type="hidden" name="module" value="{$MODULE}" />
            <input type="hidden" name="userid" value="{$USERID}" />
            <div name='massEditContent'>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label fieldLabel col-sm-5">{**PVTPATCHER-1AA6FCEFBE55503403F83339741F7C1C-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('User to be deleted', 'ParsVT')}
{** REPLACED-1AA6FCEFBE55503403F83339741F7C1C// {vtranslate('User to be deleted', $MODULE)}**}
{**PVTPATCHER-1AA6FCEFBE55503403F83339741F7C1C-FINISH**}</label>
                        <label class="control fieldValue col-sm-5" style="padding-top: 6PX;">{$DELETE_USER_NAME}</label>
                    </div>
                        
                    <div class="form-group">
                       <label class="control-label fieldLabel col-sm-5">{**PVTPATCHER-92432B16BCD8046CBA2E243A7CA1C69B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('LBL_TRANSFER_RECORDS_TO_USER', 'Users')}</label>
{** REPLACED-92432B16BCD8046CBA2E243A7CA1C69B// {vtranslate('Transfer records to user', $MODULE)}</label>**}
{**PVTPATCHER-92432B16BCD8046CBA2E243A7CA1C69B-FINISH**}
                       <div class="controls fieldValue col-xs-6">
                           <select class="select2 {if $OCCUPY_COMPLETE_WIDTH} row-fluid {/if}" name="tranfer_owner_id" data-validation-engine="validate[ required]" >
                               {foreach item=USER_MODEL key=USER_ID from=$USER_LIST}
                                   <option value="{$USER_ID}" >{$USER_MODEL->getName()}</option>
                               {/foreach}
                           </select>
                       </div>
                    </div>
                                
                    {if !$PERMANENT}        
                        <div class="form-group">
                            <label class="control-label fieldLabel col-sm-4"></label>
                                <div class="controls fieldValue col-sm-8">
                                    <input type="checkbox" name="deleteUserPermanent" value="1" >
                                    &nbsp;&nbsp;{vtranslate('LBL_DELETE_USER_PERMANENTLY',$MODULE)}
                                    &nbsp;&nbsp;<i class="fa fa-question-circle" data-toggle="tooltip"  data-placement="right" title="{vtranslate('LBL_DELETE_USER_PERMANENTLY_INFO',$MODULE)}"></i>
                                </div>
                        </div>
                    {/if}
                </div>
            </div>
            {include file='ModalFooter.tpl'|@vtemplate_path:$MODULE}
        </form>
    </div>
            </div>     
{/strip}


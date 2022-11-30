{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Settings/Roles/views/Index.php *}

{strip}
    <div class="listViewPageDiv " id="listViewContent">
        <div class="col-sm-12 col-xs-12 ">
            <br>
            <div class="clearfix treeView">
                <ul>
                    <li data-role="{$ROOT_ROLE->getParentRoleString()}" {**PVTPATCHER-2FCF04A5221BB2887295758C49B58F05-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
data-roleid="{vtranslate($ROOT_ROLE->getId())}"
{** REPLACED-2FCF04A5221BB2887295758C49B58F05// data-roleid="{$ROOT_ROLE->getId()}"**}
{**PVTPATCHER-2FCF04A5221BB2887295758C49B58F05-FINISH**}>
                        <div class="toolbar-handle">
                            <a href="javascript:;" class="btn app-MARKETING {**PVTPATCHER-95B7871842E1AE1BE99BCC38693D5845-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
droppable">{vtranslate($ROOT_ROLE->getName())}
{** REPLACED-95B7871842E1AE1BE99BCC38693D5845// droppable">{$ROOT_ROLE->getName()}**}
{**PVTPATCHER-95B7871842E1AE1BE99BCC38693D5845-FINISH**}</a>
                            <div class="toolbar" title="{vtranslate('LBL_ADD_RECORD', $QUALIFIED_MODULE)}">
                                &nbsp;<a href="{$ROOT_ROLE->getCreateChildUrl()}" data-url="{$ROOT_ROLE->getCreateChildUrl()}" data-action="modal"><span class="icon-plus-sign"></span></a>
                            </div>
                        </div>
                        {assign var="ROLE" value=$ROOT_ROLE}
                        {include file=vtemplate_path("RoleTree.tpl", "Settings:Roles")}
                    </li>
                </ul>
            </div>
        </div>
    </div>
{/strip}
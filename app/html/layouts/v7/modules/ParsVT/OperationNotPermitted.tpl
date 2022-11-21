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
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
    <style>
        .small {
            text-align: left !important;
        }
    </style>
{/if}
<div style="margin:0 auto;width: 40em;">
    <table border='0' cellpadding='5' cellspacing='0' height='600px' width="700px">
        <tr>
            <td align='center'>
                <div style='border: 3px solid rgb(153, 153, 153); background-color: rgb(255, 255, 255); width: 80%; position: relative; z-index: 100000020;'>
                    <table border='0' cellpadding='5' cellspacing='0' width='98%'>
                        <tr>
                            <td rowspan='2' width='11%'><img src="{vimage_path('denied.gif')}"></td>
                            <td style='border-bottom: 1px solid rgb(204, 204, 204); text-align: center' nowrap='nowrap' width='70%'>
				<span class='genHeaderSmall'>
{vtranslate($MESSAGE , 'ParsVT')}</span></td>
                        </tr>
                        <tr>
                            <td class='small' align='right' nowrap='nowrap'>
                                <a href='javascript:window.history.back();'>{vtranslate('LBL_GO_BACK')}</a><br>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</div>
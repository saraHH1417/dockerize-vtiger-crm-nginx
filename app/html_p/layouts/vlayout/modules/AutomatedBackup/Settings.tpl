{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}

<div class="container-fluid">
    <div class="widget_header row-fluid">
        <h3>{vtranslate($QUALIFIED_MODULE, $QUALIFIED_MODULE)}</h3>
    </div>
    <hr>
    <div class="clearfix"></div>
    <div class="summaryWidgetContainer">
        <ul class="nav nav-tabs massEditTabs">
            <li class="active">
                <a href="#module_LBL_LOCAL_BACKUP" data-toggle="tab">
                    {vtranslate('LBL_LOCAL_BACKUP', $QUALIFIED_MODULE)}
                </a>
            </li>
            <li>
                <a href="#module_LBL_FTP_BACKUP" data-toggle="tab">
                    {vtranslate('LBL_FTP_BACKUP', $QUALIFIED_MODULE)}
                </a>
            </li>
            <li>
                <a href="#module_LBL_EMAIL_REPORT" data-toggle="tab">
                    {vtranslate('LBL_EMAIL_REPORT', $QUALIFIED_MODULE)}
                </a>
            </li>
        </ul>
        <div class="tab-content massEditContent">
            <div class="tab-pane active" id="module_LBL_LOCAL_BACKUP">
                {include file='LocalBackup.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
            </div>
            <div class="tab-pane" id="module_LBL_FTP_BACKUP">
                {include file='FTPBackup.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
            </div>
            <div class="tab-pane" id="module_LBL_EMAIL_REPORT">
                {include file='EmailReport.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
            </div>
        </div>
    </div>
</div>
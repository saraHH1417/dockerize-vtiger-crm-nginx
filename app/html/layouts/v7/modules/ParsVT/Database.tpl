{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{if !class_exists('Vtiger_Datetime_UIType')}
    {include_php file='modules/Vtiger/uitypes/Datetime.php'}
{/if}

{include file='SettingsHeader.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<br/>
{assign var=list_max_entries_per_page value=vglobal('list_max_entries_per_page')}
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3">
            <ul class="nav nav-pills nav-stacked massEditTabs" style="margin-bottom: 0;border-bottom: 0;">
                <li id="DataBaseGereralMenu" class="active"><a href="#DataBaseGereral" data-toggle="tab"><strong>{vtranslate('Database Statistics',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="DataBaseNeedAttentionMenu"><a href="#DataBaseNeedAttention" data-toggle="tab"><strong>{vtranslate('Need Attention Tables',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="DataBaseBackupMenu"><a href="#DataBaseBackup" data-toggle="tab"><strong>{vtranslate('Backup/Restore',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="DataBaseOptimizeMenu"><a href="#DataBaseOptimize" data-toggle="tab"><strong>{vtranslate('Optimize Database',$QUALIFIED_MODULE)}</strong></a>
                </li>
                {if !$WHITELABEL}
                <li id="DataTransformationMenu"><a href="#DataTransformation" data-toggle="tab"><strong>{vtranslate('Data Transformation',$QUALIFIED_MODULE)}</strong></a>
                </li>
                {/if}
                <li id="MiscDatabseMenu"><a href="#MiscDatabse" data-toggle="tab"><strong>{vtranslate('Database information',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="ListofTablesMenu"><a href="#ListofTables" data-toggle="tab"><strong>{vtranslate('List of Tables',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="MySQLTunerMenu"><a href="#MySQLTuner" data-toggle="tab"><strong>{vtranslate('MySQL Tuner',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="IndexingToolMenu"><a href="#IndexingTool" data-toggle="tab"><strong>{vtranslate('Field Indexing Tool',$QUALIFIED_MODULE)}</strong></a>
                </li>

            </ul>
        </div>
        <div class="col-lg-9">
            <div class="tab-content layoutContent padding20 themeTableColor overflowVisible">
                <div class="tab-pane settingsIndexPage active" id="DataBaseGereral">
                    <div class="row-fluid">


                        <div class="row">
               <span class="col-lg-4 col-md-4 col-sm-4 settingsSummary">
                  <a class="normalattention" href="#DataBaseBackup" data-toggle="tab">
                     <h2 class="summaryCount">{$COUNTTABLES}</h2>
                     <p class="summaryText" style="margin-top:20px;">{vtranslate('Total Tables', $MODULE)}</p>
                  </a>
               </span>
                            <span class="col-lg-4 col-md-4 col-sm-4 settingsSummary">
                  <a {if $COUNTNATABLES gt 0}class="needattention" {else}class="okattention"{/if}
                     href="#DataBaseNeedAttention" data-toggle="tab">
                     <h2 class="summaryCount {if $COUNTNATABLES gt 0}blink_me{/if}">{$COUNTNATABLES}</h2>
                     <p class="summaryText {if $COUNTNATABLES gt 0}blink_me{/if}"
                        style="margin-top:20px;">{vtranslate('Need Attention Tables', $MODULE)}</p>
                  </a>
               </span>
                            <span class="col-lg-4 col-md-4 col-sm-4 settingsSummary">
                  <a {if $COUNTOPTABLES gt 0}class="needoptimize" {else}class="okattention"{/if}
                     href="#DataBaseOptimize" data-toggle="tab">
                     <h2 class="summaryCount {if $COUNTOPTABLES gt 0}blink_me{/if}">{$COUNTOPTABLES}</h2>
                     <p class="summaryText {if $COUNTOPTABLES gt 0}blink_me{/if}"
                        style="margin-top:20px;">{vtranslate('Need Optimize Tables', $MODULE)}</p>
                  </a>
               </span>
                        </div>
                        <hr>
                        <br>


                    </div>
                </div>
                <div class="tab-pane" id="MiscDatabse"></div>
                {if !$WHITELABEL}
                <div class="tab-pane" id="DataTransformation">
                    <div class="row-fluid">

                            <div class="row">
                                <div class="col-lg-3 col-sm-3">
                                    <img src="data:image/png;base64,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" width="75%">

                                </div>
                                <div class="col-lg-9 col-sm-9">

                                    {vtranslate('If you are using orginal version of VtigerCRM, You can skip this section.', $QUALIFIED_MODULE)}<br />
                                    {vtranslate('if you are using other solar canendar you must transform old database data !', $QUALIFIED_MODULE)}

                                </div>
                            </div>

                        <div class="row"><br /></div>

                        <table class="table table-hover">
                            <tr>
                                <td style="border-right: none">{vtranslate('Status', $QUALIFIED_MODULE)}:</td>
                                <td style="border-right: none" colspan="3">{vtranslate($DBUSERPERMISSIONS['Status'], $QUALIFIED_MODULE)}</td>
                            </tr>
                            <tr>
                                <td style="border-right: none">{vtranslate('Old CRM System', $QUALIFIED_MODULE)}:</td>
                                <td style="border-right: none" colspan="3">{$OLDCRM}</td>
                            </tr>
                            <tr>
                                <td style="border-right: none">{vtranslate('CRM Version', $QUALIFIED_MODULE)}:</td>
                                <td style="border-right: none" colspan="3">{$CRMVERSION[0]}  <i><a target="_blank" href="{$CRMVERSION[1]}">{vtranslate('Download Core Files', $QUALIFIED_MODULE)}</a></i> </td>
                            </tr>
                            <tr>
                                <td style="border-right: none;min-width: 200px;">{vtranslate('MySQL user privileges', $QUALIFIED_MODULE)}:</td>
                                <td style="border-right: none" colspan="3">{if $DEMO_MODE}******{else}{$DBUSERPERMISSIONS['Privileges']}{/if}</td>
                            </tr>
                        </table>

                        <div class="row">

                            {if $DBUSERPERMISSIONS['Success']}
                                <button class="btn btn-primary transformdb">
                                    {vtranslate('Transform Database', $QUALIFIED_MODULE)}
                                </button>
                            {/if}
                        </div>

                    </div>
                </div>
                {/if}
                <div class="tab-pane" id="DataBaseNeedAttention">
                    <div class="row-fluid">
                        {if $COUNTNATABLES > 0}
                            <div class="row">
                                {vtranslate('The following tables must convert for better reliability and scalability, review the following guidelines and tips before converting.', $QUALIFIED_MODULE)}
                                <br/><br/>
                                <div class="alert alert-warning blink_me">
                                    <strong>{vtranslate('Tip',$QUALIFIED_MODULE)}</strong><br/>
                                    {vtranslate('Before you click on convert botton, make sure you have backed up you database!',$QUALIFIED_MODULE)}
                                </div>
                                {if $ENGINE eq 'No'}
                                    <div class="alert alert-danger blink_me">
                                        <strong>{vtranslate('Warning',$QUALIFIED_MODULE)}</strong><br/>
                                        <a href="https://wiki.vtiger.com/index.php/System_Requirements"
                                           target="_blank">{vtranslate('Database server does not support innodb storage engine!',$QUALIFIED_MODULE)}</a>
                                    </div>
                                {/if}

                            </div>
                            <table class="table table-hover table-condensed  confTable">
                                <thead>
                                <tr>
                                    <th style="border-right: none">{vtranslate('Table Name',$QUALIFIED_MODULE)}</th>
                                    <th style="border-right: none">{vtranslate('Table Name',$QUALIFIED_MODULE)}</th>
                                </tr>
                                </thead>
                                <tbody>

                                {assign var=counter value=0}
                                <tr class="listViewEntries">
                                    {assign var=last value=$UPDATEABLETABLES|@end}

                                    {foreach item=DATABASE_INFO from=$UPDATEABLETABLES}

                                    {assign var=counter value=$counter+1}
                                    <td class="listViewEntrie medium">{$DATABASE_INFO}</td>
                                    {if $last eq $DATABASE_INFO && $counter eq '1'}
                                    <td class="listViewEntrie medium"></td>
                                </tr>
                                {/if}
                                {if $counter eq '2'}
                                {assign var=counter value=0}
                                </tr>
                                <tr class="listViewEntries">
                                    {/if}


                                    {/foreach}
                                </tbody>
                            </table>
                        {else}
                            <h4>{vtranslate('Your database schema is up-to-date!',$QUALIFIED_MODULE)}</h4>
                        {/if}
                        {if $COUNTNATABLES > 0}
                            <input type='hidden' name='updatabletables' value='{ZEND_JSON::encode($UPDATEABLETABLES)}'>
                            <button class="btn btn-primary fixError">
                                {vtranslate('Convert Database', $QUALIFIED_MODULE)}
                            </button>
                        {/if}
                        {if $DBSTATUS[0] neq "3c763d"}
                            <button class="btn btn-primary convertdb">
                                {vtranslate('Change Databse Collation', $QUALIFIED_MODULE)}
                            </button>
                        {/if}


                    </div>
                </div>
                <div class="tab-pane" id="DataBaseOptimize">
                    <div class="row-fluid">
                        <div class="row-fluid">
                            <div class="row">
                                <div class="alert alert-warning blink_me">
                                    <strong>{vtranslate('Tip',$QUALIFIED_MODULE)}</strong><br/>
                                    {vtranslate('Before you click on optimize botton, make sure you have backed up you database!',$QUALIFIED_MODULE)}
                                </div>
                            </div>
                            {if $COUNTOPTABLES gt 0}
                                <table class="table table-hover table-condensed  confTable">
                                    <thead>
                                    <tr>
                                        <th style="border-right: none">{vtranslate('Table Name',$QUALIFIED_MODULE)}</th>
                                        <th style="border-right: none">{vtranslate('Table Name',$QUALIFIED_MODULE)}</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    {assign var=counter value=0}
                                    <tr class="listViewEntries">
                                        {assign var=last value=$OPTABLES|@end}

                                        {foreach item=DATABASE_INFO from=$OPTABLES}

                                        {assign var=counter value=$counter+1}
                                        <td class="listViewEntrie medium">{$DATABASE_INFO}</td>
                                        {if $last eq $DATABASE_INFO && $counter eq '1'}
                                        <td class="listViewEntrie medium"></td>
                                    </tr>
                                    {/if}
                                    {if $counter eq '2'}
                                    {assign var=counter value=0}
                                    </tr>
                                    <tr class="listViewEntries">
                                        {/if}


                                        {/foreach}
                                    </tbody>
                                </table>
                            {else}
                                <h4>{vtranslate('Your tables are optimized!',$QUALIFIED_MODULE)}</h4>
                            {/if}
                            {if $COUNTOPTABLES gt 0}
                                <input type='hidden' name='optimizetables' value='{ZEND_JSON::encode($OPTABLES)}'>
                                <button class="btn btn-primary optimizetables">
                                    {vtranslate('Optimize', $QUALIFIED_MODULE)}
                                </button>
                            {/if}
                            <button class="btn btn-primary optimizealltables">
                                {vtranslate('Optimize Database Tables', $QUALIFIED_MODULE)}
                            </button>


                        </div>

                    </div>
                </div>
                <div class="tab-pane" id="DataBaseBackup">
                    <div class="row-fluid">
                        {if $TIME_MESSAGE}
                            <div class="alert alert-danger blink_me">
                                <strong>{vtranslate('Warning!',$QUALIFIED_MODULE)}</strong><br/>
                                {vtranslate('Database section need more time to execute functionality than the default execution time (%s seconds) available in Server. and due to short of execution time scripting not completed their process execution and hitting timing out.',$QUALIFIED_MODULE,$MAX_EXECUTION_TIME)}
                                <br/>
                                <a href="http://vtfarsi.ir/maximum-execution-vtiger/"
                                   target="_blank">{vtranslate('Please increase the value in Server and try again!',$QUALIFIED_MODULE)}</a>
                            </div>
                        {/if}
                        <div class="alert alert-info">
                            <strong>{vtranslate('Tip',$QUALIFIED_MODULE)}</strong><br/>{vtranslate('Documents attached to the system are NOT included in database backups. Backup of source code files and all attachements (files in Storage folder) should be created manually.',$QUALIFIED_MODULE)}
                        </div>


                        <div class="clearfix"></div>
                        <hr>
                        <br/>
                        <div class="block">
                            <div>
                                <h4 class="textOverflowEllipsis maxWidth50 blink_me">
                                    <img class="cursorPointer alignMiddle blockToggle blink_me hide" src="layouts/v7/skins/images/Square.png" data-mode="hide" data-id="16">
                                    <img class="cursorPointer alignMiddle blockToggle " src="layouts/v7/skins/images/Circle.png" data-mode="show" data-id="16">&nbsp;{vtranslate('Automatic Backup Settings', $MODULE)}
                                                              {if $BACKUP_OPTIONS['backup_last'] neq null}
                                                                  <small>{vtranslate('Last run', $MODULE)}: {Vtiger_DateTime_UIType::getDisplayValue($BACKUP_OPTIONS['backup_last'])}</small>
                                                              {/if}
                                </h4>
                            </div>
                            <hr>
                            <div class="blockData">
                                <div id="dbblockdata">
                                    <div class="row form-group">
                                        <div class="col-lg-4">{vtranslate('Automatic Backup',$QUALIFIED_MODULE)}</div>
                                        <div class="col-lg-8">
                                            <input name="backup_status" style="opacity: 0;" {if $BACKUP_STATUS neq 1} value='0' {else} value='1' checked{/if}
                                                   class='cursorPointer bootstrap-switch' type="checkbox"
                                                   data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                   data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                   data-on-color="primary" data-toggle="toggle"/>
                                            <a href="index.php?module=CronTasks&parent=Settings&view=List"
                                               target="_blank">
                                                <small>{vtranslate('Go to Automation Settings',$QUALIFIED_MODULE)}</small>
                                            </a>
                                        </div>
                                        <div class="col-lg-4"> &nbsp;</div>
                                        <div class="col-lg-8"> &nbsp;</div>
                                        <div class="col-lg-4">{vtranslate('Backup Frequency',$QUALIFIED_MODULE)}</div>
                                        <div class="col-lg-8">
                                            <select class="select2" name="backup_frequency" style="min-width:250px;">
                                                {ParsVT_Module_Model::ParsFormSelectCreate($BACKUP_FREQUENCY,$BACKUP_OPTIONS['backup_frequency'])}
                                            </select>
                                        </div>
                                        <div class="col-lg-4"> &nbsp;</div>
                                        <div class="col-lg-8"> &nbsp;</div>
                                        <div class="col-lg-4">{vtranslate('Backup Time',$QUALIFIED_MODULE)}</div>
                                        <div class="col-lg-8">
                                            <select class="select2 task-fields" name="backup_start">
                                                {ParsVT_Module_Model::ParsFormSelectCreate($BACKUP_TIME,$BACKUP_OPTIONS['backup_start'])}

                                            </select>
                                        </div>
                                        <div class="col-lg-4"> &nbsp;</div>
                                        <div class="col-lg-8"> &nbsp;</div>
                                        <div class="col-lg-4">{vtranslate('Delete Old Backups',$QUALIFIED_MODULE)}</div>
                                        <div class="col-lg-6">
                                            <select class="select2 task-fields" name="backup_keep" style="min-width:250px;">
                                                <option value='0' {if $BACKUP_OPTIONS['backup_keep'] eq 0}selected{/if}>{vtranslate('Never',$QUALIFIED_MODULE)}</option>
                                                {for $foo=1 to 365}
                                                    <option value='{$foo}' {if $BACKUP_OPTIONS['backup_keep'] eq $foo}selected{/if}>{vtranslate('Older than %s days',$QUALIFIED_MODULE,$foo)}</option>
                                                {/for}
                                            </select>
                                        </div>
                                        <div class="col-lg-2">
                                            <button class="btn btn-primary SaveBackupSettings">
                                                {vtranslate('Save', $QUALIFIED_MODULE)}
                                            </button>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>

                        </div>
                    </div>


                    <table cellpadding="0" cellspacing="0" border="0"
                           class="table table-condensed table-hover backupTable text-center" id="datatable">
                        <thead>
                        <tr class="active text-center confTable2">
                            <th class="text-center">{vtranslate('#',$QUALIFIED_MODULE)}</th>
                            <th class="text-center">{vtranslate('Backup Name',$QUALIFIED_MODULE)}</th>
                            <th class="text-center">{vtranslate('Creation Date', $QUALIFIED_MODULE)}</th>
                            <th class="text-center">{vtranslate('Size', $QUALIFIED_MODULE)}</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach item=S_FILE key=ID from=$FILELIST}
                            <tr class="confTable2" data-recordurl="{$ID}">
                                <td style="max-width: 30px; width: 30px;"><label for="{$ID}"><input type="radio"
                                                                                                    name="rbSelect"
                                                                                                    value="{$ID}"
                                                                                                    class="radio-group"></label>
                                </td>
                                <td>&nbsp;&nbsp;<label for="{$ID}">&nbsp;&nbsp;{$ID}</label></td>
                                <td><label for="{$ID}">{$S_FILE[0]}</label></td>
                                <td><label for="{$ID}">{$S_FILE[1]}</label></td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                    <table class="table table-condensed table-hover backupTable text-center">
                        <tbody>

                        <tr class="text-center">
                            <td class="text-center" colspan="1" style="vertical-align: middle;">
                                <button class="btn btn-success btn-backup">
                                    <strong>{vtranslate('Create Database Backup', $QUALIFIED_MODULE)}</strong>
                                </button>

                            </td>
                            <td class="listViewEntrie medium text-center" colspan="3"
                                style="vertical-align: middle;">

                                {vtranslate('Admin Password', $QUALIFIED_MODULE)}
                                <input type="password" class="inputElement" name="pass" id="adminpassword"
                                       style="max-width: 150px;">
                                <input type="hidden" name="module" value="ParsVT">
                                <input type="hidden" name="action" value="DBOperation">
                                <input type="hidden" name="parent" value="Settings">
                                <input type="hidden" name="mode" value="get_file">

                                <button class="btn btn-primary"
                                        id="downloadbackup">{vtranslate('Download Backup', $QUALIFIED_MODULE)}</button>
                                <button class="btn btn-warning"
                                        id="btn_restore">{vtranslate('Restore Backup', $QUALIFIED_MODULE)}</button>
                                <button class="btn btn-danger"
                                        id="btn_delete">{vtranslate('Delete Backup', $QUALIFIED_MODULE)}</button>
                            </td>
                        </tr>


                        </tbody>
                    </table>

                </div>
                <div class="tab-pane" id="ListofTables"></div>
                <div class="tab-pane" id="MySQLTuner">
                    <div class="row-fluid">
                        <div class="alert alert-warning">
                            <strong>{vtranslate('Tip',$QUALIFIED_MODULE)}</strong><br/>{vtranslate("MySQLTuner is a read only script. It won't write to any configuration files, change the status of any daemons, or call your mother to wish her a happy birthday. It will give you an overview of your server's performance and make some basic recommendations for improvements that you can make after it completes",$QUALIFIED_MODULE)}
                        </div>
                        <div class="clearfix"></div>
                        <hr>
                        <br/>
                        <h4>{vtranslate('ParsVT MySQL Tuner',$QUALIFIED_MODULE)}</h4>
                        <br/>
                        <button class="btn btn-primary" onclick="Database_Js.showHelp('{vtranslate('MySQL Tuner',$QUALIFIED_MODULE)}','modules/ParsVT/resources/MySQLTuner/mysqltuner.php');">
                            {vtranslate('MySQL Tuner', $QUALIFIED_MODULE)}
                        </button>
                        <br/>
                        <br/>
                        <h4>{vtranslate('CLI MySQL Tuner',$QUALIFIED_MODULE)}</h4>
                        <br/>
                        <div class="alert alert-info">
                            <strong>{vtranslate('Requirements',$QUALIFIED_MODULE)}</strong><br/>
                            <p style="direction: ltr; text-align: left">Perl 5.6 or later (with perl-doc package) <br />Unix/Linux based operating system (tested on Linux, BSD variants, and Solaris variants) <br /> Unrestricted read access to the MySQL server (OS root access recommended for MySQL < 5.1)</span>
                        </div>
                        <div>{vtranslate('Please copy & run the following command in your server',$QUALIFIED_MODULE)}</div>
                        <textarea style="direction: ltr; text-align: left; height: 100px; width: 100%;" readonly> cd {str_replace("\\","/",vglobal('root_directory'))}modules/ParsVT/resources/MySQLTuner/ && chmod +x tuner.sh && sh tuner.sh</textarea>

                    </div>
                </div>
                <div class="tab-pane" id="IndexingTool">
                    <div class="row-fluid">
                        <div class="alert alert-warning blink_me">
                            <strong>{vtranslate('Tip',$QUALIFIED_MODULE)}</strong><br/>
                            {vtranslate('Before you click on Index Now botton, make sure you have backed up you database!',$QUALIFIED_MODULE)}
                        </div>
                        <div class="row form-group">
                            <div  class="col-md-12" id="ParsVTToolsSettingsMainPanel">
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="{$TOOL->getIcon()}"></i>&nbsp;&nbsp; {vtranslate($TOOL->getLabel(), $MODULE)}
                                    </legend>
                                    {if isset($ALERT)}
                                        <div class="tool-alert">{$ALERT}</div>
                                    {/if}
                                    <div class="tool-panel">
                                        {$TOOL->showPanel($DATA)}
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#datatable').dataTable({
            "sDom": "<'row'<'col-xs-6'T><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
            "sPaginationType": "full_numbers",
            "language": {
                "decimal": "",
                "emptyTable": "{vtranslate('No data available in table', $QUALIFIED_MODULE)}",
                "info": "{vtranslate('Showing _START_ to _END_ of _TOTAL_ entries', $QUALIFIED_MODULE)}",
                "infoEmpty": "{vtranslate('Showing 0 to 0 of 0 entries', $QUALIFIED_MODULE)}",
                "infoFiltered": "{vtranslate('(filtered from _MAX_ total entries)', $QUALIFIED_MODULE)}",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "{vtranslate('Show _MENU_ entries', $QUALIFIED_MODULE)}",
                "loadingRecords": "{vtranslate('Loading...', $QUALIFIED_MODULE)}",
                "processing": "{vtranslate('Processing...', $QUALIFIED_MODULE)}",
                "search": "{vtranslate('Search:', $QUALIFIED_MODULE)}",
                "zeroRecords": "{vtranslate('No matching records found', $QUALIFIED_MODULE)}",
                "paginate": {
                    "first": "{vtranslate('First', $QUALIFIED_MODULE)}",
                    "last": "{vtranslate('Last', $QUALIFIED_MODULE)}",
                    "next": "{vtranslate('Next', $QUALIFIED_MODULE)}",
                    "previous": "{vtranslate('Previous', $QUALIFIED_MODULE)}"
                },
                "aria": {
                    "sortAscending": "{vtranslate(': activate to sort column ascending', $QUALIFIED_MODULE)}",
                    "sortDescending": "{vtranslate(': activate to sort column descending', $QUALIFIED_MODULE)}"
                }
            },
            "pageLength": {if $list_max_entries_per_page neq '' && $list_max_entries_per_page neq '0'}{$list_max_entries_per_page}{else}20{/if}
        });
    });
</script>

<br /><br /><br /><br /><br />

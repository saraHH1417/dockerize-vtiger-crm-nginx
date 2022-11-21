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


<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-lg-12">
            <h4>{vtranslate('Miscellaneous Settings', $MODULE)}</h4>
            {if $show_cron_warning eq true}
                <p class="alert alert-warning blink_me">
                    <strong>{vtranslate('Warning:', $MODULE)}</strong><br/>{vtranslate("It looks like you don't activate the Cronjob of this VtigerCRM System.", $MODULE)}
                    <strong><a href="index.php?module=CronTasks&amp;parent=Settings&amp;view=List">{vtranslate('Please activate!', $MODULE)}</a></strong> {vtranslate("Otherwise lot's of functions won't work like expected.", $MODULE)}
                </p>
            {/if}
            <hr>
        </div>
    </div>
</div>
<div class="container-fluid">
        <div class="col-lg-12">
        <div class="col-lg-3">
            <ul class="nav nav-pills nav-stacked massEditTabs" style="margin-bottom: 0;border-bottom: 0;">
                <li id="MiscGereralMenu" class="active"><a href="#MiscGereral" data-toggle="tab"><strong>{vtranslate('General Tools',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="MiscFilesPermissionsMenu"><a href="#MiscFilesPermissions" data-toggle="tab"><strong>{vtranslate('Files/Folders Permissions',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="MiscConfMenu"><a href="#MiscConf" data-toggle="tab"><strong>{vtranslate('PHP Extensions',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="MiscStabilityMenu"><a href="#MiscStability" data-toggle="tab"><strong>{vtranslate('PHP Configuration',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="MiscSysInfoMenu"><a href="#MiscSysInfo" data-toggle="tab"><strong>{vtranslate('Environment Variables',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="MiscDatabseMenu"><a href="#MiscDatabse" data-toggle="tab"><strong>{vtranslate('Database information',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="MiscSecurityMenu"><a href="#MiscSecurity" data-toggle="tab"><strong>{vtranslate('Security Configuration',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="PublicDirStatesMenu"><a href="#PublicDirStates" data-toggle="tab"><strong>{vtranslate('Restricted Folders',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="SystemCleanupMenu"><a href="#SystemCleanup" data-toggle="tab"><strong>{vtranslate('System Cleanup',$QUALIFIED_MODULE)}</strong></a>
                </li>
                <li id="ForceSchedulerMenu"><a href="#ForceScheduler" data-toggle="tab"><strong>{vtranslate('Force Scheduler',$QUALIFIED_MODULE)}</strong></a>
                </li>
            </ul>
        </div>
        <div class="col-lg-9">
            <div class="tab-content layoutContent padding20 themeTableColor overflowVisible">
                <div class="tab-pane active" id="MiscGereral">
                    <div class="row-fluid">
                        <div class="pcss3t pcss3t-icons-bottom pcss3t-theme-5 pcss3t-height-auto">
                            <ul style="list-style:  none !important;">
                                <li class="tab-content tab-content-first typography">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <fieldset class="vtToolBox">
                                                <legend>{vtranslate('Dashboard Options',$QUALIFIED_MODULE)}</legend>
                                                <ul class="list-unstyled pvtdash" style="line-height:200%">
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('Announcements Widget on Dashboard',$QUALIFIED_MODULE)}">
                                                        <input style="opacity: 0;" {if $Announcements neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="Announcements"/>
                                                        <a href="index.php?parent=Settings&module=Vtiger&view=AnnouncementEdit" target="_blank" >{vtranslate('Announcements Widget on Dashboard',$QUALIFIED_MODULE)}</a>
                                                    </li>
                                                    {if !$WHITELABEL}
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('Marketplace Banner on Dashboard',$QUALIFIED_MODULE)}">
                                                        <input style="opacity: 0;" {if $MarketplaceBanner neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="MarketplaceBanner"/>
                                                        {vtranslate('Marketplace Banner on Dashboard',$QUALIFIED_MODULE)}
                                                    </li>
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('Tutorial Widget on Dashboard',$QUALIFIED_MODULE)}">
                                                        <input style="opacity: 0;" {if $Tutorial neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="Tutorial"/>
                                                        {vtranslate('Tutorial Widget on Dashboard',$QUALIFIED_MODULE)}
                                                    </li>
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('News Widget on Dashboard',$QUALIFIED_MODULE)}">
                                                        <input style="opacity: 0;" {if $News neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="News"/>
                                                        {vtranslate('News Widget on Dashboard',$QUALIFIED_MODULE)}</li>
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('New Modules Widget on Dashboard',$QUALIFIED_MODULE)}">
                                                        <input style="opacity: 0;" {if $Modules neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="Modules"/>
                                                        {vtranslate('New Modules Widget on Dashboard',$QUALIFIED_MODULE)}
                                                    </li>
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('Latest Updates Widget on Dashboard',$QUALIFIED_MODULE)}">
                                                        <input style="opacity: 0;" {if $LatestUpdates neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="LatestUpdates"/>
                                                        {vtranslate('Latest Updates Widget on Dashboard',$QUALIFIED_MODULE)}
                                                    </li>
                                                    {/if}
                                                </ul>
                                            </fieldset>
                                            <fieldset class="vtToolBox">
                                                <legend>{vtranslate('Miscellaneous Options',$QUALIFIED_MODULE)}</legend>
                                                <ul class="list-unstyled pvtdash" style="line-height:200%">
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('Correct the record merging problem',$QUALIFIED_MODULE)}">
                                                        <input style="opacity: 0;" {if $FIXMERGE neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="FIXMERGE"/>
                                                        {vtranslate('Correct the record merging problem',$QUALIFIED_MODULE)}
                                                    </li>
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('Clear Campain Option',$QUALIFIED_MODULE)}">
                                                        <input style="opacity: 0;" {if $ClearCampaign neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="ClearCampaign"/>
                                                        {vtranslate('Clear Campain option in detail view',$QUALIFIED_MODULE)}
                                                    </li>
                                                </ul>
                                                <dl class="pvtdash">
                                                    <dd>
                                                        <small>{vtranslate('Clear the entire template cache',$QUALIFIED_MODULE)}</small>
                                                    </dd>
                                                    <dt>
                                                        <button class="btn btn-danger" type="button" {$MODULE_MODEL->getclearCacheUrl()}>{vtranslate('Delete CRM Cache', $QUALIFIED_MODULE)}</button>
                                                    </dt>
                                                    <dd>
                                                        <small>{vtranslate('Recreate the privileges files if neccessary!',$QUALIFIED_MODULE)}</small>
                                                    </dd>
                                                    <dt>
                                                        <button class="btn btn-inverse" type="button" {$MODULE_MODEL->getPrivilegsUrl()}>{vtranslate('Recreate all User Privilege Files', $QUALIFIED_MODULE)}</button>
                                                    </dt>
                                                    <dd>
                                                        <small>{vtranslate('Fix missing taxclass in profiles!',$QUALIFIED_MODULE)}</small>
                                                    </dd>
                                                    <dt>
                                                        <button class="btn btn-info" type="button" {$MODULE_MODEL->getMissingTax()}>{vtranslate('Fix missing tax', $QUALIFIED_MODULE)}</button>
                                                    </dt>
                                                    <dd>
                                                        <small>{vtranslate('Add todos & events to workflows for all modules',$QUALIFIED_MODULE)}</small>
                                                    </dd>
                                                    <dt>
                                                        <button class="btn btn-info" type="button" {$MODULE_MODEL->getfixWorkFlowUrl()}>{vtranslate('Fix Workflow Tasks', $QUALIFIED_MODULE)}</button>
                                                    </dt>
                                                    <dd>
                                                        <small>{vtranslate('Add advanced "Assigned To" creator & parent role custom function for all modules & assign Comments to parent owner',$QUALIFIED_MODULE)}</small>
                                                    </dd>
                                                    <dt>
                                                        <button class="btn btn-info" type="button" {$MODULE_MODEL->getAssignedToCF()}>{vtranslate('Add Assigned To Custom Functions', $QUALIFIED_MODULE)}</button>
                                                    </dt>
                                                    <dd>
                                                        <small>{vtranslate('Fix transfer related records on convert Leads',$QUALIFIED_MODULE)}</small>
                                                    </dd>
                                                    <dt>
                                                        <button class="btn btn-info" type="button" {$MODULE_MODEL->getfixConvertLeads()}>{vtranslate('Fix transfer related records', $QUALIFIED_MODULE)}</button>
                                                    </dt>
                                                    {if $SMSNOTIFIERMODULE}
                                                        <dd>
                                                            <small>{vtranslate('Show SMSNotifier Tab in Entity Modules',$QUALIFIED_MODULE)}</small>
                                                        </dd>
                                                        <dt>
                                                            <button class="btn btn-warning" type="button" id="SMSNotifierModule">{vtranslate('Show SMSNotifier Tab', $QUALIFIED_MODULE)}</button>
                                                        </dt>
                                                    {/if}
                                                    <dd>
                                                        <small>{vtranslate('Show Creator Field in Entity Modules',$QUALIFIED_MODULE)}</small>
                                                    </dd>
                                                    <dt>
                                                        <button class="btn btn-warning" type="button" id="editcreator">{vtranslate('Creator Field Settings', $QUALIFIED_MODULE)}</button>
                                                    </dt>
                                                    <dd>
                                                        <small>{vtranslate('Show Record ID Field in Entity Modules',$QUALIFIED_MODULE)}</small>
                                                    </dd>
                                                    <dt>
                                                        <button class="btn btn-warning" type="button" id="editrecordid">{vtranslate('Record ID Field Settings', $QUALIFIED_MODULE)}</button>
                                                    </dt>
                                                </dl>
                                            </fieldset>
                                            <fieldset class="vtToolBox">
                                                <legend>{vtranslate('Security Settings',$QUALIFIED_MODULE)}</legend>
                                                <p>
                                                    <strong>{vtranslate('Htaccess Settings',$QUALIFIED_MODULE)}
                                                        :</strong>

                                                </p>
                                                {if $HTACCESS}
                                                    <button class="btn btn-success" type="button"
                                                            id="edithtaccess">{vtranslate('Edit Htaccess Settings',$QUALIFIED_MODULE)}</button>
                                                {else}
                                                    <button class="btn btn-info" type="button"
                                                            id="edithtaccess">{vtranslate('Add New Htaccess Settings',$QUALIFIED_MODULE)}</button>
                                                {/if}
                                                <a href="{$MODULE_MODEL->getHtaccessUrl()}"
                                                   target="_blank">{vtranslate('More Info',$QUALIFIED_MODULE)}</a>
                                                <br/>
                                                <br/>
                                                <p>
                                                    <strong>{vtranslate('Restricted Folders',$QUALIFIED_MODULE)}
                                                        :</strong>

                                                </p>
                                                <button class="btn btn-info" type="button"
                                                        {$MODULE_MODEL->getfixResrictedFolders()}>{vtranslate('Fix Restricted Folders Permissions',$QUALIFIED_MODULE)}</button>


                                            </fieldset>
                                            <fieldset class="vtToolBox">
                                                <legend>{vtranslate('Customer Portal',$QUALIFIED_MODULE)}</legend>
                                                <p>
                                                    <a href="index.php?module=CustomerPortal&parent=Settings&view=Index" target="_blank"><i class="fa fa-link icon" style="margin: 0 5px"></i><strong>{vtranslate('Customer Portal Settings',$QUALIFIED_MODULE)} {vtranslate('(RESTful API)',$QUALIFIED_MODULE)}</strong></a>
                                                    {if is_dir('soap')}
                                                    <br />
                                                    <a href="index.php?module=ParsVT&parent=Settings&view=CustomerPortal" target="_blank"><i class="fa fa-link icon" style="margin: 0 5px"></i><strong>{vtranslate('Customer Portal Settings',$QUALIFIED_MODULE)} {vtranslate('(SOAP API)',$QUALIFIED_MODULE)}</strong></a>
                                                    {/if}
                                                    {if $PARSVTPORTAL}
                                                        <br />
                                                        <a href="index.php?module=ParsVTPortal&parent=Settings&view=Index" target="_blank"><i class="fa fa-link icon" style="margin: 0 5px"></i><strong>{vtranslate('ParsVT Customer Portal Settings',$QUALIFIED_MODULE)} {vtranslate('(RESTful API)',$QUALIFIED_MODULE)}</strong></a>
                                                    {/if}
                                                </p>
                                            </fieldset>
                                        </div>
                                        <!-- col-lg-6 -->
                                        <div class="col-lg-6">
                                            <fieldset class="vtToolBox">
                                                <legend>{vtranslate('Google Calendar Settings',$QUALIFIED_MODULE)}</legend>
                                                <p>
                                                    <strong>{vtranslate('Google Calendar API Settings',$QUALIFIED_MODULE)}
                                                        :</strong>
                                                <dl class="pvtdash">
                                                    <dd>
                                                        <small>{vtranslate('Client ID',$QUALIFIED_MODULE)}:</small>
                                                    </dd>
                                                    <dt>
                                                        <small><i>{$CLIENTID}</i></small>
                                                    </dt>
                                                    <dd>
                                                        <small>{vtranslate('Client Secret',$QUALIFIED_MODULE)}:</small>
                                                    </dd>
                                                    <dt>
                                                        <small><i>{$CLIENTSECRET}</i></small>
                                                    </dt>
                                                </dl>
                                                </p>
                                                {if $CLIENTID && $CLIENTSECRET}
                                                    <button class="btn btn-success" type="button"
                                                            id="googleapi">{vtranslate('Edit Settings',$QUALIFIED_MODULE)}</button>
                                                {else}
                                                    <button class="btn btn-info" type="button"
                                                            id="googleapi">{vtranslate('Add API Settings',$QUALIFIED_MODULE)}</button>
                                                {/if}
                                                <a href="{$MODULE_MODEL->getGoogleAPIUrl()}"
                                                   target="_blank">{vtranslate('More Info',$QUALIFIED_MODULE)}</a>
                                                <br/>
                                            </fieldset>
                                            <fieldset class="vtToolBox">
                                                <legend>{vtranslate('Google reCaptcha Settings',$QUALIFIED_MODULE)}</legend>
                                                <p>
                                                    <strong>{vtranslate('Google reCaptcha API Settings in Webforms',$QUALIFIED_MODULE)}
                                                        :</strong>

                                                <dl class="pvtdash">
                                                    <dd>
                                                        <small>{vtranslate('Public Key',$QUALIFIED_MODULE)}:</small>
                                                    </dd>
                                                    <dt>
                                                        <small><i>{$reCAPTCAHPUBLICKEY}</i></small>
                                                    </dt>
                                                    <dd>
                                                        <small>{vtranslate('Secret Key',$QUALIFIED_MODULE)}:</small>
                                                    </dd>
                                                    <dt>
                                                        <small><i>{$reCAPTCAHSECRETKEY}</i></small>
                                                    </dt>
                                                </dl>
                                                </p>
                                                {if $reCAPTCAHPUBLICKEY && $reCAPTCAHPUBLICKEY neq 'RECAPTCHA PUBLIC KEY FOR THIS DOMAIN' && $reCAPTCAHSECRETKEY && $reCAPTCAHSECRETKEY neq 'RECAPTCHA PRIVATE KEY FOR THIS DOMAIN'}
                                                    <button class="btn btn-success" type="button"
                                                            id="googlecapchaapi">{vtranslate('Edit Settings',$QUALIFIED_MODULE)}</button>
                                                {else}
                                                    <button class="btn btn-info" type="button"
                                                            id="googlecapchaapi">{vtranslate('Add reCAPTCAH API key',$QUALIFIED_MODULE)}</button>
                                                {/if}
                                                <a href="{$MODULE_MODEL->getreCapchaAPIUrl()}"
                                                   target="_blank">{vtranslate('More Info',$QUALIFIED_MODULE)}</a>
                                                <br/>

                                            </fieldset>
                                            <fieldset class="vtToolBox">
                                                <legend>{vtranslate('Maintenance Mode', $MODULE)}</legend>
                                                <i class="fa fa-wrench icon" style="margin: 0 5px"></i>{vtranslate('Maintenance mode is for preventing any users other than administrators from using the CRM while maintenance is taking place',$QUALIFIED_MODULE)}
                                                <ul class="list-unstyled pvtdash" style="line-height:200%">
                                                    <li data-toggle="tooltip"
                                                        title="{vtranslate('Maintenance Mode', $MODULE)}">
                                                        <input style="opacity: 0;" {if $MaintenanceMode neq 1} value='0' {else} value='1' checked{/if}
                                                               class='cursorPointer bootstrap-switch' type="checkbox"
                                                               data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                               data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                               data-on-color="primary" data-toggle="toggle"
                                                               data-type="MaintenanceMode"/>
                                                        {vtranslate('Maintenance Mode', $MODULE)}
                                                    </li>
                                                </ul>
                                                <br>
                                                <div class="maintenance_contents">
                                                    <i class="fa fa-comment-o icon" style="margin: 0 5px"></i>{vtranslate('Message', $QUALIFIED_MODULE)}:
                                                    <br>
                                                    <input type="hidden" id="maintenance_userid" value="{$CURRENT_USER_MODEL->get('id')}">
                                                    <textarea id="maintenance_message"  class="inputElement textAreaElement textarea-autosize boxSizingBorderBox" rows="3" placeholder="{vtranslate('LBL_ENTER_ANNOUNCEMENT_HERE', 'Settings:Vtiger')}" style="width:100%; min-height: 230px">{$maintenance_message}</textarea>
                                                    <div class="textAlignCenter">
                                                        <button class="btn btn-success saveMaintenanceAnnouncement hide"><strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong></button>
                                                    </div>
                                                </div>
                                                <br>
                                            </fieldset>
                                            <fieldset class="vtToolBox">
                                                <legend>{vtranslate('Login As Another User', $MODULE)}</legend>
                                                <form method="POST" action="index.php">
                                                    <em>{vtranslate('You will immediatelly logged in into the new User. You need to Relogin to get access to the Admin User.', $MODULE)}</em><br/><br/>
                                                    <input type="hidden" name="module" value="ParsVT"/>
                                                    <input type="hidden" name="action" value="Misc"/>
                                                    <input type="hidden" name="view" value="Misc"/>
                                                    <input type="hidden" name="mode" value="switchUser"/>
                                                    <select name="user" style="margin:0; width:50%;" class="select2">
                                                        {foreach from=$availableUsers item=userItem}
                                                            <option value="{$userItem.id}">{$userItem.user_name}
                                                                - {$userItem.first_name} {$userItem.last_name}</option>
                                                        {/foreach}
                                                    </select>
                                                    <input type="submit" class="btn btn-default"
                                                           value="{vtranslate('Switch User', $MODULE)}"/>
                                                </form>
                                            </fieldset>
                                            <a class="btn pull-right" href="index.php?parent=Settings&amp;module={$MODULE}&amp;view=License">{vtranslate('Manage License', $MODULE)}</a>&nbsp;
                                            <a class="btn pull-right" href="index.php?parent=Settings&amp;module={$MODULE}&amp;view=Upgrade">{vtranslate('Check for Update', $MODULE)}</a>

                                        </div>
                                        <!-- col-lg-6 -->
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="MiscConf"></div>
                <div class="tab-pane" id="MiscDatabse"></div>
                <div class="tab-pane" id="MiscSecurity"></div>
                <div class="tab-pane" id="MiscSysInfo"></div>
                <div class="tab-pane" id="MiscStability"></div>
                <div class="tab-pane" id="MiscFilesPermissions"></div>
                <div class="tab-pane" id="PublicDirStates"></div>
                <div class="tab-pane" id="SystemCleanup"></div>
                <div class="tab-pane" id="ForceScheduler"></div>
            </div>
        </div>
    </div>
</div>

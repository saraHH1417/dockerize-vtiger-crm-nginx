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
    <div class="editContainer" style="padding-left: 3%;padding-right: 3%">
        <h3>
            <strong>{vtranslate($QUALIFIED_MODULE,$QUALIFIED_MODULE)}&nbsp;{vtranslate('version',$QUALIFIED_MODULE)}&nbsp;{$VERSION}</strong> <br />{vtranslate('Install',$QUALIFIED_MODULE)}
        </h3>
        <hr>
        <div id="breadcrumb">
            <ul class="crumbs marginLeftZero">
                <li class="first step"  style="z-index:9" id="step1">
                    <a>
                        <span class="stepNum">1-</span>
                        <span class="stepText">{vtranslate('Requirements',$QUALIFIED_MODULE)}</span>
                    </a>
                </li>
                <li style="z-index:8" class="step" id="step2">
                    <a>
                        <span class="stepNum">2-</span>
                        <span class="stepText">{vtranslate('Licensing',$QUALIFIED_MODULE)}</span>
                    </a>
                </li>


        {if $TOTAL_STEPS eq "4"}

                <li style="z-index:8" class="step" id="step3">
                    <a>
                        <span class="stepNum">3-</span>
                        <span class="stepText">{vtranslate('Last Step',$QUALIFIED_MODULE)}</span>
                    </a>
                </li>
        {/if}  
                <li class="step last {if $STEP eq $TOTAL_STEPS}active{/if}" style="z-index:7" id="step{$TOTAL_STEPS}">
                    <a>
                        <span class="stepNum">{$TOTAL_STEPS}-</span>
                        <span class="stepText">{vtranslate('Complete',$QUALIFIED_MODULE)}</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
{if $STEP eq "1"}
    <div class="installationContents" style="padding-left: 3%;padding-right: 3%">
        <form name="EditWorkflow" action="index.php" method="post" id="installation_step1" class="form-horizontal">
            <input type="hidden" name="step" value="{$STEP+1}" />
            <input type="hidden" class="step" name="current_step" value="{$STEP}" />
            <input type="hidden" name="module" value="{$QUALIFIED_MODULE}" />
            <input type="hidden" name="parent" value="{$smarty.get.parent}" />
            <input type="hidden" name="view" value="{$smarty.get.view}" />


            <div class="padding1per" style="border:1px solid #ccc;padding: 1%;">
                <label>
                    <strong>{sprintf(vtranslate('Welcome to the %s Installation Wizard',$QUALIFIED_MODULE),vtranslate($QUALIFIED_MODULE,$QUALIFIED_MODULE))}</strong>
                </label>
                <div class="control-group">
                    <div>
                        <span>
                            {sprintf(vtranslate('Below you will find some more detailed notes regarding the PHP requirements for %s. Other Vtiger modules may have specific requirements and configurations needed',$QUALIFIED_MODULE),vtranslate($QUALIFIED_MODULE,$QUALIFIED_MODULE))}
                        </span>
                <br>

<table class="table table-bordered table-condensed themeTableColor confTable">
		{foreach key=ID item=ENTRIES from=$REQUIREMENTS}

   <thead>
      <tr class="blockHeader">
         <th colspan="1" class="mediumWidthType">
            <span>{vtranslate($ID,$QUALIFIED_MODULE)}</span>
         </th>
      </tr>
   </thead>
   <tbody>
	{foreach key=SUBID item=ENTRY from=$ENTRIES}
      <tr {$ENTRY['status']}>
         <td>
            <label class="marginRight5px"><strong>{vtranslate($ENTRY['title'],$QUALIFIED_MODULE)}</strong><br /><em>{vtranslate($ENTRY['description'],$QUALIFIED_MODULE)}</em></label><br />
		{foreach item=Value from=$ENTRY['values']}
                {$Value}<br />
		{/foreach}
         </td>
      </tr>
        {/foreach}
   </tbody>
                 
                
                {/foreach}
</table>

                    </div>
                </div>
            
{if $REQSTATUS}
<div class="control-group">
                    <div><span>{sprintf(vtranslate('<strong>Congratulations!</strong> Your server meets the requirements for %s module.',$QUALIFIED_MODULE),vtranslate($QUALIFIED_MODULE,$QUALIFIED_MODULE))}</span></div>
                </div>


{else}

                <div class="control-group">
                    <div><span>{vtranslate('Having trouble installing?',$QUALIFIED_MODULE)} {vtranslate('Please Contact Us!',$QUALIFIED_MODULE)}</span></div>
                </div>
                <div class="control-group">
                    <ul style="padding: 0 20px;">
                        <li>&nbsp;&nbsp;<a href="http://forum.vtfarsi.ir/">{vtranslate('Ask the Community',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/crm-wiki/">{vtranslate('Read our Docs',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/vtiger-crm-book/">{vtranslate('Read our Book',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://my.vtfarsi.ir/submitticket.php">{vtranslate('Open Ticket',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="tel:09388019100">{vtranslate('Phone Support',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/">{vtranslate('Live Support',$QUALIFIED_MODULE)}</a></li>
                    </ul>
                </div>
{/if}
                <div class="control-group" style="text-align: center;">
                    {if $REQSTATUS}<button class="btn btn-success" id="step2" type="submit"><strong>{vtranslate('Next Step', $QUALIFIED_MODULE)}</strong></button>&nbsp;&nbsp;{else}
                    <button class="btn btn-danger" id="recheck" type="button"><strong>{vtranslate('Recheck', $QUALIFIED_MODULE)}</strong></button>&nbsp;&nbsp;
{/if}
                    <button class="btn btn-info" name="btnOrder" type="button" onclick="window.open('{$orderlink}')"><strong>{vtranslate('Order Now', $QUALIFIED_MODULE)}</strong></button>&nbsp;&nbsp;
                    <button class="btn btn-inverse" name="btnShop" type="button" onclick="window.open('{$storelink}')"><strong>{vtranslate('More Modules', $QUALIFIED_MODULE)}</strong></button>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </form>
</div>
{elseif $STEP eq "2"}
    <div class="installationContents" style="padding-left: 3%;padding-right: 3%">
            <input type="hidden" class="step" value="2" />
            <input type="hidden" class="module" value="{$QUALIFIED_MODULE}" />


            <div class="padding1per" style="border:1px solid #ccc;padding: 1%;">
                <label>
                    <strong>{sprintf(vtranslate('Welcome to the %s Installation Wizard',$QUALIFIED_MODULE),vtranslate($QUALIFIED_MODULE,$QUALIFIED_MODULE))}</strong>
                </label>
                <br>
                {if $INTERNET}
                <div id="licensecheck">
                <div class="control-group">
                    <div>
                        <span>
                            {vtranslate('You are required to validate the extension before it can be used. Please enter the license key provided.',$QUALIFIED_MODULE)}
                        </span>
                    </div>
                </div>
         <table class="table table-bordered table-condensed themeTableColor">
            <thead>
               <tr class="blockHeader">
                  <th class="mediumWidthType">
                     <span class="alignMiddle">{vtranslate('Your Company Information', $QUALIFIED_MODULE)}</span>
                  </th>
                  <th class="mediumWidthType" style="border-left: none; text-align: right;">
                     <button type="button" id="company_button" class="btn btn-info" onclick="window.location.href='index.php?module=Vtiger&parent=Settings&view=CompanyDetails&block=3&fieldid=14'"/>{vtranslate('Change Company Information',$QUALIFIED_MODULE)}</button>
                  </th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('organizationname', 'Settings:Vtiger')}:</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" id="organizationname_label">{$COMPANY_DETAILS->get("organizationname")}</div>
                  </td>
               </tr>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('address', 'Settings:Vtiger')}:</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" id="address_label">{$COMPANY_DETAILS->get("address")}</div>
                  </td>
               </tr>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('city', 'Settings:Vtiger')}:</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" id="city_label">{$COMPANY_DETAILS->get("city")}</div>
                  </td>
               </tr>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('state', 'Settings:Vtiger')}:</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" id="state_label">{$COMPANY_DETAILS->get("state")}</div>
                  </td>
               </tr>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('country', 'Settings:Vtiger')}:</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" id="country_label">{$COMPANY_DETAILS->get("country")}</div>
                  </td>
               </tr>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('code', 'Settings:Vtiger')}:</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" id="code_label">{$COMPANY_DETAILS->get("code")}</div>
                  </td>
               </tr>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('vatid', 'Settings:Vtiger')}:</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" id="vatid_label">{$COMPANY_DETAILS->get("vatid")}</div>
                  </td>
               </tr>
            </tbody>
         </table>
         <br>
         <table class="table table-bordered table-condensed themeTableColor">
            <thead>
               <tr class="blockHeader">
                  <th class="mediumWidthType" colspan="2">
                     <span class="alignMiddle">{vtranslate('Your CRM Information', $QUALIFIED_MODULE)}</span>
                  </th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('CRM URL:',$QUALIFIED_MODULE)}</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" style="{if $LANGUAGE eq 'fa_ir'}text-align:right;{/if} direction:ltr;">{$SITE_URL}</div>
                  </td>
               </tr>
               <tr>
                  <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('CRM Key:', $QUALIFIED_MODULE)}</label></td>
                  <td style="border-left: none;">
                     <div class="pull-left" id="address_label">{$APP_KEY}</div>
                  </td>
               </tr>
            </tbody>
         </table>
         <br>
                <div class="control-group" style="margin-bottom:10px;">
                    <div class="control-label"><strong>{vtranslate('License Key:',$QUALIFIED_MODULE)}</strong></div>
                    <div class="controls"><input type="text" id="license_key" name="license_key" value="{$LICENSEKEY}" data-validation-engine="validate[required]" class="span4" style="width:300px" name="summary"></div>
                </div>
                </div>
                    <div id="licenseinfo">
                    </div>
                {else}

                <div class="control-group">
                    <div>
                        <span>
                            {vtranslate('Unable to connect to the internet. This may be a temporary network issue. Check your network and try again. If the problem persists, contact network administrator',$QUALIFIED_MODULE)}
                        </span>
                    </div>
                </div>
                {/if}
                <div class="control-group need-help">
                    <div><span>{vtranslate('Having trouble installing?',$QUALIFIED_MODULE)} {vtranslate('Please Contact Us!',$QUALIFIED_MODULE)}</span></div>
                </div>
                <div class="control-group need-help">
                    <ul style="padding: 0 20px;">
                        <li>&nbsp;&nbsp;<a href="http://forum.vtfarsi.ir/">{vtranslate('Ask the Community',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/crm-wiki/">{vtranslate('Read our Docs',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/vtiger-crm-book/">{vtranslate('Read our Book',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://my.vtfarsi.ir/submitticket.php">{vtranslate('Open Ticket',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="tel:09388019100">{vtranslate('Phone Support',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/">{vtranslate('Live Support',$QUALIFIED_MODULE)}</a></li>
                    </ul>
                </div>


                <div class="control-group" style="text-align: center;">
                    {if $INTERNET}
                    <span id="Activatebtn"><button class="btn btn-success" name="btnActivate" type="button"><strong>{vtranslate('Activate', $QUALIFIED_MODULE)}</strong></button>&nbsp;&nbsp;</span>
                    {else}
                     <button class="btn btn-danger" id="recheck" type="button"><strong>{vtranslate('Recheck', $QUALIFIED_MODULE)}</strong></button>&nbsp;&nbsp;
                    {/if}
                    <button class="btn btn-info" name="btnOrder" id="btnOrder" type="button" onclick="window.open('{$orderlink}')"><strong>{vtranslate('Order Now', $QUALIFIED_MODULE)}</strong></button>&nbsp;&nbsp;
                    <button class="btn btn-inverse" name="btnShop" id="btnShop" type="button" onclick="window.open('{$storelink}')"><strong>{vtranslate('More Modules', $QUALIFIED_MODULE)}</strong></button>
                </div>

            </div>
        </div>
        <div class="clearfix"></div>
</div>

{elseif $TOTAL_STEPS eq "4" && $STEP eq "3"}
<div class="installationContents" style="padding-left: 3%;padding-right: 3%">
 <input type="hidden" class="step" value="{$STEP}" />
{include file='Step3.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
  
</div>
{elseif $STEP eq "$TOTAL_STEPS"}

    <div class="installationContents" style="padding-left: 3%;padding-right: 3%">
        <form name="EditWorkflow" action="index.php" method="post" id="installation_step{$TOTAL_STEPS}" class="form-horizontal">
            <input type="hidden" class="step" value="{$TOTAL_STEPS}" />
            {if $FINISH}<input type="hidden" class="redirect" value="{$FINISHLINK}" />{/if}

            <div class="padding1per" style="border:1px solid #ccc;padding: 1%;">
                <label>
                    <strong>{vtranslate('The Installation Completed Successfully!',$QUALIFIED_MODULE)}</strong>
                </label>
                <br>
                <div class="control-group">
                    <div>
                        <span>
                            {sprintf(vtranslate('The %s module has been installed & activated successfully!',$QUALIFIED_MODULE),vtranslate($QUALIFIED_MODULE, $QUALIFIED_MODULE))}
                        </span>
                    </div>
                </div>
                <div class="control-group">
                    <div>
                        <span>
                            {vtranslate('For more vTiger Extensions, please visit our website',$QUALIFIED_MODULE)} - <a style="color: #0088cc; text-decoration:none;" href="http://www.vtfarsi.ir/shop/" target="_blank">www.VTFarsi.ir</a>
                        </span>
                    </div>
                </div>

                <div class="control-group">
                    <div><span>{vtranslate('If you have any questions or run into any issues - feel free to contact us.',$QUALIFIED_MODULE)}</span></div>
                </div>
                <div class="control-group">
                    <ul style="padding: 0 20px;">
                        <li>&nbsp;&nbsp;<a href="http://forum.vtfarsi.ir/">{vtranslate('Ask the Community',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/crm-wiki/">{vtranslate('Read our Docs',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/vtiger-crm-book/">{vtranslate('Read our Book',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://my.vtfarsi.ir/submitticket.php">{vtranslate('Open Ticket',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="tel:09388019100">{vtranslate('Phone Support',$QUALIFIED_MODULE)}</a></li>
                        <li>&nbsp;&nbsp;<a href="http://vtfarsi.ir/">{vtranslate('Live Support',$QUALIFIED_MODULE)}</a></li>
                    </ul>
                </div>

                <div class="control-group" style="text-align: center;">
                    {if $FINISH}
                    <button class="btn btn-success" name="btnFinish" type="button"><strong>{vtranslate('Finish', $QUALIFIED_MODULE)}</strong></button>
                    {else}
                    <button class="btn btn-success" name="btnFinish" type="button" onclick="window.open('index.php?module={$QUALIFIED_MODULE}&parent=Settings&view=License&mode=manageLicense')"><strong>{vtranslate('Manage License', $QUALIFIED_MODULE)}</strong></button>
                    {/if}
                </div>
            </div>
    </div>
    <div class="clearfix"></div>
    </form>
    </div>
{/if}


{/strip}
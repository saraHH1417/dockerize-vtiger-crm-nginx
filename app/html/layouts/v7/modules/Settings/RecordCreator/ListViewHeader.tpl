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
<div class="listViewPageDiv">
	<div class="col-sm-12 col-xs-12">
        <div class="row-fluid">
            <div class="span6">
                <h3>{vtranslate($MODULE, $QUALIFIED_MODULE)}</h3>
            </div>
            	<div class="contentHeader row-fluid">
            		<div class="alert alert-info">
						{vtranslate('Record creator help you to auto populate data from one module to another module', $QUALIFIED_MODULE)}<br />
						{vtranslate('Please setup field mapping from source module to destination module', $QUALIFIED_MODULE)}<br /><br />
						{vtranslate('The new link is displayed in details view of one of the main module records and you must click on “More” button to create record in target module.', $QUALIFIED_MODULE)}<br />
						{vtranslate('For example :<br />If user is on Ticket module and wants to create Invoice from Ticket than this module helps to create record from primary module(Ticket) to Secondary module(Invoice)', $QUALIFIED_MODULE)}<br />

					</div>
				</div>
        </div>
        <hr>
		<div class="row">
			<div class="col-md-3">
				<button class="btn addButton" {if stripos($MODULE_MODEL->getCreateViewUrl(), 'javascript:')===0} onclick="{$MODULE_MODEL->getCreateViewUrl()|substr:strlen('javascript:')};"
                        {else} onclick='window.location.href="{$MODULE_MODEL->getCreateViewUrl()}"' {/if}>
					<i class="icon-plus"></i>&nbsp;
					<strong>{vtranslate('LBL_ADD_RECORD', $QUALIFIED_MODULE)}</strong>
				</button>
			</div>
{/strip}

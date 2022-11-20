{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<div style='padding:5px'>
{if $RSSDATA && count($MODELS) > 0}
	<div>
		<div class='row'>
			<div class='col-lg-12' style='direction: rtl; text-align: right;'>
	                 	{foreach from=$MODELS key=k item=MODEL }
				<a href="{$MODELS[$k]['link']}" target="_blank">{$MODELS[$k]['title']}</a><hr>
	                  	{/foreach}
			</div>
		</div>
	</div>
        <div class='row'>
            <div class='col-lg-12' style='direction: rtl; text-align: left;'>
                <b><a href="{$ReadMore}" target="_blank">{vtranslate('More Info', $MODULE_NAME)}</a></b>
            </div>
        </div>
{else}
	<span class="noDataMsg">
		{vtranslate('No record found', $MODULE_NAME)}</span>
{/if}
</div>
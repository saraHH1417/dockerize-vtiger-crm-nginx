{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<!doctype html>
<title>{$PAGETITLE}!</title>
<link type="text/css" href="{$SITEURL}layouts/v7/lib/todc/css/bootstrap.min.css" rel="stylesheet">  <!--BOOTSTRAP 3 CSS FILE-->
{if $LANGUAGE eq 'fa_ir'}
<link type='text/css' rel='stylesheet' href='modules/ParsVT/resources/styles/fonts/fonts.php?font=IRANSans'>
{/if}
<style>
	body { text-align: center; padding: 150px; background-color: #FBFBFB; {if $LANGUAGE eq 'fa_ir'}direction:rtl;{/if} }
	h1 { font-size: 50px; }
	body { font: 20px 'VtigerFont', Tahoma, Helvetica, sans-serif; color: #333; }
	article { display: block; text-align: center; width: 680px; margin: 0 auto; }
	p { text-align: {if $LANGUAGE eq 'fa_ir'}right{else}left{/if}; }
</style>

<article>
	<div class="logo span6"><img src="{$COMPANY_LOGO->get('imagepath')}" title="{$COMPANY_LOGO->get('title')}" alt="{$COMPANY_LOGO->get('alt')}" width="160px;"/></div>
	<h1>{vtranslate('Maintenance Mode', $MODULE)}</h1>
	<div>
		<p>
			{vtranslate('CRM is currently down for maintenance', $MODULE)}
			<br />
			{$MAINTENANCEMESSAGE}
		</p>
		<p>{$MAINTENANCEUSERID}</p>
	</div>
</article>
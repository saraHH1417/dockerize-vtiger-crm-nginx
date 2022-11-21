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
	<div class="contents">
	<div class="row" style="margin-top:20px">
<div class="col-sm-9 col-xs-9"><input id="searchExtension" class="extensionSearch form-control" placeholder="{vtranslate("Search Module...",$QUALIFIED_MODULE)}" style="width:25%" type="text"></div>
<div class="col-sm-3 col-xs-3">
<div class="pull-right">

									<a href="http://vtfarsi.ir/%d9%85%d8%a7%da%98%d9%88%d9%84-%d9%88%db%8c%d8%aa%d8%a7%db%8c%da%af%d8%b1/" class="btn btn-success btn-sm" target=”_blank”>
										{vtranslate("View Marketplace",$QUALIFIED_MODULE)}
									</a>
									
								</div>
</div>

</div>
	<div id="pvt-marketplace" class="row" style="margin-top:20px">
    {assign var="COUNTER" value="0"}
    {if $LATESTPRODUCTS}
	{foreach item=PRODUCT_VIEW_BOX from=$LATESTPRODUCTS}
                {$COUNTER=$COUNTER+1}
		<div class="col-lg-4 col-md-6 col-sm-6 pvt-marketplace" style="margin-bottom:30px;" data-id="{$COUNTER}">
			<div class="extension_container extensionWidgetContainer">
				<div class="extension_header">
					<div class="font-x-x-large boxSizingBorderBox" style="height: 25px;overflow: hidden;">{$PRODUCT_VIEW_BOX['title']}</div>
				</div>
				<div style="padding-left:3px;">
					<div class="row extension_contents" style="border:none;" data-toggle="tooltip" title="{$PRODUCT_VIEW_BOX['summary']}">
						<div class="col-sm-8 col-xs-8">
							<div style="position: relative;  overflow: hidden; width: 100%; height: 120px;text-align: justify;padding: 20px;">
								<div class="row">{ParsVT_Module_Model::textlength_check($PRODUCT_VIEW_BOX['summary'])}
								</div>
							</div>
						</div>
						<div class="col-sm-4 col-xs-4"><a href="{$PRODUCT_VIEW_BOX['url']}" target="_blank" target=”_blank”><img src="layouts/{vglobal('default_layout')}/modules/ParsVT/images/loading.gif" class="b-lazy" data-src="{$PRODUCT_VIEW_BOX['image']}" width="100%" height="100%"></a></div></div>
					</div>
					<div class="extensionInfo">
						<div class="row">
							<div class="col-sm-12 col-xs-12">
								<div class="pull-right">
									<a href="{$PRODUCT_VIEW_BOX['url']}" class="btn btn-info btn-sm" target=”_blank”>
										{vtranslate("Read more",$QUALIFIED_MODULE)}
									</a>
									
											
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

	{/foreach}
			</div>
	{else}

	<div id="pvt-marketplace" class="col-lg-12 col-md-12 col-sm-12" style="margin-top:20px">
		<div class="alert alert-danger">{vtranslate("Unable to connect to the internet. This may be a temporary network issue. Check your network and try again. If the problem persists, contact network administrator",$QUALIFIED_MODULE)}</div>
	</div>

	{/if}
	
	</div>
	</div>
</div>
{literal}<script> function split( val ) {
return val.split( /,\s*/ );
}
	function extractLast( term ) {
		return split( term ).pop();
	}
$(document).ready(function(e) {
	$('#searchExtension').on('keyup',function(){
		var txt = $(this).val();
		if(txt.length >= 2){
			$( "div.pvt-marketplace").hide();
			$( "div.pvt-marketplace" ).each(function( index ) {
				var txtnow = $(this).html();
				if (txtnow.toLowerCase().indexOf(txt.toLowerCase()) >= 0){
					var dataid = $(this).attr('data-id');
					$(this).show();
				}
			});
		}
		else if(txt.length < 2){
			$( "div.pvt-marketplace" ).show();
		}
	})
waitForElement();
});
function waitForElement(){
    if(typeof vtUtils !== "undefined")
        vtUtils.enableTooltips();
    else
        setTimeout(waitForElement, 250);
}
	</script>{/literal}
{*<!--
/*+***********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************/
-->*}

{strip}
    <div class="col-sm-12 col-xs-12 module-action-bar clearfix coloredBorderTop">
		<div class="module-action-content clearfix">
			<div class="col-lg-4 col-md-4">
				<h4 title="{strtoupper(vtranslate($MODULE, $MODULE))}" class="module-title pull-left text-uppercase"> {strtoupper(vtranslate($MODULE, $MODULE))} </h4>
			</div>
			<div class="col-lg-8 col-md-8">
				<div class="navbar-right">
					<ul class="nav navbar-nav">
						<li><button class="btn module-buttons btn-success" type="button" onclick="location.href='http://vtfarsi.ir/%d9%85%d8%a7%da%98%d9%88%d9%84-%d9%88%db%8c%d8%aa%d8%a7%db%8c%da%af%d8%b1/';"  target=”_blank” style="background-image: linear-gradient(to bottom,#35aa47 0,#35aa47 100%);color: #fff;"><div class="fa fa-certificate" aria-hidden="true"></div>&nbsp;&nbsp;{vtranslate("View Persian Marketplace","ParsVT")}</button>
							{if !($PASSWORD_STATUS)}
								<button class="btn btn-default module-buttons" type="button" id="logintoMarketPlace">
									<div class="fa fa-sign-in" aria-hidden="true"></div>
									&nbsp;&nbsp;Login to marketplace
								</button>
							{else}
								<button class="btn btn-default module-buttons" type="button" id="{if !empty($CUSTOMER_PROFILE['CustomerCardId'])}updateCardDetails{else}setUpCardDetails{/if}">
									<div class="fa fa-credit-card" aria-hidden="true"></div>&nbsp;&nbsp;
									{if !empty($CUSTOMER_PROFILE['CustomerCardId'])}
										{vtranslate('LBL_UPDATE_CARD_DETAILS', $QUALIFIED_MODULE)}
									{else}
										{vtranslate('LBL_SETUP_CARD_DETAILS', $QUALIFIED_MODULE)}
									{/if}
								</button>
							{/if}
						</li>
					</ul>
				</div>
			</div>
		</div>
    </div>
{/strip}
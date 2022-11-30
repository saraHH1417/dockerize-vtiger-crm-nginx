{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}

<footer class="app-footer">
	<p>
		{**PVTPATCHER-BF11CE5F46990149590ED39B6CE65144-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Powered by vtiger CRM','ParsVT')}
{** REPLACED-BF11CE5F46990149590ED39B6CE65144// Powered by vtiger CRM**}
{**PVTPATCHER-BF11CE5F46990149590ED39B6CE65144-FINISH**} - {$VTIGER_VERSION}&nbsp;&nbsp;© 2004 - {date('Y')}&nbsp;&nbsp;
		{**PVTPATCHER-67C9592C8E1991BD00DD10F98955C1BE-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<a href="//www.vtiger.com" target="_blank">{vtranslate('Vtiger','ParsVT')}</a>&nbsp;&nbsp;|&nbsp;
		<a href="//www.vtiger.ir" target="_blank">{vtranslate('VTFarsi','ParsVT')}</a>&nbsp;&nbsp;|&nbsp;
{** REPLACED-67C9592C8E1991BD00DD10F98955C1BE// <a href="//www.vtiger.com" target="_blank">Vtiger</a>&nbsp;|&nbsp;**}
{**PVTPATCHER-67C9592C8E1991BD00DD10F98955C1BE-FINISH**}
		<a href="https://www.vtiger.com/privacy-policy" target="_blank">{**PVTPATCHER-DDDDC614D67F7EEF554B4EE2EF550E1B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{vtranslate('Privacy Policy','ParsVT')}
{** REPLACED-DDDDC614D67F7EEF554B4EE2EF550E1B// Privacy Policy**}
{**PVTPATCHER-DDDDC614D67F7EEF554B4EE2EF550E1B-FINISH**}</a>
	</p>
</footer>
</div>
<div id='overlayPage'>
	<!-- arrow is added to point arrow to the clicked element (Ex:- TaskManagement), 
	any one can use this by adding "show" class to it -->
	<div class='arrow'></div>
	<div class='data'>
	</div>
</div>
<div id='helpPageOverlay'></div>
<div id="js_strings" class="hide noprint">{Zend_Json::encode($LANGUAGE_STRINGS)}</div>
<div class="modal myModal fade"></div>
{include file='JSResources.tpl'|@vtemplate_path}
</body>

</html>
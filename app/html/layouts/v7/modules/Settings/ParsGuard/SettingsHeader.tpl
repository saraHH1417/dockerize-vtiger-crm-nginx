{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<script type="text/javascript">
    $(function () {
        $("#Pars{$smarty.get.view}").addClass("active");
    });
</script>


<div class="" style="margin-top:0px;">
    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
        <li id="ParsList"><a
                    href="index.php?parent=Settings&module=ParsGuard&view=List">{vtranslate('Attack List', $MODULE)}</a>
        </li>
        <li id="ParsBanList"><a
                    href="index.php?parent=Settings&module=ParsGuard&view=BanList">{vtranslate('Ban List', $MODULE)}</a>
        </li>
        <li id="ParsSettings"><a
                    href="index.php?parent=Settings&module=ParsGuard&view=Settings">{vtranslate('Settings', $MODULE)}</a>
        </li>
        <li id="ParsMoreInfo"><a
                    href="modules/ParsGuard/Guard/test.php" onclick="javascript:void window.open('modules/ParsGuard/Guard/test.php','1443735628900','width=1024,height=650,toolbar=0,menubar=0,location=0,status=0,scrollbars=1,resizable=1,left=0,top=0');return false;">{vtranslate('More info', $MODULE)}</a>
        </li>
    </ul>
</div>
<br />

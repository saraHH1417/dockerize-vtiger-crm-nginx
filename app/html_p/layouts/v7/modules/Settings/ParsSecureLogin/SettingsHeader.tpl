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
                    href="index.php?parent=Settings&module=ParsSecureLogin&view=List">{vtranslate('Login Failed List', $QUALIFIED_MODULE)}</a>
        </li>
        <li id="ParsBanList"><a
                    href="index.php?parent=Settings&module=ParsSecureLogin&view=BanList">{vtranslate('Blocked IP', $QUALIFIED_MODULE)}</a>
        </li>
        <li id="ParsShow"><a
                    href="index.php?parent=Settings&module=ParsSecureLogin&view=Show">{vtranslate('Settings', $QUALIFIED_MODULE)}</a>
        </li>
    </ul>
</div>
<br />

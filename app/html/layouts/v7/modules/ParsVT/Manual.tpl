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
<style>
    #helpparent {
        width: 100%;
        height: 700px;
        border: 0px;
    }
    #helpparent > button {
        opacity: 0.3;
        position: relative;
        float: right;
        right: 10px;
        bottom: 705px;
        transition: 0.5s;
    }
    #helpparent > button {
        opacity: 1;
    }

</style>
<div class="container-fluid">
    <div class="contents">
        <table id="InstallModule" class="table table-bordered table-condensed themeTableColor">
            <tbody>
            <tr>
                <td width="100%" class="medium" style="border:0px;padding: 0;">
                    {if $ISEXISTS}
                        <div id="helpparent">
                            <iframe src="modules/ParsVT/lib/Help/index.html" width="100%" height="700px"
                                    frameBorder="0">{vtranslate('Your browser does not support iframes.',$MODULE)}
                            </iframe>
                            {if $SHOWUPGRADEBTN}
                            <button class="btn btn-warning runtime">{vtranslate('Update Manual',$MODULE)}<br/>{vtranslate('Current Version: %s <br /> Available Version: %s',$MODULE,$CVERSION,$LVERSION)}</button>
                            {/if}

                        </div>
                    {else}
                    <div style="height: 700px;" class="row-fluid text-center">
                        <br/>
                        {vtranslate('Module Manual has not been installed yet, Click on the button to install',$MODULE,$LVERSION)}
                        <br/>
                        {if $LVERSION}
                        {vtranslate('Available Version: %s',$MODULE,$LVERSION)}
                        {/if}
                        <br/>
                        <button class="btn btn-success runtime">{vtranslate('Install Manual',$MODULE)}</button>
                    </div>
                    {/if}
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
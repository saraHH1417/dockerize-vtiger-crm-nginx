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

<div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="ParsVTExtraXLS">
    <div>
        <div>
            <div class="container-fluid">
                <div class="contents">
                    <br>
                </div>
                <div class="container-fluid">
                    <div class="related-tabs">
                        <div class="row form-group">
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>{vtranslate('Configure Export to Excel Settings',$QUALIFIED_MODULE)}</legend>
                                    <ul class="list-unstyled pvtdash" style="line-height:200%">
                                        {foreach from=$ACTIVETABS key=modulename item=module}
                                            <li>
                                                <input style="opacity: 0;" {if $module['enabled']} value='1'  checked{else} value='0'{/if}
                                                       class='cursorPointer bootstrap-switch' type="checkbox"
                                                       data-on-text="{vtranslate('Active', $QUALIFIED_MODULE)}"
                                                       data-off-text="{vtranslate('Inactive', $QUALIFIED_MODULE)}"
                                                       data-on-color="primary" data-toggle="toggle" data-type="{$modulename}" data-tabid="{$module['tabid']}" />
                                                <span  data-toggle="tooltip" title="{vtranslate($modulename,$modulename)}">{vtranslate($modulename,$modulename)}</span></li>
                                        {/foreach}

                                    </ul>
                                </fieldset>
                            </div>
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate("Export to Excel Features", $QUALIFIED_MODULE)}
                                    </legend>
                                    <p>
                                        {vtranslate('LBL_EXPORT_TO_EXCEL_DESC',$QUALIFIED_MODULE)}<br/>
                                    </p>
                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>




{strip}

{literal}
<script>
$(".modulebuttons").click(function(e){
//activates or deactivates our link from a module
//we do an ajax call to our service and flip a module link
    tabid=$(this).attr('id');
    operation=$(this).find('.btnon').hasClass('active') ? 'disable':'enable';
    var params = {
            'module' : app.getModuleName(),
            'parent' : app.getParentModuleName(),
            'action' : 'LSWYSIWYGSaveAjax',
            'tabid' : tabid,
            'operation':operation
    }
    AppConnector.request(params).then(
            function(data) {                    
                    //something happened, should check the data and set the toggle accordingly
                    if(data.result.enabled){
                        $('#'+data.result.tabid + ' .btnon').addClass('active btn-primary');
                        $('#'+data.result.tabid + ' .btnoff').removeClass('active btn-primary');
                        Vtiger_Helper_Js.showMessage({text:app.vtranslate('JS_WYSIWYG_ACTIVATED'),type:'info'})
                    }else{
                        $('#'+data.result.tabid + ' .btnoff').addClass('active btn-primary');
                        $('#'+data.result.tabid + ' .btnon').removeClass('active btn-primary');
                        Vtiger_Helper_Js.showMessage({text:app.vtranslate('JS_WYSIWYG_DEACTIVATED'),type:'info'})
                    }
            },
            function(error,err){
                    //the call failed, don't update the toggle, maybe do a message box
                        Vtiger_Helper_Js.showMessage({text:app.vtranslate('CHANGE_FAILED'),type:'error'})
            }
    );
    e.preventDefault();
  });
</script>
{/literal}
{/strip}

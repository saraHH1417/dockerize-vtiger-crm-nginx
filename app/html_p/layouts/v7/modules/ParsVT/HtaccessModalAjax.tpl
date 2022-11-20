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
<style>
	#htaccess{
         width:100% !important; 
         text-align:left !important; 
         direction:ltr !important;
	}
	.CodeMirror *{
         direction:ltr !important;
         text-align:left !important; 
        }
</style>
<script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/htaccess/codemirror.js"></script>
<script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/htaccess/nginx.js"></script>
<script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/htaccess/jquery.base64.js"></script>
<link type='text/css' rel='stylesheet' href='layouts/{vglobal('default_layout')}/modules/ParsVT/resources/htaccess/codemirror.css?_={uniqid()}'>
<link type='text/css' rel='stylesheet' href='layouts/{vglobal('default_layout')}/modules/ParsVT/resources/htaccess/isotope.css?_={uniqid()}'>

    <div id="googleapiModalContainer" class="modal-dialog" style="min-width: 800px">
        {if $HTACCESS}
            {assign var=HEADER_TITLE value={vtranslate('Edit Htaccess Settings', $QUALIFIED_MODULE)}}
        {else}
            {assign var=HEADER_TITLE value={vtranslate('Add New Htaccess Settings', $QUALIFIED_MODULE)}}
        {/if}
        {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
        <div class="modal-content">
            <div class="form-horizontal">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="controls col-xs-12" style="margin: 0 auto">
                            <p>{vtranslate('.htaccess Editor enables you to customize certain CRM settings', $QUALIFIED_MODULE)}</p><br />
                            <p class="alert alert-danger blink_me">{vtranslate("A wrong rule in htaccess file can deny user's access to CRM and change system require features.", $QUALIFIED_MODULE)}</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="controls col-xs-12" style="margin: 0 auto">
								<textarea id="finalhtaccess" name="finalhtaccess" style="display:none;"></textarea>
								<textarea id="htaccess" name="htaccess">{$HTACCESSCONTENT}</textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="row-fluid">
                    <div class="pull-right">
					<button class="btn btn-info" id="OrginalHtaccess" title="{vtranslate('Default value (recomended)', $QUALIFIED_MODULE)}"><strong>{vtranslate('Default value (recomended)', $QUALIFIED_MODULE)}</strong></button>
					<button class="btn btn-success" id="SaveHtaccess" title="{vtranslate('Save', $QUALIFIED_MODULE)}"><strong>{vtranslate('Save', $QUALIFIED_MODULE)}</strong></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/strip}

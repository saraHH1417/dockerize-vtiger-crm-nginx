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
   <div class="editViewPageDiv col-sm-12 col-xs-12">
   <div class="span6">
                <h4>{vtranslate($MODULE, $QUALIFIED_MODULE)}</h4>
            </div>
   	<div id="breadcrumb">
		<ul class="crumbs marginLeftZero">
			<li class="first step active" style="width:19%" id="steplabel1">
				<a id="step1_header">
					<span class="stepNum">1</span>
					<span class="stepText">{vtranslate('LBL_STEP1', $QUALIFIED_MODULE)}</span>
				</a>
			</li>
			
			<li style="width: 21%" class="step" id="steplabel2">
				<a id="step2_header">
					<span class="stepNum">2</span>
					<span class="stepText">{vtranslate('LBL_STEP2', $QUALIFIED_MODULE)}</span>
				</a>
			</li>
		</ul>
	</div>
      <div class="col-sm-12 col-xs-12" id="EditView">
         <form name="EditRecordCreator" action="index.php" method="post"  class="form-horizontal">
            <input type="hidden" name="record" value="{$RECORDID}" id="record" />
            <input type="hidden" name="module" value="RecordCreator" />
            <input type="hidden" name="action" value="SaveRecordCreator" />
            <input type="hidden" name="parent" value="Settings" />
            <input type="hidden" name="returnsourcemodule" value="{$RETURN_SOURCE_MODULE}" />
            <input type="hidden" name="returnpage" value="{$RETURN_PAGE}" />
            <input type="hidden" name="returnsearch_value" value="{$RETURN_SEARCH_VALUE}" />
            <div class="editViewHeader">
            </div>
            <div id="step1">
	            <hr style="margin-top: 0px !important;">
	            <div class="editViewBody">
	                <div class="form-group">
	                    <div class="col-sm-3 control-label">
	                    	{vtranslate('LBL_PRIMARY_MODULE', $QUALIFIED_MODULE)}
	                    </div>
	                    <div class="col-sm-5 controls">
	                        {if $MODE eq 'edit'}
	                            <div class="">
	                    	       <input type='text' disabled='disabled' class="form-control inputElement" value="{vtranslate($PRIMARY_MODULE)}" >
	                                <input type='hidden' id="priamry_module_name" name='priamry_module_name' value="{$PRIMARY_MODULE}" >
	                            </div>
	                        {else}
	                            <select class="select2 col-sm-12 pull-left" id="priamry_module_name" name="priamry_module_name" required="true" data-placeholder="Select Module..." style="text-align: left">
	                            	<option value="" >{vtranslate('Select an option', $QUALIFIED_MODULE)}</option>
	                                {foreach from=$ALL_MODULES key=TABID item=MODULE_MODEL}
	                                     {assign var=TARGET_MODULE_NAME value=$MODULE_MODEL->getName()}
	                                     {assign var=SINGLE_MODULE value="SINGLE_$TARGET_MODULE_NAME"}
	                                     <option value="{$MODULE_MODEL->getName()}" {if $SELECTED_MODULE == $MODULE_MODEL->getName()}  {/if}
	                                        data-create-label="{vtranslate($SINGLE_MODULE, $TARGET_MODULE_NAME)} {vtranslate('LBL_CREATION', $QUALIFIED_MODULE)}"
	                                         data-update-label="{vtranslate($SINGLE_MODULE, $TARGET_MODULE_NAME)} {vtranslate('LBL_UPDATED', $QUALIFIED_MODULE)}"
	                                         >
	                                        {if $MODULE_MODEL->getName() eq 'Calendar'}
	                                            {vtranslate('LBL_TASK', $MODULE_MODEL->getName())}
	                                        {else}
	                                            {vtranslate($MODULE_MODEL->getName(), $MODULE_MODEL->getName())}
	                                        {/if}
	                                    </option>
	                                {/foreach}
	                            </select>
	                        {/if}
	                    </div>
	                </div>
		            <div class="form-group">
	                      <div class="col-sm-3 control-label">
	                    	{vtranslate('LBL_TARGET_MODULE', $QUALIFIED_MODULE)}
	                    </div>
	                    <div class="col-sm-5 controls">
	                        {if $MODE eq 'edit'}
	                            <div class="">
	                    	        <input type='text' disabled='disabled' class="form-control inputElement" value="{vtranslate($TARGET_MODULe)}" >
	                                <input type='hidden' id="target_module_name" name='target_module_name' value="{$MODULE_MODEL->get('name')}" >
	                            </div>
	                        {else}
	                            <select class="select2 col-sm-12 pull-left" id="target_module_name" name="target_module_name" required="true" data-placeholder="Select Module..." style="text-align: left">
	                            	<option value="" >{vtranslate('Select an option', $QUALIFIED_MODULE)}</option>
	                                {foreach from=$ALL_MODULES key=TABID item=MODULE_MODEL}
	                                     {assign var=TARGET_MODULE_NAME value=$MODULE_MODEL->getName()}
	                                     {assign var=SINGLE_MODULE value="SINGLE_$TARGET_MODULE_NAME"}
	                                     <option value="{$MODULE_MODEL->getName()}" {if $SELECTED_MODULE == $MODULE_MODEL->getName()}  {/if}
	                                        data-create-label="{vtranslate($SINGLE_MODULE, $TARGET_MODULE_NAME)} {vtranslate('LBL_CREATION', $QUALIFIED_MODULE)}"
	                                         data-update-label="{vtranslate($SINGLE_MODULE, $TARGET_MODULE_NAME)} {vtranslate('LBL_UPDATED', $QUALIFIED_MODULE)}"
	                                         >
	                                        {if $MODULE_MODEL->getName() eq 'Calendar'}
	                                            {vtranslate('LBL_TASK', $MODULE_MODEL->getName())}
	                                        {else}
	                                            {vtranslate($MODULE_MODEL->getName(), $MODULE_MODEL->getName())}
	                                        {/if}
	                                    </option>
	                                {/foreach}
	                            </select>
	                        {/if}
	                    </div>
	                </div>
	               
                  	<div class="form-group">
	                    <div class="col-sm-3 control-label" >
	                        {vtranslate('LBL_TARGET_VIEW', $QUALIFIED_MODULE)}
	                    </div>
	                    <div class="col-sm-5 controls">
	                        <select class="inputElement select2 {if $OCCUPY_COMPLETE_WIDTH} row {/if}" id="target_view" name="target_view">
	                    		<option value= "None" >{vtranslate('Select an option', $QUALIFIED_MODULE)}</option>
	                            <option value="Popup" {if $MODULE_VIEW eq 'Popup'} selected {/if}>{vtranslate('Popup', $QUALIFIED_MODULE)}</option>
	                            <option value="Redirection" {if $MODULE_VIEW eq 'Redirection'} selected {/if}>{vtranslate('Redirection', $QUALIFIED_MODULE)}</option>
	                        </select>
	                    </div>
            		</div>
               
	                <div class="form-group">
	                    <div class="col-sm-3 control-label" >
	                        {vtranslate('LBL_DISPLAY_TEXT', $QUALIFIED_MODULE)}
	                    </div>
	                    <div class="col-sm-5 controls">
	                        <input type="text" name="display_text" class="form-control" value="{$DISPLAYTEXT}" id="display_text" />
	                    </div>
                	</div>
		        </div>

				<div class="row clearfix">
					<div class='textAlignCenter col-lg-12 col-md-12 col-sm-12 '>
						<button type='button' class='btn btn-success' id="test">{vtranslate('LBL_NEXT', $MODULE)}</button>&nbsp;&nbsp;
						<a class='cancelLink' href="javascript:history.back()" type="reset">{vtranslate('LBL_CANCEL', $MODULE)}</a>
					</div>
				</div>
            </div>
            <div id="step2">
	            <div id="mapping_condition">
	            </div>
	            <div class="modal-overlay-footer clearfix">
				<div class="row clearfix">
					<div class='textAlignCenter col-lg-12 col-md-12 col-sm-12 '>
						<button class="btn btn-danger backStep" type="button"><strong>{vtranslate('LBL_BACK', $QUALIFIED_MODULE)}</strong></button>&nbsp;&nbsp;
						<button type='submit' class='btn btn-success' >{vtranslate('LBL_SAVE', $MODULE)}</button>&nbsp;&nbsp;
						<a class='cancelLink' href="javascript:history.back()" type="reset">{vtranslate('LBL_CANCEL', $MODULE)}</a>
					</div>
				</div>
			</div>
        	</div>
         </form>
      </div>
   </div>
{/strip}

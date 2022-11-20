

{strip}
    <div class="fc-overlay-modal modal-content">
        <form id="exportToXLSForm" class="form-horizontal" method="post">
            <input type="hidden" name="module" value="{$sourceModule}"/>
            <input type="hidden" name="source_module" value="{$selectedModule}"/>
            <input type="hidden" name="action" value="ExportData"/>
            <input type="hidden" name="viewname" value="{$viewId}"/>
            <input type="hidden" name="selected_ids" value={ZEND_JSON::encode($selectedIds)}>
            <input type="hidden" name="excluded_ids" value={ZEND_JSON::encode($excludedIds)}>
            <input type="hidden" id="page" name="page" value="{$page}"/>
            <input type="hidden" name="search_key" value="{$searchKey}"/>
            <input type="hidden" name="operator" value="{$operator}"/>
            <input type="hidden" name="search_value" value="{$alphabetValue}"/>
            <input type="hidden" name="search_params" value='{ParsVTExtras_Module_Model::toSafeHTML($searchParams)}'/>
            <input type="hidden" name="orderby" value="{$orderBy}"/>
            <input type="hidden" name="sortorder" value="{$sortOrder}"/>
            <input type="hidden" name="tag_params" value='{ParsVTExtras_Module_Model::toSafeHTML($tagParams)}'/>

            <div class="overlayHeader">
                {assign var=TITLE value="{vtranslate('LBL_EXPORT_RECORDS',$sourceModule)}"}
                {include file="ModalHeader.tpl"|vtemplate_path:$sourceModule TITLE=$TITLE}
            </div>

            <div class="modal-body" style="margin-bottom:250px">
                <div class="datacontent row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="well exportContents">
                            <br>
                            <div><b>{vtranslate('LBL_EXPORT_DATA',$sourceModule)}</b></div>
                            <br>
                            <div style="margin-left: 50px;">
                                <div>
                                    <input type="radio" name="mode" value="ExportSelectedRecords"
                                           id="group11" {if !empty($selectedIds)} checked="checked" {else} disabled="disabled"{/if}
                                           style="margin:2px 0 -4px"/>
                                    <label style="font-weight:normal"
                                           for="group1">&nbsp;&nbsp;{vtranslate('ExportSelectedRecords',$sourceModule)}</label>
                                    {if empty($selectedIds)}&nbsp;
                                        <span style="color:red">
                                        {vtranslate('LBL_NO_RECORD_SELECTED',$selectedModule)}
                                        </span>{/if}
                                    <input type="hidden" class="isSelectedRecords"
                                           value="{if $selectedIds}1{else}0{/if}">
                                </div>
                                <br>
                                <div>
                                    <input type="radio" name="mode" value="ExportAllData"
                                           id="group12" {if empty($selectedIds)} checked="checked" {/if}
                                           style="margin:2px 0 -4px"/>
                                    <label style="font-weight:normal"
                                           for="group2">&nbsp;&nbsp;{vtranslate('ExportAllData',$sourceModule)}</label>
                                </div>
                            </div>
                            <br>
                            <div><b>{vtranslate('ColumnSettings',$sourceModule)}</b></div>
                            <br>
                            <div style="margin-left: 50px;">
                                <div>
                                    <input type="radio" name="columnMode" value="ExportAllColumns" id="group21"
                                           style="margin:2px 0 -4px"/>
                                    <label style="font-weight:normal"
                                    >&nbsp;&nbsp;{vtranslate('AllColumns',$sourceModule)}</label>
                                </div>
                                <br>
                                <div>
                                    <input type="radio" name="columnMode" value="ExportColumnsFromView" id="group22"
                                           checked="checked" style="margin:2px 0 -4px"/>
                                    <label style="font-weight:normal"
                                    >&nbsp;&nbsp;{vtranslate('ColumnsFromView',$sourceModule)}</label>
                                </div>
                            </div>
                            <br>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
            <div class="modal-overlay-footer clearfix">
                <div class="row clearfix">
                    <div class=" textAlignCenter col-lg-12 col-md-12 col-sm-12 ">
                        <div>
                            <button type="submit" class="btn btn-success btn-lg">{vtranslate('LBL_EXPORT', 'Vtiger')}
                                &nbsp;{vtranslate($selectedModule, $selectedModule)}</button>
                            &nbsp;&nbsp;&nbsp;<a class="cancelLink" data-dismiss="modal"
                                                 href="#">{vtranslate('LBL_CANCEL', $sourceModule)}</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
{/strip}
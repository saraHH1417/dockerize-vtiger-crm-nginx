{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{if !class_exists('Vtiger_Datetime_UIType')}
    {include_php file='modules/Vtiger/uitypes/Date.php'}
{/if}
{assign var=list_max_entries_per_page value=vglobal('list_max_entries_per_page')}

<br/>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:0px;">
    <h4>{vtranslate('Manage Calendar Occasions', $QUALIFIED_MODULE)}</h4>
    <hr>
</div>
<div class="col-lg-12" style="margin-top: 10px">
    <div class=" row-fluid">
        <div class="alert alert-warning"  style="text-align: center;">
            {vtranslate('The events on this list will display on the calendar based on Iran official holidays and events', $QUALIFIED_MODULE)}
        </div>
        <button class="btn addButton btn-default module-buttons" onclick="Occasions_Detail_Js.ModifyOccasionDetails({$ID});if (event.stopPropagation){ event.stopPropagation(); } else{ event.cancelBubble = true; }">
            <div class="fa fa-plus" aria-hidden="true"></div>
            <strong>{vtranslate('Add Occasion', $QUALIFIED_MODULE)}</strong>
        </button>
            <table cellpadding="0" cellspacing="0" border="0"
                   class="table table-condensed table-hover backupTable text-center" id="datatable">
                <thead>
                <tr class="active text-center confTable2">
                    <th class="text-center">{vtranslate('LBL_ACTIONS',$QUALIFIED_MODULE)}</th>
                    <th class="text-center">{vtranslate('Occasional Title',$QUALIFIED_MODULE)}</th>
                    <th class="text-center">{vtranslate('Occasional Date', $QUALIFIED_MODULE)}</th>
                    <th class="text-center">{vtranslate('Holiday', $QUALIFIED_MODULE)}</th>
                    <th class="text-center">{vtranslate('Recurring', $QUALIFIED_MODULE)}</th>
                </tr>
                </thead>
                <tbody>
                {foreach item=SLISTOCCASION key=ID from=$LISTOCCASIONS}
                    <tr class="confTable2" data-recordurl="{$SLISTOCCASION['id']}">
                        <td style="max-width: 100px; width: 80px;">
                            <span><a onclick="Occasions_Detail_Js.ModifyOccasionDetails({$SLISTOCCASION['id']});if (event.stopPropagation){ event.stopPropagation(); } else{ event.cancelBubble = true; }"><i class="fa fa-edit" title="{vtranslate('LBL_EDIT',$MODULE)}"></i></a></span>&nbsp;&nbsp;
                            <span><a onclick="Occasions_Detail_Js.DeleteID({$SLISTOCCASION['id']});if (event.stopPropagation){ event.stopPropagation(); } else{ event.cancelBubble = true; }"><i class="fa fa-trash" title="{vtranslate('LBL_DELETE',$MODULE)}"></i></a></span>
                        </td>
                        <td><label for="{$SLISTOCCASION['id']}">{$SLISTOCCASION['title']}</label></td>
                        <td><label for="{$SLISTOCCASION['id']}">{Vtiger_Date_UIType::getDisplayDateValue($SLISTOCCASION['date'])}</label></td>
                        <td><label for="{$SLISTOCCASION['id']}">{if $SLISTOCCASION['holiday']  eq 1} {vtranslate('Yes', $QUALIFIED_MODULE)} {else} {vtranslate('No', $QUALIFIED_MODULE)} {/if} </label></td>
                        <td><label for="{$SLISTOCCASION['id']}">{if $SLISTOCCASION['recurring']  eq 1} {vtranslate('Yes', $QUALIFIED_MODULE)} {else} {vtranslate('No', $QUALIFIED_MODULE)} {/if} </label></td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#datatable').dataTable({
            "sDom": "<'row'<'col-xs-6'T><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
            "sPaginationType": "full_numbers",
            "language": {
                "decimal": "",
                "emptyTable": "{vtranslate('No data available in table', $QUALIFIED_MODULE)}",
                "info": "{vtranslate('Showing _START_ to _END_ of _TOTAL_ entries', $QUALIFIED_MODULE)}",
                "infoEmpty": "{vtranslate('Showing 0 to 0 of 0 entries', $QUALIFIED_MODULE)}",
                "infoFiltered": "{vtranslate('(filtered from _MAX_ total entries)', $QUALIFIED_MODULE)}",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "{vtranslate('Show _MENU_ entries', $QUALIFIED_MODULE)}",
                "loadingRecords": "{vtranslate('Loading...', $QUALIFIED_MODULE)}",
                "processing": "{vtranslate('Processing...', $QUALIFIED_MODULE)}",
                "search": "{vtranslate('Search:', $QUALIFIED_MODULE)}",
                "zeroRecords": "{vtranslate('No matching records found', $QUALIFIED_MODULE)}",
                "paginate": {
                    "first": "{vtranslate('First', $QUALIFIED_MODULE)}",
                    "last": "{vtranslate('Last', $QUALIFIED_MODULE)}",
                    "next": "{vtranslate('Next', $QUALIFIED_MODULE)}",
                    "previous": "{vtranslate('Previous', $QUALIFIED_MODULE)}"
                },
                "aria": {
                    "sortAscending": "{vtranslate(': activate to sort column ascending', $QUALIFIED_MODULE)}",
                    "sortDescending": "{vtranslate(': activate to sort column descending', $QUALIFIED_MODULE)}"
                }
            },
            "pageLength": {if $list_max_entries_per_page neq '' && $list_max_entries_per_page neq '0'}{$list_max_entries_per_page}{else}20{/if}
        });
    });
</script>

<br/><br/><br/><br/><br/>

<script>
        var Occasions_Detail_Js = {
            DeleteID: function (record) {
                app.helper.showConfirmationBox({ 'message': '{vtranslate('Are you sure you want to continue?', $QUALIFIED_MODULE)}' }).then(
                    function (e) {
                        var progressIndicatorElement = jQuery.progressIndicator({
                            'message': '',
                            'position': 'html',
                            'blockInfo': {
                                'enabled': true
                            }
                        });
                        var params = { };
                        params['module'] = 'ParsVT';
                        params['action'] = 'PersianPack';
                        params['mode'] = 'DeleteOccasion';
                        params['value'] = record;
                        AppConnector.request(params).then(
                            function (data) {
                                progressIndicatorElement.progressIndicator({ 'mode': 'hide' });
                                if (data.success && data.success == true) {
                                    app.helper.showSuccessNotification({ 'message': data.result.message });
                                } else if (data.error) {
                                    app.helper.showErrorNotification({ 'message': 'Unknown Error' });
                                }
                            },
                            function (error) {
                                progressIndicatorElement.progressIndicator({ 'mode': 'hide' });
                                app.helper.showErrorNotification({ 'message': 'Unknown Error' });
                            }
                        );
                        setTimeout(function () {
                            window.location.reload(1);
                        }, 3000);
                    },
                    function (error, err) {
                        return false;
                    });
            },
            ModifyOccasionDetails: function (record) {
                var url = 'index.php?module=ParsVT&parent=Settings&view=OccasionModalAjax&id='+record;
                app.request.get({ 'url': url }).then(
                    function (err, data) {
                        if (err === null) {
                            app.helper.showModal(data);
                        } else {
                            if (err.message) {
                                app.helper.showErrorNotification({ 'message': err.message });
                            } else {
                                app.helper.showErrorNotification({ 'message': 'Unknown Error' });
                            }
                        }
                    }
                );
            }
        };
</script>

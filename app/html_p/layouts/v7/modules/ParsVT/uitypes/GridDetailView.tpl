{* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** *}
{strip}
    {assign var="FIELD_ID" value=$FIELD_MODEL->getId()}
    <div class="row grid-div-parent">
        <div class="col-lg-12 col-md-12 col-sm-12">
            {assign var=HEADERS value=ParsVT_AdvCF_Model::getParameters($FIELD_ID)}
            {assign var=ROWS value=$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'))}
            {assign var=ROWS value=rtrim($ROWS,'_')}
            {assign var=COLOMNS value=array()}
            <div class="table-responsive">
                {assign var="JSON_ROW" value=json_decode(html_entity_decode($ROWS),true)}
                <table class="table table-striped table-bordered table-hover dataTables">
                    <thead>
                    <tr class="blockHeader">
                        {if isset($HEADERS['rowNames']) AND $HEADERS['rowNames']}
                            <th>
                                #
                            </th>
                            {append var='COLOMNS' value='' index='#'}
                        {/if}
                        {foreach $HEADERS['columnNames'] as $HEAD=>$V}
                            <th>
                                {if isset($V['name']) AND isset($V['type']) }
                                    {$V['name']}
                                    {append var='COLOMNS' value='' index=$V['name']}
                                {else}
                                    {$V}
                                    {append var='COLOMNS' value='' index=$V}
                                {/if}
                            </th>
                        {/foreach}
                    </tr>
                    </thead>
                    <tbody>
                    {foreach $JSON_ROW as $ROW}
                        <tr>
                            {foreach $COLOMNS as $KEY=>$V}
                                <td>
                                    {if isset($ROW[$KEY]) AND isset($ROW[$KEY]) }
                                        {$ROW[$KEY]}
                                    {/if}
                                </td>
                            {/foreach}
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
{/strip}
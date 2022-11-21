{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
{strip}
    <style>
        {literal}
        .main-content{
            padding-top: 10px;
            background-color: #fbfbfb;
        }
        .right-content .scroll{
            /*max-height: 500px;*/
            /*overflow-x: auto;*/
        }
        .right-content .search-result-list{
            width: 100%;
            overflow-y: auto;
        }
        .left-content {
            position: fixed;
        }
        .left-content .left-content-module-list{
            padding-top: 20px;
            padding-bottom: 20px;
            border: solid 1px #9c9c9c;
            background-color: #fff;
        }
        .left-content .left-content-module-list .left-content-search-link{
            display: inline-block;
            height: 100%;
            width: 80%;
            color: #AAAAAA;
            margin-top: 10px;
            margin-left: 15px;
            padding: 0px 10px;
            text-decoration: none;
            vertical-align: top;
            border: 1px solid #DDDDDD;
        }
        .left-content .left-content-module-list span.label{
            font-size: 13px;
            font-weight: bold;
            text-transform: uppercase;
            color: #948e8e;
        }
        .left-content .left-content-module-list .list-item{
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
            cursor: pointer;
            border-left: solid 5px #fff;
        }
        .left-content .left-content-module-list .list-item:hover{
            background-color: #eee;
            color: #15c;
            border-left: solid 5px #eee;
        }
        .left-content .left-content-module-list .list-item.active{
            border-left: solid 5px #71a7ea;
            background-color: #f9f6f6;
            color: #15c;
            font-weight: bold;
        }
        .highlight {
            background-color: #fbed50;
            padding: 0;

        }
        .module-search-result{
            border: solid 1px #ccc;
            margin-bottom: 25px;
            background-color: #fff;
        }
        .module-search-result .result-header{
            padding-top: 4px;
            background-color: #F3F3F3;
            height: 30px;
            border-bottom: solid 1px #d2cdcd;
        }
        .module-search-result .result-header .total{
            padding-left: 15px;
            padding-right: 15px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
        }
        .module-search-result .result-header .paging{
            padding-right: 40px;
        }

        .listViewRecordActions .table-actions{
            width: 85px;
        }
        .search-tag {
            margin-top: 10px;
            padding-left: 25px;
        }
        .listViewEntriesTable thead{
            background-color: #fafaf9;
        }
        .listViewEntriesTable thead tr.listViewContentHeader td{
            padding: 0px 14px !important;
            white-space: nowrap;
            text-transform: uppercase;
            vertical-align: middle;
            color: #3e3e3e;
        }
        .listViewEntriesTable thead tr.listViewContentHeader td:nth-child(2){
            padding: 0px 0px !important;
        }
        .listViewEntriesTable .listViewContentHeader{
            height: 29px;
        }
        .listViewEntriesTable .listViewEntries:hover{
            background-color: #eee;
        }
        .listViewEntriesTable .listViewEntries .listViewEntryValue{
            padding-left: 14px;
        }
        .listViewEntriesTable .listViewEntries .listViewEntryValue:nth-child(2){
            padding-left: 0px;
        }
        {/literal}
    </style>
    <div class="main-container clearfix">
        
        <input type='hidden' value="{$VALUE}" id='searchKey'>
        <input type='hidden' value="{$KEY_WORD_SEARCH}" id='keyWordSearch'>
        <div class="clearfix main-content">
            <div class="col-lg-2 left-content pull-left">
                <div class="left-content-module-list">
                    <span class="label">{vtranslate('Search Results','GlobalSearch')}</span>
                    {assign var=FOUND_RECORDS value=0}
                    {foreach item=LIST_RESULTS key=SEARCH_MODULE from=$SEARCH_RESULTS name=listresult}
                        {if $LIST_RESULTS['totalResults'] eq 0}{continue}{/if}
                        {assign var=FOUND_RECORDS value=FOUND_RECORDS+1}
                        {assign var=TOTAL_RESULTS value=$LIST_RESULTS['totalResults']}
                        <div class="list-item" data-module="{$SEARCH_MODULE}">
                            <a href="javascript:void(0)">{vtranslate($SEARCH_MODULE, $SEARCH_MODULE)} ({$TOTAL_RESULTS})</a>
                        </div>
                    {/foreach}
                    {if $FOUND_RECORDS eq 0}
                        <div><h5 style="text-align: center;font-size: 12px;">{vtranslate('No records found','GlobalSearch')}</h5></div>
                    {else}
                        <br>
                    {/if}
                    <span class="label">{vtranslate('Keyword search','GlobalSearch')}</span>
                    <div class="left-content-search-link hidden-xs">
                        <span class="fa fa-search" aria-hidden="true"></span>
                        <input style="border: 0;height: 30px;width: 70%;margin: 1px 0 1px 5px;" class="global-keyword-input" type="text" placeholder="{vtranslate('Type keyword','GlobalSearch')}..." value="">
                    </div>
                    {if !empty($KEY_WORD_SEARCH)}
                        {assign var=KEY_WORD_SEARCH value=explode(',',$KEY_WORD_SEARCH)}
                        {foreach item=KEY_WORD  from=$KEY_WORD_SEARCH}
                            <div class="search-tag">
                                <span class="badge badge-pill badge-default">{$KEY_WORD} &nbsp;&nbsp;<a class="remove-search-tag" href="javascript:void(0)" onclick="remove_search_tag('{$KEY_WORD}')"><i class="deleteTag fa fa-times"></i></a></span>
                            </div>
                        {/foreach}
                    {/if}
                </div>
                <div class="clear-fix"></div>
            </div>
            <div class="col-lg-10 right-content {if $CURRENT_USER_MODEL->get('language') neq 'fa_ir'}pull-right{/if}">
                <div class="scroll">
                    {if $NO_MODULE eq 'true'}
                        <div class="detailViewInfo row-fluid">
                            <div class="span12 details">
                                <div class="alert alert-error">
                                    <p style="font-weight:bold;">{vtranslate('LBL_NO_MODULE_SELECTED', 'GlobalSearch')}</p>
                                </div>
                            </div>
                        </div>
                    {else}
                        {assign var=WIDTHTYPE value=$CURRENT_USER_MODEL->get('rowheight')}
                        {assign var=FOUND_RECORDS value=0}
                        {foreach item=LIST_RESULTS key=SEARCH_MODULE from=$SEARCH_RESULTS name=listresult}
                            {if $LIST_RESULTS['totalResults'] eq 0}{continue}{/if}
                            {assign var=FOUND_RECORDS value=FOUND_RECORDS+1}
                            <div class="module-search-result listViewTopMenuDiv noprint" id="{$SEARCH_MODULE}_search_content">
                                {assign var=LISTVIEW_HEADERS value=$LIST_RESULTS['listViewHeaders']}
                                {assign var=LISTVIEW_ENTRIES value=$LIST_RESULTS['listViewEntries']}
                                {assign var=TOTAL_RESULTS value=$LIST_RESULTS['totalResults']}
                                {assign var=PAGE_COUNT value=$LIST_RESULTS['PAGE_COUNT']}
                                {assign var=LISTVIEW_ENTRIES_COUNT value=$LIST_RESULTS['listViewEntries']|count}
                                {assign var=PAGING_MODEL value=$PAGING_MODELS[$SEARCH_MODULE]}
                                {assign var=PAGE_NUMBER value=1}
                                <div class="result-header">
                                    <div class="total pull-left">
                                        <span class="total-results-label">{vtranslate($SEARCH_MODULE, $SEARCH_MODULE)} ({$TOTAL_RESULTS})</span>
                                        <input type="hidden" name="search_module" value="{$MODULE}"/>
                                    </div>
                                    <div class="paging pull-right">
                                        {*{include file="ListViewActions.tpl"|vtemplate_path:'GlobalSearch' MODULE=$SEARCH_MODULE}*}
                                        <div class="" >
                                            <input type="hidden" name="pageNumber" value="{$PAGE_NUMBER}">
                                            <input type="hidden" name="recordsCount" value="{$TOTAL_RESULTS}">
						        <span class="pageNumbersText" id="pageNumbersText{$SEARCH_MODULE}" style="padding-right:5px">
							        {if $PAGING_MODEL->getRecordStartRange() neq ''}{$PAGING_MODEL->getRecordStartRange()}{else}0{/if} {vtranslate('LBL_to', $MODULE)} {if $PAGING_MODEL->getRecordEndRange() neq ''}{$PAGING_MODEL->getRecordEndRange()}{else}0{/if}
						        </span>{vtranslate('LBL_OF',$SEARCH_MODULE)} {$TOTAL_RESULTS}
                                            &nbsp;&nbsp;&nbsp;<a id="listViewPreviousPageButton{$SEARCH_MODULE}" class="previousPageButton listViewPreviousPageButton navigationButton verticalAlignMiddle" data-start='{$PAGING_MODEL->getRecordStartRange()-$PAGING_MODEL->getPageLimit()}'data-module="{$SEARCH_MODULE}" {if !$PAGING_MODEL->isPrevPageExists()}disabled=""{/if}>
                                                <i class="fa fa-caret-left"></i>&nbsp;&nbsp;
                                            </a>
                                            <a id="listViewNextPageButton{$SEARCH_MODULE}" class="nextPageButton listViewNextPageButton navigationButton verticalAlignMiddle" data-module="{$SEARCH_MODULE}" data-start='{$PAGING_MODEL->getRecordEndRange()}' {if !$PAGING_MODEL->isNextPageExists()} disabled=""{/if}>
                                                <i class="fa fa-caret-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="clear-fix"></div>
                                </div>
                                <div id="searchResult{$SEARCH_MODULE}" class="search-result-list">
                                    {include file="ListViewContents.tpl"|vtemplate_path:'GlobalSearch' SEARCH_MODE_RESULTS=true}
                                </div>
                            </div>
                        {/foreach}
                        {if $FOUND_RECORDS eq 0}
                            <h4 style="text-align: center;">{vtranslate('No records found','GlobalSearch')} !</h4>
                        {/if}
                    {/if}
                </div>
            </div>
        </div>
    </div>

{/strip}
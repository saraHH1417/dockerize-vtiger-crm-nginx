{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is: vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
  *
 ********************************************************************************/
-->*}

{if empty($CONTENTTYPE)}
{literal}
    <script type="text/javascript">
        Vtiger_Widget_Js('Vtiger_PBXManager_Widget_Js', {}, {
            getCharRelatedData: function () {
                var container = this.getContainer();
                var dataAll = container.find('.widgetData').val();
                dataAll = JSON.parse(dataAll);
                var data = dataAll[0];
                var dataType = dataAll[1];
                if (dataType == 'multibar') {
                    var users = new Array();
                    var stages = new Array();
                    var count = new Array();
                    for (var i = 0; i < data.length; i++) {
                        if ($.inArray(data[i].user, users) == -1) {
                            users.push(data[i].user);
                        }
                        if ($.inArray(data[i].direction, stages) == -1) {
                            stages.push(data[i].direction);
                        }
                    }
                    var allLinks = new Array();
                    for (j in stages) {
                        var salesStageCount = new Array();
                        var links = new Array();
                        for (i in users) {
                            var salesCount = 0;
                            for (var k in data) {
                                var userData = data[k];
                                if (userData.direction == stages[j] && userData.user == users[i]) {
                                    salesCount = parseFloat(userData.count);
                                    link = userData.links;
                                    break;
                                }
                            }
                            links.push(link);
                            salesStageCount.push(salesCount);
                        }
                        allLinks.push(links);
                        count.push(salesStageCount);
                    }
                    return {
                        'data': count,
                        'ticks': users,
                        'labels': stages,
                        'links': allLinks
                    }
                } else if (dataType == 'pie') {
                    var chartData = [];
                    for (var index in data) {
                        var row = data[index];
                        var rowData = [row.user, parseFloat(row.count), row.id];
                        chartData.push(rowData);
                    }
                    return {'chartData': chartData};
                }else if (dataType == 'linechart') {
                    var dates = new Array();
                    var stages = new Array();
                    var data_type = new Array();
                    var count = new Array();
                    for (var i = 0; i < data.length; i++) {
                        if ($.inArray(data[i].date, dates) == -1) {
                            dates.push(data[i].date);
                        }
                        if ($.inArray(data[i].direction, stages) == -1) {
                            stages.push(data[i].direction);
                            data_type.push("integer");
                        }
                    }
                    var allLinks = new Array();
                    for (j in stages) {
                        var salesStageCount = new Array();
                        var links = new Array();
                        for (i in dates) {
                            var salesCount = 0;
                            for (var k in data) {
                                var dateData = data[k];
                                if (dateData.direction == stages[j] && dateData.date == dates[i]) {
                                    salesCount = parseFloat(dateData.count);
                                    link = dateData.links;
                                    break;
                                }
                            }
                            links.push(link);
                            salesStageCount.push(salesCount);
                        }
                        allLinks.push(links);
                        count.push(salesStageCount);
                    }
                    return {
                        'chartData': count,
                        'yMaxValue': 0,
                        'labels': dates,
                        'data_labels': stages,
                        'data_type'	: data_type,
                        'title': stages,
                        'links' : links
                    };
                }
            },

            generateLinks: function () {
                var jData = this.getContainer().find('.widgetData').val();
                var statData = JSON.parse(jData);
                var links = [];
                for (var i = 0; i < statData.length; i++) {
                    links.push(statData[i]['links']);
                }
                return links;
            },

            postInitializeCalls: function () {
                var thisInstance = this;
                this.getPlotContainer(false).off('vtchartClick').on('vtchartClick', function (e, data) {
                    if (data.url)
                        thisInstance.openUrl(data.url);
                });
            },

            loadChart: function () {
                var chartData = this.getCharRelatedData();
                var container = this.getContainer();
                var dataAll = container.find('.widgetData').val();
                dataAll = JSON.parse(dataAll);
                var dataType = dataAll[1];
                if (dataType == 'multibar') {
                    var chartOptions = {
                        renderer: 'multibar',
                        links: chartData.links
                    };
                    this.getPlotContainer(false).data('widget-data', JSON.stringify(this.getCharRelatedData()));
                    this.getPlotContainer(false).vtchart(chartData, chartOptions);
                } else if (dataType == 'pie') {
                    var chartOptions = {
                        renderer: 'pie',
                        links: this.generateLinks()
                    };
                    this.getPlotContainer(false).vtchart(chartData, chartOptions);
                }else if (dataType == 'linechart') {
                    console.dir(chartData)
                    var chartOptions = {
                        renderer: 'linechart',
                        links: chartData.links
                    };
                    this.getPlotContainer().vtchart(chartData, chartOptions);
                }
            }
        });
    </script>
{/literal}
{/if}
{if empty($CONTENTTYPE)}
    <div class="dashboardWidgetHeader">
        {include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME}
    </div>
{/if}
<div class="dashboardWidgetContent">
    <span style="position: absolute;bottom: 5px;z-index: 99999;"> {vtranslate('LBL_FROM',$MODULE)} {$STARTDATE} {vtranslate('LBL_TO',$MODULE)}  {$ENDDATE}</span>
    {include file="dashboards/DashBoardWidgetContents.tpl"|@vtemplate_path:$MODULE_NAME}
</div>

{if empty($CONTENTTYPE)}
    <div class="widgeticons dashBoardWidgetFooter">
        <div class="filterContainer">
            <div class="row">
                <div class="col-sm-12">
                <span class="col-lg-4">
                    <span>
                        <strong>{vtranslate('Created Time', $MODULE_NAME)} &nbsp; {vtranslate('LBL_BETWEEN', $MODULE_NAME)}</strong>
                    </span>
                </span>
                    <div class="col-lg-7">
                        <div class="input-daterange input-group dateRange widgetFilter" id="datepicker"
                             name="createdtime">
                            <input type="text" class="input-sm form-control" name="start" value="{$STARTDATE}"
                                   style="height:30px;"/>
                            <span class="input-group-addon">{vtranslate('to','ParsVT')}</span>
                            <input type="text" class="input-sm form-control" name="end" value="{$ENDDATE}"
                                   style="height:30px;"/>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-12">
                <span class="col-lg-4">
                        <span>
                            <strong>{vtranslate('Assigned To', $MODULE_NAME)}</strong>
                        </span>
                </span>
                    <span class="col-lg-7">
                    {assign var=CURRENT_USER_ID value=$CURRENTUSER->getId()}
                    <select class="select2 col-sm-12 widgetFilter reloadOnChange" name="smownerid">
                        <option value="{$CURRENT_USER_ID}">{vtranslate('LBL_MINE')}</option>
                        <option value="">{vtranslate('LBL_ALL', $MODULE_NAME)}</option>
                        {assign var=ALL_ACTIVEUSER_LIST value=$CURRENTUSER->getAccessibleUsers()}
                        {if count($ALL_ACTIVEUSER_LIST) gt 1}
                            <optgroup label="{vtranslate('LBL_USERS')}">
                                {foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEUSER_LIST}
                                    {if $OWNER_ID neq $CURRENT_USER_ID}
                                        <option value="{$OWNER_ID}">{$OWNER_NAME}</option>
                                    {/if}
                                {/foreach}
                            </optgroup>
                        {/if}
                    </select>
                </span>
                </div>
            </div>
        </div>
        <div class="footerIcons pull-right">
            {include file="dashboards/DashboardFooterIcons.tpl"|@vtemplate_path:$MODULE_NAME SETTING_EXIST=true}
        </div>
    </div>
{/if}
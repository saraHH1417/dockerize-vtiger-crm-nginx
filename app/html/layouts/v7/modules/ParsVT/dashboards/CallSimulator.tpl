<div class="dashboardWidgetHeader">
    {include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME}
</div>
<div class="dashboardWidgetContent">
    <div style="margin-top: 10px; margin-left: 20px; margin-right: 20px;">
        <div class="row miniListContent" style="padding:5px">
            <div class="col-lg-6 textOverflowEllipsis" style="padding-right: 5px;">
                <label>{vtranslate('Call to/from', $MODULE_NAME)}</label>
            </div>
            <div class="col-lg-6 textOverflowEllipsis" style="padding-right: 5px;">
                <input type="text" id="pvtCallPhone" class="inputElement"/>
            </div>
        </div
        <div class="row miniListContent" style="padding:5px">
            <div class="col-lg-6 textOverflowEllipsis" style="padding-right: 5px;">
                <label>{vtranslate('Call Direction', $MODULE_NAME)}</label>
            </div>
            <div class="col-lg-6 textOverflowEllipsis" style="padding-right: 5px;">
                <select id="pvtCallType" class="inputElement select2">
                    <option value="inbound">{vtranslate('Inbound', $MODULE_NAME)}</option>
                    <option value="outbound">{vtranslate('Outbound', $MODULE_NAME)}</option>
                </select>
            </div>
        </div
        <div class="row miniListContent" style="padding:5px">
            <div class="col-lg-12 textOverflowEllipsis" style="padding-right: 5px;">
                <button id="pvtStartCall" class="btn btn-primary" style="margin-top: 25px; width: 100%">{vtranslate('Start Call', $MODULE_NAME)}</button>
            </div>
        </div
        <div style="clear: both;"></div>
    </div>
</div>

<div class="widgeticons dashBoardWidgetFooter">
    <div class="footerIcons pull-right">
        {if !$WIDGET->isDefault()}
            <a name="dclose" class="widget" data-url="{$WIDGET->getDeleteUrl()}">
                <i class="fa fa-remove" hspace="2" border="0" align="absmiddle" title="{vtranslate('LBL_REMOVE')}" alt="{vtranslate('LBL_REMOVE')}"></i>
            </a>
        {/if}
    </div>
</div>

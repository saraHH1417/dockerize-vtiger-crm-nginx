{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{literal}
<script type="text/javascript" src="layouts/v7/modules/ParsVTExtras/resources/highcharts/js/highcharts.js"></script>
<script type="text/javascript" src="layouts/v7/modules/ParsVTExtras/resources/highcharts/js/modules/funnel.js"></script>
<script type="text/javascript" src="layouts/v7/modules/ParsVTExtras/resources/highcharts/js/modules/exporting.js"></script>
<script type="text/javascript">
    jQuery(function () {
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        jQuery('#container').highcharts({
            chart: {
                type: 'funnel',
                marginRight: 100
            },
            title: {
                text: app.vtranslate('Sales funnel'),
                useHTML: true, //bug fixed `IE9` and `EDGE`
                style: {
                    direction: 'rtl',
                },
                x: -50
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>',
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
                        style: {
                            direction: 'rtl',
                            textShadow: false, //bug fixed IE9 and EDGE
                        },
                        useHTML: true,
                        softConnector: true
                    },
                    neckWidth: '30%',
                    neckHeight: '25%',
                    useHTML: true,
                    //-- Other available options
                    // height: pixels or percent
                    // width: pixels or percent
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function () {
                                location.href = this.options.url;
                            }
                        }
                    }
                }
            },
            legend: {
                useHTML: true,
            },

            tooltip: {
                //useHTML: true
                useHTML: true,
                style: {
                    direction: 'rtl',
                },
                formatter: function () {
                    return  numberWithCommas(this.y) ;
                }
            },
            series: [{
                {/literal}
                name: ' ',
                data:
                {$DATA}
                {literal}

            }]
        });
    });
</script>
{/literal}
<div class="dashboardTitle" id="title" style="font-weight:bold">
    {$TITLE}
</div>
<div id="container" style="min-width: 330px; max-width: 330px; height: 200px; margin: 0 auto;"></div>
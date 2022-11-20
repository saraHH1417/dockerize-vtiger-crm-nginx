{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='Head.tpl'|@vtemplate_path:$MODULE}
<div class="listViewPageDiv">
    <div class="container-fluid">
        <div class="row">
            <div id="main-content" class="container-fluid">
                <div id="printarea">
                    <div id="map"
                         class="grid-100 leaflet-container leaflet-touch leaflet-fade-anim leaflet-grab leaflet-touch-drag leaflet-touch-zoom"
                         tabindex="0" style="position: relative;">
                        <div class="leaflet-pane leaflet-map-pane" style="transform: translate3d(0px, 0px, 0px);">
                            <div class="leaflet-pane leaflet-tile-pane">
                                <div class="leaflet-layer " style="z-index: 1; opacity: 1;">
                                    <div class="leaflet-tile-container leaflet-zoom-animated"
                                         style="z-index: 19; transform: translate3d(-465px, -41px, 0px) scale(2);"></div>
                                    <div class="leaflet-tile-container leaflet-zoom-animated"
                                         style="z-index: 20; transform: translate3d(-465px, -41px, 0px) scale(1);">
                                    </div>
                                </div>
                            </div>
                            <div class="leaflet-pane leaflet-shadow-pane"><img
                                        src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/map/images/marker-shadow.png"
                                        class="leaflet-marker-shadow leaflet-zoom-animated" alt=""
                                        style="margin-left: -12px; margin-top: -41px; width: 41px; height: 41px; transform: translate3d(-131542px, 148306px, 0px);">
                            </div>
                            <div class="leaflet-pane leaflet-overlay-pane">
                                <svg pointer-events="none" class="leaflet-zoom-animated" width="1078" height="480"
                                     viewBox="-90 -40 1078 480" style="transform: translate3d(-90px, -40px, 0px);">
                                    <g>
                                        <path class="leaflet-interactive" stroke="red" stroke-opacity="1"
                                              stroke-width="5" stroke-linecap="round" stroke-linejoin="round"
                                              fill="none" d="M449 200L213 440"></path>
                                    </g>
                                </svg>
                            </div>
                            <div class="leaflet-pane leaflet-marker-pane"><img
                                        src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/map/images/marker-icon.png"
                                        class="leaflet-marker-icon leaflet-zoom-animated leaflet-interactive" alt=""
                                        tabindex="0"
                                        style="margin-left: -12px; margin-top: -41px; width: 25px; height: 41px; transform: translate3d(-131542px, 148306px, 0px); z-index: 148306;"><img
                                        src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/map/images/qibla-wind-direction.png"
                                        class="leaflet-marker-icon leaflet-zoom-animated leaflet-interactive leaflet-marker-draggable"
                                        alt="" tabindex="0"
                                        style="margin-left: -50px; margin-top: -50px; width: 100px; height: 100px; transform: translate3d(449px, 200px, 0px); z-index: 200;">
                            </div>
                            <div class="leaflet-pane leaflet-tooltip-pane"></div>
                            <div class="leaflet-pane leaflet-popup-pane"></div>
                            <div class="leaflet-proxy leaflet-zoom-animated"
                                 style="transform: translate3d(2.69315e+06px, 1.69343e+06px, 0px) scale(8192);"></div>
                        </div>
                        <div class="leaflet-control-container">
                            <div class="leaflet-top leaflet-left">
                                <div class="leaflet-control-zoom leaflet-bar leaflet-control"><a
                                            class="leaflet-control-zoom-in" href="#" title="Zoom in" role="button"
                                            aria-label="Zoom in">+</a><a class="leaflet-control-zoom-out"
                                                                         href="#"
                                                                         title="Zoom out" role="button"
                                                                         aria-label="Zoom out">−</a></div>
                            </div>
                            <div class="leaflet-top leaflet-right">
                                <div class="leaflet-geonames-search leaflet-bar active leaflet-control">
                                    <a class="leaflet-geonames-icon" href="#" title="Find location"></a>
                                    <form class="">
                                        <input class="" type="search" placeholder="{vtranslate("Search", $MODULE)} ...">
                                    </form>
                                    <ul class=""></ul>
                                </div>
                            </div>
                            <div class="leaflet-bottom leaflet-left"></div>
                            <div class="leaflet-bottom leaflet-right">
                                <div class="info leaflet-control"></div>
                                <div class="leaflet-control-attribution leaflet-control">© Openstreetmap | © <a
                                            href="http://www.openstreetmap.org/copyright">OpenStreetMap</a></div>
                            </div>
                        </div>
                    </div>
                    <div id="intro" class="grid-100 mobile-grid-100 grid-parent" leaflet-browser-print-content="">
                        <div class="grid-25 mobile-grid-50">
                            <h4>
                                {vtranslate("Place name", $MODULE)}...
                            </h4><span id="namatempat"></span>
                        </div>
                        <div class="grid-25 mobile-grid-50">
                            <h4>
                                {vtranslate("Longitude", $MODULE)}
                            </h4>{vtranslate("Latitude", $MODULE)}: <span id="curLat"></span>
                            <br> {vtranslate("Longitude", $MODULE)}: <span id="curLong"></span>
                        </div>
                        <div class="grid-25 mobile-grid-50">
                            <h4>
                                {vtranslate("Distance to Kaaba", $MODULE)}...
                            </h4><span id="jarakmekah"></span>
                        </div>
                        <div class="grid-25 mobile-grid-50">
                            <h4>
                                {vtranslate("The angle of deviation of the qiblah from the north", $MODULE)}
                            </h4><span id="arahkiblat"> </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var theip = "{$IP}";
    var geoip_country_code = "";
    var geoip_country_name = "";
    var geoip_region_name = "";
    var geoip_city = "";
    var geoip_postal_code = "";
    var geoip_latitude = "{$latitude}";
    var geoip_longitude = "{$longitude}";
    var geoip_placename = "{$PLACENAME}";
</script>
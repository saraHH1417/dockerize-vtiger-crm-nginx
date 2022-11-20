{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
{strip}
<link rel="stylesheet" href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/map/dist/leaflet.css" />
<style>
    #locationPicker, #locationPicker * {
        direction: ltr !important;
    }
</style>
<div id="gpsContainer" class='modelContainer col-sm-12 col-xs-12 content-area '>
    <div id="GPSModalContainer" class="modal-dialog" style="min-width:900px; min-height: 800px">
        {assign var=HEADER_TITLE value={vtranslate('Coordinate', $QUALIFIED_MODULE)}}
        {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
        <div class="modal-content">
                <div class="modal-body tabbable slimScrollDiv">
                    <div class="">
                        <div class="row">
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="address" placeholder="{vtranslate('LBL_TYPE_SEARCH', $QUALIFIED_MODULE)}">
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="latitude" placeholder="{vtranslate('Latitude', $QUALIFIED_MODULE)}">
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="longitude" placeholder="{vtranslate('Longitude', $QUALIFIED_MODULE)}">
                            </div>
                            <div class="col-md-3">
                                <input type="number" class="form-control" id="radius" placeholder="Radius">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div id="locationName" class="col-md-12"></div>
                        </div>
                        <br>
                        <div id="locationPicker" style="width: auto; height: 300px;"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="textAlignCenter col-lg-12 col-md-12 col-sm-12 ">
                        <button class="btn btn-success setgps" data-gpstarget="{$GPSTARGET}" data-gpsvalue="{$LAT},{$LON}" ><strong>{vtranslate('LBL_OK', $MODULE)}</strong>
                        </button>&nbsp;&nbsp;
                        <button id="getLocation" class="btn btn-info"><strong>{vtranslate('Get Current Position', $MODULE)}</strong>
                        </button>&nbsp;&nbsp;
                        <button class="btn btn-danger clearLocation" data-gpstarget="{$GPSTARGET}"><strong>{vtranslate('LBL_DELETE', $MODULE)}</strong>
                        </button>&nbsp;&nbsp;
                        <a class="cancelLink" type="reset"
                           onclick="javascript:jQuery('.modal').modal('hide');">{vtranslate('Cancel', $MODULE)}</a>
                    </div>
                </div>
        </div>
    </div>
    <script>
        {literal}
        function check_lat_lon(lat, lon){
            var validLat = /^(-?[1-8]?\d(?:\.\d{1,18})?|90(?:\.0{1,18})?)$/.test(lat);
            var validLon = /^(-?(?:1[0-7]|[1-9])?\d(?:\.\d{1,18})?|180(?:\.0{1,18})?)$/.test(lon);
            if(validLat && validLon) {
                return true;
            } else {
                return false;
            }
        }
        {/literal}
        var gpslat = "{$LAT}";
        var gpslon = "{$LON}";
        var gpszoom = 13;
        if (!check_lat_lon(gpslat, gpslon)){
            gpslat = 35.69082603616864;
            gpslon = 51.37207281233287;
            gpszoom = 4;
        }
        function showError(error) {
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    app.helper.showErrorNotification({ 'message': '{vtranslate("Location information is unavailable.", $MODULE)}' });
                    break;
                case error.POSITION_UNAVAILABLE:
                    app.helper.showErrorNotification({ 'message': '{vtranslate("Location information is unavailable.", $MODULE)}' });
                    break;
                case error.TIMEOUT:
                    app.helper.showErrorNotification({ 'message': '{vtranslate("The request to get user location timed out.", $MODULE)}' });
                    break;
                case error.UNKNOWN_ERROR:
                    app.helper.showErrorNotification({ 'message': '{vtranslate( "An unknown error occurred.", $MODULE)}' });
                    break;
            }
        }
    </script>
    <script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/map/dist/leaflet.js"></script>
    <script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/map/dist/Locationpicker.js"></script>
{/strip}

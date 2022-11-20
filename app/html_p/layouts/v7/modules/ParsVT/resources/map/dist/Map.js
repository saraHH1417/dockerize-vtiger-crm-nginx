var LATITUDE = jQuery('input[name=LATITUDE]').val();
var LONGITUDE = jQuery('input[name=LONGITUDE]').val();
LATITUDE = parseFloat(LATITUDE);
LONGITUDE = parseFloat(LONGITUDE);
var MAPZOOM = jQuery('input[name=MAPZOOM]').val();
var SOURCEMODULE = jQuery('input[name=SOURCE_MODULE]').val();
var SINGLEMAPVIEW = jQuery('input[name=SINGLEMAPVIEW]').val();
if (SINGLEMAPVIEW != '') {
    var MAPTITLE = jQuery('input[name=MAPTITLE]').val();
    var MAPRECORDID = jQuery('input[name=MAPRECORDID]').val();
    if (LATITUDE != "" && LONGITUDE != "") {
        var map = L.map('ParsVTMap').setView([LATITUDE, LONGITUDE], MAPZOOM);
        var marker = L.marker([LATITUDE, LONGITUDE]).addTo(map);
        if (MAPRECORDID != "" && MAPTITLE != "") {
            marker.bindPopup("<b><a href='index.php?module=" + SOURCEMODULE + "&view=Detail&record=" + MAPRECORDID + "'>" + MAPTITLE + "</a></b>").openPopup();
        }
    } else {
        var map = L.map('ParsVTMap').setView([32.657857671573154, 51.66788578033448], MAPZOOM);
    }
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'copyright © <a href="//osm.org/copyright">OpenStreetMap</a>/ODbL - <a href="//ParsVT.com">ParsVT</a>',
        minZoom: 2,
        maxZoom: 20
    }).addTo(map);
} else {
    var map = new L.Map('ParsVTMap', {
        attribution: 'copyright © <a href="//osm.org/copyright">OpenStreetMap</a>/ODbL - <a href="//ParsVT.com">ParsVT</a>',
        zoom: MAPZOOM,
        center: new L.latLng([LATITUDE, LONGITUDE]),
        layers: new L.TileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png')
    });
    function getMapRadiusKM() {
        var mapBoundNorthEast = map.getBounds().getNorthEast();
        var mapDistance = mapBoundNorthEast.distanceTo(map.getCenter());
        return mapDistance / 1000;
    }
    L.layerJSON({
        caching: false,
        buildPopup: function (data, marker) {
            marker.bindPopup(data.popup).openPopup();
        },
        callData: function (bbox, callback) {
            return jQuery.ajax({
                url: "index.php",
                data: {
                    module: app.getModuleName(), distance: getMapRadiusKM(), centerlat: map.getCenter().lat ,centerlon: map.getCenter().lng,
                    src_module: SOURCEMODULE, action: 'ACF', mode: 'PopulateMap', viewname: jQuery('#viewname').val(),
                    lat1: bbox[0][0], lon1: bbox[0][1],
                    lat2: bbox[1][0], lon2: bbox[1][1]
                },
                success: callback
            });
        }
    }).addTo(map);
}

//https://maps.google.com/maps?q=32.64139859195775,51.66664123535156
//https://www.openstreetmap.org/#map=18/32.64139859195775/51.66664123535156
//https://yandex.com/maps/?from=api-maps&l=map&ll=51.66664123535156,32.64139859195775&z=15
//https://www.waze.com/ul?ll=32.64139859195775,51.66664123535156&navigate=yes&zoom=15
//http://maps.apple.com/?ll=32.64139859195775,51.66664123535156

var OSMPICKER = (function () {
    var app = {};

    var map;
    var marker;
    var circle;
    app.initmappicker = function (lat, lon, r, z, option) {
        var marketicon = L.icon({
            iconUrl: 'layouts/v7/modules/ParsVT/resources/map/images/marker-icon.png',
            shadowUrl: 'layouts/v7/modules/ParsVT/resources/map/images/marker-shadow.png',
            iconSize:     [25, 41], // size of the icon
            shadowSize:   [41, 41], // size of the shadow
            iconAnchor:   [12, 41], // point of the icon which will correspond to marker's location
            //shadowAnchor: [4, 62],  // the same for the shadow
            popupAnchor:  [0, -41] // point from which the popup should open relative to the iconAnchor
        });
        try {
            map = new L.Map('locationPicker');
        } catch (e) {
            console.log(e);
        }
        var osmUrl = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
        var osmAttrib = 'Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors';
        var osm = new L.TileLayer(osmUrl, {minZoom: 1, maxZoom: 20, attribution: osmAttrib});
        map.setView([lat, lon], 10);
        map.addLayer(osm);
        map.setZoom(z);
        searchCoordinates(lat, lon)
        if (!marker) {
            marker = new L.marker([lat, lon], {icon: marketicon}, {draggable: 'true'});
            circle = new L.circle([lat, lon], r, {
                weight: 2
            });
        } else {
            marker.setLatLng([lat, lon]);
            circle.setLatLng([lat, lon]);
        }

        marker.on('dragend', function (e) {
            circle.setLatLng(e.target.getLatLng());
            map.setView(e.target.getLatLng());
            $("#" + option.latitudeId).val(e.target.getLatLng().lat);
            $("#" + option.longitudeId).val(e.target.getLatLng().lng);
            $(".setgps").attr('data-gpsvalue',e.target.getLatLng().lat+','+e.target.getLatLng().lng);
            searchCoordinates(e.target.getLatLng().lat, e.target.getLatLng().lng);
        });

        setTimeout(function() {
            map.invalidateSize();
        }, 10);

        map.on("click", function (e) {
            $("#" + option.latitudeId).val(e.latlng.lat);
            $("#" + option.longitudeId).val(e.latlng.lng);
            $(".setgps").attr('data-gpsvalue',e.latlng.lat+','+e.latlng.lng);
            marker.setLatLng([e.latlng.lat, Number(e.latlng.lng)]);
            circle.setLatLng(marker.getLatLng());
            map.setView(marker.getLatLng());
            searchCoordinates(e.latlng.lat, e.latlng.lng);
            //console.log(e);

        });
        map.addLayer(marker);
        map.addLayer(circle);

        $("#" + option.latitudeId).val(lat);
        $("#" + option.latitudeId).on('change', function () {
            marker.setLatLng([Number($(this).val()), marker.getLatLng().lng]);
            circle.setLatLng(marker.getLatLng());
            map.setView(marker.getLatLng());
            //map.setZoom(13);
            searchCoordinates(Number($(this).val()), marker.getLatLng().lng);
            $(".setgps").attr('data-gpsvalue',Number($(this).val())+','+marker.getLatLng().lng);

        });

        $("#" + option.longitudeId).val(lon);
        $("#" + option.longitudeId).on('change', function () {
            marker.setLatLng([marker.getLatLng().lat, Number($(this).val())]);
            circle.setLatLng(marker.getLatLng());
            map.setView(marker.getLatLng());
            //map.setZoom(13);
            searchCoordinates(marker.getLatLng().lat, Number($(this).val()));
            $(".setgps").attr('data-gpsvalue',marker.getLatLng().lat+','+Number($(this).val()));
        });

        $("#" + option.radiusId).val(r);
        $("#" + option.radiusId).on('change', function () {
            circle.setRadius(Number($(this).val()));
        });

        $("#" + option.addressId).on('change', function () {
            var item = searchLocation($(this).val(), newLocation);
        });

        $("#getLocation").on('click', function () {
            getLocation();
        });

        function newLocation(item) {
            $("#" + option.latitudeId).val(item.lat);
            $("#" + option.longitudeId).val(item.lon);
            marker.setLatLng([item.lat, item.lon]);
            circle.setLatLng([item.lat, item.lon]);
            map.setView([item.lat, item.lon]);
            //map.setZoom(13);
            searchCoordinates(item.lat, item.lon);
            $(".setgps").attr('data-gpsvalue',item.lat+','+item.lon);
        }

        /*
        var osmGeocoder = new L.Control.OSMGeocoder({
            collapsed: false,
            position: 'bottomright',
            text: 'Find!',
        });
        map.addControl(osmGeocoder);
        */
    };

    function searchLocation(text, callback) {
        var requestUrl = "http://nominatim.openstreetmap.org/search?format=json&q=" + text;
        $.ajax({
            url: requestUrl,
            type: "GET",
            dataType: 'json',
            error: function (err) {
                console.log(err);
            },
            success: function (data) {
                console.log(data);
                var item = data[0];
                callback(item);
            }
        });
    }

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.watchPosition(showPosition, showError);
        } else {
            app.helper.showErrorNotification({ 'message': 'Geolocation is not supported by this browser.' });
        }
    }

    function showPosition(position) {
        var lat = position.coords.latitude.toString();
        var lon = position.coords.longitude.toString();
        if (lat.length > 10)
            lat = lat.substring(0, 10);
        if (lon.length > 10)
            lon = lon.substring(0, 10);

        $("#latitude").val(lat);
        $("#longitude").val(lon);
        $(".setgps").attr('data-gpsvalue',lat+','+lon);
        marker.setLatLng([lat, lon]);
        circle.setLatLng(marker.getLatLng());
        map.setView(marker.getLatLng());
        map.setZoom(15);
        searchCoordinates(lat,lon);
    }

    function searchCoordinates(lat, lon) {
        var requestUrl = "https://nominatim.openstreetmap.org/reverse?format=json&lat="+lat+"&lon="+lon+"&accept-language=fa_ir";
        var locationlang = jQuery('body').data('language');
        $.ajax({
            url: requestUrl,
            type: "GET",
            dataType: 'json',
            error: function (err) {
                $("#locationName").html("");
                //console.log(err);
            },
            success: function (data) {
                //console.log(data);
                var locationname = data.display_name;
                if (locationlang == "fa_ir") {
                    locationname = data.display_name.split(",")
                    locationname.reverse();
                    for( var i = 0; i < locationname.length; i++){
                        if ( !isNaN(locationname[i])) {
                            locationname.splice(i, 1);
                        }
                    }
                    //console.log(locationname);
                    locationname = locationname.join();
                }
                $("#locationName").html(locationname);

            }
        });
    };

    return app;
})();

$(document).ready(function(){
    OSMPICKER.initmappicker(gpslat, gpslon, 300, gpszoom, {
        addressId: "address",
        latitudeId: "latitude",
        longitudeId: "longitude",
        radiusId: "radius"
    });

/*    $(document).on('hidden.bs.modal', function () {
        window.alert('hidden event fired!');
    });*/

});
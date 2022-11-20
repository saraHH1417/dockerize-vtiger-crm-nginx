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
{strip}
<div class="listViewPageDiv">
    <div class="container-fluid">
        <div class="row">

            <div class="col-sm-12 col-xs-12">
                <form class="form-horizontal recordEditView" id="ParsVTSettings" name="edit" method="post" action="index.php" enctype="multipart/form-data">

                    <div class="editViewBody">
                        <div class="editViewContents">
                            <input type="hidden" name="module" value="{$MODULE}">
                            <input type="hidden" name="action" value="Save">
                            <input type="hidden" name="mode" value="SavePreferences">
                            <input type="hidden" name="view" value="{$smarty.get.view}">
                            <div name="editContent">
                                {foreach key=key item=item from=$PARSVTBLOCKS}
                                <div class="fieldBlockContainer">
                                    <div>
                                        <h4>{vtranslate($key,$MODULE)}</h4></div>
                                    <hr>
                                    <table class="table table-borderless">
                                        <tbody>
                                            <tr>
                                                {assign var=COUNTER value=0} {foreach key=fieldid item=fieldvalue from=$item} {assign var="FIELD_NAME" value=$fieldvalue['fieldname']} {assign var="FIELD_LABEL" value=$fieldvalue['fieldlabel']} {assign var="FIELD_COLUMN" value=$fieldvalue['columnname']}

                                                <td class="fieldLabel alignMiddle">{vtranslate($fieldvalue['fieldlabel'],$MODULE)}&nbsp; </td>
                                                <td class="fieldValue" style="width:25%">
                                                    {if $fieldvalue['uitype'] eq '56'}
                                                    <input type="hidden" name="{$FIELD_NAME}" value=0 />
                                                    <input id="{$MODULE}_editView_fieldName_{$FIELD_NAME}" class="inputElement" style="width:15px;height:15px;" data-fieldname="{$FIELD_NAME}" data-fieldtype="checkbox" type="checkbox" name="{$FIELD_NAME}" {if $UserValues[$FIELD_COLUMN] eq '1'} checked {/if}/> 
                                                    {elseif $fieldvalue['uitype'] eq '16' || $fieldvalue['uitype'] eq '17'}
                                                    <select data-fieldname="{$FIELD_NAME}" data-fieldtype="picklist" class="inputElement select2" type="picklist" name="{$FIELD_NAME}" data-selected-value='{$UserValues[$FIELD_COLUMN]}'>
                                                        {foreach item=PICKLIST_VALUE from=${$fieldvalue['columnname']}}
                                                        <option value="{Vtiger_Util_Helper::toSafeHTML($PICKLIST_VALUE)}" {if $PICKLIST_VALUE eq $UserValues[$FIELD_COLUMN]} selected {/if}>{if $fieldvalue['columnname'] eq 'time_zone'}{vtranslate($PICKLIST_VALUE,'Users')}{else}{vtranslate($PICKLIST_VALUE,$MODULE)}{/if}</option>
                                                        {/foreach}
                                                    </select>

                                                    {/if}
                                                </td>

                                                {if $COUNTER eq 1}
                                            </tr>
                                            <tr>
                                                {assign var=COUNTER value=0} {else} {assign var=COUNTER value=$COUNTER+1} {/if} {/foreach} {if $COUNTER is odd}
                                                <td></td>
                                                <td></td>
                                                {/if}

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                {/foreach}

                                {if $SALAH}
                                <div class="fieldBlockContainer">
                                    <h4 class="fieldBlockHeader">{vtranslate('Your Location',$MODULE)}</h4>
                                    <hr>
                                    <table class="table table-borderless">
                                        <tbody>
                                            <tr id="SelectGPSAuto" {if $custom eq '1'}style="display:none"{/if}>
                                                <td class="fieldLabel alignMiddle">{vtranslate('LBL_SELECT_COUNTRY','Users')}&nbsp;</td>
                                                <td class="fieldValue">
                                                    <select id="country" data-fieldname="country" data-fieldtype="picklist" class="inputElement select2" type="picklist" name="country" data-selected-value='{$country}'>
                                                        {foreach item=TCOUNTRY from=$COUNTIRES}
                                                        <option value="{Vtiger_Util_Helper::toSafeHTML($TCOUNTRY)}" {if $country eq $TCOUNTRY} selected {/if}>{vtranslate($TCOUNTRY,$MODULE)}</option>
                                                        {/foreach}
                                                    </select>

                                                </td>
                                                <td class="fieldLabel alignMiddle">{vtranslate('City',$MODULE)}&nbsp;</td>
                                                <td class="fieldValue">
                                                    <select id="city" name="city" data-fieldname="city" data-fieldtype="picklist" class="inputElement select2" type="picklist" data-selected-value='{$city}'>
                                                        {$CITIES}
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fieldLabel alignMiddle">{vtranslate('Latitude',$MODULE)}&nbsp;</td>
                                                <td class="fieldValue">
                                                    <input  id="latitude" type="text" name="latitude" value="{$latitude}" class="inputElement" style="direction:ltr; text-align:left"  {if $custom neq '1'}readonly{/if} maxlength="10" />
                                                    <div id="errorLatLng" style="color:red"></div>
                                                </td>
                                                <td class="fieldLabel alignMiddle">{vtranslate('Longitude',$MODULE)}&nbsp;</td>
                                                <td class="fieldValue">                
                                                    <input  id="longitude" type="text" name="longitude" value="{$longitude}" class="inputElement"  style="direction:ltr; text-align:left"  {if $custom neq '1'}readonly{/if} maxlength="10" />
                                                    <div id="errorLonLng" style="color:red"></div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="fieldLabel alignMiddle">{vtranslate('Custom Coordinates',$MODULE)}&nbsp;</td>
                                                <td class="fieldValue">
                                                    <input type="hidden" name="custom" value=0 />
                                                    <input id="{$MODULE}_editView_fieldName_custom" class="inputElement" style="width:15px;height:15px;" data-fieldname="custom" data-fieldtype="checkbox" type="checkbox" name="custom" {if $custom eq '1'} checked {/if}/>

                                                    <button id="getLocation" class="btn btn-info" type="button" {if $custom neq '1'}style="display: none"{/if}>{vtranslate('Get Current Position', $MODULE)}</button>
                                                    <input  id="cityname"  type="hidden" name="cityname" value="{$city}"/>
                                                </td>
                                                <td>{vtranslate('Prayer Time Calculation Method',$MODULE)}&nbsp;</td>
                                                <td>
                                                <select id="adhanmethod" name="adhanmethod" data-fieldname="adhanmethod" data-fieldtype="picklist" class="inputElement select2" type="picklist" data-selected-value='{$adhanmethod}'>
                                                	<option value="0" {if $adhanmethod eq '0'}selected{/if}>{vtranslate('Shia Ithna-Ashari',$MODULE)}</option>
                                                	<option value="1" {if $adhanmethod eq '1'}selected{/if}>{vtranslate('University of Islamic Sciences, Karachi',$MODULE)}</option>
                                                	<option value="2" {if $adhanmethod eq '2'}selected{/if}>{vtranslate('Islamic Society of North America (ISNA)',$MODULE)}</option>
                                                	<option value="3" {if $adhanmethod eq '3'}selected{/if}>{vtranslate('Muslim World League (MWL)',$MODULE)}</option>
                                                	<option value="4" {if $adhanmethod eq '4'}selected{/if}>{vtranslate('Umm al-Qura, Makkah',$MODULE)}</option>
                                                	<option value="5" {if $adhanmethod eq '5'}selected{/if}>{vtranslate('Egyptian General Authority of Survey',$MODULE)}</option>
                                                	<option value="7" {if $adhanmethod eq '7'}selected{/if}>{vtranslate('Institute of Geophysics, University of Tehran',$MODULE)}</option>
                                                </select>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                {/if}




                            </div>
                        </div>
                    </div>
                    <div class="modal-overlay-footer clearfix">
                        <div class="row clearfix">
                            <div class="textAlignCenter col-lg-12 col-md-12 col-sm-12 ">
                                <button id="SaveParsVTPreferences" type="submit" class="btn btn-success saveButton">{vtranslate('LBL_SAVE', $MODULE)}</button>&nbsp;</div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{/strip}

<script>
function ValidateGPSPoint(value) {
     var latlngVal = {literal}/^-?([0-8]?[0-9]|90)\.[0-9]{1,7}$/;{/literal}
     return (latlngVal.test(value));
}

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition(showPosition, showError);
    } else {
        app.helper.showErrorNotification({ 'message': '{vtranslate("Geolocation is not supported by this browser.", $MODULE)}' });
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
$(function() {

    $("#SaveParsVTPreferences").on('click', function () {
        var progressIndicatorElement = jQuery.progressIndicator({
            'message': "{vtranslate("LBL_LOADING_PLEASE_WAIT",$MODULE)}",
            'position': 'html',
            'blockInfo': {
                'enabled': true
            }
        });

        $("#ParsVTSettings").submit();
    });
    $("#getLocation").on('click', function () {
        getLocation();
    });

    $("#ParsVTSettings").submit(function(){
        if ( !$("#longitude").length || !$("#latitude").length) return true;
        var lonlng = $("#longitude").val();
        var latlng = $("#latitude").val();
        if(!ValidateGPSPoint(lonlng)) {
            $("#errorLonLng").html("{vtranslate("This coordinate is not valid!",$MODULE)}");
            app.helper.hideProgress();
            return false;
        }
        if(!ValidateGPSPoint(latlng)) {
            $("#errorLatLng").html("{vtranslate("This coordinate is not valid!",$MODULE)}");
            app.helper.hideProgress();
            return false;
        }
    });
    $("#latitude").keydown(function(event) {
        var latlng = $("#latitude").val();
        if(!ValidateGPSPoint(latlng)) {
                $("#errorLatLng").html("{vtranslate("This coordinate is not valid!",$MODULE)}");
        }else{
                $("#errorLatLng").html("");
        } 
    });
    $("#longitude").keydown(function(event) {
        var lonlng = $("#longitude").val();
        if(!ValidateGPSPoint(lonlng)) {
                $("#errorLonLng").html("{vtranslate("This coordinate is not valid!",$MODULE)}");
        }else{
                $("#errorLonLng").html("");
        } 
    });

    $("#{$MODULE}_editView_fieldName_custom").change(function() {
       if(this.checked) {
          $("#longitude").prop("readonly", false);
          $("#latitude").prop("readonly", false);
          $("#SelectGPSAuto").hide();
          $("#getLocation").show();
       } else {
          $("#longitude").prop("readonly", true);
          $("#latitude").prop("readonly", true);
          $("#SelectGPSAuto").show();
          $("#getLocation").hide();
       }
     });


    $("#country").change(function(e) {
        var $target = $(e.target).find(':selected');
        if ($target.is('option')) {
            if ($target.val() != '') {
                var url = 'index.php';
                var params = {};
                params['module'] = '{$MODULE}';
                params['action'] = 'SalahTime';
                params['mode'] = 'GetCities';
                params['country'] = $target.val();
                if (typeof csrfMagicToken == 'undefined')
                    params['tokenname'] = csrfMagicName;
                if (typeof csrfMagicToken == 'undefined')
                    params['tokenval'] = csrfMagicToken;
                $.post(url, params, function(data) {
                    if (data.success) {
                        $("#city").html('');
                        $("#city").append(data.result);
                        $("#city").select2();

                    } 
                });
            }
        }
    });
    $("#city").change(function(e) {
        var $target = $(e.target).find(':selected');
        if ($target.is('option')) {
            if ($target.val() != '') {
                var url = 'index.php';
                var city = $target.val();
                var params = {};
                params['module'] = '{$MODULE}';
                params['action'] = 'SalahTime';
                params['mode'] = 'GetCity';
                params['city'] = city;
                if (typeof csrfMagicToken == 'undefined')
                    params['tokenname'] = csrfMagicName;
                if (typeof csrfMagicToken == 'undefined')
                    params['tokenval'] = csrfMagicToken;
                $.post(url, params, function(data) {
                    if (data.success && city == data.result.id) {
                        $("#latitude").val(data.result.latitude);
                        $("#longitude").val(data.result.longitude);
                        $("#cityname").val(data.result.city);
                    } 
                });
            }
        }
    });
});
</script>
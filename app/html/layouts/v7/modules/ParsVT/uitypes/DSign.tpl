{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
  *
 ********************************************************************************/
-->*}
{strip}
    <meta charset="utf-8">
    <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
       Remove this if you use the .htaccess -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="initial-scale=1.0, target-densitydpi=device-dpi"/>
    <!-- this is for mobile (Android) Chrome -->
    <meta name="viewport" content="initial-scale=.5, width=device-height">
    <!--  mobile Safari, FireFox, Opera Mobile  -->
    <script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Signature/jSignature.min.js"></script>
    <script src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/Signature/plugins/jSignature.CompressorBase30.min.js"></script>
    <style type="text/css">
        #signatureparent {
            color: darkblue;
            background-color: darkgrey;
            /*max-width:600px;*/
            padding: 20px;
        }

        /*This is the div within which the signature canvas is fitted*/
        .signature {
            border: 2px dotted black;
            background-color: lightgrey;
            width: 300px;
            height: 80px;
            position: left;
            left: e . pageX;
            top: e . pageY;
        }

        /* Drawing the 'gripper' for touch-enabled devices */
        html.touch #content {
            float: left;
            width: 52%;
        }

        html.touch #scrollgrabber {
            width: 4%;
            margin-right: 2%;
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAFCAAAAACh79lDAAAAAXNSR0IArs4c6QAAABJJREFUCB1jmMmQxjCT4T/DfwAPLgOXlrt3IwAAAABJRU5ErkJggg==)
        }

        span[name=existingImages] img {
            height: 100px;
            width: 300px;
        }

    </style>
    <div id="desiner{$FIELD_MODEL->getFieldName()}">
        <div id="signature{$FIELD_MODEL->getFieldName()}" class='signature'></div>
        <img id="sigimage{$FIELD_MODEL->getFieldName()}">
        <div style="display: inline-block;">
            <p>
                <input id="donebutton{$FIELD_MODEL->getFieldName()}" type="button"
                       value="{vtranslate('Done','ParsVT')}">
                <input id="clearbutton{$FIELD_MODEL->getFieldName()}" type="button"
                       value="{vtranslate('Clear','ParsVT')}">
            </p>
            <input name="{$FIELD_MODEL->getFieldName()}" value="{$FIELD_MODEL->get('fieldvalue')}"
                   id="idimagedata{$FIELD_MODEL->getFieldName()}" type="hidden"/>
        </div>
        <div id="img_preview"></div>
    </div>
    {assign var="FIELD_INFO" value=Vtiger_Util_Helper::toSafeHTML(Zend_Json::encode($FIELD_MODEL->getFieldInfo()))}
    {assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
    {assign var="FIELD_NAME" value=$FIELD_MODEL->get('name')}
    {if $FIELD_MODEL->get('fieldvalue') != ''}
        <div class="row">
			<span class="col-lg-8" name="existingImages">
			<img src="{$FIELD_MODEL->get('fieldvalue')}" data-image-id="{$FIELD_MODEL->getFieldName()}" width="150"
                 height="80"></span>
            <span class="col-lg-3">
				<span class="row">
				<input type="button" value="{vtranslate('LBL_EDIT',$QUALIFIED_MODULE)}" class="signEdit{$FIELD_MODEL->getFieldName()}">
				<input type="button" id="file_{$ITER}" value="{vtranslate('LBL_DELETE',$QUALIFIED_MODULE)}"
                       class="signDelete{$FIELD_MODEL->getFieldName()}">
                </span>
			</span>
        </div>
        {assign var="WHODID" value=Vtiger_Dsign_UIType::getDisplayNameValue($FIELD_MODEL->getFieldName())}
        {if $WHODID && !empty($WHODID)}
            <div class="row">
                <span class="col-lg-11">
                {vtranslate('Signed by','ParsVT')}: {$WHODID}
                </span>
            </div>
        {/if}
    {/if}


{/strip}


<script type="text/javascript">
    jQuery(document).ready(function () {

        var field_name = "{$FIELD_MODEL->getFieldName()}";
        jQuery("#signature" + field_name).jSignature();
        {if $FIELD_MODEL->get('fieldvalue') != ''}
            jQuery("#desiner{$FIELD_MODEL->getFieldName()}").hide();
        {/if}
        jQuery('#donebutton' + field_name).click(function () {
            var signatureCheck = jQuery('#signature' + field_name).jSignature('getData', 'image');
            if (signatureCheck.length === 0) {
                alert('Signature required.');
            } else {
                jQuery('#sigimage' + field_name).attr('src', jQuery('#signature' + field_name).jSignature('getData'));
                jQuery('#sigimage' + field_name).show();
                var imagedata = jQuery('#signature' + field_name).jSignature('getData');
                jQuery('#idimagedata' + field_name).val(imagedata);
            }
        });
        jQuery('#clearbutton' + field_name).click(function () {
            jQuery('#signature' + field_name).jSignature('clear');
            jQuery('#signature' + field_name).show();
            jQuery('#sigimage' + field_name).hide();
        });
        jQuery('.signEdit{$FIELD_MODEL->getFieldName()}').click(function (element) {
            jQuery('#desiner{$FIELD_MODEL->getFieldName()}').show();
        });
        jQuery('.signDelete{$FIELD_MODEL->getFieldName()}').click(function (element) {
            var file_id = jQuery(this).id;
            var formElement = jQuery('#EditView');
            jQuery('#idimagedata{$FIELD_MODEL->getFieldName()}').val('');
            jQuery('#desiner{$FIELD_MODEL->getFieldName()}').show();
            var recordId = formElement.find('input[name="record"]').val();
            var element = jQuery(this);
            var imageId = element.closest('div').find('img').data().imageId;
            //console.log(element);
            element.closest('div').remove();
            //var exisitingImages = parentTd.find('[name="existingImages"]');
            if (formElement.find('[name=imageid]').length != 0) {
                var imageIdValue = JSON.parse(formElement.find('[name=imageid]').val());
                imageIdValue.push(imageId);
                formElement.find('[name=imageid]').val(JSON.stringify(imageIdValue));
            } else {
                var imageIdJson = [];
                imageIdJson.push(imageId);
                formElement.append('<input type="hidden" name="signDeleted" value="true" />');
                formElement.append('<input type="hidden" name="imageid" value="' + JSON.stringify(imageIdJson) + '" />');
            }
        });
    });
</script>
 
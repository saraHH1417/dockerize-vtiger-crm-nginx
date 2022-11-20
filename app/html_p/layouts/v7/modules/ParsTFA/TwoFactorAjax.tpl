{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{strip}
<script> 
$(document).ready(function(){

var newurl = $('input#NEWURL').val();
var secret = $('input#NewSecret').val();
var newurl = $('input#NEWURL').val();
var d = new Date(Date({$tosectime}));
    setInterval(function() {
        d.setSeconds(d.getSeconds() + 1);
        $('#timer').text((d.getHours() +':' + d.getMinutes() + ':' + d.getSeconds() ));
    }, 1000);

function splitNChars(txt, num) {
    var result = [];
    for (var i = 0; i < txt.length; i += num) {
        result.push(txt.substr(i, num));
    }
    var output = '';
    for (var i = 0; i < result.length; i++) {
    output += result[i] + "   ";
    }
    return output;
}

function checkValidation() {
var value = $('#validatekey').val();
if (value.length == 6 && !isNaN(value)) {
   return true;
}
}

    $(document).on('click', "#step2", function() {
        $('#qrdiv').show();
        $('#devicelist').hide();
        $('#newqr').html('<div id="qrcodeCanvas" style="margin:15px;"></div>');
        $('#qrcodeCanvas').qrcode({  text	: newurl });
        var secret = $('input#NewSecret').val();
        $('#auth-key').html(splitNChars(secret, 4));
        $('#step2').attr("id", "CheckKey");
        $('#CheckKey').text("{vtranslate("Check Key", $MODULE)}");
        $('#CheckKey').toggleClass('btn-inverse btn-info');

    });
    $(document).on('click', "#CheckKey", function() {
           if (checkValidation()) {
           $(this).html("{vtranslate('Please Wait ...',$MODULE)}");
           $(this).attr('disabled', 'disabled');
           $('#validatekey').attr('disabled', 'disabled');
           var url = 'index.php?module=ParsTFA&parent=Settings&action=ValidateKey';
	   var val = $('#validatekey').val();
	   var device = $('#choosedevice').val();
	   $.post(url,{ Key:val,Secret:secret,Device:device,ID:{$USERID} },function(s){
                var obj = $.parseJSON(s);
		if(obj[0] == 'Valid'){
			$('#devicelist').hide();
			$('#result').html(obj[2]);
			$('#alert').show();
			$('#alert').removeClass("alert-error");
			$('#alert').addClass(obj[1]);
			$('#qrdiv').hide();
			$('.close').hide();
                        $('#CheckKey').text("{vtranslate('LBL_CLOSE')}");
                        $('#CheckKey').removeAttr('disabled'); 
                        $('#CheckKey').toggleClass('btn-inverse btn-success');
                        $('#CheckKey').attr("id", "Finish");
			
		} else if (obj[0] == 'Invalid') {
			$('#result').html(obj[2]);
			$('#alert').addClass(obj[1]);
			$('#alert').show();
                        $('#validatekey').removeAttr('disabled'); 
                        $('#CheckKey').removeAttr('disabled'); 
                        $('#CheckKey').text("{vtranslate("Check Key", $MODULE)}");
                        $('#CheckKey').toggleClass('btn-info btn-inverse');


		} else {
			$('#result').html("{vtranslate("Unkown Error", $MODULE)}");
			$('#alert').addClass("alert-error");
			$('#alert').show();
                        $('#validatekey').removeAttr('disabled'); 
                        $('#CheckKey').removeAttr('disabled'); 
                        $('#CheckKey').text("{vtranslate("Check Key", $MODULE)}");
                        $('#CheckKey').toggleClass('btn-info btn-inverse');
                }
           });

          }

                 
           });
     $(document).on('click', "#Finish", function() {
        location.reload();
        });



});

</script> 

    <div id="massEditContainer" class='modal-dialog' style='width:450px'>
        {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=vtranslate('Setup Two Step Verification Software', $MODULE)}
        <div class="modal-content">
            <input type="hidden" name="module" value="{$MODULE}" />
            <input type="hidden" id="userid" name="userid" value="{$USERID}" />
            <div name='massEditContent'>
                <div class="modal-body">
<center>

<label>{vtranslate('Today')}: {$TODAYDATE} <span id="timer"></span></label>

                    <div class="control-group" id="devicelist">
                        <label class="control-label">{vtranslate('Operating System Type:', $MODULE)}</label>
                        <div class="controls">
                           <select class="select2" name="DEVICE" id="choosedevice">{$LISTDEVICES}</select>
                        </div>
                    </div>

                    <div class="control-group" id="qrdiv" style="display:none;">
                        <label class="control-label">{vtranslate('Scan QR code or Enter Key manually', $MODULE)}</label>
                        <div class="controls">
                            <div id="newqr"><div id="qrcodeCanvas" style="margin:15px;"></div></div>

                            <div style="padding: 10px;background-color: #FFD633;width: 20em;text-align: center;">
                            <div style="font-size: 14px;font-weight: bold;line-height: 1.5;" dir="ltr" id="auth-key"></div>
                            <div style="font-size: 80%;color: #666;">
                            {vtranslate("Spaces don't matter.", $MODULE)}
                            </div>
                            </div><br />
			    <input type="text" name="validatekey" id="validatekey"  pattern="[0-9-]+" min="6" max="6" maxlength="6" required>
                            	
                    </div>
                </div>

                </center>	
            </div>
            </div>
            <div class="modal-footer">
                <div class="row-fluid">
                        <div id="alert" class="alert" style="display:none;"><a class="icon-remove" data-dismiss="alert"></a>&nbsp;&nbsp;<span id="result"></span></div>
                        <button id="step2" class="btn btn-primary" type="button" style="margin: 0 5px;"><strong>{vtranslate('Next Step', $MODULE)}</button>
                </div>
            </div>

	

</div>
{/strip}

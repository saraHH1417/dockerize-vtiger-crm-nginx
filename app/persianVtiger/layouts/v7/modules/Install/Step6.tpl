{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}

<form class="form-horizontal" name="step6" method="post" action="index.php">
	<input type=hidden name="module" value="Install" />
	<input type=hidden name="view" value="Index" />
	<input type=hidden name="mode" value="Step7" />
	<input type=hidden name="auth_key" value="{$AUTH_KEY}" />

	<div class="row main-container">
		<div class="inner-container">
			<div class="row">
				<div class="col-sm-10">
					<h4>{vtranslate('LBL_ONE_LAST_THING','Install')}</h4>
				</div>
				<div class="col-sm-2">
					<a href="http://vtfarsi.ir/crm-wiki/" target="_blank" class="pull-right">
						<img src="{'help.png'|vimage_path}" alt="Help-Icon"/>
					</a>
				</div>
			</div>
			<hr>
			<div class="offset2 row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<table class="config-table input-table">
						<tbody>
							<tr>
								<td>
									<strong>{vtranslate('Please let us know your Industry','Install')}</strong> <span class="no">*</span>
								</td>
								<td>
									<select name="industry" class="select2" required="true" style="width:250px;" placeholder="Choose one...">
										<option value=""></option> 
										<option>{vtranslate('Accounting','Install')}</option>
										<option>{vtranslate('Advertising','Install')}</option>
										<option>{vtranslate('Agriculture','Install')}</option>
										<option>{vtranslate('Apparel & Accessories','Install')}</option>
										<option>{vtranslate('Automotive','Install')}</option>
										<option>{vtranslate('Banking & Financial Services','Install')}</option>
										<option>{vtranslate('Biotechnology','Install')}</option>
										<option>{vtranslate('Call Centers','Install')}</option>
										<option>{vtranslate('Careers/Employment','Install')}</option>
										<option>{vtranslate('Chemical','Install')}</option>
										<option>{vtranslate('Computer Hardware','Install')}</option>
										<option>{vtranslate('Computer Software','Install')}</option>
										<option>{vtranslate('Consulting','Install')}</option>
										<option>{vtranslate('Construction','Install')}</option>
										<option>{vtranslate('Education','Install')}</option>
										<option>{vtranslate('Energy Services','Install')}</option>
										<option>{vtranslate('Engineering','Install')}</option>
										<option>{vtranslate('Entertainment','Install')}</option>
										<option>{vtranslate('Financial','Install')}</option>
										<option>{vtranslate('Food & Food Service','Install')}</option>
										<option>{vtranslate('Government','Install')}</option>
										<option>{vtranslate('Health care','Install')}</option>
										<option>{vtranslate('Insurance','Install')}</option>
										<option>{vtranslate('Legal','Install')}</option>
										<option>{vtranslate('Logistics','Install')}</option>
										<option>{vtranslate('Manufacturing','Install')}</option>
										<option>{vtranslate('Media & Production','Install')}</option>
										<option>{vtranslate('Non-profit','Install')}</option>
										<option>{vtranslate('Pharmaceutical','Install')}</option>
										<option>{vtranslate('Real Estate','Install')}</option>
										<option>{vtranslate('Rental','Install')}</option>
										<option>{vtranslate('Retail & Wholesale','Install')}</option>
										<option>{vtranslate('Security','Install')}</option>
										<option>{vtranslate('Service','Install')}</option>
										<option>{vtranslate('Sports','Install')}</option>
										<option>{vtranslate('Telecommunications','Install')}</option>
										<option>{vtranslate('Transportation','Install')}</option>
										<option>{vtranslate('Travel & Tourism','Install')}</option>
										<option>{vtranslate('Utilities','Install')}</option>
										<option>{vtranslate('Other','Install')}</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									{vtranslate('We collect anonymous information (Country, OS) to help us improve future versions of Vtiger. Data about how CRM is used and where it is being used helps us identify the areas in the product that need to be enhanced. We use this data to improve your experience with Vtiger. None of the data collected here can be linked back to an individual.','Install')}
								</td>
							</tr>
						</tbody>
					</table>
					<table class="config-table input-table">
						<tbody>
							<tr>
								<td colspan="2">
									<strong>{vtranslate('Parsvtiger License Key:','Install')}</strong> <span class="no">*</span>
								</td>
							</tr>
							<tr>
								<td>
								<input type="text" id="license" name="license" style="min-width: 300px; text-align: left; direction: ltr"><span id="licenseok"></span>
								</td>
								<td><input value="{vtranslate('Check Key','Install')}"  id="checkkey" name="checkkey" class="btn btn-large btn-info"  type="button"></input>	</td>
							</tr>
						</tbody>
					</table>
					<div id="showstatus"></div>
				</div>
			</div>
			<div class="row offset2">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div class="button-container">
						<input type="button" class="btn btn-large btn-primary" value="{vtranslate('LBL_NEXT','Install')}" name="step7" style="display:none"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div id="progressIndicator" class="row main-container hide">
	<div class="inner-container">
		<div class="inner-container">
			<div class="row">
				<div class="col-sm-12 welcome-div alignCenter">
					<h3>{vtranslate('LBL_INSTALLATION_IN_PROGRESS','Install')}...</h3><br>
					<img src="{'install_loading.gif'|vimage_path}"/>
					<h6>{vtranslate('LBL_PLEASE_WAIT','Install')}.... </h6>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="checkprogressIndicator" class="row main-container hide" style="position: absolute; top: 0; right: 0; bottom: 0; left: 0;     background: rgba(255, 255, 255, .7) !important;">
	<div class="inner-container">
		<div class="inner-container">
			<div class="row">
				<div class="col-sm-12 welcome-div alignCenter">
					<img src="{'install_loading.gif'|vimage_path}"/>
					<h6>{vtranslate('LBL_PLEASE_WAIT','Install')}.... </h6>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$('#checkkey').click(function(){
	var url = 'index.php';
	var val = $('#license').val();
    var buttonsInfo = {
        cancel: {
            label: "",
            className : 'hide no-print'
        },
        confirm: {
            label: "{vtranslate('OK','Install')}",
            className : 'confirm-box-ok confirm-box-btn-pad btn-danger'
        }
    };

    if(val == ''){
        app.helper.showConfirmationBox({ 'message': '{vtranslate('Please Enter Your License Key!','Install') }', 'title': '{vtranslate('Error','Install') }' ,'buttons': buttonsInfo}).then(
            function () {
                return false;
            },
            function (error, err) {
                return false;
            }
        );
        return false;
    }

    if(val.length < 20 || !val.startsWith("Pars")){
        app.helper.showConfirmationBox({ 'message': '{vtranslate('Please Enter Valid License Key!','Install') }', 'title': '{vtranslate('Error','Install') }' ,'buttons': buttonsInfo}).then(
            function () {
                return false;
            },
            function (error, err) {
                return false;
            }
        );
        return false;
    }

    jQuery('#checkprogressIndicator').removeClass('hide').addClass('show');

    var params = {
        '_key' : val,
    };
	$.post('modules/Migration/actions/Setup.php',params,function(s){
        jQuery('#checkprogressIndicator').removeClass('show').addClass('hide');
        if (/^[\],:{}\s]*$/.test(s.replace(/\\["\\\/bfnrtu]/g, '@').
        replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
        replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
            var obj = $.parseJSON(s);
            if (obj.success) {
                obj = $.parseJSON(obj.response);
                $('#showstatus').html(obj[1]);
                if (obj[0] == 'Active') {
                    $('input[name=step7]').show();
                    $('#checkkey').hide();
                    $('#license').attr('readonly', true);
                    $('#licenseok').html("<span style='color:green; padding:0 20px;'><strong>{vtranslate('Valid','Install')}</strong></span>");
                } else {
                    $('input[name=step7]').hide();
                }
            } else if (obj.response) {
                $('#showstatus').html(obj.response);
            }
        }
        jQuery('#checkprogressIndicator').removeClass('show').addClass('hide');
    });
});
</script>
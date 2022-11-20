<?php /* Smarty version Smarty-3.1.7, created on 2022-11-20 16:19:24
         compiled from "/var/www/html/includes/runtime/../../layouts/v7/modules/Install/Step6.tpl" */ ?>
<?php /*%%SmartyHeaderCode:206939768637a225427aee0-20863677%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5512c711a039070ff82f09ff28b5fba24f1d5f0f' => 
    array (
      0 => '/var/www/html/includes/runtime/../../layouts/v7/modules/Install/Step6.tpl',
      1 => 1668948322,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '206939768637a225427aee0-20863677',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'AUTH_KEY' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_637a22542ba54',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_637a22542ba54')) {function content_637a22542ba54($_smarty_tpl) {?>

<form class="form-horizontal" name="step6" method="post" action="index.php">
	<input type=hidden name="module" value="Install" />
	<input type=hidden name="view" value="Index" />
	<input type=hidden name="mode" value="Step7" />
	<input type=hidden name="auth_key" value="<?php echo $_smarty_tpl->tpl_vars['AUTH_KEY']->value;?>
" />

	<div class="row main-container">
		<div class="inner-container">
			<div class="row">
				<div class="col-sm-10">
					<h4><?php echo vtranslate('LBL_ONE_LAST_THING','Install');?>
</h4>
				</div>
				<div class="col-sm-2">
					<a href="http://vtfarsi.ir/crm-wiki/" target="_blank" class="pull-right">
						<img src="<?php echo vimage_path('help.png');?>
" alt="Help-Icon"/>
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
									<strong><?php echo vtranslate('Please let us know your Industry','Install');?>
</strong> <span class="no">*</span>
								</td>
								<td>
									<select name="industry" class="select2" required="true" style="width:250px;" placeholder="Choose one...">
										<option value=""></option> 
										<option><?php echo vtranslate('Accounting','Install');?>
</option>
										<option><?php echo vtranslate('Advertising','Install');?>
</option>
										<option><?php echo vtranslate('Agriculture','Install');?>
</option>
										<option><?php echo vtranslate('Apparel & Accessories','Install');?>
</option>
										<option><?php echo vtranslate('Automotive','Install');?>
</option>
										<option><?php echo vtranslate('Banking & Financial Services','Install');?>
</option>
										<option><?php echo vtranslate('Biotechnology','Install');?>
</option>
										<option><?php echo vtranslate('Call Centers','Install');?>
</option>
										<option><?php echo vtranslate('Careers/Employment','Install');?>
</option>
										<option><?php echo vtranslate('Chemical','Install');?>
</option>
										<option><?php echo vtranslate('Computer Hardware','Install');?>
</option>
										<option><?php echo vtranslate('Computer Software','Install');?>
</option>
										<option><?php echo vtranslate('Consulting','Install');?>
</option>
										<option><?php echo vtranslate('Construction','Install');?>
</option>
										<option><?php echo vtranslate('Education','Install');?>
</option>
										<option><?php echo vtranslate('Energy Services','Install');?>
</option>
										<option><?php echo vtranslate('Engineering','Install');?>
</option>
										<option><?php echo vtranslate('Entertainment','Install');?>
</option>
										<option><?php echo vtranslate('Financial','Install');?>
</option>
										<option><?php echo vtranslate('Food & Food Service','Install');?>
</option>
										<option><?php echo vtranslate('Government','Install');?>
</option>
										<option><?php echo vtranslate('Health care','Install');?>
</option>
										<option><?php echo vtranslate('Insurance','Install');?>
</option>
										<option><?php echo vtranslate('Legal','Install');?>
</option>
										<option><?php echo vtranslate('Logistics','Install');?>
</option>
										<option><?php echo vtranslate('Manufacturing','Install');?>
</option>
										<option><?php echo vtranslate('Media & Production','Install');?>
</option>
										<option><?php echo vtranslate('Non-profit','Install');?>
</option>
										<option><?php echo vtranslate('Pharmaceutical','Install');?>
</option>
										<option><?php echo vtranslate('Real Estate','Install');?>
</option>
										<option><?php echo vtranslate('Rental','Install');?>
</option>
										<option><?php echo vtranslate('Retail & Wholesale','Install');?>
</option>
										<option><?php echo vtranslate('Security','Install');?>
</option>
										<option><?php echo vtranslate('Service','Install');?>
</option>
										<option><?php echo vtranslate('Sports','Install');?>
</option>
										<option><?php echo vtranslate('Telecommunications','Install');?>
</option>
										<option><?php echo vtranslate('Transportation','Install');?>
</option>
										<option><?php echo vtranslate('Travel & Tourism','Install');?>
</option>
										<option><?php echo vtranslate('Utilities','Install');?>
</option>
										<option><?php echo vtranslate('Other','Install');?>
</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<?php echo vtranslate('We collect anonymous information (Country, OS) to help us improve future versions of Vtiger. Data about how CRM is used and where it is being used helps us identify the areas in the product that need to be enhanced. We use this data to improve your experience with Vtiger. None of the data collected here can be linked back to an individual.','Install');?>

								</td>
							</tr>
						</tbody>
					</table>
					<table class="config-table input-table">
						<tbody>
							<tr>
								<td colspan="2">
									<strong><?php echo vtranslate('Parsvtiger License Key:','Install');?>
</strong> <span class="no">*</span>
								</td>
							</tr>
							<tr>
								<td>
								<input type="text" id="license" name="license" style="min-width: 300px; text-align: left; direction: ltr"><span id="licenseok"></span>
								</td>
								<td><input value="<?php echo vtranslate('Check Key','Install');?>
"  id="checkkey" name="checkkey" class="btn btn-large btn-info"  type="button"></input>	</td>
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
						<input type="button" class="btn btn-large btn-primary" value="<?php echo vtranslate('LBL_NEXT','Install');?>
" name="step7" style="display:none"/>
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
					<h3><?php echo vtranslate('LBL_INSTALLATION_IN_PROGRESS','Install');?>
...</h3><br>
					<img src="<?php echo vimage_path('install_loading.gif');?>
"/>
					<h6><?php echo vtranslate('LBL_PLEASE_WAIT','Install');?>
.... </h6>
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
					<img src="<?php echo vimage_path('install_loading.gif');?>
"/>
					<h6><?php echo vtranslate('LBL_PLEASE_WAIT','Install');?>
.... </h6>
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
            label: "<?php echo vtranslate('OK','Install');?>
",
            className : 'confirm-box-ok confirm-box-btn-pad btn-danger'
        }
    };

    if(val == ''){
        app.helper.showConfirmationBox({ 'message': '<?php echo vtranslate('Please Enter Your License Key!','Install');?>
', 'title': '<?php echo vtranslate('Error','Install');?>
' ,'buttons': buttonsInfo}).then(
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
        app.helper.showConfirmationBox({ 'message': '<?php echo vtranslate('Please Enter Valid License Key!','Install');?>
', 'title': '<?php echo vtranslate('Error','Install');?>
' ,'buttons': buttonsInfo}).then(
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
                    $('#licenseok').html("<span style='color:green; padding:0 20px;'><strong><?php echo vtranslate('Valid','Install');?>
</strong></span>");
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
</script><?php }} ?>
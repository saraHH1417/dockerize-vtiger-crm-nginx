<?php
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
chdir(dirname(__FILE__)."/../../../../");
include_once 'includes/Loader.php';
include_once 'vtlib/Vtiger/Module.php';
include_once 'includes/runtime/EntryPoint.php';
include_once 'modules/Emails/class.smtp.php';
include_once 'modules/Emails/class.phpmailer.php';
global $site_URL;
ini_set('display_errors','on'); error_reporting(E_ALL); // STRICT DEVELOPMENT
$site_URL = explode("modules/", $site_URL)[0];
Vtiger_Session::init();
global $current_user;
if (!$current_user) {
    $current_user = new Users();
    if (isset($_SESSION['authenticated_user_id']))
        $current_user->retrieveCurrentUserInfoFromFile($_SESSION['authenticated_user_id'], "Users");
    else {
        header("Location: " . $site_URL . "index.php");
        exit;
    }
}
if ($current_user->is_admin != 'on') {
    header("Location: " . $site_URL . "index.php");
    exit;
} else {
    $rtl = '';
    $rtl_languages = array('fa_ir', 'fa_af', 'ar_ae', 'ar_sa', 'ar_dz', 'ar_eg', 'ar_ma', 'ar_om', 'he_il', 'ur_pk', 'ku_iq', 'ps');

    $rtl .= "<link type='text/css' rel='stylesheet' href='" . $site_URL . "layouts/v7/lib/todc/css/bootstrap.min.css'>";
    if (in_array($current_user->language, $rtl_languages)) {
        $rtl .= '<link type="text/css" rel="stylesheet" href="' . $site_URL . 'modules/ParsVT/resources/styles/rtl.php" media="screen" />';
    }

    if ((!defined("DEMO_MODE") || !DEMO_MODE) && (!defined("CLOUD_MODE") || !CLOUD_MODE)) {
        if (!empty($_POST)) {
            echo sendParsVTMail($_POST); die;
        }
        echo '<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link type="text/css" rel="stylesheet" href="'.$site_URL.'layouts/v7/lib/todc/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="'.$site_URL.'layouts/v7/skins/marketing/style.css">
    <link type="text/css" rel="stylesheet" href="'.$site_URL.'layouts/v7/lib/jquery/select2/select2.css">
    <link type="text/css" rel="stylesheet" href="'.$site_URL.'layouts/v7/lib/select2-bootstrap/select2-bootstrap.css">
    <style>
    .ltrinput {
        direction: ltr !important;
        text-align: left;
    }
    .inputElement {
        height: 30px;
        width: 100%;
        border-radius: 1px;
        box-shadow: none;
        border: 1px solid #cccccc;
    }
    </style>';
    echo $rtl;
        echo '<script>
    var parentUrl = window.parent.location.href;
    var iframetUrl = window.location.href;
    if(parentUrl == iframetUrl){
        window.location.href = "'.$site_URL.'";
    }
    </script></head><body>';
        $module = "Settings:Vtiger";
        $viewer = new Vtiger_Viewer();
        $systemDetailsModel = Settings_Vtiger_Systems_Model::getInstanceFromServerType('email', 'OutgoingServer');
        $viewer->assign('MODEL',$systemDetailsModel);
        $viewer->assign('CURRENT_USER_MODEL', Users_Record_Model::getCurrentUserModel());
        $viewer->assign('QUALIFIED_MODULE', $module);
        $viewer->assign('MODULE', $module);
        $viewer->view("OutgoingServerEdit.tpl", $module);
        $toemail = "<tr><td class='fieldLabel'><label>".vtranslate("LBL_TO","Email")."</label></td><td class='fieldValue'><div class=' col-lg-6 col-md-6 col-sm-12'><input type='email' class='inputElement ltrinput' name='sendto_email_field' data-rule-email='true' data-rule-illegal='true' value='' required></div> </td></tr>";
        $saveoutgoing = "<tr><td class=' fieldLabel'><label>".vtranslate("Save as outgoing server","ParsVT")."</label></td><td class='' style='border-left: none;'><div class=' col-lg-6 col-md-6 col-sm-12'><input type='checkbox' name='save_outgoingserver'  value='0'></div></td></tr>";
        echo "<script  type='text/javascript' src='".$site_URL."layouts/v7/lib/jquery/jquery.min.js'></script>
<script type='text/javascript' src='".$site_URL."layouts/v7/lib/jquery/select2/select2.min.js'></script>
<script type='text/javascript' src='".$site_URL."layouts/v7/lib/todc/js/bootstrap.min.js'></script>
<script>
jQuery(document).ready(function() {
    var defaultError = '".vtranslate('LBL_TESTMAILSTATUS', "Settings:Vtiger")."<strong>".vtranslate('LBL_MAILSENDERROR', "Settings:Vtiger")."';
    var successMsg = '".vtranslate("LBL_MAIL_SENT_SUCCESSFULLY")."';
    jQuery('.select2').select2();
    jQuery('input[name=smtp_auth]').attr('name', 'smtp_auth');
    jQuery('.cancelLink').remove();
    jQuery('.alert-danger').css('text-align', 'center');
    jQuery('.alert-danger').addClass('emailmsg');
    jQuery('input[name=server]').prop('required',true);
    jQuery(\"".$toemail."\").insertBefore('#OutgoingServerForm > div > div.block > table > tbody > tr:nth-child(6)');
    jQuery(\"".$saveoutgoing."\").insertAfter('#OutgoingServerForm > div > div.block > table > tbody > tr:nth-child(8)');
    checkrequired();
    jQuery('input[name=save_outgoingserver]').change(function() {
        if (jQuery('input[name=save_outgoingserver]').is(':checked')) {
             jQuery('input[name=save_outgoingserver]').val(1);
        } else {
             jQuery('input[name=save_outgoingserver]').val(0);
        }
    });

    jQuery('#EditViewOutgoing > div > div').remove();
    jQuery('#OutgoingServerForm > div > div.block > div').remove();
    jQuery('#OutgoingServerForm > div > div.block > hr').remove();
    jQuery('input[type=text]').addClass('ltrinput');
    jQuery('div.modal-overlay-footer').removeClass('modal-overlay-footer');
    jQuery('input[type=email]').addClass('ltrinput');
    jQuery('input[type=password]').addClass('ltrinput');
    var form = jQuery('#OutgoingServerForm');
    form.find('[name=\"serverType\"]').on('change',function(e){
        var servertypevalue=form.find('[name=\"serverType\"]').val();
        form.find('[name=\"server\"]').val(servertypevalue);
        
        if(servertypevalue === \"mail.od1.vtiger.com\"){
           var vtigerUser= form.find('[name=\"vtigerServer\"]').data(\"username\");
           var vtigerpassword= form.find('[name=\"vtigerServer\"]').data(\"password\");
           var vtigeremail= form.find('[name=\"vtigerServer\"]').data(\"email\");
            form.find('[name=\"server_username\"]').val(vtigerUser);
            form.find('[name=\"server_password\"]').val(vtigerpassword);
            form.find('[name=\"from_email_field\"]').val(vtigeremail);
        }else{
            form.find('[name=\"server_username\"]').val(\"\");
            form.find('[name=\"server_password\"]').val(\"\");
            form.find('[name=\"from_email_field\"]').val(\"\");
        }
    });

    jQuery('form').on('submit', function (e) {
       e.preventDefault();     
            jQuery.post('".$_SERVER['PHP_SELF']."', jQuery('form').serialize())
            // Serialization looks good: name=textInNameInput&&telefon=textInPhoneInput etc
            .done(function(data) {
                jQuery('.errorMessage').removeClass('hide');   
                if (data.trim().length > 0) {
                    if (data == successMsg) {
                        jQuery('div.emailmsg').html(data);
                        jQuery('div.emailmsg').addClass('alert-success');   
                        jQuery('div.emailmsg').removeClass('alert-danger');   
                    } else {
                        jQuery('div.emailmsg').html(data);
                        jQuery('div.emailmsg').removeClass('alert-success');   
                        jQuery('div.emailmsg').addClass('alert-danger');   
                    }
                } else {
                    jQuery('div.emailmsg').removeClass('alert-success');   
                    jQuery('div.emailmsg').addClass('alert-danger');   
                    jQuery('div.emailmsg').html(defaultError);   
                }
            });
            return false;       
      });

});
function checkrequired() {
    if (jQuery('input[name=smtp_auth]').is(':checked')) {
        jQuery('input[name=server_username]').prop('required',true);
        jQuery('input[name=smtp_auth]').val(1);
    } else {
        jQuery('input[name=server_username]').prop('required',false);
        jQuery('input[name=smtp_auth]').val(0);
    }
}
</script>
</body>
</html>";

    } else {
        $module = "ParsVT";
        $viewer = new Vtiger_Viewer();
        $viewer->assign('QUALIFIED_MODULE', $module);
        $viewer->assign('MODULE', $module);
        $viewer->view("DemoMode.tpl", $module);


    }
}

function sendParsVTMail($REQUEST) {
    global $current_user;
    global $HELPDESK_SUPPORT_EMAIL_ID ,$HELPDESK_SUPPORT_NAME ;
    $default = false;
    $server_port = 0;
    $server_type = $id = $serverType = $server = $server_username = $server_password = $from_email_field = $sendto_email_field = '';
    $smtp_auth = 0;
    $save_outgoingserver = 0;
    $port = 25;
    foreach ($REQUEST as $key => $value) ${$key} = $value;
    ob_start(); // Turn on output buffering
    $mail = new PHPMailer();
    $subject = "Test Mail using PHP mailer " . date("Y-m-d H:i:s");
    $content = "<b>This is a test mail using PHP mailer class. please ignore!</b>";
    $mail->IsSMTP();
    $mail->SMTPDebug = 1;
    if ($smtp_auth == 1) $smtp_auth = true; else $smtp_auth = false;
    $mail->SMTPAuth = $smtp_auth;
    $server = strtolower($server);
    $returnValue = parse_url($server);
    if (!empty($returnValue['scheme'])) {
        if ($returnValue['scheme'] == 'tls') {
            $mail->SMTPSecure = "tls";
            $port = 587;
        } else if ($returnValue['scheme'] == 'ssl') {
            $mail->SMTPSecure = "ssl";
            $port = 465;
        }
    }
    if (!empty($returnValue['port'])) {
        $port = $returnValue['port'];
    }
    $mail->Port = $port;
    $mail->Username = $server_username;
    $mail->Password = $server_password;
    $mail->Host = $returnValue['host'];
    $mail->Mailer = "smtp";
    $receiver = getUserFullName($current_user->id);
    if (empty($receiver)) {
        $receiver = $HELPDESK_SUPPORT_NAME;
    }
    if (!empty($current_user->email1)) {
        $current_user_email = $current_user->email1;
    } else {
        $current_user_email = $HELPDESK_SUPPORT_EMAIL_ID;
    }

    if (empty($from_email_field)) {
        $from_email = $from_email_field;
    } else {
        $from_email = $current_user_email;
    }

    $mail->SetFrom($from_email, $receiver);
    $mail->AddReplyTo($current_user_email, $receiver);
    $mail->AddAddress($sendto_email_field);
    $mail->Subject = $subject;
    $mail->WordWrap = 80;
    $mail->MsgHTML($content);
    $mail->IsHTML(true);
    $response = $mail->Send();
    if (!$response) {
        echo "<br />Problem on sending mail<br />";
        echo vtranslate("LBL_FAILED_TO_SEND");
    } else {
        echo vtranslate("LBL_MAIL_SENT_SUCCESSFULLY");
        if ($save_outgoingserver == 1) {
            saveInstanceFromServerType();
        }
    }
    $output = ob_get_contents(); // Capture the output into a variable
    ob_clean(); // Clean (erase) the output buffer
    return $output;
}

function saveInstanceFromServerType() {
    $request = new Vtiger_Request($_REQUEST, $_REQUEST);
    $db = PearDatabase::getInstance();
    $query = 'SELECT * FROM vtiger_systems WHERE server_type=?';
    $params = array('email');
    $result = $db->pquery($query,$params);
    $instance = new Settings_Vtiger_Systems_Model();
    if($db->num_rows($result) > 0 ){
        $rowData = $db->query_result_rowdata($result,0);
        $instance->setData($rowData);
    }
    $instance->setData($request->getAll());
    $id = $instance->save($request);
    $data = $instance->getData();
    return $data;
}

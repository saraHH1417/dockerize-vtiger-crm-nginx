<?php
/* * *******************************************************************************
 * The content of this file is subject to the Asterisk Connector license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir Team
 * Portions created by VTFarsi.ir Team are Copyright(C) VTFarsi.ir Team
 * All Rights Reserved.
 * ****************************************************************************** */
$instagram_urls = array("cdninstagram.com","instagram.com","fbcdn.net","facebook.com","fbsbx.com");
if (isset($_REQUEST['proxy_url'])) {
    $url = urldecode($_REQUEST['proxy_url']);
    $finded = false;
    foreach ($instagram_urls as $instagram_url) {
        if (strpos($url, $instagram_url) !== false) {
            $finded = true;
            break;
        }
    }
    if (strpos($_REQUEST['proxy_url'], 'instagram.com/p') !== false) {
        header("Location: ".$url); exit();
    }
    if ($finded) {
        $arrContextOptions = array(
            "ssl" => array(
                "verify_peer" => false,
                "verify_peer_name" => false,
            ),
            'http' => array('
        ignore_errors' => true
            )
        );
        $data = file_get_contents($_REQUEST['proxy_url'], false, stream_context_create($arrContextOptions));
        if (ob_get_level() > 0) {
            foreach ($http_response_header as $response_header) {
                header($response_header);
            }
            ob_clean();
            flush();
        }
        echo $data;
        exit;
    }
}
header('Content-Type: image/png');
echo base64_decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABAQMAAAAl21bKAAAAA1BMVEUAAACnej3aAAAAAXRSTlMAQObYZgAAAApJREFUCNdjYAAAAAIAAeIhvDMAAAAASUVORK5CYII=');
exit;
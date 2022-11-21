<?php
#for check Token Expire Time in Webservice
$expirationTimeout = 3600; // (in seconds)
#get free api from here https://ocr.space/OCRAPI
$ocr_apikey = '01c15b00ab88957';
#caller id lookup source modules
$cid_lookup_modules = array (
   'Leads',
   'Contacts',
   'Accounts',
   'Vendors',
);
#allow anonymous download on GetFile method in rest2
$allow_anonymous_download = false;
?>
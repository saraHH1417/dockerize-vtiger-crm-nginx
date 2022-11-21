<?php
/*#####Generic Settings#####*/
#Fix city and country code
$fixnumber = 'true';
#Hide Numbers in cid lookup source
$hidenumber = 'false';
#specify the city code
$citycode = '21';
#specify the country code
$countrycode = '98';
#specify dial prefix
$prefix = '';
#specify click to call format
$cidformat = "CRM Call To %s"; //Web Call number
#original record link parameters (change find value with replace value in original record link)
$find = '';  //Specifies the value to find
$replace = '';  //Specifies the value to replace the value in find
#use custom download link (if you are using this method connector ignore original record link )
$strCRL = true;
#custum download link url pattern
$strCRLPattern = "{CallRecordlink}{UniqueId}";
# Use below documentaion
# {CallRecordlink} -> "http://mydomain.com/download.php?id="
# {format} ->  ".wav"
# {recordingdate}  "2016-02-23"
# {recordingdate2}  "2016/02/23"
# {recordingdate3}  "20160223"
# {recordingtime}  "22-19-45"
# {recordingtime2}  "221945"
# {RecordingDestinationNumber}  "03136204751"
# {RecordingSourceNumber}  "111"
# {UniqueId}  "220584844545454.14584"
# {recordingdirection}  "inbound"
# {CallRecordlink}/recordings/monitor/{recordingdate}/{RecordingSourceNumber}-{RecordingDestinationNumber}-{recordingdate3}-{UniqueId}{format}
# http://yourdomain.com/recordings/monitor/2016/02/23/6-02188513872-20160223-2209011456252741.14145.wav
#custum download file format
$format = ".wav";
#custum download link url pattern
$strCRURL = "http://xxx.xxx.xxx.xxx/download.php?id=";

/*#####Sitak & Simotel Settings#####*/
#Sitak API Url without splash
$sitak_url = '';
#Simotel API Version
$simotel_api = 'v1';
#Simotel X-APIKEY
$xapikey = 'hHnah2DsYEIyqiXofffpiLyymCdj6kaJ9CkXxpVJ85DJ1rRWys';
#Simotel API Url without splash ot AMI IP Address
$simotel_url = 'http://109.125.141.99:9880/';
#Ring API Url without splash
$ring_url = '';
#API UserName or AMI Username
$api_username = 'parsvt';
#API SecretKey or AMI Password
$api_password = 'dGVzdDpTc0A4MDE5NjI2';
#Ring API Token
$ring_token = '';

/*#####Analog Settings#####*/
#Analog Connector Status
$analogstatus = 'false';
#Analog Connector Type
$analogtype = 'Satel';
#custum download link url for Analog Connectors
$analogdlserver = 'http://xxx.xxx.xxx.xxx/download.php?file=';
#Analog popup users
$analogpopupusers = '';
#exclude userless callsss
$exclude_userless_calls = false;
#exclude internal
$exclude_internal_calls = false;
#exclude extensions - separate by comma
$exclude_extensions = "";
#exclude phone numbers - separate by comma
$exclude_phone_numbers = "";
#specify the user if no extension defined in system
$assigned_system_user_id = '';
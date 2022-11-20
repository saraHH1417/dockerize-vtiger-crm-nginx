<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

class SMSNotifier_AwebSMS_Provider implements SMSNotifier_ISMSProvider_Model
{
    private $userName;
    private $password;
    private $parameters = array();
    private $client = null;

    const SERVICE_URI = 'http://panel.awebsms.ir';
    private static $REQUIRED_PARAMETERS = array('from');

    /**
     * Function to get provider name
     * @return <String> provider name
     */
    public function getName()
    {
        return 'AwebSMS';
    }

    /**
     * Function to get required parameters other than (userName, password)
     * @return <array> required parameters list
     */
    public function getRequiredParams()
    {
        return self::$REQUIRED_PARAMETERS;
    }

    /**
     * Function to get service URL to use for a given type
     * @param <String> $type like SEND, PING, QUERY
     */
    public function getServiceURL($type = false)
    {
        if ($type) {
            switch (strtoupper($type)) {
                case 'SOAP':
                    return self::SERVICE_URI . '/class/sms/webservice3/server.php?wsdl';
                case 'REST':
                    return self::SERVICE_URI . '/class/sms/restful/sendSms_OneToMany.php';
                case 'URL':
                    return self::SERVICE_URI . '/class/sms/webservice/send_url.php';
                case 'URL2':
                    return 'http://parsian-hesab.ir/api/server.php';
            }
        }
        return false;
    }

    /**
     * Function to set authentication parameters
     * @param <String> $userName
     * @param <String> $password
     */
    public function setAuthParameters($userName, $password)
    {
        $this->userName = $userName;
        $this->password = $password;
    }

    /**
     * Function to set non-auth parameter.
     * @param <String> $key
     * @param <String> $value
     */
    public function setParameter($key, $value)
    {
        $this->parameters[$key] = $value;
    }

    /**
     * Function to get parameter value
     * @param <String> $key
     * @param <String> $defaultValue
     * @return <String> value/$default value
     */
    public function getParameter($key, $defaultValue = false)
    {
        if (isset($this->parameters[$key])) {
            return $this->parameters[$key];
        }
        return $defaultValue;
    }

    /**
     * Function to prepare parameters
     * @return <Array> parameters
     */
    protected function prepareParameters()
    {
        $params = array('user' => $this->userName, 'pwd' => $this->password);
        foreach (self::$REQUIRED_PARAMETERS as $key) {
            $params[$key] = $this->getParameter($key);
        }
        return $params;
    }

    /**
     * Function to handle SMS Send operation
     * @param <String> $message
     * @param <Mixed> $toNumbers One or Array of numbers
     */
    public function send($message, $toNumbers)
    {
        if (!is_array($toNumbers)) {
            $toNumbers = array($toNumbers);
        }
        $tmpnumbers = array();
        foreach ($toNumbers as $number) {
            $tmpnumbers[] = $this->CorrectNumber($number);
        }
        $toNumbers = $tmpnumbers;
        $number = $this->prepareParameters();

        /* URL2 */
        if ($number['from'] == '+985000144411' || $number['from'] == '5000144411' || $number['from'] == '985000144411') {
            $number['from'] = '985000144411';
            $params = array(
                'action' => 'SMS_SEND',
                'u' => $this->userName,
                'p' => $this->password,
                'to' => implode(',',$toNumbers),
                'from' => $number['from'],
                'text' => $message,
            );
            $responses = $this->CallURL('SendSMS', $params);

        /* REST */
        } else {
            $url = $this->getServiceURL('REST');
            $params = array(
                'uname' => $this->userName,
                'pass' => $this->password,
                'from' => $number['from'],
                'to' => $toNumbers,
                'msg' => $message,
            );
            $responses = $this->call($params, $url);
        }

        $error = false;
        if (!is_numeric($responses[0]['uid']) || floatval($responses[0]['uid']) < 0) {
            $error = $responses[0]['state'];
        }
        $results = array();
        for ($x = 0; $x < count($toNumbers); $x++) {
            if ($error) {
                $result['error'] = true;
                $result['to'] = $toNumbers[$x];
                $result['statusmessage'] = $error; // Complete error message
                $result['status'] = 'Failed';
            } else {
                $result['id'] = $responses[$x]['uid'];
                $result['to'] = $toNumbers[$x];
                $result['status'] = 'Processing';
                $result['statusmessage'] = $responses[$x]['state'];
            }
            $error = false;
            $results[] = $result;
        }

        return $results;
    }

    /**
     * Function to get query for status using messgae id
     * @param <Number> $messageId
     */
    public function query($messageId)
    {
        $response = $this->GetStatus($messageId);

        $error = false;
        $result = array();
        if ($response['errCode']) {
            $response[0]['stategetstatus'] = 'E8';
            $error = $response['result']['statusId'];
        }
        $code = $response['result']['statusId'];
        $result['statusmessage'] = "CODE: $code " . $response['result']['status'];
        $result['id'] = $messageId;
        switch ($code) {
            case "1":
                $result['status'] = 'Processing';
                $result['needlookup'] = 1;
                break;
            case "3":
                $result['status'] = 'Dispatched';
                $result['needlookup'] = 1;
                break;
            case "4":
                $result['status'] = 'Delivered';
                $result['needlookup'] = 0;
                break;
            case "5":
                $result['status'] = 'Delivered';
                $result['needlookup'] = 0;
                break;
            case "6":
                $result['status'] = 'Failed';
                $result['needlookup'] = 0;
                break;
            case "2":
                $result['status'] = 'Failed';
                $result['needlookup'] = 0;
                break;
            default:
                $result['status'] = 'Failed';
                $result['needlookup'] = 0;
        }
        $result['error'] = $error;
        return $result;
    }

    /**
     * Function to Correct SMS Receiver Number
     * @param <Number> $uNumber
     */
    public function CorrectNumber($uNumber)
    {
        $uNumber = Trim($uNumber);
        $ret = &$uNumber;

        if (substr($uNumber, 0, 3) == '%2B') {
            $ret = substr($uNumber, 3);
            $uNumber = $ret;
        }

        if (substr($uNumber, 0, 3) == '%2b') {
            $ret = substr($uNumber, 3);
            $uNumber = $ret;
        }

        if (substr($uNumber, 0, 4) == '0098') {
            $ret = substr($uNumber, 4);
            $uNumber = $ret;
        }

        if (substr($uNumber, 0, 3) == '098') {
            $ret = substr($uNumber, 3);
            $uNumber = $ret;
        }


        if (substr($uNumber, 0, 3) == '+98') {
            $ret = substr($uNumber, 3);
            $uNumber = $ret;
        }

        if (substr($uNumber, 0, 2) == '98') {
            $ret = substr($uNumber, 2);
            $uNumber = $ret;
        }

        if (substr($uNumber, 0, 1) == '0') {
            $ret = substr($uNumber, 1);
            $uNumber = $ret;
        }

        return '+98' . $ret;
    }

    /**
     * Function to Get Sent SMS Status
     * @params <Number> $batchid, <Number> $unique_ids
     */
    public function GetStatus($batchid)
    {
        $parameters = array(
            'uname' => $this->userName,
            'pass' =>  $this->password,
            'uniqueID' => $batchid,
            'ManyToMany' => '',//1 برای پیام نظیر به نظیر
        );
        $returnObj = $this->CallAPI(self::SERVICE_URI . '/class/sms/restful/getStatus.php', json_encode($parameters));
        return $returnObj;
    }

    /**
     * Function to Call Soap Webservice
     * @params <String> $method, <Array> $params
     */
    public function call($params, $url)
    {
        $data = $this->CallAPI($url, json_encode($params));
        if ($data['errCode'] == 0) {
            $result[] = array(
                'uid' => $data['result'][0],
                'state' => 'Done'
            );
        } else {
            $result[] = array(
                'uid' => $data['errCode'],
                'state' => $data['result']
            );
        }

        return $result;
    }

    /**
     * Function to Check PHP Extensions
     */
    public function CheckSOAP()
    {
        return (extension_loaded('soap') ? true : false);
    }

    /**
     * Function to prepare Webservice Post Fields
     * @params <Array> $params
     */
    public function preparePostFields($params)
    {
        $querystring = "";
        foreach ($params AS $k => $v) {
            if (is_array($v)) {
                foreach ($v as $value) {
                    $querystring .= $k . "[]=" . urlencode($value) . "&";
                }
            } else {
                $querystring .= "$k=" . urlencode($v) . "&";
            }
        }

        return $querystring;
    }

    /**
     * Function to Process Url Post Results
     * @params <String> $str
     */
    private function unvar_dump($str)
    {
        if (strpos($str, "\n") === false) {
            //Add new lines:
            $regex = array(
                '#(\\[.*?\\]=>)#',
                '#(string\\(|int\\(|float\\(|array\\(|NULL|object\\(|})#',
            );
            $str = preg_replace($regex, "\n\\1", $str);
            $str = trim($str);
        }
        $regex = array(
            '#^\\040*NULL\\040*$#m',
            '#^\\s*array\\((.*?)\\)\\s*{\\s*$#m',
            '#^\\s*string\\((.*?)\\)\\s*(.*?)$#m',
            '#^\\s*int\\((.*?)\\)\\s*$#m',
            '#^\\s*bool\\(true\\)\\s*$#m',
            '#^\\s*bool\\(false\\)\\s*$#m',
            '#^\\s*float\\((.*?)\\)\\s*$#m',
            '#^\\s*\[(\\d+)\\]\\s*=>\\s*$#m',
            '#\\s*?\\r?\\n\\s*#m',
        );
        $replace = array(
            'N',
            'a:\\1:{',
            's:\\1:\\2',
            'i:\\1',
            'b:1',
            'b:0',
            'd:\\1',
            'i:\\1',
            ';'
        );
        $serialized = preg_replace($regex, $replace, $str);
        $func = create_function(
            '$match',
            'return "s:".strlen($match[1]).":\\"".$match[1]."\\"";'
        );
        $serialized = preg_replace_callback(
            '#\\s*\\["(.*?)"\\]\\s*=>#',
            $func,
            $serialized
        );
        $func = create_function(
            '$match',
            'return "O:".strlen($match[1]).":\\"".$match[1]."\\":".$match[2].":{";'
        );
        $serialized = preg_replace_callback(
            '#object\\((.*?)\\).*?\\((\\d+)\\)\\s*{\\s*;#',
            $func,
            $serialized
        );
        $serialized = preg_replace(
            array('#};#', '#{;#'),
            array('}', '{'),
            $serialized
        );

        return unserialize($serialized);
    }

    /**
     * Function to Process Url Post Results
     * @params <String> $method, <String/Array> $params
     */
    private function CallURL($method, $params)
    {
        if ($method == 'SendSMS') {
            if (isset($params['action']) && $params['action'] == 'SMS_SEND')
                $serviceURL = self::getServiceURL('URL2');
            else
                $serviceURL = self::getServiceURL('URL');
            $data = false;
            $params = $this->preparePostFields($params);
            if (function_exists("curl_exec") && function_exists("curl_setopt") && function_exists("curl_exec") && function_exists("curl_close")) {
                $c = curl_init();
                curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($c, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($c, CURLOPT_URL, $serviceURL . "?" . $params);
                $data = curl_exec($c);
                $err = curl_getinfo($c, CURLINFO_HTTP_CODE);
                curl_close($c);
            } elseif (ini_get('allow_url_fopen') && function_exists('file_get_contents')) {
                $data = @file_get_contents($serviceURL . "?" . $params);
            }

            if ($data) {
                $response = json_decode($data, true);
                if (is_numeric($response[0]['uid'])) {
                    return $response;
                } else {
                    return array(array('uid' => 'Error', 'state' => $response[0]['state']));
                }
            } else {
                return array(array('uid' => 'Error', 'state' => 'Connection Error'));
            }
        }
        return array(array('uid' => 'Error', 'state' => 'PHP SOAP Extension Not Loaded'));
    }

    /**
     * Function to Process Rest Post Results
     * @params <String> $method, <String/Array> $params
     */
    function CallAPI($url, $data = false)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($curl);
        curl_close($curl);

        return json_decode($result, true);
    }
}

?>

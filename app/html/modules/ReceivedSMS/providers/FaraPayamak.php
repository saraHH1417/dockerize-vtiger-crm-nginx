<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

class ReceivedSMS_FaraPayamak_Provider {

	private $userName;
	private $password;
	public $parameters = array('count','from','index');

	const SERVICE_URI = 'http://api.payamak-panel.com/post/Receive.asmx?wsdl';

	/**
	 * Function to get provider name
	 * @return <String> provider name
	 */
	public function getName() {
		return 'FaraPayamak';
	}

	/**
	 * Function to get required parameters other than (userName, password)
	 * @return <array> required parameters list
	 */
	public function getRequiredParams() {
		return $this->parameters;
	}

	/**
	 * Function to get service URL to use for a given type
	 * @param <String> $type like SEND, PING, QUERY
	 */
	public function getServiceURL() {
	    	return  self::SERVICE_URI;
	}

	/**
	 * Function to set authentication parameters
	 * @param <String> $userName
	 * @param <String> $password
	 */
	public function setAuthParameters($userName, $password) {
		$this->userName = $userName;
		$this->password = $password;
	}

	/**
	 * Function to set non-auth parameter.
	 * @param <String> $key
	 * @param <String> $value
	 */
	public function setParameter($key, $value) {
		$this->parameters[$key] = $value;
	}

	/**
	 * Function to get parameter value
	 * @param <String> $key
	 * @param <String> $defaultValue
	 * @return <String> value/$default value
	 */
	public function getParameter($key, $defaultValue = false) {
		if(isset($this->parameters[$key])) {
			return $this->parameters[$key];
		}
		return $defaultValue;
	}

	/**
	 * Function to prepare parameters
	 * @return <Array> parameters
	 */
	protected function prepareParameters() {
		$params = array('user' => $this->userName, 'pwd' => $this->password);
		foreach ($this->parameters as $key) {
			$params[$key] = $this->getParameter($key);
		}
		return $params;
	}

	/**
	 * Function to handle SMS receive operation
	 * Output should be return as array and sub array for each sms with key
	 * required params are "mob" as SMS Sender Mobile and "msg" as SMS Message Content
	 * general optional params are "to" as Receive message number
	 * other optional params for lead are "type=lead" , "nam" , "lnam" , "mail" , "web" , "phone" , "fax" , "com" , "source" , "industry" , "assignto"
	 * other optional params for tickets are "type=helpdesk" , "sub" , "status" , "cat" , "priority" , "severities" , "tassignto"
	 * example output: 
	 * array(array('mob'=>'+9890123456789', 'msg'=>'this is test 1', 'to'=>'10001002002000'),array('mob'=>'+989987654321', 'msg'=>'this is test 2', 'to'=>'10001005005000', 'type'=>'lead'))
	 * for more info please reffer module settings http://vtiger_url/index.php?module=ReceivedSMS&parent=Settings&view=Settings
	 */
	public function receive() {
		$url = $this->getServiceURL();
		$results = array();
		$parameters = array();
		if (!$this->CheckSOAP()) return array();
		ini_set("soap.wsdl_cache_enabled", "0");
        $sms_client = new SoapClient($url, array('encoding'=>'UTF-8'));
        $params = $this->prepareParameters();
        $parameters['username'] = $params['user'];
        $parameters['password'] = $params['pwd'];
        $parameters['location'] =  1;
        $parameters['from'] = (isset($params['from']) ? $params['from'] : '');
        $parameters['index'] = (isset($params['index']) && is_numeric($params['index']) ? $params['index'] : 0);
        $parameters['count'] = (isset($params['count']) && is_numeric($params['count']) &&  $params['count'] <= 100 ? $params['count'] : 100);
        $result = $sms_client->GetMessages($parameters)->GetMessagesResult;
        if (is_null($result)) return array();
        $result = json_decode(json_encode($result),true);
        if (isset($result['MessagesBL'])) {
        	foreach ($result['MessagesBL'] as $v) {
        		if (isset($v['MsgID']) && $v['IsRead'] != '1')
	         	$results[] = array('mob'=>$v['Sender'], 'msg'=>$v['Body'], 'to'=>$v['Receiver']);
        	}
	       return $results;
        } else return array();
		// example output
		//$results[] = array('mob'=>'+9890123456789', 'msg'=>'this is test 1', 'to'=>'10001002002000');
		//$results[] = array('mob'=>'+989987654321', 'msg'=>'this is test 2', 'to'=>'10001005005000', 'type'=>'lead');
	
	}
	
	/**
	 * Function to Check PHP Extensions 
	 */
    public function CheckSOAP(){
        return (extension_loaded('soap') ? true : false);
    }	
}
?>

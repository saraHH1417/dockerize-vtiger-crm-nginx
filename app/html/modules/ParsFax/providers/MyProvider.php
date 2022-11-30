<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

class ParsFax_MyProvider_Provider {

	public $parameters = array('api_id');

	const SERVICE_URI = 'http://localhost:9898';
	/**
	 * Function to get provider name
	 * @return <String> provider name
	 */
	public function getName() {
		return 'MyProvider';
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
	 * for more info please reffer module settings http://vtiger_url/index.php?module=ParsFax&parent=Settings&view=Settings
	 */
	public function receive() {
		$results = array();
		//example output
		//uncomment for test
		//$results[] = array('mob'=>'+9890123456789', 'msg'=>'this is test 1', 'to'=>'10001002002000');
		//$results[] = array('mob'=>'+989987654321', 'msg'=>'this is test 2', 'to'=>'10001005005000', 'type'=>'lead');
		return $results;
	}
	
}
?>
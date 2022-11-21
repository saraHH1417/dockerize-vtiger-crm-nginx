<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Commercial License
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Code is vtiger.
 * All Rights Reserved. Copyright (C) vtiger.
 ************************************************************************************/

class ParsVT_V2_Vtiger_Default extends ParsVT_Api_Operation {

	protected $restrictedOperations = array('login', 'logout', 'extendsession');
	
	protected function any(ParsVT_Api_Request $request, $user) {

		$db = PearDatabase::getInstance();
		$fn = null; $fnargs = array();
		
		$operation = $request->getType();
		$rs = null;
		
		if (!in_array(strtolower($operation), $this->restrictedOperations)) {
			$sql = 'SELECT * FROM vtiger_ws_operation WHERE prelogin=0 and type=? and name=?'; 
			$params = array($request->getMethod() == 'get'? 'GET' : 'POST', $operation); // Compatability: Anything other GET is POST
			$rs = $db->pquery($sql, $params);			
		}
				
		if ($rs && $db->num_rows($rs)) {
			$row = $db->fetch_array($rs);
			$fn  = $row['handler_method'];
			
			$file = vglobal('root_directory') . '/'. $row['handler_path'];
			if (isFileAccessible ($file)) {
				include_once $file;
			}
			
			if ($fn && function_exists($fn)) {
				$fnargsinfo = array();
				
				// Validation of Request parameters vs Handler method arguments.
				$fnreflection = new ReflectionFunction($fn);
				foreach ($fnreflection->getParameters() as $p) {
					$fnargsinfo[] = array(
						'required' => $p->isDefaultValueAvailable() ? false : true,
						'name'     => $p->getName(), // Can be different infact
					);
				}
				
				$sql = 'SELECT * FROM vtiger_ws_operation_parameters WHERE operationid=? ORDER BY sequence ASC';
				$params = array($row['operationid']);
				
				$rs = $db->pquery($sql, $params);
				$fnargindex = 0;
				while ($row = $db->fetch_array($rs)) {
					if ($fnargsinfo[$fnargindex]['required'] && $request->isEmpty($row['name'])) {
						throw new Exception('Expected parameter missing: '.$row['name'], 412);
					}

					// TODO: Handle value transformation (string, DateTime...)
					$value = $request->get($row['name']);
          
                    //value will be HTML entities due to $request->get internal implementaion
                    //but any String type argument need it with much tampering
                    //Example: query string would have (<,>) etc... that should not be converted to (&lt; or &ght;)
                    if(strcasecmp($row['type'], 'String') === 0 && is_string($value)){
                        $value = html_entity_decode($value);
                    }
                    
                    // Default Vtiger Restapi entry point provides proxy tunnel to webservice API
                    // null value when passed over the request gets treated as string instead of native null
                    if(is_string($value) && ($value == 'NULL' || $value == 'null')) $value = null;
                    
					$fnargs[] = $value;
					++$fnargindex;
				}
			}			
		}
		if (!$fn || !function_exists($fn)) {
			throw new Exception('Unsupported operation: '.$request->getMode());
		}
		
		$fnargs[] = $user;
		return call_user_func_array($fn, $fnargs);
	}
	
	public function get(ParsVT_Api_Request $request, $user)  { return $this->any($request, $user); }
	public function post(ParsVT_Api_Request $request, $user) { return $this->any($request, $user); }
	public function put(ParsVT_Api_Request $request, $user)  { return $this->any($request, $user); }
	public function del(ParsVT_Api_Request $request, $user)  { return $this->any($request, $user); }
}

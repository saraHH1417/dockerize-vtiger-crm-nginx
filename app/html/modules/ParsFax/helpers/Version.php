<?php
/* * *******************************************************************************
 * The content of this file is subject to the ParsFax Module license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTfarsi.ir are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
class ParsFax_Version_Helper {

    public static $version = '1.5.2';
    public static $patch = '13960429';

    public function getVersion()
    {
        return self::$version;
    }
    
    public function getPatch()
    {
        return self::$patch;
    }
}
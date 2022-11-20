<?php
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

chdir(dirname(__FILE__) . '/../..');
ini_set('display_errors','off'); error_reporting(0); // STRICT DEVELOPMENT
include_once 'vtlib/Vtiger/Module.php';
include_once 'vtlib/Vtiger/Package.php';
include_once 'includes/main/WebUI.php';

include_once 'include/Webservices/Utils.php';

error_reporting(0);

/**
 * Class ParsVT_Tools_Console_Controller
 */
class ParsVT_Tools_Console_Controller
{
    /**
     *
     */
    const PROMPT_ANY = 1;

    /**
     *
     */
    const PROMPT_OPTIONAL = 2;

    /**
     *
     */
    const PROMPT_NUMERIC = 3;

    /**
     *
     */
    const PROMPT_ALPHANUMERIC = 4;

    /**
     *
     */
    const PROMPT_NAME = 5;

    /**
     *
     */
    const PROMPT_LABEL = 6;

    /**
     *
     */
    const PROMPT_PATH = 7;

    /**
     * @var bool
     */
    protected $interactive = true;

    /**
     * @var array
     */
    protected $arguments = array();

    /**
     * ParsVT_Tools_Console_Controller constructor.
     */
    protected function __construct()
    {
    }

    /**
     * @param $args
     * @param $interactive
     * @return $this
     */
    public function setArguments($args, $interactive)
    {
        $this->arguments = $args;
        $this->interactive = $interactive;

        return $this;
    }

    /**
     *
     */
    protected function handle()
    {
        global $argv;
        $this->arguments = $argv;

        // Discard the script name.
        array_shift($this->arguments);
        if ($this->arguments) {
            $this->arguments = explode('=', $this->arguments[1]);
            $this->interactive = false;
        }

        $this->welcome();
        $this->options();
    }

    /**
     * Print the welcome message.
     */
    protected function welcome()
    {
        if ($this->interactive) {
            echo "
   _____                __      __ _______                       
  |  __ \               \ \    / /|__   __|                      
  | |__) |__ _  _ __  ___\ \  / /    | |    ___  ___   _ __ ___  
  |  ___// _` || '__|/ __|\ \/ /     | |   / __|/ _ \ | '_ ` _ \ 
  | |   | (_| || |   \__ \ \  /      | | _| (__| (_) || | | | | |
  |_|    \__,_||_|   |___/  \/       |_|(_)\___|\___/ |_| |_| |_|
                                                                          
\n\n";
            echo "  Welcome to ParsVT CRM Console.\n";
            echo "  This tool will enable you to get started with developing extensions with ease.\n";
            echo "  Have a good time. Press CTRL+C or type \"exit\" to quit.\n";
        }
    }

    /**
     *
     */
    protected function options()
    {
        if ($this->interactive) {
            echo "  Choose the options below:\n";
            echo "  1. Create New Module.\n";
            echo "  2. Create New Layout.\n";
            echo "  3. Create New Language Pack.\n";
            echo "  4. Create Test Language Pack.\n";
            echo "  5. Import Module.\n";
            echo "  6. Update Module.\n";
            echo "  7. Remove Module.\n";
            $option = $this->prompt("  Enter your choice: ", self::PROMPT_NUMERIC);
        } else {
            $option = array_shift($this->arguments);
            switch ($option) {
                case '--import':
                    $option = 5;
                    break;
                case '--update':
                    $option = 6;
                    break;
                case '--remove':
                    $option = 7;
                    break;
            }
        }

        try {
            switch (intval($option)) {
                case 1:
                    $this->handleCreateModule();
                    break;
                case 2:
                    $this->handleCreateLayout();
                    break;
                case 3:
                    $this->handleCreateLanguage();
                    break;
                case 4:
                    $this->handleCreateTestLanguage();
                    break;
                case 5:
                    $this->handleImportModule();
                    break;
                case 6:
                    $this->handleUpdateModule();
                    break;
                case 7:
                    $this->handleRemoveModule();
                    break;
            }
        } catch (Exception $e) {
            echo "  ERROR: " . $e->getMessage() . "\n";
            echo $e->getTraceAsString();
            echo "  \n";
        }
    }

    /**
     * @param string $msg
     * @param int $type
     * @return string
     */
    protected function prompt($msg = '', $type = self::PROMPT_ANY)
    {
        do {
            if ($msg) {
                echo $msg;
            }

            $value = trim(fgets(STDIN));

            if ($value == 'exit') {
                exit;
            }

            if (!$value && $type == self::PROMPT_OPTIONAL) {
                return $value;
            } else if ($value || $value === '0') {
                switch ($type) {
                    case self::PROMPT_NUMERIC:
                        if (is_numeric($value)) {
                            return $value;
                        }
                        break;
                    case self::PROMPT_ALPHANUMERIC:
                        if (!preg_match("/^[a-zA-Z0-9]+$/", $value)) {
                            return $value;
                        }
                        break;
                    case self::PROMPT_NAME:
                        if (!preg_match("/^[a-zA-Z][^a-zA-Z0-9_ ]*$/", $value)) {
                            return $value;
                        }
                        break;
                    case self::PROMPT_LABEL:
                        if (!preg_match("/^[a-zA-Z0-9_ ]+$/", $value)) {
                            return $value;
                        }
                        break;
                    case self::PROMPT_PATH:
                        if (!preg_match("/^[a-zA-Z0-9_:+.-\/\\\\]+$/", $value)) {
                            return $value;
                        }
                    default:
                        return $value;
                }
            }
        } while (true);
    }

    /**
     * @param $value
     * @return mixed
     */
    protected function toAlphaNumeric($value)
    {
        return preg_replace("/[^a-zA-Z0-9_]/", "", $value);
    }

    /**
     * @param $dir
     * @param $file_pattern
     * @param $files
     */
    protected function findFiles($dir, $file_pattern, &$files)
    {
        $items = glob($dir . '/*', GLOB_NOSORT);
        foreach ($items as $item) {
            if (is_file($item)) {
                if (!$file_pattern || preg_match("/$file_pattern/", $item)) {
                    $files[] = $item;
                }
            } else if (is_dir($item) && ($dir != $item)) {
                $this->findFiles($item, $file_pattern, $files);
            }
        }
    }

    // Option Handlers
    protected function handleCreateModule()
    {
        $controller = new ParsVT_Tools_Console_ModuleController();
        $controller->setArguments($this->arguments, $this->interactive)->handle();
    }

    protected function handleCreateLanguage()
    {
        $controller = new ParsVT_Tools_Console_LanguageController();
        $controller->setArguments($this->arguments, $this->interactive)->handle();
    }

    protected function handleCreateTestLanguage()
    {
        $controller = new ParsVT_Tools_Console_TestLanguageController();
        $controller->setArguments($this->arguments, $this->interactive)->handle();
    }

    protected function handleCreateLayout()
    {
        $controller = new ParsVT_Tools_Console_LayoutController();
        $controller->setArguments($this->arguments, $this->interactive)->handle();
    }

    protected function handleImportModule()
    {
        $controller = new ParsVT_Tools_Console_ImportController();
        $controller->setArguments($this->arguments, $this->interactive)->handle();
    }

    protected function handleUpdateModule()
    {
        $controller = new ParsVT_Tools_Console_UpdateController();
        $controller->setArguments($this->arguments, $this->interactive)->handle();
    }

    protected function handleRemoveModule()
    {
        $controller = new ParsVT_Tools_Console_RemoveController();
        $controller->setArguments($this->arguments, $this->interactive)->handle();
    }

    // Static
    public static function run()
    {
        $singleton = new self();
        $singleton->handle();
    }
}

/**
 * Class ParsVT_Tools_Console_ModuleController
 */
class ParsVT_Tools_Console_ModuleController extends ParsVT_Tools_Console_Controller
{

    public function handle()
    {
        echo "  >>> MODULE <<<\n";

        $moduleInformation = array();
        do {
            $moduleInformation['name'] = ucwords($this->prompt("  Enter module name: ", self::PROMPT_NAME));
            $module = $this->find($moduleInformation['name']);
            if (!$module) {
                break;
            }
            echo "  ERROR: " . $moduleInformation['name'] . " module already exists, try another.\n";
        } while (true);

        $moduleInformation['entityfieldlabel'] = 'Name';

        $entityfieldlabel = ucwords($this->prompt(sprintf("  Entity field (%s): ",
            $moduleInformation['entityfieldlabel']), self::PROMPT_OPTIONAL));
        if ($entityfieldlabel) {
            $moduleInformation['entityfieldlabel'] = $entityfieldlabel;
        }

        $moduleInformation['parent'] = 'Tools';

        echo "  Creating ...";
        $this->create($moduleInformation);
        echo "  DONE.\n";
    }

    public function find($name)
    {
        return Vtiger_Module::getInstance($name);
    }

    protected function create($moduleInformation)
    {
        $moduleInformation['entityfieldname'] = strtolower($this->toAlphaNumeric($moduleInformation['entityfieldlabel']));

        $module = new Vtiger_Module();
        $module->name = $moduleInformation['name'];
        $module->parent = $moduleInformation['parent'];
        $module->save();

        $module->initTables();

        $block = new Vtiger_Block();
        $block->label = 'LBL_' . strtoupper($module->name) . '_INFORMATION';
        $module->addBlock($block);

        $blockcf = new Vtiger_Block();
        $blockcf->label = 'LBL_CUSTOM_INFORMATION';
        $module->addBlock($blockcf);

        $field1 = new Vtiger_Field();
        $field1->name = $moduleInformation['entityfieldname'];
        $field1->label = $moduleInformation['entityfieldlabel'];
        $field1->uitype = 2;
        $field1->column = $field1->name;
        $field1->columntype = 'VARCHAR(255)';
        $field1->typeofdata = 'V~M';
        $block->addField($field1);

        $module->setEntityIdentifier($field1);

        /** Common fields that should be in every module, linked to vtiger CRM core table */
        $field2 = new Vtiger_Field();
        $field2->name = 'assigned_user_id';
        $field2->label = 'Assigned To';
        $field2->table = 'vtiger_crmentity';
        $field2->column = 'smownerid';
        $field2->uitype = 53;
        $field2->typeofdata = 'V~M';
        $block->addField($field2);

        $field3 = new Vtiger_Field();
        $field3->name = 'createdtime';
        $field3->label = 'Created Time';
        $field3->table = 'vtiger_crmentity';
        $field3->column = 'createdtime';
        $field3->uitype = 70;
        $field3->typeofdata = 'T~O';
        $field3->displaytype = 2;
        $block->addField($field3);

        $field4 = new Vtiger_Field();
        $field4->name = 'modifiedtime';
        $field4->label = 'Modified Time';
        $field4->table = 'vtiger_crmentity';
        $field4->column = 'modifiedtime';
        $field4->uitype = 70;
        $field4->typeofdata = 'T~O';
        $field4->displaytype = 2;
        $block->addField($field4);

        // Create default custom filter (mandatory)
        $filter1 = new Vtiger_Filter();
        $filter1->name = 'All';
        $filter1->isdefault = true;
        $module->addFilter($filter1);
        // Add fields to the filter created
        $filter1->addField($field1)->addField($field2, 1)->addField($field3, 2);

        // Set sharing access of this module
        $module->setDefaultSharing();

        // Enable and Disable available tools
        $module->enableTools(Array('Import', 'Export', 'Merge'));

        // Initialize Webservice support
        $module->initWebservice();

        // Create files
        $this->createFiles($module, $field1);

        // Link to menu
        Settings_MenuEditor_Module_Model::addModuleToApp($module->name, $module->parent);
    }

    protected function createFiles(Vtiger_Module $module, Vtiger_Field $entityField)
    {
        $targetpath = 'modules/' . $module->name;
        if (!is_file($targetpath)) {
            mkdir($targetpath);
            //mkdir($targetpath . '/language');

            $templatepath = 'vtlib/ModuleDir/6.0.0';

            $moduleFileContents = file_get_contents($templatepath . '/ModuleName.php');
            $replacevars = array(
                'ModuleName' => $module->name,
                '<modulename>' => strtolower($module->name),
                '<entityfieldlabel>' => $entityField->label,
                '<entitycolumn>' => $entityField->column,
                '<entityfieldname>' => $entityField->name,
            );

            foreach ($replacevars as $key => $value) {
                $moduleFileContents = str_replace($key, $value, $moduleFileContents);
            }
            file_put_contents($targetpath . '/' . $module->name . '.php', $moduleFileContents);
        }
        $targetpath = 'languages/en_us/' . $module->name.'.php';
        if (!is_file($targetpath)) {
            $templatepath = 'vtlib/ModuleDir/6.0.0';
            if (file_exists($templatepath . '/languages/en_us/ModuleName.php')) {
                $moduleFileContents = file_get_contents($templatepath . '/languages/en_us/ModuleName.php');
                $replacevars = array(
                    'ModuleName' => $module->name,
                    'Module Name' => ucfirst($module->name),
                );
                foreach ($replacevars as $key => $value) {
                    $moduleFileContents = str_replace($key, $value, $moduleFileContents);
                }
                file_put_contents($targetpath, $moduleFileContents);
                if (is_dir('languages/fa_ir/')) {
                    $targetpath = 'languages/fa_ir/' . $module->name.'.php';
                    file_put_contents($targetpath, $moduleFileContents);
                    if (file_exists($targetpath)) {
                        include_once $targetpath;
                        $languageStringsTranslation = array();
                        if(isset($languageStrings)){
                            foreach ($languageStrings as $key=>$text){
                                $translatedString = ParsVT_Tools_Console_Translate::translate('en','fa', $text);
                                $languageStringsTranslation[$key] = ($translatedString != '' ? $translatedString : $text);
                            }
                            $string  = "<?php \n/* ********************************************************************************\n * The content of this file is subject to the VTFarsi.ir Modules License(\"License\");\n * You may not use this file except in compliance with the License\n * The Initial Developer of the Original Code is VTFarsi.ir\n * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team\n * All Rights Reserved.\n * ****************************************************************************** */\n\n";
                            $string .= '$languageStrings = ' . var_export( $languageStringsTranslation, true ) . ";\n\n";
                            file_put_contents( $targetpath, $string );
                        }
                    }
                }
            }
        }
    }

}

class ParsVT_Tools_Console_LayoutController extends ParsVT_Tools_Console_Controller
{

    // Similar grouped patterns to identify the line on which tpl filename is specified.
    const VIEWERREGEX = '/\$viewer->(view|fetch)[^\(]*\(([^\)]+)/';
    const RETURNTPLREGEX = '/(return)([ ]+[\'"]+[^;]+)/';

    const TPLREGEX = '/[\'"]([^\'"]+)/';

    public function handle()
    {
        echo "  >>> LAYOUT <<<\n";

        $layoutInformation = array();
        do {
            $layoutInformation['name'] = strtolower($this->prompt("  Enter layout name: ", self::PROMPT_NAME));
            if (!file_exists('layouts/' . $layoutInformation['name'])) {
                break;
            }
            echo "  ERROR: " . $layoutInformation['name'] . " already exists, try another.\n";
        } while (true);

        echo "  Creating ...";
        $this->create($layoutInformation);
        echo "  DONE.\n";
    }

    protected function create($layoutInformation)
    {
        $files = array();
        $this->findFiles('includes', '.php$', $files);
        $this->findFiles('modules', '.php$', $files);

        $layoutdir = 'layouts/' . $layoutInformation['name'] . '/';

        foreach ($files as $file) {
            $tplfolder = $layoutdir . "modules/Vtiger";
            if (preg_match("/modules\/([^\/]+)\/([^\/]+)\//", $file, $fmatch)) {
                $tplfolder = $layoutdir . "modules/" . $fmatch[1];
                if ($fmatch[1] == 'Settings') {
                    $tplfolder .= '/' . $fmatch[2];
                }
            }

            $tpls = array();
            $this->findTemplateNames($file, $tpls);
            $tpls = array_unique($tpls);

            if ($tpls) {
                foreach ($tpls as $tpl) {
                    $tplname = basename($tpl, true);
                    // Fix sub-directory path
                    $tplpath = $tplfolder . '/' . substr($tpl, 0, strpos($tpl, $tplname));
                    if (!file_exists($tplpath)) {
                        mkdir($tplpath, 0755, true);
                    }
                    if (!file_exists($tplpath . $tplname)) {
                        $initialContent = "{* License Text *}\n";
                        // Enable debug to make it easy to implement.
                        $initialContent .= "{debug}{* REMOVE THIS LINE AFTER IMPLEMENTATION *}\n\n";
                        file_put_contents($tplpath . $tplname, $initialContent);
                    }
                    file_put_contents($tplpath . $tplname, "{* $file *}\n", FILE_APPEND);
                }
            }
        }
    }

    /**
     * @param $file
     * @param $tpls
     * @param bool $inreturn
     */
    protected function findTemplateNames($file, &$tpls, $inreturn = false)
    {
        $contents = file_get_contents($file);

        $regex = $inreturn ? self::RETURNTPLREGEX : self::VIEWERREGEX;
        if (preg_match_all($regex, $contents, $matches)) {
            foreach ($matches[2] as $match) {
                if (preg_match(self::TPLREGEX, $match, $matches2)) {
                    if (stripos($matches2[1], '.tpl') !== false) {
                        $tpls[] = $matches2[1];
                    }
                }
            }
            // Viewer files can also have return tpl calls - find them.
            if (!$inreturn) {
                $this->findTemplateNames($file, $tpls, true);
            }
        }
    }
}

/**
 * Class ParsVT_Tools_Console_LanguageController
 */
class ParsVT_Tools_Console_LanguageController extends ParsVT_Tools_Console_Controller
{
    /**
     *
     */
    const BASE_LANG_PREFIX = 'en_us';

    /**
     *
     */
    public function handle()
    {
        echo "  >>> LANGUAGE <<<\n";

        $languageInformation = array();
        do {
            $languageInformation['prefix'] = strtolower($this->prompt("  Enter (languagecode_countrycode): ", self::PROMPT_NAME));
            if (!file_exists('languages/' . $languageInformation['prefix'])) {
                break;
            }
            echo "  ERROR: " . $languageInformation['prefix'] . " already exists, try another.\n";
        } while (true);

        echo "  Creating ...";
        $this->create($languageInformation);
        echo "  DONE.\n";
    }

    /**
     * @param $languageInformation
     */
    protected function create($languageInformation)
    {
        $files = array();
        $this->findFiles('languages/' . self::BASE_LANG_PREFIX, '.php$', $files);

        foreach ($files as $file) {
            $filename = basename($file, true);
            $dir = substr($file, 0, strpos($file, $filename));
            $dir = str_replace('languages/' . self::BASE_LANG_PREFIX, 'languages/' . $languageInformation['prefix'], $dir);
            if (!file_exists($dir)) mkdir($dir);

            if (isset($languageInformation['prefix_value'])) {
                $contents = file_get_contents($file);
                $contents = preg_replace("/(=>[^'\"]+['\"])(.*)/", sprintf('$1%s$2', $languageInformation['prefix_value']), $contents);
                file_put_contents($dir . '/' . $filename, $contents);
            } else {
                copy($file, $dir . '/' . $filename);
            }
        }
    }

    /**
     * @param $languageInformation
     */
    protected function deploy($languageInformation)
    {
        if (!isset($languageInformation['label'])) {
            echo "  Language label not specified.";
            return;
        }

        $db = PearDatabase::getInstance();
        $check = $db->pquery('SELECT 1 FROM vtiger_language WHERE prefix=?', $languageInformation['prefix']);
        if ($check && $db->num_rows($check)) {
            ;
        } else {
            $db->pquery('INSERT INTO vtiger_language (id,name,prefix,label,lastupdated,isdefault,active) VALUES(?,?,?,?,?,?,?)',
                array($db->getUniqueId('vtiger_language'), $languageInformation['label'], $languageInformation['prefix'],
                    $languageInformation['label'], date('Y-m-d H:i:s'), 0, 1));
        }
    }
}

/**
 * Class ParsVT_Tools_Console_TestLanguageController
 */
class ParsVT_Tools_Console_TestLanguageController extends ParsVT_Tools_Console_LanguageController
{
    /**
     *
     */
    public function handle()
    {
        echo "  >>> TEST LANGUAGE <<<\n";

        $languageInformation = array('label' => 'TEST', 'prefix' => 'te_st', 'prefix_value' => '✔ ');

        echo "  Creating ...";
        $this->create($languageInformation);
        echo "  DONE\n";

        echo "  Deploying ...";
        $this->deploy($languageInformation);
        echo "  DONE.\n";
    }
}

/**
 * Class ParsVT_Tools_Console_ImportController
 */
class ParsVT_Tools_Console_ImportController extends ParsVT_Tools_Console_Controller
{
    /**
     * @throws Exception
     */
    public function handle()
    {
        if ($this->interactive) {
            echo "  >>> IMPORT MODULE <<<\n";
            do {
                $path = $this->prompt("  Enter package path: ", self::PROMPT_PATH);
                if (file_exists($path)) {
                    break;
                }
                echo "  ERROR: " . $path . " - file not found, try another.\n";
            } while (true);
        } else {
            $path = array_shift($this->arguments);
        }

        if (file_exists($path)) {
            $package = new Vtiger_Package();
            $module = $package->getModuleNameFromZip($path);

            $moduleInstance = Vtiger_Module::getInstance($module);
            if ($moduleInstance) {
                echo "  ERROR: Module $module already exists!\n";
            } else {
                echo "  Importing ...";
                $package->import($path);
                echo "  DONE.\n";
            }

        } else {
            throw new Exception("Package file $path not found.");
        }

    }
}

/**
 * Class ParsVT_Tools_Console_UpdateController
 */
class ParsVT_Tools_Console_UpdateController extends ParsVT_Tools_Console_Controller
{
    /**
     * @throws Exception
     */
    public function handle()
    {
        if ($this->interactive) {
            echo "  >>> UPDATE MODULE <<<\n";
            do {
                $path = $this->prompt("  Enter package path: ", self::PROMPT_PATH);
                if (file_exists($path)) {
                    break;
                }
                echo "  ERROR: " . $path . " - file not found, try another.\n";
            } while (true);
        } else {
            $path = array_shift($this->arguments);
        }

        if (file_exists($path)) {
            $package = new Vtiger_Package();
            $module = $package->getModuleNameFromZip($path);

            $moduleInstance = Vtiger_Module::getInstance($module);
            if (!$moduleInstance) {
                echo "  ERROR: Module $module not found!\n";
            } else {
                echo "  Updating ...";
                $package->update($moduleInstance, $path);
                echo "  DONE.\n";
            }

        } else {
            throw new Exception("Package file $path not found.");
        }
    }
}

/**
 * Class ParsVT_Tools_Console_RemoveController
 */
class ParsVT_Tools_Console_RemoveController extends ParsVT_Tools_Console_Controller
{
    var $db, $adb;
    public function __construct()
    {
        $adb =PearDatabase::getInstance();
        $this->adb = $adb;
        $this->db = $adb;
    }


    private function exec_disabled($value = 'exec')
    {
        $disabled = explode(',', ini_get('disable_functions'));
        return in_array($value, $disabled);
    }

    private function del($tmp_path)
    {
        global $root_directory;
        if (!is_writeable($tmp_path) && is_dir($tmp_path)) {
            chmod($tmp_path, 0777);
        }
        if (is_dir($tmp_path)) {
            $handle = opendir($tmp_path);
            while ($tmp = readdir($handle)) {
                if ($tmp != '..' && $tmp != '.' && $tmp != '') {
                    if (is_writeable($tmp_path . DS . $tmp) && is_file($tmp_path . DS . $tmp)) {
                        unlink($tmp_path . DS . $tmp);
                    } elseif (!is_writeable($tmp_path . DS . $tmp) && is_file($tmp_path . DS . $tmp)) {
                        chmod($tmp_path . DS . $tmp, 0666);
                        unlink($tmp_path . DS . $tmp);
                    }

                    if (is_writeable($tmp_path . DS . $tmp) && is_dir($tmp_path . DS . $tmp)) {
                        $this->del($tmp_path . DS . $tmp);
                    } elseif (!is_writeable($tmp_path . DS . $tmp) && is_dir($tmp_path . DS . $tmp)) {
                        chmod($tmp_path . DS . $tmp, 0777);
                        $this->del($tmp_path . DS . $tmp);
                    }
                }
            }
            closedir($handle);
            rmdir($tmp_path);
        } elseif (is_file($tmp_path)) {
            if (!is_writeable($tmp_path)) {
                chmod($tmp_path, 0777);
            }
            unlink($tmp_path);
        }
        if (!is_dir($tmp_path) && !is_file($tmp_path)) {
            return true;
        } else {
            if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') { //for windows
                if ($this->exec_disabled('system')) {
                    return false;
                }
                if (!file_exists("test/data/tools/rm.exe"))
                    return false;
                ob_start(); // Turn on output buffering
                @system('"test/data/tools/rm -rf "' . $root_directory . $tmp_path . '"');
                $data = ob_get_contents(); // Capture the output into a variable
                ob_clean(); // Clean (erase) the output buffer
            } else {
                if ($this->exec_disabled('exec')) {
                    return false;
                }
                exec('rm -rf "' . $root_directory . $tmp_path . '"', $data);
            }
            if (!is_dir($tmp_path) && !is_file($tmp_path))
                return true;
            else
                return false;
        }
    }


    /**
     * Uninstall Methods
     */
    private function ModuleTableList($modulename)
    {
        $_Tables = array();
        if (file_exists("modules/$modulename/schema.xml")) {
            $schema = simplexml_load_file("modules/$modulename/schema.xml");
            if (!empty($schema->tables) && !empty($schema->tables->table)) {
                foreach ($schema->tables->table as $tablenode) {
                    $table = trim($tablenode->name);
                    if (!in_array($table, $_Tables)) {
                        $_Tables[] = $table;
                    }
                }
            }
        }
        return $_Tables;
    }

    public function removeData($module)
    {
        $out = '';
        $out .= sprintf(vtranslate("Delete %s  from vtiger_crmentity table.", $module), $module);
        $result = $this->db->pquery("DELETE FROM `vtiger_crmentity` WHERE `setype`=?", array($module));
        $out .= " - " . ($result ? vtranslate("DONE", $module) : "<b>" . vtranslate("Error", $module) . "</b>");
        $out .= "<br>";
        $out .= sprintf(vtranslate("Delete %s  from vtiger_ws_entity table.", $module), $module);
        $result = $this->db->pquery("DELETE FROM `vtiger_ws_entity` WHERE `name`=?", array($module));
        $out .= " - " . ($result ? vtranslate("DONE", $module) : "<b>" . vtranslate("Error", $module) . "</b>");
        $out .= "<br>";
        $out .= sprintf(vtranslate("Delete %s  from vtiger_entity table.", $module), $module);
        $result = $this->db->pquery("DELETE FROM `vtiger_entity` WHERE `name`=?", array($module));
        $out .= " - " . vtranslate("DONE", $module) . "</b>";
        $out .= "<br>";
        $result = $this->db->pquery("SELECT * FROM `vtiger_settings_field` WHERE `linkto` LIKE '%module=" . $module . "%'", array());
        if ($this->db->num_rows($result) > 0) {
            while ($row = $this->db->fetchByAssoc($result)) {
                $out .= sprintf(vtranslate("Delete %s  from vtiger_settings_field table.", $module), $module);
                $tmpresult = $this->db->pquery("DELETE FROM `vtiger_settings_field` WHERE `fieldid`=?", array($row['fieldid']));
                $out .= " - " . ($tmpresult ? vtranslate("DONE", $module) : "<b>" . vtranslate("Error", $module) . "</b>");
                $out .= "<br>";
            }
        }

        $out .= sprintf(vtranslate("Delete %s cron tasks.", $module), $module);
        $result = $this->db->pquery("DELETE FROM vtiger_cron_task WHERE module = ?", array($module));
        $out .= " - " . vtranslate("DONE", $module) . "<br>";

        $out .= sprintf(vtranslate("Delete %s Handlers.", $module), $module);
        $result = $this->db->pquery("DELETE FROM vtiger_eventhandlers WHERE handler_class like %'".$module."''%", array());
        $out .= " - " . vtranslate("DONE", $module) . "<br>";

        $out .= sprintf(vtranslate("Delete %s module tables.", $module), $module);
        $out .= "<br>";
        $tables = $this->ModuleTableList($module);
        foreach ($tables as $table) {
            $out .= sprintf(vtranslate("Delete %s table.", $module), $table);
            $result = $this->db->pquery("DROP TABLE IF EXISTS $table");
            $out .= " - " . ($result ? vtranslate("DONE", $module) : "<b>" . vtranslate("Error", $module) . "</b>");
            $out .= "<br>";
        }
        return $out;
    }

    /**
     * @param $moduleName
     */
    public function removeFiles($moduleName)
    {
        $out = "";
        $files = glob("layouts/*/modules/" . $moduleName);
        $out .= sprintf(vtranslate("Remove %s template folder.", $moduleName), $moduleName) . "<br />";
        foreach ($files as $file) {
            $out .= "Remove " . $file;
            $result = $this->del($file);
            $out .= " - " . ($result ? vtranslate("DONE", $moduleName) : "<b>" . vtranslate("Error", $moduleName) . "</b>");
            $out .= "<br>";
        }
        $out .= sprintf(vtranslate("Remove %s module folder", $moduleName), $moduleName);
        $result = $this->del("modules/" . $moduleName);
        $out .= " - " . ($result ? vtranslate("DONE", $moduleName) : "<b>" . vtranslate("Error", $moduleName) . "</b>");
        $out .= "<br>";
        $out .= sprintf(vtranslate("Remove %s language files:", $moduleName), $moduleName) . "<br />";
        $files = glob("languages/*/" . $moduleName . ".php");
        foreach ($files as $file) {
            if (is_file($file)) {
                $result = $this->del($file);
                $out .= "Remove " . $file . " - " . ($result ? vtranslate("DONE", $moduleName) : "<b>" . vtranslate("Error", $moduleName) . "</b>");
                $out .= "<br>";
            }
        }

        $dir = "cron/modules/" . $moduleName;
        if (is_dir($dir)) {
            $out .= sprintf(vtranslate("Remove %s cron folder", $moduleName), $moduleName);
            $result = $this->del($dir);
            $out .= " - " . ($result ? vtranslate("DONE", $moduleName) : "<b>" . vtranslate("Error", $moduleName) . "</b>");
            $out .= "<br>";
        }

        $dir = "storage/" . $moduleName;
        if (is_dir($dir)) {
            $out .= sprintf(vtranslate("Remove %s storage folder", $moduleName), $moduleName);
            $result = $this->del($dir);
            $out .= " - " . ($result ? vtranslate("DONE", $moduleName) : "<b>" . vtranslate("Error", $moduleName) . "</b>");
            $out .= "<br>";
        }

        return $out;
    }

    /**
     *
     */
    public function handle()
    {
        if ($this->interactive) {
            echo "  >>> REMOVE MODULE <<<\n";
            do {
                $module = $this->prompt("  Enter module name: ", self::PROMPT_NAME);
                $moduleInstance = Vtiger_Module::getInstance($module);
                if (!$moduleInstance) {
                    echo "  ERROR: Module $module not found, try another.\n";
                } else {
                    echo "  Removing ...";
                    $moduleInstance->delete();
                    $this->removeData($module);
                    $this->removeFiles($module);
                    echo "  DONE.\n";
                }
            } while (true);
        } else {
            $module = array_shift($this->arguments);
            $moduleInstance = Vtiger_Module::getInstance($module);
            if (!$moduleInstance) {
                echo "  ERROR: Module $module not found!\n";
            } else {
                echo "  Removing ...";
                $moduleInstance->delete();
                $this->removeData($module);
                $this->removeFiles($module);
                echo "  DONE.\n";
            }
        }
    }
}

/**
 * Class ParsVT_Tools_Console_Translate
 */
class ParsVT_Tools_Console_Translate
{

    public static function translate($from, $to, $text){
        $url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=" . $from . "&tl=" . $to . "&hl=en-US&dt=t&dt=bd&dj=1&source=icon&tk=310461.310461&q=" . urlencode($text);
        $options  = array('http' => array('user_agent' => 'AndroidTranslate/5.3.0.RC02.130475354-53000263 5.1 phone TRANSLATE_OPM5_TEST_1'));
        $context  = stream_context_create($options);
        $response = file_get_contents($url, false, $context);
        $response = json_decode($response , true);
        if (json_last_error() == JSON_ERROR_NONE) {
            if (isset($response['sentences'][0]['trans'])) {
                return $response['sentences'][0]['trans'];
            }
        }
        return $text;
    }
}

if (php_sapi_name() == 'cli') {
    ParsVT_Tools_Console_Controller::run();
} else {
    echo "Usage: php -f modules/ParsVT/console.php";
}

<?php
/**
 * Created by PhpStorm.
 * User: Hamid
 * Date: 1398/01/22
 * Time: 21:17 PM
 */
$Yekan     = array();
$Str_10_20 = array();
$Dahgan    = array();
$Sadgan    = array();
$DogNo     = array();
if (!function_exists('showCityNameField')) {
    function showCityNameField($value, $language='fa_ir')
    {
        global $adb;
        if (!checkParsVTActive()) return '';
        $adb = PearDatabase::getInstance();
        if ($language) {
            $column = ($language == 'fa_ir' ? 'Title' : 'Title_En');
        } else {
            $column = 'Title';
        }
        $result = $adb->pquery('SELECT Type, '.$column.' as Name FROM `vtiger_parsvt_cities` WHERE `LocationId` = ? ', array($value));
        if ($adb->num_rows($result) > 0) {
            $type = $adb->query_result($result, 0, 'type');
            $Name = $adb->query_result($result, 0, 'name');
            switch ($type){
                case "0":
                    return '-';
                    break;
                case "1":
                    return $Name;
                    break;
                case "2":
                    $sql2 ='SELECT CONCAT(t2.'.$column.', " - ", t1.'.$column.') as Name FROM vtiger_parsvt_cities t1, vtiger_parsvt_cities t2 WHERE t1.`LocationId` = ? && t1.Parent = t2.LocationId';
                    $result = $adb->pquery($sql2, array($value));
                    return $adb->query_result($result, 0, 'name');
                    break;
                case "3":
                    $sql3 ='SELECT CONCAT(t3.'.$column.', " - ", t2.'.$column.', " - ", t1.'.$column.') as Name FROM vtiger_parsvt_cities t1, vtiger_parsvt_cities t2, vtiger_parsvt_cities t3 WHERE t1.`LocationId` = ? && t1.Parent = t2.LocationId && t2.Parent = t3.LocationId';
                    $result = $adb->pquery($sql3, array($value));
                    return $adb->query_result($result, 0, 'name');
                    break;
                default:
                    return '-';
            }
        } else return '-';

    }
}
if (!function_exists('showDateTimeField')) {
    function showDateTimeField($value)
    {
        if (!checkParsVTActive()) return '';
        $dateValue = '--';
        if ($value != '') {
            $date = new DateTimeField($value);
            $dateTimeValue = $date->getDisplayDateTimeValue();
            list($startDate, $startTime) = explode(' ', $dateTimeValue);
            $currentUser = Users_Record_Model::getCurrentUserModel();
            if ($currentUser->get('hour_format') == '12') {
                $startTime = Vtiger_Time_UIType::getTimeValueInAMorPM($startTime);
            }
            $dateValue = "$startDate $startTime";
        }
        return $dateValue;
    }
}
if (!function_exists('showDigitalSignatueField')) {
    function showDigitalSignatueField($value)
    {
        if (!checkParsVTActive()) return '';
        if ($value != '') return '<img src="'.$value.'" width="150" height="80">';
        return '';
    }
}
if (!function_exists('showUserFullNameByID')) {
    function showUserFullNameByID($userids)
    {
        global $adb;
        $name = array();
        $userids = explode(',',$userids);
        if (!checkParsVTActive()) return $name;
        $query1= "SELECT concat(`first_name`,' ',`last_name`) as name FROM `vtiger_users` WHERE id = ? limit 1";
        $query2= "SELECT `groupname` as name FROM `vtiger_groups` WHERE `groupid` = ? limit 1";
        $adb = PearDatabase::getInstance();
        foreach ($userids as $userid) {
            $result = $adb->pquery($query1, array($userid));
            if ($adb->num_rows($result) > 0) {
                $name[] = $adb->query_result($result, 0, 'name');
            } else {
                $result = $adb->pquery($query2, array($userid));
                if ($adb->num_rows($result) > 0) {
                    $tmpname = $adb->query_result($result, 0, 'name');
                    $name[] = vtranslate($tmpname, 'Vtiger');
                }
            }
        }
        if (count($name) == 0)
            return '';
        elseif (count($name) == 1)
            return $name[0];
        else
            return implode(',',$name);
    }
}
if (!function_exists('showNumberToPersian')) {
    function showNumberToPersian($number)
    {
        if (!checkParsVTActive()) return '';
        $number = $number + 0;  //fix useless zeros
        $text = strrev($number);
        $text = str_replace(0, '۰', $text);
        $text = str_replace(1, '۱', $text);
        $text = str_replace(2, '۲', $text);
        $text = str_replace(3, '۳', $text);
        $text = str_replace(4, '۴', $text);
        $text = str_replace(5, '۵', $text);
        $text = str_replace(6, '۶', $text);
        $text = str_replace(7, '۷', $text);
        $text = str_replace(8, '۸', $text);
        $text = str_replace(9, '۹', $text);
        return $text;
    }
}
if (!function_exists('showUploadFileField')) {
    function showUploadFileField($field, $imagetag = false, $width = false)
    {
        global $site_URL, $root_directory;
        $path = explode('$$', $field);
        if (file_exists($root_directory . $path[0])) {
            if ($imagetag && $imagetag != 0)
                return '<img  alt="" src="' . $site_URL . $path[0] . '" ' . ($width && $width != 0 ? 'style="max-width:' . $width . '%"' : "") . ' />';
            else
                return $site_URL.$path[0];
        }
    }
}
if (!function_exists('showMapField')) {
    function showMapField($value)
    {
        if (!checkParsVTActive()) return $value;
        return '<img src="https://maps.wikimedia.org/img/osm-intl,15,'.$value.',300x300.png" />';
    }
}
if (!function_exists('showRepeaterField')) {
    function showRepeaterField($value)
    {
        if (!checkParsVTActive()) return $value;
        $value = str_replace('(((','{',$value);
        $value = str_replace(')))','}',$value);
        $value = rtrim($value,"_");
        $value = html_entity_decode($value, ENT_QUOTES);
	    $result = json_decode($value , true);
        if (!is_array($result)) {
            return $value;
        }
        $output = '<ul>';
        foreach ($result as $repeter) {
            $output .= '<li>' . $repeter['repeater'] . '</li>';
        }
        $output .= '</ul>';
        return $output;
    }
}
if (!function_exists('showGridField')) {
    function showGridField($value,$fontfamily = 'yekan,tahoma')
    {
        if (!checkParsVTActive()) return $value;
        $value = rtrim($value, "_");
        $value = html_entity_decode($value, ENT_QUOTES);
        $result = json_decode($value, true);
        if (!is_array($result)) {
            return $value;
        }
        $i = $j = 0;
        $output = '<table autosize="2.4"  border="1" style="page-break-inside:avoid; font-family: '.$fontfamily.'; border: 1px">';
        $output .= '<thead>';
        $output .= '<tr class="blockHeader">';
        foreach ($result[0] as $HEAD => $V) {
            $output .= '<th>';
            $output .= $HEAD;
            $output .= '</th>';
            $i++;
        }
        $output .= '</tr>';
        $output .= '</thead>';
        $output .= '<tbody>';
        foreach ($result as $ROW) {
            $j = 0;
            $output .= '<tr>';
            foreach ($ROW as $TD) {
                $output .= '<td>';
                $output .= $TD;
                $output .= '</td>';
                $j++;
            }
            while($j < $i) {
                $output .= '<td></td>';
                $j++;
            }
            $output .= '</tr>';
        }
        $output .= '</tbody>';
        $output .= '</table>';
        return $output;
    }
}
if (!function_exists('showColorField')) {
    function showColorField($value)
    {
        if (!checkParsVTActive()) return $value;
        return '<div style="width:50px; height:20px; color: '.$value.'; background-color: '.$value.';"></div>';
    }
}
if (!function_exists('showStarField')) {
    function showStarField($value)
    {
        if (!checkParsVTActive()) return $value;
        $output = '';
        for($j=1;$j<=$value;$j++)
        {
            $output .= "*";
        }
        return $output;
    }
}
if (!function_exists('Str_0_100')) {
    function Str_0_100($No)
    {
        global $Str_10_20;
        global $Yekan;
        global $Dahgan;
        $s = '';
        if ($No < 10)
            $s = $Yekan[$No];
        elseif ($No < 20)
            $s = $Str_10_20[$No - 10];
        elseif ($No < 100) {
            $s = $Dahgan[intval(($No / 10)) - 1];
            if (($No % 10) > 0)
                $s = $s . ' و ' . $Yekan[$No % 10];
        }
        return $s;
    }
}
if (!function_exists('Str_0_1000')) {
    function Str_0_1000($No)
    {
        global $Sadgan;
        $s = '';
        if ($No < 100)
            $s = Str_0_100($No);
        else {
            $s = $Sadgan[intval(($No / 100)) - 1];
            if ($No % 100 > 0)
                $s = $s . ' و ' . Str_0_100($No % 100);
        }
        return $s;
    }
}
if (!function_exists('Persian_Number_To_Word')) {
    function Persian_Number_To_Word($number,$thousands_separator=' ',$start=0)
    {
        $number=str_replace($thousands_separator,"",$number);
        $No = $number;
        global $Yekan;
        global $Str_10_20;
        global $Dahgan;
        global $Sadgan;
        global $DogNo;


        $s = '';
        $i = $k = 0;

        $Yekan[0] = "صفر";
        $Yekan[1] = "یک";
        $Yekan[2] = "دو";
        $Yekan[3] = "سه";
        $Yekan[4] = "چهار";
        $Yekan[5] = "پنج";
        $Yekan[6] = "شش";
        $Yekan[7] = "هفت";
        $Yekan[8] = "هشت";
        $Yekan[9] = "نه";


        $Str_10_20[0] = "ده";
        $Str_10_20[1] = "یازده";
        $Str_10_20[2] = "دوازده";
        $Str_10_20[3] = "سیزده";
        $Str_10_20[4] = "چهارده";
        $Str_10_20[5] = "پانزده";
        $Str_10_20[6] = "شانزده";
        $Str_10_20[7] = "هفده";
        $Str_10_20[8] = "هیجده";
        $Str_10_20[9] = "نوزده";

        $Dahgan[0] = "ده";
        $Dahgan[1] = "بیست";
        $Dahgan[2] = "سی";
        $Dahgan[3] = "چهل";
        $Dahgan[4] = "پنجاه";
        $Dahgan[5] = "شصت";
        $Dahgan[6] = "هفتاد";
        $Dahgan[7] = "هشتاد";
        $Dahgan[8] = "نود";

        $Sadgan[0] = "صد";
        $Sadgan[1] = "دویست";
        $Sadgan[2] = "سیصد";
        $Sadgan[3] = "چهارصد";
        $Sadgan[4] = "پانصد";
        $Sadgan[5] = "ششصد";
        $Sadgan[6] = "هفتصد";
        $Sadgan[7] = "هشتصد";
        $Sadgan[8] = "نهصد";

        $DogNo[0] = "";
        $DogNo[1] = "هزار";
        $DogNo[2] = "میلیون";
        $DogNo[3] = "میلیارد";
        $DogNo[4] = "تریلیارد";
        $DogNo[5] = "بیلیارد";
        $DogNo[6] = "تریلیون";
        $DogNo[7] = "تریلیارد";
        $DogNo[8] = "کوآدریلیون";
        $DogNo[9] = "کادریلیارد";
        $DogNo[10] = "کوینتیلیون";
        $DogNo[11] = "کوانتینیارد";
        $DogNo[12] = "سکستیلیون";
        $DogNo[13] = "سکستیلیارد";
        $DogNo[14] = "سپتیلیون";
        $DogNo[15] = "سپتیلیارد";
        $DogNo[16] = "اکتیلیون";
        $DogNo[17] = "اکتیلیارد";
        $DogNo[18] = "نانیلیون";
        $DogNo[19] = "نانیلیارد";
        $DogNo[20] = "دسیلیون";
        $DogNo[21] = "دسیلیارد";
        $DogNo[22] = "گوگول";
        $DogNo[23] = "گوگول پلکس";
        $DogNo[24] = "گوگول پلکسیان";

        $DogNo=array_slice($DogNo,$start);//start array $DogNo for big number

        $s = '';
        $i = 0;
        if ((int) $No == 0)
            $s = $Yekan[0];
        else
            While ($No > 0) {
                $k  = $No - 1000 * intval(($No / 1000));
                $No = intval(($No / 1000));
                if ($k > 0) {
                    //edit for show change 0 key array ($DogNo)
                    if (strlen($s) > 0)
                        $s = $DogNo[$i] . " و" . $s;
                    else
                        $s = $DogNo[$i] . $s;
                    $s = Str_0_1000($k) . ' ' . $s;
                }
                $i ++;
            } //while
        return $s;
    }
}
if (!function_exists('Persian_Number_To_Word_Full')) {
    function Persian_Number_To_Word_Full($number_string,$change=3)
    {
        global $adb;
        if (isset($_REQUEST["commontemplateid"]) || isset($_REQUEST['pdftemplateid'])) {

            $pdf_id=isset($_REQUEST["commontemplateid"])?$_REQUEST["commontemplateid"]:$_REQUEST['pdftemplateid'];
            $sql = "SELECT decimals, decimal_point, thousands_separator FROM vtiger_pdfmaker_settings WHERE templateid = '".$pdf_id."' limit 1";
            $res = $adb->query($sql);
            if($adb->num_rows($res)) {
                while($res && $row=$adb->fetch_row($res)) {
                    $decimals = $row['decimals'];
                    $decimal_point = $row['decimal_point'];
                    $thousands_separator = $row['thousands_separator'];
                }
            }
        } else {
            $decimals = 0;
            $decimal_point = ",";
            $thousands_separator = " ";
        }
        $number_string=str_replace($thousands_separator,"",$number_string);
        $number_string=str_replace($decimal_point,".",$number_string);

        //change code ...
        $number_string=preg_replace('#[^0-9\\.]#', '', $number_string);//get alone digital number and decimal
        $strpos=strpos($number_string, '.');//check decimal in string number
        $number = $number_string;//get number int
        $s="";//without decimal number
        if ($strpos !== false) {//if float number
            $number = substr($number_string, 0, $strpos);//get number int
            $decimal = substr($number_string, $strpos + 1);//get number decimal

            //get word decimal
            $S2=Persian_Number_To_Word($decimal);
            if(intval($decimal)!=0){
                switch (strlen($decimal)) {
                    case 1:
                        $str_mid = "دهم";
                        break;
                    case 2:
                        $str_mid = "صدم";
                        break;
                    case 3:
                        $str_mid = "هزارم";
                        break;
                    default:
                        $str_mid = "";
                        break;
                }
                $s= (intval($number)==0?"" : " و " ). $S2 . ' ' . $str_mid;
            }else{
                $s = intval($number)==0? Persian_Number_To_Word(0):"";
            }
        }

        if(intval($number)==0 && $strpos === false)$s=Persian_Number_To_Word($number,$thousands_separator).$s;
        $i=0;
        $j=1;
        //9 number get and send to function Persian_Number_To_Word
        do{
            $len=strlen($number);
            $sbstr=substr($number,-(3*$change));
            if($len>(3*$change)){
                $number=substr($number,0,-(3*$change));
            }
            if(intval($sbstr)!=0){
                $s=Persian_Number_To_Word($sbstr,$thousands_separator,$i).(($i>0 && $j)?" و":" ").$s;
                $j=1;
            }
            else $j=0;
            $i+=$change;
        }while($len> (3*$change));


        return $s;

    }
}
if (!function_exists('Persian_Number_Format')) {
    function Persian_Number_Format($number){
        return number_format($number);
    }
}
if (!function_exists('translate')) {
    function translate($string, $module='Vtiger')
    {
        if (!checkParsVTActive()) return $string;
        return vtranslate($string, $module);
    }
}
if (!function_exists('ShowRTFField')) {
    function ShowRTFField($htmlfield)
    {
        if (!checkParsVTActive()) return $htmlfield;
        return html_entity_decode($htmlfield,ENT_QUOTES);
    }
}
if (!function_exists('checkParsVTActive')) {
    function checkParsVTActive()
    {
        $parsvtModule = Vtiger_Module_Model::getInstance('ParsVT');
        if ($parsvtModule && $parsvtModule->isActive()) {
            return true;
        }
        return false;
    }
}
if (!function_exists('ShowJalaliDateFormat')) {
    function ShowJalaliDateFormat($date, $outFormat = "Y/m/d") {
        if (strlen($date) > 10)
            $date = substr($date, 0, 10);
        $sql_format_date = getValidDBInsertDateValue($date);
        if (class_exists('ParsVT_Adaptive_Helper'))
            return ParsVT_Adaptive_Helper::jdate($outFormat,strtotime($sql_format_date));
        else
            $date = new DateTime($sql_format_date);
        return $date->format($outFormat);
    }
}
if (!function_exists('ShowLineItemsDiscounts')) {
    function ShowLineItemsDiscounts($format=1) {
        global $adb;
        if (!checkParsVTActive()) return '0';
        $adb = PearDatabase::getInstance();
        $recordid = isset($_REQUEST['record']) ? $_REQUEST['record'] : 0;
        $sql = 'SELECT CASE WHEN `discount_percent` > 0 THEN `discount_percent` * `quantity` * `listprice` / 100 ELSE 0 END AS sum1 , CASE WHEN `discount_amount` > 0 THEN `discount_amount` ELSE 0 END AS sum2 FROM `vtiger_inventoryproductrel` WHERE `id` = ?';
        $result = $adb->pquery($sql, array($recordid));
        $total = 0;
        if ($adb->num_rows($result) > 0) {
            while ($resultrow = $adb->fetch_array($result)) {
                $total += $resultrow['sum1'];
                $total += $resultrow['sum2'];
            }
        }
        $total = $total + 0;
        if ($format != 0) {
            if (isset($_REQUEST["commontemplateid"]) || isset($_REQUEST['pdftemplateid'])) {
                $pdf_id=isset($_REQUEST["commontemplateid"])?$_REQUEST["commontemplateid"]:$_REQUEST['pdftemplateid'];
                $sql = "SELECT decimals, decimal_point, thousands_separator FROM vtiger_pdfmaker_settings WHERE templateid = '".$pdf_id."' limit 1";
                $res = $adb->query($sql);
                if($adb->num_rows($res)) {
                    while($res && $row=$adb->fetch_row($res)) {
                        $decimals = $row['decimals'];
                        $decimal_point = $row['decimal_point'];
                        $thousands_separator = $row['thousands_separator'];
                    }
                }
            } else {
                $decimals = 0;
                $decimal_point = ",";
                $thousands_separator = "";
            }
            $total = number_format($total, $decimals, $decimal_point, $thousands_separator);
        }

        return $total;
    }
}
if (!function_exists('ShowTotalDiscountsSum')) {
    function ShowTotalDiscountsSum($format = 1) {
        global $adb;
        if (!checkParsVTActive()) return '0';
        $adb = PearDatabase::getInstance();
        $recordid = isset($_REQUEST['record']) ? $_REQUEST['record'] : false;
        if (!$recordid) return false;
        $sql = 'SELECT `setype` FROM `vtiger_crmentity` where `crmid` = ? limit 1';
        $result = $adb->pquery($sql, array($recordid));
        if ($adb->num_rows($result) > 0) {
            $total =0;
            $module = $adb->query_result($result, 0, 'setype');
            require_once('data/CRMEntity.php');
            $focus = CRMEntity::getInstance($module);
            $focus->retrieve_entity_info($recordid, $module);
            if (!isset($focus->column_fields['hdnSubTotal'],$focus->column_fields['hdnDiscountPercent'],$focus->column_fields['hdnDiscountAmount'])) return 0;
            $total += $focus->column_fields['hdnSubTotal'] * $focus->column_fields['hdnDiscountPercent'] / 100;
            $total += $focus->column_fields['hdnDiscountAmount'];
            $total = $total + 0;
            if ($format != 0) {
                if (isset($_REQUEST["commontemplateid"]) || isset($_REQUEST['pdftemplateid'])) {
                    $pdf_id=isset($_REQUEST["commontemplateid"])?$_REQUEST["commontemplateid"]:$_REQUEST['pdftemplateid'];
                    $sql = "SELECT decimals, decimal_point, thousands_separator FROM vtiger_pdfmaker_settings WHERE templateid = '".$pdf_id."' limit 1";
                    $res = $adb->query($sql);
                    if($adb->num_rows($res)) {
                        while($res && $row=$adb->fetch_row($res)) {
                            $decimals = $row['decimals'];
                            $decimal_point = $row['decimal_point'];
                            $thousands_separator = $row['thousands_separator'];
                        }
                    }
                } else {
                    $decimals = 0;
                    $decimal_point = ",";
                    $thousands_separator = "";
                }
                $total = number_format($total, $decimals, $decimal_point, $thousands_separator);
            }
            return $total;
        } else return 0;
    }
}
if (!function_exists('ShowSumOfAllDiscounts')) {
    function ShowSumOfAllDiscounts($format = 1)
    {
        $adb = PearDatabase::getInstance();
        $total =  ShowTotalDiscountsSum(0) + ShowLineItemsDiscounts(0);
        $total = $total + 0;
        if ($format != 0) {
            if (isset($_REQUEST["commontemplateid"]) || isset($_REQUEST['pdftemplateid'])) {
                $pdf_id=isset($_REQUEST["commontemplateid"])?$_REQUEST["commontemplateid"]:$_REQUEST['pdftemplateid'];
                $sql = "SELECT decimals, decimal_point, thousands_separator FROM vtiger_pdfmaker_settings WHERE templateid = '".$pdf_id."' limit 1";
                $res = $adb->query($sql);
                if($adb->num_rows($res)) {
                    while($res && $row=$adb->fetch_row($res)) {
                        $decimals = $row['decimals'];
                        $decimal_point = $row['decimal_point'];
                        $thousands_separator = $row['thousands_separator'];
                    }
                }
            } else {
                $decimals = 0;
                $decimal_point = ",";
                $thousands_separator = "";
            }
            $total = number_format($total, $decimals, $decimal_point, $thousands_separator);
        }
        return $total;
    }
}
if (!function_exists('FixRTLDirection')) {
    function FixRTLDirection($string)
    {
        $dir = isRTL($string)?'rtl':'ltr';
        return '<span dir="'.$dir.'" style="direction: '.$dir.';">'.$string.'</span>';
    }
}
if (!function_exists('isRTL')) {
    function isRtl($value) {
        $rtlChar = '/[\x{0590}-\x{083F}]|[\x{08A0}-\x{08FF}]|[\x{FB1D}-\x{FDFF}]|[\x{FE70}-\x{FEFF}]/u';
        return preg_match($rtlChar, $value) != 0;
    }
}
if (!function_exists('ParsVTNumberFormat')) {
    function ParsVTNumberFormat($number) {

        $PDFMaker_template_id = vglobal("PDFMaker_template_id");
        $adb = PearDatabase::getInstance();

        $sql = "SELECT decimals, decimal_point, thousands_separator
			FROM vtiger_pdfmaker_settings           
			WHERE templateid=?";
        $result = $adb->pquery($sql, array($PDFMaker_template_id));
        $data = $adb->fetch_array($result);

        $decimal_point = html_entity_decode($data["decimal_point"], ENT_QUOTES);
        $thousands_separator = html_entity_decode(($data["thousands_separator"] != "sp" ? $data["thousands_separator"] : " "), ENT_QUOTES);
        $decimals = $data["decimals"];
        $return = number_format ( $number , $decimals , $decimal_point , $thousands_separator );
        return $return;
    }
}
if (!function_exists('ParsVTNumberFormatDES')) {
    function ParsVTNumberFormatDES($number) {

        $PDFMaker_template_id = vglobal("PDFMaker_template_id");
        $adb = PearDatabase::getInstance();

        $sql = "SELECT decimals, decimal_point, thousands_separator
	   	   	   FROM vtiger_pdfmaker_settings           
	   	   	   WHERE templateid=?";
        $result = $adb->pquery($sql, array($PDFMaker_template_id));
        $data = $adb->fetch_array($result);

        $decimal_point = html_entity_decode($data["decimal_point"], ENT_QUOTES);
        $thousands_separator = html_entity_decode(($data["thousands_separator"] != "sp" ? $data["thousands_separator"] : " "), ENT_QUOTES);
        $decimals = $data["decimals"];

        $number = str_replace($thousands_separator, '', $number);
        $number = str_replace($decimal_point, '.', $number);

        if(intval($number)==$number){
            $decimals =0;
        }

        $return = number_format ( $number , $decimals , $decimal_point , $thousands_separator );
        return $return;
    }
}
if (!function_exists('ParsVTConvertDateToGregorian')) {
    function ParsVTConvertDateToGregorian($value,$format=false) {

        if (!checkParsVTActive()) return '';
        $dateValue = '';
        if ($value != '') {
            $dateValue = DateTimeField::convertToDBFormat($value);
            if ($format) {
                $dateValue = date($format,strtotime($dateValue));
            }
        }
        return $dateValue;
    }
}
if (!function_exists('ShowHtmlField')) {
    function ShowHtmlField($record,$field)
    {
        if (!checkParsVTActive() || !$record) return $record;
        $focus = Vtiger_Record_Model::getInstanceById($record);
        $htmlfield = $focus->get($field);
        return html_entity_decode($htmlfield,ENT_QUOTES);
    }
}
if ( ! function_exists( 'ParsVTStrReplace' ) ) {
    function ParsVTStrReplace( $string, $search, $replace = '' ) {
        return str_replace( $search, $replace, $string );
    }
}
if (!function_exists('StripHTMLTags')) {
    function StripHTMLTags($content)
    {
        if (!checkParsVTActive() || !$content) return $content;
        $content = strip_tags($content);
        $content = str_replace("&nbsp", "", $content);
        return html_entity_decode($content,ENT_QUOTES);
    }
}
if ( ! function_exists( 'showplaqueField' ) ) {
    function showplaqueField( $value , $element = " " ) {
        if ( strpos( $value, '-' ) !== false ) {
            $plaque = explode( '-', $value );
        }
        $html = '<span class="value" data-field-type="plaque">
  ' . $plaque[2] .$element . $plaque[3] . " " . $plaque[1] . " "  . $plaque[0] . ' 
</span>';

        return $html;
    }
}
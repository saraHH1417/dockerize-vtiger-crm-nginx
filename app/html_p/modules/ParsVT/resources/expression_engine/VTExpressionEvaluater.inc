<?php
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
$Yekan = array();
$Str_10_20 = array();
$Dahgan = array();
$Sadgan = array();
$DogNo = array();

function __vt_parsvt_translate($arr = array())
{
    $string='';
    $module = 'Vtiger';
    if (empty($arr)) return '';
    if (count($arr) == 2) {
        $string = $arr[0];
        $module = $arr[1];
    } elseif (count($arr) == 1) {
        $string = $arr[0];
    }
    if (empty($string)) return '';
    if (empty($module)) $module =  'Vtiger';
    return vtranslate($string, $module);
}

function __vt_parsvt_validatedate($arr = array())
{
    $date='';
    $format = 'Y-m-d';
    if (empty($arr)) return '';
    if (count($arr) == 2) {
        $date = $arr[0];
        $format = $arr[1];
    } elseif (count($arr) == 1) {
        $date = $arr[0];
    }
    if (empty($date)) return '';
    $d = DateTime::createFromFormat($format, $date);
    // The Y ( 4 digits year ) returns TRUE for any integer with any number of digits so changing the comparison from == to === fixes the issue.
    return $d && $d->format($format) === $date;
}

function __vt_parsvt_convert_to_user_format($date)
{
    $tmpdate = explode(" ", $date);
    if (!__vt_parsvt_validatedate(array($tmpdate[0]))) return $date;
    if (count($tmpdate) == 1) {
        return Vtiger_Date_UIType::getDisplayDateValue($date);
    } elseif (count($tmpdate) == 2 && __vt_parsvt_validatedate(array($tmpdate[1], "H:i:s"))) {
        return Vtiger_Datetime_UIType::getDisplayDateTimeValue($date);
    }
    return $date;
}

function __vt_parsvt_jalalidateformat($arr = array())
{
    $date='';
    $outFormat = 'Y-m-d';
    if (empty($arr)) return '';
    if (count($arr) == 2) {
        $date = $arr[0];
        $outFormat = $arr[1];
    } elseif (count($arr) == 1) {
        $date = $arr[0];
    }
    if (strlen($date) > 10)
        $date = substr($date, 0, 10);
    $sql_format_date = getValidDBInsertDateValue($date);
    if (class_exists('ParsVT_Adaptive_Helper'))
        return ParsVT_Adaptive_Helper::jdate($outFormat, strtotime($sql_format_date));
    else
        $date = new DateTime($sql_format_date);
    return $date->format($outFormat);
}

function __vt_parsvt_gregoriandateformat($arr = array())
{
    $value='';
    $format = 'Y-m-d';
    if (empty($arr)) return '';
    if (count($arr) == 2) {
        $value = $arr[0];
        $format = $arr[1];
    } elseif (count($arr) == 1) {
        $value = $arr[0];
    }
    if (empty($value)) return '';
    $dateValue = '';
    if ($value != '') {
        $dateValue = DateTimeField::convertToDBFormat($value);
        if ($format) {
            $dateValue = date($format, strtotime($dateValue));
        }
    }
    return $dateValue;
}

function __vt_parsvt_str_replace($arr = array())
{
    if (empty($arr)) return '';
    if (count($arr) == 3) {
        $string = $arr[0];
        $search = $arr[1];
        $replace = $arr[2];
        return str_replace($search, $replace, $string);
    } else {
        return '';
    }
}

function __vt_parsvt_convert_number_to_words($arr = array())
{
    $number='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $number = $arr[0];
    }
    if (empty($number)) return '';
    $number = str_replace(",", '', $number);
    $hyphen = '-';
    $conjunction = ' and ';
    $separator = ', ';
    $negative = 'negative ';
    $decimal = ' point ';
    $dictionary = array(
        0 => 'zero',
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
        10 => 'ten',
        11 => 'eleven',
        12 => 'twelve',
        13 => 'thirteen',
        14 => 'fourteen',
        15 => 'fifteen',
        16 => 'sixteen',
        17 => 'seventeen',
        18 => 'eighteen',
        19 => 'nineteen',
        20 => 'twenty',
        30 => 'thirty',
        40 => 'fourty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety',
        100 => 'hundred',
        1000 => 'thousand',
        1000000 => 'million',
        1000000000 => 'billion',
        1000000000000 => 'trillion',
        1000000000000000 => 'quadrillion',
        1000000000000000000 => 'quintillion'
    );

    if (!is_numeric($number)) {
        return '';
    }

    if (($number >= 0 && (int)$number < 0) || (int)$number < 0 - PHP_INT_MAX) {
        return '';
    }

    if ($number < 0) {
        return $negative . __vt_parsvt_convert_number_to_words(array(abs($number)));
    }

    $string = $fraction = null;

    if (strpos($number, '.') !== false) {
        list($number, $fraction) = explode('.', $number);
    }

    switch (true) {
        case $number < 21:
            $string = $dictionary[$number];
            break;
        case $number < 100:
            $tens = ((int)($number / 10)) * 10;
            $units = $number % 10;
            $string = $dictionary[$tens];
            if ($units) {
                $string .= $hyphen . $dictionary[$units];
            }
            break;
        case $number < 1000:
            $hundreds = $number / 100;
            $remainder = $number % 100;
            $string = $dictionary[$hundreds] . ' ' . $dictionary[100];
            if ($remainder) {
                $string .= $conjunction . __vt_parsvt_convert_number_to_words(array($remainder));
            }
            break;
        default:
            $baseUnit = pow(1000, floor(log($number, 1000)));
            $numBaseUnits = (int)($number / $baseUnit);
            $remainder = $number % $baseUnit;
            $string = __vt_parsvt_convert_number_to_words(array($numBaseUnits)) . ' ' . $dictionary[$baseUnit];
            if ($remainder) {
                $string .= $remainder < 100 ? $conjunction : $separator;
                $string .= __vt_parsvt_convert_number_to_words(array($remainder));
            }
            break;
    }

    if (null !== $fraction && is_numeric($fraction)) {
        $string .= $decimal;
        $words = array();
        foreach (str_split((string)$fraction) as $number) {
            $words[] = $dictionary[$number];
        }
        $string .= implode(' ', $words);
    }

    return $string;
}

function __vt_parsvt_str_0_100($No)
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

function __vt_parsvt_str_0_1000($No)
{
    global $Sadgan;
    $s = '';
    if ($No < 100)
        $s = __vt_parsvt_str_0_100($No);
    else {
        $s = $Sadgan[intval(($No / 100)) - 1];
        if ($No % 100 > 0)
            $s = $s . ' و ' . __vt_parsvt_str_0_100($No % 100);
    }
    return $s;
}

function __vt_parsvt_persian_number_to_word($arr = array())
{
    $number='';
    $thousands_separator = ',';
    if (empty($arr)) return '';
    if (count($arr) == 2) {
        $number = $arr[0];
        $thousands_separator = $arr[1];
    } elseif (count($arr) == 1) {
        $number = $arr[0];
    }
    if (empty($number)) return '';
    $number = str_replace($thousands_separator, "", $number);
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

    $DogNo[0] = "هزار";
    $DogNo[1] = "میلیون";
    $DogNo[2] = "میلیارد";
    $DogNo[3] = "تریلیون";


    $s = '';
    $i = 0;
    if ((int)$No == 0)
        $s = $Yekan[0];
    else
        while ($No > 0) {
            $k = $No - 1000 * intval(($No / 1000));
            $No = intval(($No / 1000));
            if ($k > 0) {
                if ($i > 0) {
                    if (strlen($s) > 0)
                        $s = $DogNo[$i - 1] . " و" . $s;
                    else
                        $s = $DogNo[$i - 1] . $s;
                }
                $s = __vt_parsvt_str_0_1000($k) . ' ' . $s;
            }
            $i = $i + 1;
        } //while
    return $s;
}

function __vt_parsvt_persian_number_to_word_full($arr = array())
{
    $number='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $number = $arr[0];
    }
    if (empty($number)) return '';
    $decimals = 0;
    $decimal_point = ",";
    $thousands_separator = " ";
    $number = str_replace($thousands_separator, "", $number);
    $FullNo = floatval(str_replace($decimal_point, ".", $number));
    if (strpos(strval($FullNo), '.') == 0)
        return __vt_parsvt_persian_number_to_word(array($FullNo, $thousands_separator));
    else {
        $No = 0.0;
        $Mantisa = 0.0;
        $S1 = $S2 = $str_mid = '';
        $No = intval(substr(strval($FullNo), 0, strpos(strval($FullNo), '.')));
        $S1 = __vt_parsvt_persian_number_to_word(array($No, $thousands_separator));
        $Mantisa = substr(strval($FullNo), strpos(strval($FullNo), '.') + 1);
        $S2 = __vt_parsvt_persian_number_to_word(array(intval($Mantisa)));
        switch (strlen(strval($FullNo)) - strpos(strval($FullNo), '.') - 1) {
            case 1:
                $str_mid = "دهم";
                break;
            case 2:
                $str_mid = "صدم";
                break;
            case 3:
                $str_mid = "هزارم";
                break;
        }
        return ($S2 == '' ? $S1 : $S1 . " و " . $S2 . ' ' . $str_mid);
    }
}

function __vt_parsvt_getgroupname($arr = array()) {
    $groupid='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $groupid = $arr[0];
    }
    if (empty($groupid)) return '';
    $result = Vtiger_Functions::getGroupName($groupid);
    if (is_array($result)) {
        $out = array();
        foreach ($result as $key => $value) {
            $out[] = $value;
        }
    } else return $result;
    return implode(",",$out);
}

function __vt_parsvt_getusername($arr = array()) {
    $userid='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $userid = $arr[0];
    }
    if (empty($userid)) return '';
    return Vtiger_Functions::getUserName($userid);
}

function __vt_parsvt_get_owner($arr = array()) {
    $id='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $id = $arr[0];
    }
    if (empty($id)) return '';
    $result = Vtiger_Functions::getOwnerRecordLabel($id);
    $out = array();
    foreach ($result as $key => $value) {
        $out[] = $value;
    }
    return implode(",",$out);
}

function __vt_parsvt_getuserfullname($arr = array()) {
    $userid='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $userid = $arr[0];
    }
    if (empty($userid)) return '';
    return Vtiger_Functions::getUserRecordLabel($userid);
}

function  __vt_parsvt_getrecordlabel($arr = array()) {
    $record_id='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $record_id = $arr[0];
    }
    if (empty($record_id)) return '';
    return Vtiger_Functions::getCRMRecordLabel($record_id);
}

function __vt_parsvt_makerandompassword() {
    return Vtiger_Functions::generateRandomPassword();
}

function __vt_parsvt_striphtmltags($arr = array())
{
    $content='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $content = $arr[0];
    }
    if (empty($content)) return '';
    $content = strip_tags($content);
    $content = str_replace("&nbsp", "", $content);
    return html_entity_decode($content,ENT_QUOTES);
}

function __vt_parsvt_getuserfullnamebyids($arr = array())
{
    $userids='';
    if (empty($arr)) return '';
    if (count($arr) == 1) {
        $userids = $arr[0];
    }
    if (empty($userids)) return '';
    global $adb;
    $name = array();
    $userids = explode(',',$userids);
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

function __vt_parsvt_citynamefield($arr = array())
{
    $language='fa_ir';
    $value = '';
    if (empty($arr)) return '';
    if (count($arr) == 2) {
        $value = $arr[0];
        $language = $arr[1];
    } elseif (count($arr) == 1) {
        $value = $arr[0];
    }
    if (empty($value)) return '';
    global $adb;
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

function __vt_parsvt_url_shortener($arr = array())
{
    if (empty($arr)) return '';
    $onetime = 0;
    $rewrite = 0;
    $full = 1;
    $uri = false;
    if (count($arr) == 4) {
        $uri = $arr[0];
        $onetime = $arr[1];
        $full = $arr[2];
        $rewrite = $arr[3];
    } elseif (count($arr) == 3) {
        $uri = $arr[0];
        $onetime = $arr[1];
        $full = $arr[2];
    } elseif (count($arr) == 2) {
        $uri = $arr[0];
        $onetime = $arr[1];
    } elseif (count($arr) == 1) {
        $uri = $arr[0];
    }
    if (empty($uri)) return '';
    $params = array(
        'URI' => $uri,
    );
    if ($onetime != 1) $onetime = 0;
    if ($rewrite != 1) $rewrite = 0;
    if ($full != 0) $full = 1;
    return ParsVT_URLShortener_Handler::generateURL($params, $onetime, $rewrite , $full);
}

function __vt_parsvt_get_pdfmaker_link($arr = array())
{
    if (empty($arr)) return '';
    $id = false;
    $templateid = '';
    $language = '';
    if (count($arr) == 3) {
        $id = $arr[0];
        $templateid = "&templateid=".$arr[1];
        $language = "&language=".$arr[2];
    } elseif (count($arr) == 2) {
        $id = $arr[0];
        $templateid = '&templateid=' . $arr[1];
    } elseif (count($arr) == 1) {
        $id = $arr[0];
    }
    if (empty($id)) return '';
    $encodedID = ParsVT_WebService_Model::encode_id($id);
    return "modules/ParsVT/ws/API/V2/Tools/Retrieve/showpdfmaker/?id=".$encodedID.$templateid.$language;
}


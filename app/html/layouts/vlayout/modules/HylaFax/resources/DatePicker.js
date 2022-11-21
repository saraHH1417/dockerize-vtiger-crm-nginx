//var dateObj = new Date();
//var dateObj = "1396-03-27";
//var dateObj = new Date();
//var dateObj = "1396-03-27";
var ParsCalenderType = jQuery('#parsvtiger_calendar_type').val();
var ParsDateFormat = jQuery('#pvt_date_format').val();
var dateObj = jQuery('#pvt_today').val();
var ParsvtigerDateFormat = app.convertToDatePickerFormat(ParsDateFormat);
//alert(dateObj);
if (typeof(ParsCalenderType) != 'undefined') {
    if (ParsCalenderType != 'islamic' && ParsCalenderType != 'jalali') {
        ParsCalenderType = 'gregorian';
    }
} else {
    ParsCalenderType = 'gregorian';
}

var weekDaysArray = {
    Sunday: 0,
    Monday: 1,
    Tuesday: 2,
    Wednesday: 3,
    Thursday: 4,
    Friday: 5,
    Saturday: 6
};
var defaultFirstDay = jQuery('#start_day').val();
if (defaultFirstDay == '' || typeof(defaultFirstDay) == 'undefined') {
    var convertedFirstDay = 1
} else {
    convertedFirstDay = weekDaysArray[defaultFirstDay];
}

function pvtdatepicker(element) {
    if ($(element).length == 0) return;
    var tmpvalue = jQuery(element).val();
    if (tmpvalue != '') {
        dateObj = tmpvalue;
    }
    //create parameter for datepicker
    var params = {
        format: ParsvtigerDateFormat,
        date: dateObj,
        calType: ParsCalenderType,
        starts: convertedFirstDay,
        eventName: "focus",
        autoclose: true,
        onBeforeShow: function() {},
        onChange: function(ev) {
            $(element).val(ev);
            $('.datepicker').hide();
        }
    };

    if (ParsCalenderType != 'gregorian') {
        var language = jQuery('body').data('language');
        var lang = language.split('_');
        params['locale'] = lang;

    }

    jQuery(element).DatePicker(params);
}

function searchdatepicker(element) {
    if ($(element).length == 0) return;
    var tmpvalue = jQuery(element).val();
    if (tmpvalue != '') {
        dateObj = tmpvalue;
    }
    //create parameter for datepicker
    var params = {
        format: 'm-Y',
        date: dateObj,
        calType: ParsCalenderType,
        starts: convertedFirstDay,
        eventName: "focus",
        autoclose: true,
        onBeforeShow: function() {},
        onChange: function(ev) {
            $(element).val(ev);
            $('.datepicker').hide();
        }
    };

    if (ParsCalenderType != 'gregorian') {
        var language = jQuery('body').data('language');
        var lang = language.split('_');
        params['locale'] = lang;

    }

    jQuery(element).DatePicker(params);
}


pvtdatepicker('#transfer_date');
pvtdatepicker('#date_start');
pvtdatepicker('#date_end');
searchdatepicker('#month_filter');
//jQuery(element'#transfer_date').DatePicker(params);
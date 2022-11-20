{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{if $content}
<div class="dashboardWidgetHeader">
	{include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME}
</div>
<div class="dashboardWidgetContent">
{/if}
    <div style='padding:5px'>

<div style="margin:0 auto;">


<div class="row form-group">

  <div class="col-xs-6">
     {vtranslate("Select Source Date","ParsVT")}
  </div>
  <div class="col-xs-6">
<select class="inputbox chzn-select select2" name="convertdate" onChange="switchCalendar(this.options[this.selectedIndex].value)">
  <option value="gregorian" {if $FIELD_VALUE eq "gregorian"} selected="" {/if}>{vtranslate("gregorian","ParsVT")}</option>
  <option value="persian" {if $FIELD_VALUE eq "jalali"} selected="" {/if}>{vtranslate("jalali","ParsVT")}</option>
  <option value="islamic" {if $FIELD_VALUE eq "islamic"} selected="" {/if}>{vtranslate("islamic","ParsVT")}</option>
</select>
  </div>
</div>

<form name="gregorian" style="display:block">
<div class="row form-group" style="text-align: center;">
  <div class="col-xs-4">
    <input class="form-control" placeholder="Day" type="text" name="day" value="1" size="3">
  </div>
  <div class="col-xs-4">
    <select class="form-control" name="month">
        <option value=1>{vtranslate("LBL_JANUARY","ParsVT")}
        <option value=2>{vtranslate("LBL_FEBRUARY","ParsVT")}
        <option value=3>{vtranslate("LBL_MARCH","ParsVT")}
        <option value=4>{vtranslate("LBL_APRIL","ParsVT")}
        <option value=5>{vtranslate("LBL_MAY","ParsVT")}
        <option value=6>{vtranslate("LBL_JUNE","ParsVT")}
        <option value=7>{vtranslate("LBL_JULY","ParsVT")}
        <option value=8>{vtranslate("LBL_AUGUST","ParsVT")}
        <option value=9>{vtranslate("LBL_SEPTEMBER","ParsVT")}
        <option value=10>{vtranslate("LBL_OCTOBER","ParsVT")}
        <option value=11>{vtranslate("LBL_NOVEMBER","ParsVT")}
        <option value=12>{vtranslate("LBL_DECEMBER","ParsVT")}
</select>
  </div>
  <div class="col-xs-4">
    <input class="form-control" placeholder="Year" type="text" name="year" value="1998" size="5">
  <input type="hidden" name="leap" value="" size="12" readonly style="display:none">
  <input type="hidden" name="wday" value="" size="9" readonly style="display:none">
  <input type="hidden" name="hour" value="00" size="2"><input type="hidden" name="min" value="00" size="2"><input type="hidden" name="sec" value="00" size="2">
  </div>

<div class="row form-group" style="text-align: center;">
  <button type="button" class="btn btn-primary" value="{vtranslate("Convert","ParsVT")}" onClick="calcGregorian();">{vtranslate("Convert","ParsVT")}</button>
</div>
</div>
</form>
<script language="JavaScript">
    var today = new Date();
    var y = today.getYear();
    if (y < 1000) {
        y += 1900;
    }
    document.gregorian.year.value = y

    document.gregorian.month.selectedIndex = today.getMonth();
    document.gregorian.day.value = today.getDate();
</script>
<form name="persian" style="display:none">
<div class="row form-group" style="text-align: center;">
  <div class="col-xs-4">
    <input class="form-control" placeholder="Day" type="text" name="day" value="1" size="3">
  </div>
  <div class="col-xs-4">
    <select class="form-control" name="month">
        <option value=1>{vtranslate("Farvardin","ParsVT")}
        <option value=2>{vtranslate("Ordibehesht","ParsVT")}
        <option value=3>{vtranslate("Khordad","ParsVT")}
        <option value=4>{vtranslate("Tir","ParsVT")}
        <option value=5>{vtranslate("Mordad","ParsVT")}
        <option value=6>{vtranslate("Shahrivar","ParsVT")}
        <option value=7>{vtranslate("Mehr","ParsVT")}
        <option value=8>{vtranslate("Aban","ParsVT")}
        <option value=9>{vtranslate("Azar","ParsVT")}
        <option value=10>{vtranslate("Dey","ParsVT")}
        <option value=11>{vtranslate("Bahman","ParsVT")}
        <option value=12>{vtranslate("Esfand","ParsVT")}
</select>
  </div>
  <div class="col-xs-4">
    <input class="form-control" placeholder="Year" type="text" name="year" value="" size="5">
  <input type="hidden" name="leap" value="" size="12" readonly style="display:none">
  <input type="hidden" name="wday" value="" size="9" readonly style="display:none">
  </div>

<div class="row form-group" style="text-align: center;">
  <button type="button" class="btn btn-primary" value="{vtranslate("Convert","ParsVT")}" onClick="calcPersian();">{vtranslate("Convert","ParsVT")}</button>
</div>
</div>
</form>
<form name="islamic" style="display:none">
<div class="row form-group" style="text-align: center;">
  <div class="col-xs-4">
    <input class="form-control" placeholder="Day" type="text" name="day" value="1" size="3">
  </div>
  <div class="col-xs-4">
    <select class="form-control" name="month">
        <option value=1>{vtranslate("Muḥarram","ParsVT")}
        <option value=2>{vtranslate("Safar","ParsVT")}
        <option value=3>{vtranslate("Rabi-al-awwal","ParsVT")}
        <option value=4>{vtranslate("Rabi-al-thani","ParsVT")}
        <option value=5>{vtranslate("Jumada-al-awwal","ParsVT")}
        <option value=6>{vtranslate("Jumada-al-thani","ParsVT")}
        <option value=7>{vtranslate("Rajab","ParsVT")}
        <option value=8>{vtranslate("Shaaban","ParsVT")}
        <option value=9>{vtranslate("Ramadan","ParsVT")}
        <option value=10>{vtranslate("Shawwal","ParsVT")}
        <option value=11>{vtranslate("Dhu-al-Qidah","ParsVT")}
        <option value=12>{vtranslate("Dhu-al-Hijjah","ParsVT")}
</select>
  </div>
  <div class="col-xs-4">
    <input class="form-control" placeholder="Year" type="text" name="year" value="" size="5">
  <input type="hidden" name="leap" value="" size="12" readonly style="display:none">
  <input type="hidden" name="wday" value="" size="9" readonly style="display:none">
  </div>

<div class="row form-group" style="text-align: center;">
  <button type="button" class="btn btn-primary" value="{vtranslate("Convert","ParsVT")}" onClick="calcIslamic();">{vtranslate("Convert","ParsVT")}</button>
</div>
</div>
</form>

<form name="julianday" style="display:none">
    <input type="hiden" name="day" value="" size="16">
</form>
<form name="modifiedjulianday" style="display:none">
    <input type="hidden" name="day" value="" size="16">
</form>
<script language="JavaScript">
    calcGregorian();  
</script>

<div id="outputdate" class="row form-group alert alert-info" style="text-align:center; margin-top:-20px">
</div>



</div>


    </div>
{if $content}

</div>

<div class="widgeticons dashBoardWidgetFooter">
    <div class="footerIcons pull-right">
        {include file="dashboards/DashboardFooterIcons.tpl"|@vtemplate_path:$MODULE_NAME}
    </div>
</div>
{/if}
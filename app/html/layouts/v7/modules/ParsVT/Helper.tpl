{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{assign var=USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
{strip}
{literal}
    <style>
        .parsvideoimage:hover {cursor: help; background: -moz-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(255,255,255,1)), color-stop(51%, rgba(0,0,0,1)), color-stop(100%, rgba(0,0,0,1)));background:-webkit-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);background: -o-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);background: -ms-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);background:radial-gradient(ellipse at center, rgba(255,255,255,1) 0%, rgba(0,0,0,1) 51%, rgba(0,0,0,1) 100%);filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#000000',GradientType=1 );opacity:0.5;}.parspresent {min-height: 400px;min-width: 600px }#helperContainer .showaboutus {width: 40em;height: 18em;margin: 1em auto;overflow: hidden;background: white;position: relative;box-sizing: border-box }#helperContainer .marquee {top: 6em;position: relative;box-sizing: border-box;animation: marquee 15s linear infinite }#helperContainer .marquee:hover {animation-play-state: paused }@keyframes marquee {0% {top: 8em }100% {top: -31em }}#helperContainer .showaboutus .marquee {margin: 0;padding: 0 1em;line-height: 1.5em;font: 1em Tahoma, Helvetica, Sans-Serif }#helperContainer .showaboutus:before, #helperContainer .showaboutus::before, #helperContainer .showaboutus:after, #helperContainer .showaboutus::after {left: 0;z-index: 1;content: '';position: absolute;pointer-events: none;width: 100%;height: 2em;background-image: linear-gradient(180deg, #FFF, rgba(255, 255, 255, 0)) }#helperContainer showaboutus:after, #helperContainer .showaboutus::after {bottom: 0;transform: rotate(180deg) }#helperContainer .showaboutus:before, #helperContainer .showaboutus::before {top: 0 }#helperContainer .modal-body {max-height: unset !important;}#helperContainer .nav {padding-left: 0 !important;padding-right: 0 !important;}#helperContainer .active a {display: block;width: 100%;}#helperContainer li a {text-indent: 10px;}#helperContainer .panel-body {padding: 0;}#helperContainer .title {width: 91%;float: left;}#helperContainer .other-video {background: #efefef;padding: 10px;border-radius: 3px;}#helperContainer .nav-pills > li + li {margin-left: 0px;}.tree, .tree ul {margin: 0;padding: 0;list-style: none;direction: ltr;font-size: 15px;background-color: #f8f8f8;}.tree ul {margin-left: 1em;position: relative }.tree ul ul {margin-left: .5em }.tree ul:before {content: "";display: block;width: 0;position: absolute;top: 0;bottom: 0;right: 0;border-left: 1px solid;color: rgba(0, 0, 0, 0.51);}.tree li {margin: 0;padding: 0 1em;line-height: 2em;color: #369;font-weight: 700;position: relative }.tree ul li:before {content: "";display: block;width: 10px;height: 0;border-top: 1px solid;margin-top: -1px;position: absolute;top: 1em;right: 0;color: rgba(0, 0, 0, 0.51);}.tree ul li:last-child:before {background: #f8f8f8;height: auto;top: 1em;bottom: 0 }.indicator {margin-right: 5px;float: right;padding-left: 6px;margin-top: 7px;color: rgba(0, 0, 0, 0.51);}.tree li a {text-decoration: none;color: #369;}.tree li button, .tree li button:active, .tree li button:focus {text-decoration: none;color: #369;border: none;background: transparent;margin: 0px 0px 0px 0px;padding: 0px 0px 0px 0px;outline: 0;}.bg-gray {background-color: #cccccc75;}.oStyle {padding: 20px;border-top: 1px solid #adada5ab;border-right: 1px solid #adada5ab;border-radius: 2px;border-left: 1px solid #d2d2d1;border-bottom: 1px solid #d2d2d1;box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.2), 0 1px 0px 0 rgba(0, 0, 0, 0.19);}.vtitle {padding: 10px 0;font-size: 20px;}.cvideo {padding: 10px 0;font-size: 13px;}.indicator-text {color: #000;}
        .blink_me { animation: blinker 3s linear infinite; font-weight: bold; } @keyframes blinker {50% { opacity: 0.5; } }
    </style>
{/literal}
    <div id="helperContainer" class='fc-overlay-modal modal-content' style="height:100%;">
        <div class="overlayHeader">
            {assign var=HEADER_TITLE value="ParsVT Helper"}
            {include file="ModalHeader.tpl"|vtemplate_path:$MODULE TITLE=$HEADER_TITLE}
        </div>
        <hr style="margin:0px;">
        <div class='modal-body overflowYAuto'>
            <div class='datacontent'>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="panel panel-default">
                            <div class="panel-footer">{vtranslate('Main Menu',$MODULE)}</div>
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked" style="margin-bottom: 0;border-bottom: 0;">
                                    <li class="active"><a href="#HelperTutorials" data-toggle="tab"
                                                          class="Tutorials"><strong>{vtranslate('Video Tutorials',$MODULE)}</strong></a>
                                    </li>
			   	    {if $USER_MODEL->isAdminUser()}
                                    <li><a href="#HelperHelpDesk" data-toggle="tab"
                                           class="HelpDesk"><strong>{vtranslate('Send Support Ticket',$MODULE)}</strong></a>
                                    </li>
				    {/if}
                                    <li><a href="#HelperAbout" data-toggle="tab"
                                           class="About"><strong>{vtranslate('About Us',$MODULE)}</strong></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="refreshVideoList">
                            {if $refreshVideoList}
                                <button type="button" class="blink_me btn btn-info col-md-12 pars_video_refresh_btn"
                                        style="margin-bottom: 5px"> {vtranslate('Update videos list',$MODULE)} <i
                                            class="fa fa-refresh"></i></button>
                            {/if}
                            <button type="button" class="btn btn-danger col-md-12 pars_video_category_btn"
                                    style="margin-bottom: 5px"> {vtranslate('List of Videos',$MODULE)} <i class="fa fa-list"></i></button>
                            <button type="button" class="btn btn-warning col-md-12" onclick="window.open('http://parsvt.com/webinar')"
                                    style="margin-bottom: 30px"> {vtranslate('List of Webinars',$MODULE)} <i class="fa fa-video-camera"></i></button>
                        </div>
                        <hr>
                        <div class="pars_video_div">
                            {if $ParsVTVideo|@count gt 1}
                                <h4>{vtranslate('Other videos of this section',$MODULE)}</h4>
                                {assign var=videocounter value="1"}
                                <div class="pars_video_content_div">
                                    {foreach from=$ParsVTVideo key=itemKey item=itemValue}
                                        {if $itemKey eq 0} {continue} {/if}
                                        {if $videocounter eq 4}{break}{/if}
                                        {assign var=videocounter value=$videocounter+1}
                                        <div class="panel panel-default">
                                            <div class="panel-footer">
                                                <i class="fa fa-video-camera" aria-hidden="true"></i>
                                                <div class="title">{$itemValue['title']}</div>
                                            </div>
                                            <div class="panel-body subvideo" data-id="{$itemValue['id']}" >
                                                {if $itemValue['path_picture'] eq ''}
                                                    <img class="parsvideoimage" src="http://license.aweb.co/videos/default_video.png"
                                                         width="100%">
                                                {else}
                                                    <img class="parsvideoimage" src="{$itemValue['path_picture']}"
                                                         width="100%">
                                                {/if}
                                                <button class="btn btn-primary pars_video_btn"
                                                        data-id="{$itemValue['id']}" style="margin: 10px"
                                                        width="100%">{$itemValue['title']}</button>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            {/if}
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="tab-content layoutContent themeTableColor overflowVisible">
                            <div class="tab-pane active" id="HelperTutorials" style="text-align: right;direction: rtl;">
                                {if $ParsVT eq 'OK'}
                                    {if $ParsVTVideoIsCategory eq 1}
                                        <div class="col-md-4 pull-right">
                                            <ul id="tree2" class="tree">
                                                {foreach from=$ParsVTVideo key=k item=v}
                                                    {if $k neq '0'}<li class="text-danger">
                                                        <i class="indicator glyphicon glyphicon-folder-open"></i>
                                                        <span class="indicator-text">{$k}</span>{else}  {/if}
                                                    <ul>
                                                        {foreach from=$v key=k1 item=v1}
                                                            {if $k1 neq '0'}<li class="text-success">
                                                                <i class="indicator glyphicon glyphicon-folder-open"></i>
                                                                <span class="indicator-text">{$k1}</span>{else}  {/if}
                                                            <ul>
                                                                {foreach from=$v1 key=k2 item=v2}
                                                                    {*{$v2|@print_r}*}
                                                                    <li><a class="pars_video_btn subvideo" data-id="{$v2['id']}"><i
                                                                                    class="indicator glyphicon glyphicon-expand"></i>{$v2['title']}
                                                                        </a></li>
                                                                {/foreach}
                                                            </ul>
                                                            {if $k1 neq '0'}</li>{/if}
                                                        {/foreach}
                                                    </ul>
                                                    {if $k1 neq '0'}</li>{/if}
                                                {/foreach}
                                            </ul>
                                        </div>
                                        <div class="col-md-8">
                                            <div id="15425207818329342">
                                                <script type="text/JavaScript"
                                                        src="https://www.aparat.com/embed/bIcdo?data[rnddiv]=15425207818329342&data[responsive]=yes"></script>
                                            </div>
                                        </div>
                                    {else}
                                        <div class="row-fluid pars_video_source">
                                            {if $ParsVTVideo[0]['upload_type'] eq 'URL'}
                                                {$ParsVTVideo[0]['path_video']}
                                            {else}
                                                <video width="100%" controls controlsList="nodownload">
                                                    <source src="{$ParsVTVideo[0]['path_video']}" type="video/mp4">
                                                </video>
                                            {/if}
                                            <div class="row-fluid pars_video_source">
                                                <h2>{$ParsVTVideo[0]['title']}</h2>
                                                <br>
                                            </div>
                                            <p>{$ParsVTVideo[0]['comment']}</p>
                                        </div>
                                        <div class="pars_relatedvideo_div">
                                            {assign var=videocounter value="1"}
                                            {assign var=related_video value=$ParsVTVideo[0]['related_video']}
                                            {if $related_video[0] neq ''}
                                                <hr>
                                                <h4>{vtranslate('Related Videos',$MODULE)}</h4>
                                                <br>
                                                {foreach from=$related_video key=itemKey item=itemValue}
                                                    {if $videocounter eq 4}{break}{/if}
                                                    {assign var=videocounter value=$videocounter+1}
                                                    <div class="col-lg-3">
                                                        <div class="panel panel-default">
                                                            <div class="panel-footer">
                                                                <i class="fa fa-video-camera" aria-hidden="true"></i>
                                                                <div class="title">{$itemValue}</div>
                                                            </div>
                                                            <div class="panel-body subrelvideo" data-name="{$itemValue}">
                                                                <img src="http://license.aweb.co/videos/default_video.png"
                                                                     class="parsvideoimage"  width="100%">
                                                                <button class="btn btn-primary pars_relatedvideo_btn"
                                                                        data-name="{$itemValue}"
                                                                        style="margin: 10px">{$itemValue}</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                {/foreach}
                                            {/if}
                                        </div>
                                    {/if}
                                {else}
                                    <h3 class="text-danger">{vtranslate('Unable to connect to the internet. This may be a temporary network issue. Check your network and try again. If the problem persists, contact network administrator', $MODULE)}</h3>
                                {/if}
                            </div>
			   {if $USER_MODEL->isAdminUser()}
                            <div class="tab-pane" id="HelperHelpDesk">
                                <div class="row-fluid">
                                    {$ticket}
                                </div>
                            </div>
			    {/if}
                            <div class="tab-pane" id="HelperAbout">
                                <div class="row-fluid">
                                    <div class="row form-group">
                                        <div style="padding:30px;text-align: center; min-height:40vh">
                                            <a href="//www.vtfarsi.ir" target="_blank"><img src="layouts/{vglobal('default_layout')}/modules/ParsVT/images/logo.png"></a><br><br>
                                            <p>
                                                {vtranslate('Powered by vtiger CRM',$MODULE)}
                                                - {vglobal('vtiger_current_version')} &nbsp;© 2004 - {date('Y')}<br>
                                                {vtranslate('Developed by ParsVT Team',$MODULE)} - {$ParsVTVersion}
                                                ({$ParsVTPatch}) &nbsp;© 2013 - {date('Y')}
                                                <br/>
                                                <div class="showaboutus">
                                            <p class="marquee">
                                                {$ABOUTUS}
                                            </p>
                                        </div>

                                        <br/><br/><br/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div id="parscategory" style="display: none;">
                            <div class="col-md-4 pull-right">
                                <ul id="tree2" class="tree">
                                    {foreach from=$ParsVTVideoCategory key=k item=v}
                                        {if $k neq '0'}<li class="text-danger">
                                            <i class="indicator glyphicon glyphicon-folder-open"></i>
                                            <span class="indicator-text">{$k}</span>{else}  {/if}
                                        <ul>
                                            {foreach from=$v key=k1 item=v1}
                                                {if $k1 neq '0'}<li class="text-success">
                                                    <i class="indicator glyphicon glyphicon-folder-open"></i>
                                                    <span class="indicator-text">{$k1}</span>{else}  {/if}
                                                <ul>
                                                    {foreach from=$v1 key=k2 item=v2}
                                                        {*{$v2|@print_r}*}
                                                        <li><a class="pars_video_btn subvideo" data-id="{$v2['id']}"><i
                                                                        class="indicator glyphicon glyphicon-expand"></i>{$v2['title']}
                                                            </a></li>
                                                    {/foreach}
                                                </ul>
                                                {if $k1 neq '0'}</li>{/if}
                                            {/foreach}
                                        </ul>
                                        {if $k1 neq '0'}</li>{/if}
                                    {/foreach}
                                </ul>
                            </div>
                            <div class="col-md-8">
                                <iframe class='parspresent'
                                        src="https://www.aparat.com/video/video/embed/videohash/bIcdo/vt/frame"
                                        style="border:0px #ffffff none;" scrolling="no" frameborder="1"
                                        marginheight="0px" marginwidth="0px" width="100%" allowfullscreen></iframe>
                                {*<div id="15425207818329342"><script type="text/JavaScript" src="https://www.aparat.com/embed/bIcdo?data[rnddiv]=15425207818329342&data[responsive]=yes"></script></div>*}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="min-height: 50px"></div>
        </div>
    </div>
    </div>
    <script>
        var PVTHelpers = {
            tr1: "{vtranslate('Related Videos', $MODULE)}",
            tr2: "{vtranslate('Ticket was successfully sent', $MODULE)}",
            tr3: "{vtranslate('Send new ticket failed', $MODULE)}",
            tr4: "{vtranslate('View ticket', $MODULE)}",
            tr5: "{vtranslate('Main Menu', $MODULE)}",
            tr6: "{vtranslate('Video Tutorials', $MODULE)}",
            tr7: "{vtranslate('Submit Support Ticket', $MODULE)}",
            tr8: "{vtranslate('Update videos', $MODULE)}",
            tr9: "{vtranslate('Other videos of this section', $MODULE)}",
        };
    </script>
{/strip}
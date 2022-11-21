{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{include file='SettingsHeader.tpl'|@vtemplate_path:$QUALIFIED_MODULE}
<style>
    .slidecontainer {
        width: 100%;
    }

    .slider {
        -webkit-appearance: none;
        width: 100%;
        height: 15px;
        border-radius: 5px;
        background: #d3d3d3;
        outline: none;
        opacity: 0.7;
        -webkit-transition: .2s;
        transition: opacity .2s;
    }

    .slider:hover {
        opacity: 1;
    }

    .slider::-webkit-slider-thumb {
        -webkit-appearance: none;
        appearance: none;
        width: 25px;
        height: 25px;
        border-radius: 50%;
        background: #4CAF50;
        cursor: pointer;
    }

    .slider::-moz-range-thumb {
        width: 25px;
        height: 25px;
        border-radius: 50%;
        background: #4CAF50;
        cursor: pointer;
    }
</style>
<div class="settingsIndexPage col-lg-12 col-md-12 col-sm-12" id="ParsVTExtraSettings">
    <div>
        <div>
            <div class="container-fluid">
                <div class="contents">
                    <br>
                </div>
                <div class="container-fluid">
                    <div class="related-tabs">
                        <div class="row form-group">
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>{vtranslate('Settings',$QUALIFIED_MODULE)}</legend>
                                    <form class="form-horizontal" action = 'index.php' method = 'POST'>
                                        <input type="hidden" class="hide" name="module" value="ParsVTExtras">
                                        <input type="hidden" class="hide" name="view" value="TTS">
                                        <input type="hidden" class="hide" name="action" value="ActionAjax">
                                        <input type="hidden" class="hide" name="mode" value="SaveTTS">

                                        <table class="table">
                                            <tbody>
                                            <tr><td width="30%" class="medium">{vtranslate('Service Type',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <select id="TTSStatus" class="select2 inputElement" name="TTSType">
                                                        <option value="cloud" {if $TTSType eq 'cloud'}selected{/if}>{vtranslate("Cloud",$QUALIFIED_MODULE)}</option>
                                                        <option value="onpromise" {if $TTSType eq 'onpromise'}selected{/if}>{vtranslate("On-Promise",$QUALIFIED_MODULE)}</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr  class="cloud {if $TTSType neq 'cloud'}hide{/if}">
                                                <td width="30%" class="medium">{vtranslate('API Key',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <input type="text" class="inputElement" name="APIKey" value="{$APIKey}">
                                                </td>
                                            </tr>
                                            <tr class="onpromise {if $TTSType eq 'cloud'}hide{/if}">
                                                <td width="30%" class="medium">{vtranslate('Server IP',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <input type="text" class="inputElement" name="ServerIP" value="{$ServerIP}">
                                                </td>
                                            </tr>
                                            <tr  class="onpromise {if $TTSType eq 'cloud'}hide{/if}">
                                                <td width="30%" class="medium">{vtranslate('Server Port',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <input type="number" class="inputElement " name="ServerPort" value="{$ServerPort}">
                                                </td>
                                            </tr>
                                            <tr class="onpromise {if $TTSType eq 'cloud'}hide{/if}">
                                                <td width="30%" class="medium">{vtranslate('Username',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <input type="text" class="inputElement" name="Username" value="{$Username}">
                                                </td>
                                            </tr>
                                            <tr class="onpromise {if $TTSType eq 'cloud'}hide{/if}">
                                                <td width="30%" class="medium">{vtranslate('Password',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <input type="password" class="inputElement" name="Password" value="{$Password}">
                                                </td>
                                            </tr>

                                            <tr><td width="30%" class="medium">{vtranslate('Speaker',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <select class="select2 inputElement" name="Speaker">
                                                        <option value="Male1" {if $Speaker eq 'Male1'}selected{/if}>{vtranslate("Man 1",$QUALIFIED_MODULE)}</option>
                                                        <option value="Male2" {if $Speaker eq 'Male2'}selected{/if}>{vtranslate("Man 2",$QUALIFIED_MODULE)}</option>
                                                        <option value="Female1" {if $Speaker eq 'Female1' || $Speaker eq ''}selected{/if}>{vtranslate("Female",$QUALIFIED_MODULE)}</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="30%" class="medium">{vtranslate('Pitch Level',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <div class="slidecontainer">
                                                        <input type="range" min="1" max="10" value="{$PitchLevel}" class="slider" name="PitchLevel">
                                                        <p>{vtranslate('Value',$QUALIFIED_MODULE)}: <span class="slidevalue">{$PitchLevel}</span></p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="30%" class="medium">{vtranslate('Punctuation Level',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <div class="slidecontainer">
                                                        <input type="range" min="0" max="3" value="{$PunctuationLevel}" class="slider" name="PunctuationLevel">
                                                        <p>{vtranslate('Value',$QUALIFIED_MODULE)}: <span class="slidevalue">{$PunctuationLevel}</span></p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="30%" class="medium">{vtranslate('Speech Speed Level',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <div class="slidecontainer">
                                                        <input type="range" min="1" max="10" value="{$SpeechSpeedLevel}" class="slider" name="SpeechSpeedLevel">
                                                        <p>{vtranslate('Value',$QUALIFIED_MODULE)}: <span class="slidevalue">{$SpeechSpeedLevel}</span></p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="30%" class="medium">{vtranslate('Tone Level',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <div class="slidecontainer">
                                                        <input type="range" min="1" max="19" value="{$ToneLevel}" class="slider" name="ToneLevel">
                                                        <p>{vtranslate('Value',$QUALIFIED_MODULE)}: <span class="slidevalue">{$ToneLevel}</span></p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="30%" class="medium">{vtranslate('Gain Level',$QUALIFIED_MODULE)}</td>
                                                <td class="medium">
                                                    <div class="slidecontainer">
                                                        <input type="range" min="1" max="5" value="{$GainLevel}" class="slider" name="GainLevel">
                                                        <p>{vtranslate('Value',$QUALIFIED_MODULE)}: <span class="slidevalue">{$GainLevel}</span></p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="medium" colspan="2"></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="widget_header row-fluid">
                                            <div class="span4 btn-toolbar">
                                                <div>
                                                    <button class="btn btn-success saveButton" type="submit" title="{vtranslate("Save",$QUALIFIED_MODULE)}"><strong>{vtranslate("Save",$QUALIFIED_MODULE)}</strong></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>


                                </fieldset>
                            </div>
                            <div class="col-md-6">
                                <fieldset class="vtToolBox">
                                    <legend>
                                        <i class="fa fa-info-circle"></i>&nbsp;&nbsp;&nbsp;{vtranslate("Ariana TTS Features", $QUALIFIED_MODULE)}
                                    </legend>
                                    <p>
                                        {vtranslate('LBL_ARIANA_DESC',$QUALIFIED_MODULE)}<br/>
                                        <a href="http://asr-gooyesh.com/fa/product/ariana-service/" target="_blank"><strong>{vtranslate('Read more information',$QUALIFIED_MODULE)}</strong></a><br/></p>
                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function() {
            $('#TTSStatus').change(function(){
                if($('#TTSStatus').val() == 'cloud') {
                    $('.cloud').removeClass('hide');
                    $('.onpromise').addClass('hide');
                } else {
                    $('.onpromise').removeClass('hide');
                    $('.cloud').addClass('hide');
                }
            });
        $('.slider').change(function(e){
            $(this).parent().find("span.slidevalue").html($(this).val());
        });
    });
</script>
(function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.Recorder = f()}})(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
"use strict";

module.exports = require("./recorder").Recorder;

},{"./recorder":2}],2:[function(require,module,exports){
'use strict';

var _createClass = (function () {
    function defineProperties(target, props) {
        for (var i = 0; i < props.length; i++) {
            var descriptor = props[i];descriptor.enumerable = descriptor.enumerable || false;descriptor.configurable = true;if ("value" in descriptor) descriptor.writable = true;Object.defineProperty(target, descriptor.key, descriptor);
        }
    }return function (Constructor, protoProps, staticProps) {
        if (protoProps) defineProperties(Constructor.prototype, protoProps);if (staticProps) defineProperties(Constructor, staticProps);return Constructor;
    };
})();

Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.Recorder = undefined;

var _inlineWorker = require('inline-worker');

var _inlineWorker2 = _interopRequireDefault(_inlineWorker);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : { default: obj };
}

function _classCallCheck(instance, Constructor) {
    if (!(instance instanceof Constructor)) {
        throw new TypeError("Cannot call a class as a function");
    }
}

var Recorder = exports.Recorder = (function () {
    function Recorder(source, cfg) {
        var _this = this;

        _classCallCheck(this, Recorder);

        this.config = {
            bufferLen: 4096,
            numChannels: 2,
            mimeType: 'audio/wav'
        };
        this.recording = false;
        this.callbacks = {
            getBuffer: [],
            exportWAV: []
        };

        Object.assign(this.config, cfg);
        this.context = source.context;
        this.node = (this.context.createScriptProcessor || this.context.createJavaScriptNode).call(this.context, this.config.bufferLen, this.config.numChannels, this.config.numChannels);

        this.node.onaudioprocess = function (e) {
            if (!_this.recording) return;

            var buffer = [];
            for (var channel = 0; channel < _this.config.numChannels; channel++) {
                buffer.push(e.inputBuffer.getChannelData(channel));
            }
            _this.worker.postMessage({
                command: 'record',
                buffer: buffer
            });
        };

        source.connect(this.node);
        this.node.connect(this.context.destination); //this should not be necessary

        var self = {};
        this.worker = new _inlineWorker2.default(function () {
            var recLength = 0,
                recBuffers = [],
                sampleRate = undefined,
                numChannels = undefined;

            self.onmessage = function (e) {
                switch (e.data.command) {
                    case 'init':
                        init(e.data.config);
                        break;
                    case 'record':
                        record(e.data.buffer);
                        break;
                    case 'exportWAV':
                        exportWAV(e.data.type);
                        break;
                    case 'getBuffer':
                        getBuffer();
                        break;
                    case 'clear':
                        clear();
                        break;
                }
            };

            function init(config) {
                sampleRate = config.sampleRate;
                numChannels = config.numChannels;
                initBuffers();
            }

            function record(inputBuffer) {
                for (var channel = 0; channel < numChannels; channel++) {
                    recBuffers[channel].push(inputBuffer[channel]);
                }
                recLength += inputBuffer[0].length;
            }

            function exportWAV(type) {
                var buffers = [];
                for (var channel = 0; channel < numChannels; channel++) {
                    buffers.push(mergeBuffers(recBuffers[channel], recLength));
                }
                var interleaved = undefined;
                if (numChannels === 2) {
                    interleaved = interleave(buffers[0], buffers[1]);
                } else {
                    interleaved = buffers[0];
                }
                var dataview = encodeWAV(interleaved);
                var audioBlob = new Blob([dataview], { type: type });

                self.postMessage({ command: 'exportWAV', data: audioBlob });
            }

            function getBuffer() {
                var buffers = [];
                for (var channel = 0; channel < numChannels; channel++) {
                    buffers.push(mergeBuffers(recBuffers[channel], recLength));
                }
                self.postMessage({ command: 'getBuffer', data: buffers });
            }

            function clear() {
                recLength = 0;
                recBuffers = [];
                initBuffers();
            }

            function initBuffers() {
                for (var channel = 0; channel < numChannels; channel++) {
                    recBuffers[channel] = [];
                }
            }

            function mergeBuffers(recBuffers, recLength) {
                var result = new Float32Array(recLength);
                var offset = 0;
                for (var i = 0; i < recBuffers.length; i++) {
                    result.set(recBuffers[i], offset);
                    offset += recBuffers[i].length;
                }
                return result;
            }

            function interleave(inputL, inputR) {
                var length = inputL.length + inputR.length;
                var result = new Float32Array(length);

                var index = 0,
                    inputIndex = 0;

                while (index < length) {
                    result[index++] = inputL[inputIndex];
                    result[index++] = inputR[inputIndex];
                    inputIndex++;
                }
                return result;
            }

            function floatTo16BitPCM(output, offset, input) {
                for (var i = 0; i < input.length; i++, offset += 2) {
                    var s = Math.max(-1, Math.min(1, input[i]));
                    output.setInt16(offset, s < 0 ? s * 0x8000 : s * 0x7FFF, true);
                }
            }

            function writeString(view, offset, string) {
                for (var i = 0; i < string.length; i++) {
                    view.setUint8(offset + i, string.charCodeAt(i));
                }
            }

            function encodeWAV(samples) {
                var buffer = new ArrayBuffer(44 + samples.length * 2);
                var view = new DataView(buffer);

                /* RIFF identifier */
                writeString(view, 0, 'RIFF');
                /* RIFF chunk length */
                view.setUint32(4, 36 + samples.length * 2, true);
                /* RIFF type */
                writeString(view, 8, 'WAVE');
                /* format chunk identifier */
                writeString(view, 12, 'fmt ');
                /* format chunk length */
                view.setUint32(16, 16, true);
                /* sample format (raw) */
                view.setUint16(20, 1, true);
                /* channel count */
                view.setUint16(22, numChannels, true);
                /* sample rate */
                view.setUint32(24, sampleRate, true);
                /* byte rate (sample rate * block align) */
                view.setUint32(28, sampleRate * 4, true);
                /* block align (channel count * bytes per sample) */
                view.setUint16(32, numChannels * 2, true);
                /* bits per sample */
                view.setUint16(34, 16, true);
                /* data chunk identifier */
                writeString(view, 36, 'data');
                /* data chunk length */
                view.setUint32(40, samples.length * 2, true);

                floatTo16BitPCM(view, 44, samples);

                return view;
            }
        }, self);

        this.worker.postMessage({
            command: 'init',
            config: {
                sampleRate: this.context.sampleRate,
                numChannels: this.config.numChannels
            }
        });

        this.worker.onmessage = function (e) {
            var cb = _this.callbacks[e.data.command].pop();
            if (typeof cb == 'function') {
                cb(e.data.data);
            }
        };
    }

    _createClass(Recorder, [{
        key: 'record',
        value: function record() {
            this.recording = true;
        }
    }, {
        key: 'stop',
        value: function stop() {
            this.recording = false;
        }
    }, {
        key: 'clear',
        value: function clear() {
            this.worker.postMessage({ command: 'clear' });
        }
    }, {
        key: 'getBuffer',
        value: function getBuffer(cb) {
            cb = cb || this.config.callback;
            if (!cb) throw new Error('Callback not set');

            this.callbacks.getBuffer.push(cb);

            this.worker.postMessage({ command: 'getBuffer' });
        }
    }, {
        key: 'exportWAV',
        value: function exportWAV(cb, mimeType) {
            mimeType = mimeType || this.config.mimeType;
            cb = cb || this.config.callback;
            if (!cb) throw new Error('Callback not set');

            this.callbacks.exportWAV.push(cb);

            this.worker.postMessage({
                command: 'exportWAV',
                type: mimeType
            });
        }
    }], [{
        key: 'forceDownload',
        value: function forceDownload(blob, filename) {
            var url = (window.URL || window.webkitURL).createObjectURL(blob);
            var link = window.document.createElement('a');
            link.href = url;
            link.download = filename || 'output.wav';
            var click = document.createEvent("Event");
            click.initEvent("click", true, true);
            link.dispatchEvent(click);
        }
    }]);

    return Recorder;
})();

exports.default = Recorder;

},{"inline-worker":3}],3:[function(require,module,exports){
"use strict";

module.exports = require("./inline-worker");
},{"./inline-worker":4}],4:[function(require,module,exports){
(function (global){
"use strict";

var _createClass = (function () { function defineProperties(target, props) { for (var key in props) { var prop = props[key]; prop.configurable = true; if (prop.value) prop.writable = true; } Object.defineProperties(target, props); } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var _classCallCheck = function (instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } };

var WORKER_ENABLED = !!(global === global.window && global.URL && global.Blob && global.Worker);

var InlineWorker = (function () {
  function InlineWorker(func, self) {
    var _this = this;

    _classCallCheck(this, InlineWorker);

    if (WORKER_ENABLED) {
      var functionBody = func.toString().trim().match(/^function\s*\w*\s*\([\w\s,]*\)\s*{([\w\W]*?)}$/)[1];
      var url = global.URL.createObjectURL(new global.Blob([functionBody], { type: "text/javascript" }));

      return new global.Worker(url);
    }

    this.self = self;
    this.self.postMessage = function (data) {
      setTimeout(function () {
        _this.onmessage({ data: data });
      }, 0);
    };

    setTimeout(function () {
      func.call(self);
    }, 0);
  }

  _createClass(InlineWorker, {
    postMessage: {
      value: function postMessage(data) {
        var _this = this;

        setTimeout(function () {
          _this.self.onmessage({ data: data });
        }, 0);
      }
    }
  });

  return InlineWorker;
})();

module.exports = InlineWorker;
}).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
},{}]},{},[1])(1);
});

URL = window.URL || window.webkitURL;

var gumStreamRecord; 						//stream from getUserMedia()
var recRecord; 							//Recorder.js object
var inputRecord; 							//MediaStreamAudioSourceNode we'll be recording
var parentRecord;
// shim for AudioContext when it's not avb.
var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext; //audio context to help us record
/*
$(".pauseButton").attr('disabled',true);
$(".stopButton").attr('disabled',true);
$('body').on('click', '.recordButton', startRecording);
$('body').on('click', '.stopButton', stopRecording);
$('body').on('click', '.pauseButton', pauseRecording);
*/

function startRecording() {
    parentRecord =jQuery(this).closest('.recording-field');
    var constraints = { audio: true, video:false };
    parentRecord.find(".recordButton").attr('disabled',true);
    parentRecord.find(".pauseButton").attr('disabled',false);
    parentRecord.find(".stopButton").attr('disabled',false);
    navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
        audioContext = new AudioContext();
        gumStreamRecord = stream;
        inputRecord = audioContext.createMediaStreamSource(stream);
        recRecord = new Recorder(inputRecord,{numChannels:1})
        recRecord.record();
    }).catch(function(err) {
        app.helper.showErrorNotification({'message': app.vtranslate(err.message)});
        //enable the record button if getUserMedia() fails
        parentRecord.find(".recordButton").attr('disabled',false);
        parentRecord.find(".pauseButton").attr('disabled',true);
        parentRecord.find(".stopButton").attr('disabled',true);
    });
}

function pauseRecording(){
    parentRecord =jQuery(this).closest('.recording-field');
    if (recRecord.recording){
        //pause
        recRecord.stop();
        parentRecord.find(".pauseButton").html('<i class="glyphicon glyphicon-play"></i>');
    }else{
        //resume
        recRecord.record()
        parentRecord.find(".pauseButton").html('<i class="glyphicon glyphicon-pause"></i>');
    }
}

function stopRecording() {
    parentRecord =jQuery(this).closest('.recording-field');
    //disable the stop button, enable the record too allow for new recordings
    parentRecord.find(".recordButton").attr('disabled',false);
    parentRecord.find(".pauseButton").attr('disabled',true);
    parentRecord.find(".stopButton").attr('disabled',true);
    //reset button just in case the recording is stopped while paused
    parentRecord.find(".pauseButton").html('<i class="glyphicon glyphicon-pause"></i>');
    //tell the recorder to stop the recording
    recRecord.stop();
    //stop microphone access
    gumStreamRecord.getAudioTracks()[0].stop();
    //create the wav blob and pass it on to createDownloadLink
    recRecord.exportWAV(createDownloadLink);
}

function createDownloadLink(blob) {

    var url = URL.createObjectURL(blob);
    var au = jQuery('<audio></audio>');
    var li = jQuery('<li></li>');
    var link = jQuery('<a></a>');
    //name of .wav file to use during upload and download (without extendion)
    var tzoffset = (new Date()).getTimezoneOffset() * 60000; //offset in milliseconds
    var localISOTime = (new Date(Date.now() - tzoffset)).toISOString().slice(0, -1);
    var filename = localISOTime;
    au.attr('controls',true);
    au.attr('src',url);
    link.attr('href',url);
    link.attr('download',filename+".wav");
    link.html("<br><i class='btn btn-info glyphicon glyphicon-download'></i>");
    //add the new audio element to li
    li.append(au);
    li.append(link);
    var upload = jQuery('<i class=\'btn btn-success glyphicon glyphicon-ok\'></i>');
    li.append(upload);//add the upload link to li
    var delete_btn = jQuery('<i class=\'btn btn-danger glyphicon glyphicon-remove\'></i>');
    li.append(delete_btn);//add the upload link to li


    delete_btn.click(function () {
        var parent_li = jQuery(this).closest('li');
        app.helper.showProgress();
        var file = jQuery(this).data('file');
        if(file){
            var parentRecordTxt = jQuery(this).closest('td.fieldValue').find('textarea');
            var field_value = jQuery(this).data('file-value');
            var field_name = parentRecordTxt.attr('name');
            if (jQuery('input[name="record"]').length) {
                var parrent_record_id = jQuery('input[name="record"]').val();
            } else {
                var parrent_record_id = app.getRecordId();
            }
            var url = 'index.php?module=ParsVT&action=ActionAjax&mode=removeFile';
            jQuery.ajax({
                url: url,
                data: { file_path : file,parrent_record_id:parrent_record_id,field_name:field_name},
                async:false,
                success: function(data) {
                    var arrayvalues = parentRecordTxt.text().split("||");
                    parentRecordTxt.text(arrayRemove(arrayvalues, field_value).join("||"));
                    parent_li.remove();
                    app.helper.hideProgress();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    app.helper.hideProgress();
                }
            });
        }else{
            parent_li.remove();
            app.helper.hideProgress();
        }

    });

    upload.click(function () {
        var parentRecordTxt = jQuery(this).closest('td.fieldValue').find('textarea');
        var parentRecordTxtVal= parentRecordTxt.text();
        var listRecord =parentRecordTxtVal?parentRecordTxtVal.split('||'):[];
        app.helper.showProgress();
        var fd=new FormData();
        //index.php?module=ParsVT&action=ActionAjax&mode=ajaxUploadFromForm
        fd.append("module",'ParsVT');
        fd.append("action",'ActionAjax');
        fd.append("mode",'ajaxUploadVoiceFile');
        fd.append("audio_data",blob, filename+'.wav');
        jQuery.ajax({
            url: "index.php",
            type: "POST",
            data: fd,
            processData: false,
            contentType: false
        }).done(function (data) {
            var return_file = data.result.list_file;
            listRecord.push(return_file[0]);
            parentRecordTxt.text(listRecord.join('||'));
            var res = return_file[0].split("$$");
            var file_path = res[0].replace(/\s+/g, " ").trim();
            delete_btn.attr('data-file',file_path);
            delete_btn.attr('data-file-value',return_file[0]);
            upload.attr('disabled',true);
            app.helper.hideProgress();
            app.helper.showSuccessNotification({'message': app.vtranslate('JS_UPLOAD_SUCCESSFUL')});
        }).fail(function() {
            app.helper.hideProgress();
            errorMessage = app.vtranslate('JS_UPLOAD_FAILED');
            app.helper.showErrorNotification({'message': errorMessage});
        });
    });

    parentRecord.find('.recordingsList').append(li);
}
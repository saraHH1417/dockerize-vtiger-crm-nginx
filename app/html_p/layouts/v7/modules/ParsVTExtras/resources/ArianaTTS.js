jQuery(document).ajaxComplete(function (event, xhr, settings) {
    if(!$('span.commentInfoContent').parent().find('.reader-ariana-button').length) {
        $('span.commentInfoContent').after('<button style="padding: 0px 15px;\n' +
            'vertical-align: middle;' +
            'background: #eee;' +
            'background: -moz-linear-gradient(top,#fff 0,#eee 100%);' +
            'background: -webkit-gradient(linear,left top,left bottom,color-stop(0,#fff),color-stop(100%,#eee));' +
            'background: -webkit-linear-gradient(top,#fff 0,#eee 100%);' +
            'background: -o-linear-gradient(top,#fff 0,#eee 100%);' +
            'background: -ms-linear-gradient(top,#fff 0,#eee 100%);' +
            'background: linear-gradient(to bottom,#fff 0,#eee 100%);' +
            'border: 1px solid #d0d0d0;' +
            'border-radius: 15px 15px 15px 15px;' +
            'height: 26px;' +
            'margin-bottom: 2px;' +
            'color: #676767;' +
            'line-height: 20px;' +
            'font-size: 12px;' +
            'font-weight: 100;" type="button" class="reader-ariana-button" >' +
            app.vtranslate('Read')+' 🔊 ' +
            '</button>');
        $('button.reader-ariana-button').click(function () {
            app.helper.showProgress();
            var parentRA = $(this).parent();
            var textBoxText = parentRA.find('span.commentInfoContent').text();
            jQuery.ajax({
                type: "POST",
                ContentType: "application/json; charset=UTF-8",
                dataType: "json",
                data: {Text: textBoxText, module: 'ParsVTExtras', action: 'ArianaTTS'},
                url: 'index.php',
                complete: function (jdata) {
                    var data = jdata.responseText;
                    if (data) {
                        var raw = atob(data);
                        var rawLength = raw.length;
                        var array = new Uint8Array(new ArrayBuffer(rawLength));

                        for (i = 0; i < rawLength; i++) {
                            array[i] = raw.charCodeAt(i);
                        }

                        var blobBuffer = new Blob([array], {type: "audio/mpeg"});
                        // var blobUrl = window.URL.createObjectURL(blobBuffer);

                        var mp3 = window.URL.createObjectURL(blobBuffer);
                        var notifyParams = {
                            'title': "<a download='ariana'+jQuery.now()+'.mp3' href='" + mp3 + "'>" +
                                "<i class='glyphicon glyphicon-cloud-download'></i>" +
                                app.vtranslate('Download file') +
                                "</a>",
                            'message': "<div class='row'>" +
                                "<div class='col-sm-12 col-md-12'>" +
                                "<div class='caption text-center'>" +
                                "</div></div>" +
                                "<div class='col-sm-12 col-md-12'>" +
                                "<center><audio controls autoplay  preload='auto'>" +
                                "<source src='" + mp3 + "' type='audio/mpeg'>" +
                                "</audio>" +
                                "</center>" +
                                "</div>"
                        };

                        var settings = {
                            'delay': 1000,
                            'timer': 400000000,
                            'element': 'body',
                            'type': 'danger'
                        };

                        app.helper.hideProgress();
                        jQuery.notify(notifyParams, settings);
                    } else {
                        app.helper.hideProgress();
                        app.helper.showErrorNotification({'message': app.vtranslate('Unable to parse audio file')});
                    }
                }
            });

        });
    }
});
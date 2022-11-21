/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
jQuery.fn.extend({
    rating: function (options) {
        'use strict';
        if (typeof (options) === 'undefined') {
            options = {};
        }
        var ratings = [];
        var objs = this;
        if (objs.length) {
            for (var i = 0; i < objs.length; i++) {
                ratings.push(new simpleRating(options, objs[i]));
            }
        }
    },
});
var simpleRating = class {

    constructor(options, obj) {
        this.obj = obj;
        this.options = options;
        this.rating = 0;
        this.maxstars = 5;
        this.randid = "customerstatus" + this.rnd(200, 500);
        this.maxemotions = 9;
        this.emotionstitle = new Array("", "Disappointed", "Very dissatisfied", "Moderately dissatisfied", "Slightly dissatisfied", "Neutral", "Slightly satisfied", "Moderately satisfied", "Very satisfied", "Extremely satisfied");
        this.emotionicons = new Array("&#x1F636;", "&#x1F621", "&#x1F620", "&#x1F61E;", "&#x1F61F;", "&#x1F610;", "&#x1F642;", "&#x1F60A;", "&#x1F607;", "&#x1F60D;");
        this.init();
    }

    rnd(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }

    init() {
        if (!this.options.emotion) {
            this.options.emotion = false;
        }
        var html = '<div class="simple-rating star-rating">';
        if (this.options.listview) {
            html += '<i class="fa" data-rating="0">' + this.emotionicons[0] + '</i>';
        } else {
            if (this.options.emotion) {
                for (var i = 0; i < this.maxemotions; i++) {
                    html += '<i class="fa" data-rating="' + (i + 1) + '" alt="' + app.vtranslate(this.emotionstitle[i]) + '" title="' + app.vtranslate(this.emotionstitle[i]) + '">' + this.emotionicons[0] + '</i>';
                }
            } else {
                for (var i = 0; i < this.maxstars; i++) {
                    html += '<i class="fa fa-star-o" data-rating="' + (i + 1) + '"></i>';
                }
            }
        }
        if (!this.options.readonly) {
            html += '<i class="fa fa-trash star-trash" data-rating="0"></i>';
        }
        if (this.options.emotion) {
            html += '<br><span id="' + this.randid + '" class="text-info"></span>';
        }
        html += '</div>';

        $(this.obj).attr('type', 'hidden').after(html);
        if (!this.options.readonly) {
            $(this.obj).next().children().click({classObj: this}, function (e) {
                e.data.classObj.rate(this);
            });

            $(this.obj).next().children().mouseenter({classObj: this}, function (e) {
                e.data.classObj.setstars($(this).data('rating'));
            });

            $(this.obj).next().children().mouseleave({classObj: this}, function (e) {
                e.data.classObj.setstars(e.data.classObj.rating);
            });
        }
        if (this.options.emotion && $.isNumeric($(this.obj).val()) && $(this.obj).val() <= this.maxemotions) {
            this.rating = $(this.obj).val();
            this.setstars($(this.obj).val());
            this.refresh();
        } else if ($.isNumeric($(this.obj).val()) && $(this.obj).val() <= this.maxstars) {
            this.rating = $(this.obj).val();
            this.setstars($(this.obj).val());
            this.refresh();
        } else {
            $(this.obj).val(this.rating);
            this.refresh();
        }
        if (this.options.emotion) {
            $("#" + this.randid).html(app.vtranslate(this.emotionstitle[this.rating]));
        }
    }

    rate(obj) {
        var rating = $(obj).data('rating');
        $(obj).parent().prev().val(rating);
        this.rating = rating;
        this.refresh();
    }

    refresh() {
        this.setstars(this.rating);
    }

    setstars(rating) {
        var stars = $(this.obj).next().children();
        if (this.options.listview) {
            var starObj = $(this.obj).next().children()[0];
            $(starObj).html(this.emotionicons[rating]);
            $("#" + this.randid).html(app.vtranslate(this.emotionstitle[rating]));
        } else {
            if (this.options.emotion) {
                //test
                for (var i = 0; i < this.maxemotions; i++) {
                    var starObj = $(this.obj).next().children()[i];
                    if (i < rating) {
                        $(starObj).html(this.emotionicons[rating]);
                        //$(starObj).addClass('fa-star');
                    } else {
                        $(starObj).html(this.emotionicons[0]);
                    }
                }
                $("#" + this.randid).html(app.vtranslate(this.emotionstitle[rating]));
            } else {
                for (var i = 0; i < this.maxstars; i++) {
                    var starObj = $(this.obj).next().children()[i];
                    if (i < rating) {
                        $(starObj).removeClass('fa-star-o');
                        $(starObj).addClass('fa-star');
                    } else {
                        $(starObj).addClass('fa-star-o');
                        $(starObj).removeClass('fa-star');
                    }
                }
            }
        }
    }
};
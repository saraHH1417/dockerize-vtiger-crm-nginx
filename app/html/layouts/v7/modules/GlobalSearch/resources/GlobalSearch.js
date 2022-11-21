/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */

jQuery(document).ready(function() {
    setTimeout(function () {
        initData_GlobalSearch();
    }, 0);
    $( ".js-reference-display-value").removeClass( "js-reference-display-value");
});
function initData_GlobalSearch() {
    jQuery(document).find(".keyword-input").unbind("keypress");
    var basicSearchModulesList = jQuery('#basicSearchModulesList');

    // Add Emails to search
    var targetOptions = new jQuery();
    basicSearchModulesList.find("option[value='Emails']").each(function() {
        jQuery(this).remove();
    });
    basicSearchModulesList.append('<option class="globalSearch_module_Emails" value="Emails">Emails</option>');
    basicSearchModulesList.find('option').each(function(i,e) {
        targetOptions = targetOptions.add(jQuery(e));
    });
    basicSearchModulesList.trigger("liszt:updated");

    jQuery(document).on("keypress",".keyword-input", function(e) {
        if (e.which == 13) {
            e.preventDefault();
            var currentTarget = jQuery(e.currentTarget);
            var val = currentTarget.val();
            var search_module=jQuery('#basicSearchModulesList').val();
            if(val.trim() !='') {
                val = encodeURIComponent(val);
                window.location.href = "index.php?module=GlobalSearch&view=SearchResults&value="+val+"&search_module="+search_module;
            }else{
                Vtiger_Helper_Js.showPnotify('Please type the keyword to search');
            }
        }
        else{
            return;
        }
        e.preventDefault();
    })
    jQuery(document).on("keypress",".global-keyword-input", function(e) {
        if (e.which == 13) {
            e.preventDefault();
            var currentTarget = jQuery(e.currentTarget);
            var val = currentTarget.val();
            if(val.trim() !='') {
                var url = window.location.href;
                var params = app.convertUrlToDataParams(url);
                var keyword = params.keyword;
                if(keyword != undefined && keyword != 'undefined' && keyword != ''){
                    keyword = decodeURIComponent(keyword);
                    keyword = keyword + ',' + val;
                }else{
                    keyword = val;
                }
                params.keyword = keyword;
                params = $.param( params );
                window.location.href = "index.php?"+params;
            }else{
                app.helper.showErrorNotification({message:'Please type the keyword to search'});
            }
        }
        else{
            return;
        }
        e.preventDefault();
    });

    $(document).ajaxComplete(function(event, jqxhr, settings){
        if(settings.data != undefined && settings.data.indexOf('view=BasicAjax') != -1 && settings.data.indexOf('mode=showAdvancedSearch') != -1){
            jQuery(document).on("click","#advanceSearchButton", function(e) {
                var search_module = $('#searchModuleList').val();
                if(search_module != undefined && search_module != ''){
                    $(document).ajaxComplete(function(event, jqxhr, settings){
                        if(settings.data != undefined && settings.data.indexOf('view=ListAjax') != -1 && settings.data.indexOf('mode=showSearchResults') != -1){
                            var params = app.convertUrlToDataParams(settings.data);
                            var search_params = params.search_params;
                            window.location.href = "index.php?module=GlobalSearch&view=SearchResults&search_module="+search_module+'&search_type=vt_standard&search_params='+search_params;
                        }
                    });
                }
            });
        }
    });
    $('.left-content .left-content-module-list .list-item').on('click',function(){
        $('.left-content .left-content-module-list .list-item').removeClass('active');
        $(this).addClass('active');
        var module = $(this).data('module');
        $("body, html").animate({
            scrollTop: $("#"+module+"_search_content").offset().top - 94
        }, 100);
    });
    $(document).ready(function(){
        $('div.search-links-container').after('<div id="search_ajax" class="col-md-3 col-lg-3"></div>');
        var searchInput = $('div.search-links-container div.search-link input.keyword-input');
        searchInput.unbind( "keyup" );
        searchInput.keyup($.debounce(function(e){
            if( this.value.length >= 3 ){
                var code = e.which;
                if(code != 13){
                    setTimeout(ajaxSearch(this),1000);
                }
            }
        } , 1000));
        searchInput.focus(function(){
            if( this.value.length >= 3 ){
                $('.search_ajax_result').show();
            }else{
                $(this).val('');
                ajaxShowLogged()
            }
        });
        $('body').append('<style>.loader {margin-top: 6px;margin-right: 3px;float:right;border: 4px solid #f3f3f3;border-radius: 50%;border-top: 4px solid #3498db;width: 20px;height: 20px;-webkit-animation: spin 2s linear infinite; /* Safari */animation: spin 2s linear infinite;} @-webkit-keyframes spin {0% { -webkit-transform: rotate(0deg); }100% { -webkit-transform: rotate(360deg); }}@keyframes spin {0% { transform: rotate(0deg); }100% { transform: rotate(360deg); }}</style>');
    });
}
function ajaxShowLogged(){
    var params = {
        module: 'GlobalSearch',
        action: 'ActionAjax',
        mode: 'ajaxShowLogged'
    };
    app.request.post({'data' : params}).then(function(err, data){
        if(err == null){
            $('#search_ajax').html(data);

            var w = $('.global-nav .search-links-container').width();
            var left = $('.global-nav .search-links-container').position().left;
            left = left - 15;
            $('.search_ajax_result').css({width:w});
            $('.search_ajax_result').css({left:'-'+left+'px'});
            $('.search_ajax_result').show();
            $('div.search-links-container div.search-link input.keyword-input').focusout(function(){
                setTimeout(function(){
                    $('.search_ajax_result').hide();
                },200);
            });
        }
    });
}
function ajaxSearch(ele){
    key = ele.value;
    if(key == '' || key == undefined){
        return false;
    }
    var params = {
        module: 'GlobalSearch',
        action: 'ActionAjax',
        mode: 'searchRecord',
        label: key
    };
    $('.loader').remove();
    $(ele).closest('div.search-link').find('#adv-search').after('<div class="loader"></div>');
    app.request.post({'data' : params}).then(function(err, data){
        if(err == null){
            $('#search_ajax').html(data);
            var w = $('.global-nav .search-links-container').width();
            var left = $('.global-nav .search-links-container').position().left;
            left = left - 15;
            $('.search_ajax_result').css({width:w});
            $('.search_ajax_result').css({left:'-'+left+'px'});
            $('.search_ajax_result').show();
            $('div.search-links-container div.search-link input.keyword-input').focusout(function(){
                setTimeout(function(){
                    $('.search_ajax_result').hide();
                },200);
            });
            setTimeout(function(){
                $('.loader').remove();
            },500);
        }
    });
}
function record_to_log(e){
    var crmid = $(e).data('record');
    var url = $(e).data('url');
    $(e).attr('href','#');
    $(e).attr('target','_self');
    var params = {
        module: 'GlobalSearch',
        action: 'ActionAjax',
        mode: 'recordToLog',
        record: crmid
    };
    //app.request.post({'data' : params}).then(function(err, data){
        window.open(url,'_blank');
    //app.request.post({'data' : params}).then(function(err, data){
    //    window.open(url,'_blank');
    ////    $(e).attr('href',url);
    ////    $(e).attr('onclick','');
    ////    setTimeout(function(){ $(e).click();alert( $(e).attr('href')); }, 3000);
    //});
    //return false;
};
function remove_search_tag(tag){
    var url = window.location.href;
    var params = app.convertUrlToDataParams(url);
    var keyword = params.keyword;
    var keyword = decodeURIComponent(keyword);
    keyword = keyword.split(',');
    keyword.forEach(function(item,k){
        if(item == tag){
            keyword.splice(k, 1);
        }
    });
    keyword =  keyword.toString();
    params.keyword = keyword;
    params = $.param( params );
    window.location.href = "index.php?"+params;
}
(function($) {

    $.extend({

        debounce : function(fn, timeout, invokeAsap, ctx) {

            if(arguments.length == 3 && typeof invokeAsap != 'boolean') {
                ctx = invokeAsap;
                invokeAsap = false;
            }

            var timer;

            return function() {

                var args = arguments;
                ctx = ctx || this;

                invokeAsap && !timer && fn.apply(ctx, args);

                clearTimeout(timer);

                timer = setTimeout(function() {
                    !invokeAsap && fn.apply(ctx, args);
                    timer = null;
                }, timeout);

            };

        },

        throttle : function(fn, timeout, ctx) {

            var timer, args, needInvoke;

            return function() {

                args = arguments;
                needInvoke = true;
                ctx = ctx || this;

                if(!timer) {
                    (function() {
                        if(needInvoke) {
                            fn.apply(ctx, args);
                            needInvoke = false;
                            timer = setTimeout(arguments.callee, timeout);
                        }
                        else {
                            timer = null;
                        }
                    })();
                }

            };

        }

    });

})(jQuery);
//we should set up some keyboard shortcuts for list views, some for detail view and some for edit view
//some might be based on scraping what is on the screen
//might be nice to somehow indicate what shortcuts are available.
$(function () {
    var view = app.view();
    var module = app.getModuleName();
    //go to list view
    if (view === "List") {
        //things that only make sense in list view
        Mousetrap.bind(['mod+i'], function () {
            $("#"+module+"_basicAction_LBL_IMPORT").click();
            return false;
        });
        Mousetrap.bind(['mod+a'], function () {
            $("#"+module+"_listView_basicAction_LBL_ADD_RECORD").click();
            return false;
        });
        Mousetrap.bind('pagedown', function () {
            $('#NextPageButton').click();
            return false;
        });
        Mousetrap.bind('pageup', function () {
            $('#PreviousPageButton').click();
            return false;
        });


    }
    if (view === "Edit") {
        //things that only make sense in edit view
        //save
        Mousetrap.bindGlobal('mod+s', function () {
            $(".btn[type=submit]").click();
            return false;
        });
    }
    if (view === "Detail") {
        //things that only make sense in detail view
        //edit
        Mousetrap.bind('mod+e', function (e) {
            $(".btn[id$=LBL_EDIT]").click();
            return false;
        });
        //duplicate
        Mousetrap.bind('mod+d', function () {
            window.location.href = $('li[id$=LBL_DUPLICATE] a').attr("href");
            return false;
        });

        //next record
        Mousetrap.bind('left', function () {
            $('#detailViewPreviousRecordButton').click();
            return false;
        });
        //previous record
        Mousetrap.bind('right', function () {
            $('#detailViewNextRecordButton').click();
            return false;
        });

        //pageup and pagedown for the nav pills
        Mousetrap.bind('pagedown', function () {
            currentpill = $('ul.nav-tabs .active').index();
            moveto = $('ul.nav-tabs').children()[currentpill + 1]
            if (moveto) {
                moveto.click()
            }
            ;
            return false;
        });
        Mousetrap.bind('pageup', function () {
            currentpill = $('ul.nav-tabs .active').index();
            moveto = $('ul.nav-tabs').children()[currentpill - 1]
            if (moveto) {
                moveto.click()
            }
            ;
            return false;
        });


    }
    //things that make sense from everywhere
    Mousetrap.bind('mod+k', function () {
        if ($(".module-breadcrumb").length) {
            var url = $(".module-breadcrumb").find( "a" ).first().attr('href');
            window.location.replace(url);
        }
        return false;
    });
    //escape to go back
    Mousetrap.bind('mod+b', function () {
        window.history.back();
    });
});

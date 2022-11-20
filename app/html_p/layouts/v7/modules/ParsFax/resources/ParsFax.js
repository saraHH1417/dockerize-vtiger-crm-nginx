jQuery.Class("ParsFax_Js", {}, {
    sendFax: function () {
        ParsFax.registerPicklist2();
        var time = 5;
        if (typeof CKEDITOR != 'undefined') {
            ParsFax.LoadEditor(time);
        }
    },
     /**
     * Function to register required events
     */
    registerEvents: function () {
        var self = this;
        self.sendFax();
        ParsFax.registerEventsForToField();
    }
});

//On Page Load
jQuery(document).ready(function () {
    var instance = new ParsFax_Js();
    instance.registerEvents();
});

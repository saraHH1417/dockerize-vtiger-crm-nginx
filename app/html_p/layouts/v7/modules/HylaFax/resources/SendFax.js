$(document).ready(function () {
    if (jQuery('#numbers').length) {
        var select2params = {
            closeOnSelect: false,
            tags: [],
            tokenSeparators: [","],

        }
        app.showSelect2ElementView(jQuery('#numbers'), select2params);
    }
});

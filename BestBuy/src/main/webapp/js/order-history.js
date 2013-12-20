$(document).ready(function() {
    $('#sl_sort').change(function() {
        var action = 'OrderHistory?sort=' + $('#sl_sort').val();
        var ajax = $.ajax(action);
        ajax.done(function(msg) {
            $("#list_orders").html(msg);
        });
    });
});
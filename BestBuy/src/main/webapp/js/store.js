$(document).ready(function() {
        
        $('#sl_view').change(function (){
           var action = 'Store?view=' + $('#sl_view').val(); 
           var ajax = $.ajax(action);
           ajax.done(function(msg) {
                $("#list_products").html(msg);
            });
        });
        
        $('#sl_sort').change(function (){
           var action = 'Store?sort=' + $('#sl_sort').val(); 
           var ajax = $.ajax(action);
           ajax.done(function(msg) {
                $("#list_products").html(msg);
            });
        });
});
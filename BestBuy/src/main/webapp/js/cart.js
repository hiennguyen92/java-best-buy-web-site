$(document).ready(function() {
    $(".f_cart").each(function(){
        $(this).submit(function (){
            var quantity = $(this).parent().parent().find("#quantity").val();
            $(this).find("#h_quantity").val(quantity);
            return true;
        });
    });
});
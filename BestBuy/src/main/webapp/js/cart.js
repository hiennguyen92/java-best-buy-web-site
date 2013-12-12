$(document).ready(function() {
    $(".f_cart").each(function(){
        $(this).submit(function (){
            var quantity = $(this).parent().parent().find("#quantity").val();
            $(this).find("#h_quantity").val(quantity);
            return true;
        });
    });
    $("#f_checkout").submit(function (){
       if($(".f_cart").length == 0){
           alert("you must choose at least 1 item");
           return false;
       }
       return false;
    });
});
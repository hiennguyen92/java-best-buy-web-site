$(document).ready(function() {
    $("#f_cart").submit(function(){
       $("#h_quantity").val($("#quantity").val());
       return true;
    });
});
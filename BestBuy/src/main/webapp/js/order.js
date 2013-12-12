$(document).ready(function() {
    var result = $("#result").val();
    if(result != ""){
        alert(result);
    }
    $("#f_order").submit(function (){
       var name = $("input[name='tb_RealName']").val();
       var phone = $("input[name='tb_Phone']").val();
       var address = $("textarea[name='tb_Address']").val();
       
       if(name == ""){
            alert("you haven't entered your name!");
            return false;
       }       
       else if(phone == ""){
            alert("you haven't entered your phone number!");
            return false;
       }       
       else if(address == ""){
            alert("you haven't entered your address!");
            return false;
       }
       
       return true;
    });
});
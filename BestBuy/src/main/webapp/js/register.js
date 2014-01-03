$(document).ready(function() {
    var result = $("#result").val();
    if(result != ""){
        alert(result);
    }
    $("#f_register").submit(function (){
       var username = $("input[name='tb_Username']").val();
       var password = $("input[name='tb_Password']").val();
       var repassword = $("input[name='tb_RePassword']").val();
       
       if(username == ""){

            $.notify("You haven't entered username!","error");
            $("input[name='tb_Username']").focus();
            return false;
       }       
       else if(password == ""){
            $.notify("You haven't entered password!","error");
            $("input[name='tb_Password']").focus();
            return false;
       }       
       else if(repassword != null && password != repassword){
            $.notify("Password and re-password aren't the same!","error");
            $("input[name='tb_RePassword']").focus();
            return false;
       }
       
       return true;
    });
}); 
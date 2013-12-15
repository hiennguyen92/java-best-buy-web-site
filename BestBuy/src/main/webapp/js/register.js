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
            alert("you haven't entered username!");
            return false;
       }       
       else if(password == ""){
            alert("you haven't entered password!");
            return false;
       }       
       else if(repassword != null && password != repassword){
            alert("password and re-password aren't the same!");
            return false;
       }
       
       return true;
    });
});
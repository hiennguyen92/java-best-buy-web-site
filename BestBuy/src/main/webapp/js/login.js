$(document).ready(function() {
    var result = $("#result").val();
    if(result != ""){
        alert(result);
    }
    
    $("#f_login").submit(function (){
       var username = $("input[name='j_username']").val();
       var password = $("input[name='j_password']").val();
       
       if(username == ""){

            $.notify("Input Username","error");
            $("input[name='j_username']").focus();
            return false;
       }       
       else if(password == ""){
            $.notify("Input Password","error");
            $("input[name='j_password']").focus();
            return false;
       }       

       return true;
    });
    
    
});
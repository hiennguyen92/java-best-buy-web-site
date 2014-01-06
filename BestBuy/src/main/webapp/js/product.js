$(document).ready(function() {
    var result = $("#result").val();
    if(result != ""){
        alert(result);
    }
    if($("#h_Brand").val() != ""){
        $("select[name='sl_Brand']").val($("#h_Brand").val());
    }
    if($("#h_Type").val() != ""){
        $("select[name='sl_Type']").val($("#h_Type").val());
    }
    $("#f_manage").submit(function (){
       var name = $("input[name='tb_Name']").val();
       var description = $("input[name='tb_Description']").val();
       var price = $("input[name='tb_Price']").val();
       var screen = $("input[name='tb_Screen']").val();
       var warranty = $("input[name='tb_Warranty']").val();
       var url = $("#imgUpload").attr("src");
       
       $("input[name='h_url']").val(url);
       
       if(name == ""){
            //alert("you haven't entered product name!");
            $.notify("You haven't entered product name!","error");
            $("input[name='tb_Name']").focus();
            return false;
       }       
       else if(description == ""){
            //alert("you haven't entered description!");
            $.notify("You haven't entered description!","error");
            $("input[name='tb_Description']").focus();
            return false;
       }   
       else if(price == ""){
            //alert("you haven't entered price!");
            $.notify("You haven't entered price!","error");
            $("input[name='tb_Price']").focus();
            return false;
       }
       else if(screen != null && screen == ""){
            //alert("you haven't entered screen size!");
            $.notify("You haven't entered screen size!","error");
            $("input[name='tb_Screen']").focus();
            return false;
       }
       else if(warranty == ""){
            //alert("you haven't entered warranty time!");
            $.notify("You haven't entered warranty time!","error");
            $("input[name='tb_Warranty']").focus();
            return false;
       }
       else if(url == null){
            $.notify("you haven't chosen a image!");
            return false;
       }
       
       return true;
    });
});
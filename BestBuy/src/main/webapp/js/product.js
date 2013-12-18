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
            alert("you haven't entered product name!");
            return false;
       }       
       else if(description == ""){
            alert("you haven't entered description!");
            return false;
       }   
       else if(price == ""){
            alert("you haven't entered price!");
            return false;
       }
       else if(screen != null && screen == ""){
            alert("you haven't entered screen size!");
            return false;
       }
       else if(warranty == ""){
            alert("you haven't entered warranty time!");
            return false;
       }
       else if(url == ""){
            alert("you haven't chosen a image!");
            return false;
       }
       
       return true;
    });
});
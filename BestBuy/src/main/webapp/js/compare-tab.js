$(document).ready(function() {
        
        $(".compare li").click(function (){
            var id = $(this).attr("id").replace("item_","");
            location.href="Redirect?remove_compare="+id;
        });
        
        $("#f_compare").submit(function (){
            if($("#item_2").children().length == 0){
                alert("You must select at least 2 items");
                return false;
            }
                
            $("#f_compare #id1").val($("#compare_1").val());
            $("#f_compare #id2").val($("#compare_2").val());
            $("#f_compare #id3").val($("#compare_3").val());
            $("#f_compare #id4").val($("#compare_4").val());
            
            return true;
        });
});

function remove(id){
    $("#item_"+id).html($("#item_"+(parseInt(id)+1)).html());
    $("#item_"+id).attr("class", $("#item_"+(parseInt(id)+1)).attr("class"));
    if(id == 1){
        $("#item_2").html($("#item_3").html());
        $("#item_2").attr("class", $("#item_3").attr("class"));
        $("#item_3").html($("#item_4").html());
        $("#item_3").attr("class", $("#item_4").attr("class"));
    }
    else if(id == 2){
        $("#item_3").html($("#item_4").html());
        $("#item_3").attr("class", $("#item_4").attr("class"));
    }
    $("#item_4").html("");
    $("#item_4").attr("class", "");
    
    $("#remove_"+id).removeAttr("style");
    $("#remove_"+id).removeAttr("id");
}
$(document).ready(function() {
        
        $(".compare li").click(function (){
            var id = $(this).attr("id").replace("item_","");
            var ajax = $.ajax("Redirect?remove_compare="+id);
            ajax.done(function(msg) {
                $(".compare").html(msg);
            });
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

function addCompare(id) {
    var ajax = $.ajax("Redirect?compare="+id);
    ajax.done(function(msg) {
        $(".compare").html(msg);
    });
}
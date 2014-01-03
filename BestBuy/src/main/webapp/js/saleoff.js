$(document).ready(function() {
    $("#fromdate").datepicker({
        showButtonPanel: true,
        showAnim: 'show',
        minDate: new Date(),
        dateFormat: "dd/mm/yy",
        onSelect: function(selectedDate) {
            $("#todate").datepicker("option", "minDate", selectedDate);
        }
    });
    $("#todate").datepicker({
        showButtonPanel: true,
        showAnim: 'show',
        minDate: new Date(),
        dateFormat: "dd/mm/yy",
        onSelect: function(selectedDate) {
            $("#fromdate").datepicker("option", "maxDate", selectedDate);
        }
    });
    $("#f_sale").submit(function (){
       var name = $("input[name='tb_Name']").val();
       var description = $("textarea[name='tb_Description']").val();
       var percent = $("input[name='tb_Percent']").val();
       var from = $("input[name='tb_From']").val();
       var to = $("input[name='tb_To']").val();
       
       if(name ===""){
            //alert("you haven't entered event name!");
            $.notify("You haven't entered event name!","error");
            $("input[name='tb_Name']").focus();
            return false;
       }       
       else if(description === ""){
            //alert("you haven't entered event description!");
            $.notify("You haven't entered event description!","error");
            $("input[name='tb_Description']").focus();
            return false;
       }       
       else if(percent === ""){
            //alert("you haven't entered sale off percent!");
            $.notify("You haven't entered sale off percent!","error");
            $("input[name='tb_Percent']").focus();
            return false;
       }
       else if(from === ""){
            //alert("you haven't entered begin date!");
            $.notify("You haven't entered begin date!","error");
            $("input[name='tb_From']").focus();
            return false;
       }
       else if(to === ""){
            //alert("you haven't entered end date!");
            $.notify("You haven't entered end date!","error");
            $("input[name='tb_To']").focus();
            return false;
       }
       return true; 
    });
});
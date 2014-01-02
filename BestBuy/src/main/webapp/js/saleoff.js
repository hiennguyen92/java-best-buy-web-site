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
            alert("you haven't entered event name!");
            return false;
       }       
       else if(description === ""){
            alert("you haven't entered event description!");
            return false;
       }       
       else if(percent === ""){
            alert("you haven't entered sale off percent!");
            return false;
       }
       else if(from === ""){
            alert("you haven't entered begin date!");
            return false;
       }
       else if(to === ""){
            alert("you haven't entered end date!");
            return false;
       }
       return true; 
    });
});
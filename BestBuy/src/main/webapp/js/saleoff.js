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
});
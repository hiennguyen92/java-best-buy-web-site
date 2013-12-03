$(document).ready(function() {
    $(".jqzoom").jqzoom();
    $(".menu_body").hide();
    //toggle the componenet with class menu_body
    $(".menu_head").click(function() {
        plusmin = $(this).children(".plusminus").text();

        if (plusmin == '+'){
            $(this).children(".plusminus").text('-');
            var $openDiv = $("div[class='menu_body'][style!='display: none;']");
            $openDiv.slideToggle(300);
            var plusmin;
            plusmin = $openDiv.prev().children(".plusminus").text();
            $openDiv.prev().children(".plusminus").text('+');
        }
        else
            $(this).children(".plusminus").text('+');        
        $(this).next(".menu_body").slideToggle(300);
    });
});
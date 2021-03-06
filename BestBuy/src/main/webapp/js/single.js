$(document).ready(function() {
    $(".zoom").elevateZoom({
        cursor: "crosshair",
        zoomWindowWidth: 300,
        zoomWindowHeight: 300
    });
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
    
    $(".auto-submit-star").rating({
        callback: function(value, link){
          var ajax = $.ajax("Info?id="+ $("#productId").val() +"&rating="+value);
          ajax.done(function(msg) {
                $("#rating").html(msg);
                alert("thanks for rating");
            });
        }
    });
    
    $('#products').slides({
            preload: true,
            preloadImage: 'images/delele.gif',
            effect: 'slide, fade',
            crossfade: true,
            slideSpeed: 350,
            fadeSpeed: 500,
            generatePagination: false
    });
    
    $(".contact-form").submit(function (){
        var id = $("#product_id").val();
        var content = $("#ta_content").val();
        var ajax = $.ajax("Info?id="+id+"&ta_content="+content);
        ajax.done(function(msg){
            $("#comment_section").html(msg);
            $("#ta_content").val("");
        });
        return false;
    });
});
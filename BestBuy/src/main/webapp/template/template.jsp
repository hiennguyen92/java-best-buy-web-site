<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@taglib  prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Best Buy</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
        <meta name="keywords" content="Mobilestore iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <link href='http://fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans' rel='stylesheet' type='text/css'>
        <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
        <script src="js/jqzoom.pack.1.0.1.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/responsiveslides.css">
        <script type="text/javascript" src="js/jquery.livequery.js"></script>
        <script type="text/javascript" src="js/store.js"></script>
        <link href="css/style1.css" rel="stylesheet" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/responsiveslides.min.js"></script>
          <script>
            // You can also use "$(window).load(function() {"
                    $(function () {

                      // Slideshow 1
                      $("#slider1").responsiveSlides({
                        maxwidth: 1600,
                        speed: 600
                      });
                });
          </script>
        <link rel="stylesheet" href="css/jqzoom.css" type="text/css">
        <script type="text/javascript">
            $(function() {
                $(".jqzoom").jqzoom();
            });
        </script>
        <script>
            $(document).ready(function() {
                $(".menu_body").hide();
                //toggle the componenet with class menu_body
                $(".menu_head").click(function() {
                    $(this).next(".menu_body").slideToggle(600);
                    var plusmin;
                    plusmin = $(this).children(".plusminus").text();

                    if (plusmin == '+')
                        $(this).children(".plusminus").text('-');
                    else
                        $(this).children(".plusminus").text('+');
                });
            });
        </script>
    </head>
    <body>
        <!----start-Header---->
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="slider" ignore="true" />
        <!----End-Header---->
        <div class="clear"> </div>
        <div class="wrap">
            <tiles:insertAttribute name="body" />
            <tiles:insertAttribute name="sidebar" />
            <div class="clear"> </div>
        </div>
        <tiles:insertAttribute name="footer" />
    </body>
</html>

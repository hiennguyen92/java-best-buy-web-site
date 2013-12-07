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
        <script src="js/jquery.js"></script>
        <script src="js/jquery.MetaData.js"></script>
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

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE HTML>
<html>
    <head>
        <sj:head/>
        <title>Best Buy</title>
        <meta property="og:image" content="http://laptrinhhiendai-testappoke.rhcloud.com/images/logo.png"/>
        <meta property="og:title" content="Best Buy Shop"/>
        <meta property="og:description" content="Best Buy Shop" />
        <link href='<s:url value="/css/style.css"/>' rel="stylesheet" type="text/css"  media="all" />
        <link href='http://fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans' rel='stylesheet' type='text/css'>
        <script src='<s:url value="/js/jquery.MetaData.js"/>'></script>
        <script src='<s:url value="/js/notify-combined.js"/>'></script>
        <script src='<s:url value="/js/notify-combined.min.js"/>'></script>
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

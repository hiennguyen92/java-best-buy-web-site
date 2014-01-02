<%-- 
    Document   : 404
    Created on : Jan 2, 2014, 8:47:33 PM
    Author     : Jeremy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String url = request.getRequestURL().toString();
    String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";

    response.sendRedirect(baseURL + "Error");
%>
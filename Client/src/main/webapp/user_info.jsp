<%-- 
    Document   : user_info
    Created on : Dec 30, 2013, 11:58:00 PM
    Author     : HOANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
        <title>Client</title>
    </head>
    <body>
        <div class="container">
            <div class="page-header">
                <h1><small>${name} info</small></h1>
            </div>
            <p>Username: ${name}</p>
            <p>Real name: ${user.realName}</p>
            <p>Phone number: ${user.phone}</p>
            <p>Address: ${user.address}</p>

            <button type="button" class="btn btn-default" onclick="location.href = 'index'">Return</button>
        </div>
    </body>
</html>

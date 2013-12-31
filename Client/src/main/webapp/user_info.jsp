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
        <title>${name} INFO</title>
    </head>
    <body>
        <p>Username: ${name}</p>
        <p>Real name: ${user.realName}</p>
        <p>Phone number: ${user.phone}</p>
        <p>Address: ${user.address}</p>
    </body>
</html>

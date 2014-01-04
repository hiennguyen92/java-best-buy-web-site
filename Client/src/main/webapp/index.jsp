<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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
                <h1><small>Best Buy Client</small></h1>
            </div>

            <form action="${pageContext.request.contextPath}/GetInfo" method="get">
                <div class="col-lg-6">
                    <div class="input-group">
                        <input name="name" type="text" class="form-control" placeholder="Username">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">Get user info</button>
                        </span>
                    </div><!-- /input-group -->
                </div>
            </form>

        </div>
    </body>
</html>

<%@ page import="org.springframework.security.core.AuthenticationException" %>
<%@ page import="org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter" %>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Best Buy</title>
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css"  media="all" />
         <link href="<c:url value="/css/style1.css"/>" rel="stylesheet" type="text/css"  media="all" />
        <meta name="keywords" content="Mobilestore iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <link href='http://fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <div class="wrap">
            <!----start-Header---->
            <div class="header">
                <div class="clear"> </div>
                <div class="header-top-nav">
                    <ul>

                    </ul>
                </div>
                <div class="clear"> </div>
            </div>
        </div>
        <div class="clear"> </div>
        <div class="top-header">
            <div class="wrap">
                <!----start-logo---->
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/Home"><img height="35" width="280" src="${pageContext.request.contextPath}/images/logo.png" title="logo" /></a>
                </div>
                <!----end-logo---->
                <!----start-top-nav---->
                <div class="top-nav">
                    <ul>

                    </ul>
                </div>
                <div class="clear"> </div>
            </div>
        </div>
        <!----End-top-nav---->
        <!----End-Header---->
        <div class="clear"> </div>
        <div class="wrap">
            <div class="content" style="height: 500px">
                <div class="about">
                    <h4>BEST BUY ACCESS</h4>
                    <div class="span_2_of_3">
                        <c:if test="${!empty sessionScope.SPRING_SECURITY_LAST_EXCEPTION}">
                            <div class="error">
                                <h2>Woops!</h2>

                                <p>Access could not be granted. (<%= ((AuthenticationException) session.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY)).getMessage()%>)</p>
                            </div>
                        </c:if>
                        <c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>

                        <h5>Please Confirm</h5>

                        <p>Your access token: <%= request.getAttribute("oauth_token")%></p>

                        <p>You hereby authorize "<c:out value="${consumer.consumerName}"/>" to access the following resource:</p>
                        
                        <h3><img src="${pageContext.request.contextPath}/images/quotes_alt.png">  <c:out value="${consumer.resourceName}"/> &mdash; <c:out value="${consumer.resourceDescription}"/></h3>


                        <form action="<c:url value="/Service/oauth/authorize"/>" method="post">
                            <input name="requestToken" value="<c:out value="${oauth_token}"/>" type="hidden"/>
                            <c:if test="${!empty oauth_callback}">
                                <input name="callbackURL" value="<c:out value="${oauth_callback}"/>" type="hidden"/>
                            </c:if>
                                <label><button name="authorize" type="submit">Authorize</button></label>
                                <label><button name="cancel" type="button" onclick="location.href='/Client/index'">Cancel</button></label>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <div class="clear"> </div>
        <div class="footer">
            <div class="wrap">
                <div class="section group">
                    <div class="col_1_of_4 span_1_of_4">
                        <h3>Our Info</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                    </div>
                    <div class="col_1_of_4 span_1_of_4">
                        <h3>Latest-News</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    </div>
                    <div class="col_1_of_4 span_1_of_4">
                        <h3>Store Location</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <h3>Order-online</h3>
                        <p>080-1234-56789</p>
                        <p>080-1234-56780</p>
                    </div>
                    <div class="col_1_of_4 span_1_of_4 footer-lastgrid">
                        <h3>News-Letter</h3>
                        <input type="text"><input type="submit" value="go" />
                        <h3>Fallow Us:</h3>
                        <ul>
                            <li><a href="#"><img src="images/twitter.png" title="twitter" />Twitter</a></li>
                            <li><a href="#"><img src="images/facebook.png" title="Facebook" />Facebook</a></li>
                            <li><a href="#"><img src="images/rss.png" title="Rss" />Rss</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

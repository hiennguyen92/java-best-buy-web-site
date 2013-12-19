<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="wrap">
    <!----start-Header---->
    <div class="header">
        <div class="search-bar">
            <form>
                <input type="text"><input type="submit" value="Search" />
            </form>
        </div>
        <div class="clear"> </div>
        <div class="header-top-nav">
            <ul>
                <c:choose>
                    <c:when test="${User == null}">
                        <li><a href="${pageContext.request.contextPath}/Register">Register</a></li>
                        <li><a href="${pageContext.request.contextPath}/Login">Login</a></li>                
                    </c:when>
                    <c:otherwise>
                        <li><a href="#">Hello ${User.username}</a></li>
                        <li><a href="${pageContext.request.contextPath}/j_spring_security_logout">Log out</a></li>
                        <li><a href="${pageContext.request.contextPath}/WishList">Wish List</a></li>
                        <li><a href="${pageContext.request.contextPath}/OrderHistory">Orders History</a></li>
                    </c:otherwise>
                </c:choose>
                <li><a href="${pageContext.request.contextPath}/Cart"><span>shopingcart&nbsp;&nbsp;: </span></a><lable> &nbsp;${fn:length(Cart.products)} items</lable></li>
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
            <a href="Home"><img height="35" width="280" src="images/logo.png" title="logo" /></a>
        </div>
        <!----end-logo---->
        <!----start-top-nav---->
        <div class="top-nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/Home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/Store">Store</a></li>
                <li><a href="${pageContext.request.contextPath}/Contact">Contact</a></li>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <li><a href="${pageContext.request.contextPath}/Admin/Statistics">Manager</a></li>
                </sec:authorize>
            </ul>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<!----End-top-nav---->
<!----End-Header---->

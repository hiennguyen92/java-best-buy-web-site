<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <li><a href="Register">Register</a></li>
                        <li><a href="Login">Login</a></li>
                        <li><a href="Login"><span>shopingcart&nbsp;&nbsp;: </span></a><lable> &nbsp;0 items</lable></li>                        
                    </c:when>
                    <c:otherwise>
                        <li><a href="#">Hello ${User.username}</a></li>
                        <li><a href="j_spring_security_logout">Log out</a></li>
                        <li><a href="WishList">Wish List</a></li>
                        <li><a href="OrderHistory">Orders History</a></li>
                        <li><a href="Cart"><span>shopingcart&nbsp;&nbsp;: </span></a><lable> &nbsp;${Cart.products.size()} items</lable></li>
                    </c:otherwise>
                </c:choose>
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
                <li><a href="Home">Home</a></li>
                <li><a href="Store">Store</a></li>
                <li><a href="Contact">Contact</a></li>
            </ul>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<!----End-top-nav---->
<!----End-Header---->

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
                        <li><a href="Wish">Wish List</a></li>
                        <li><a href="#"><span>shopingcart&nbsp;&nbsp;: </span></a><lable> &nbsp;0 items</lable></li>                        
                    </c:when>
                    <c:otherwise>
                        <li><a href="MyInfo">Hello ${User.username}</a></li>
                        <li><a href="Redirect?logout=true">Log out</a></li>
                        <li><a href="Login">Wish List</a></li>
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
            <a href="Home"><img src="images/logo.png" title="logo" /></a>
        </div>
        <!----end-logo---->
        <!----start-top-nav---->
        <div class="top-nav">
            <ul>
                <li><a href="Home">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="Store">Store</a></li>
                <li><a href="store.html">Featured</a></li>
                <li><a href="Compare?id1=1&id2=2&id3=3&id4=4">Blog</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<!----End-top-nav---->
<!----End-Header---->

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
                    </c:when>
                    <c:otherwise>
                        <li><a href="MyInfo">Hello ${User.username}</a></li>
                    </c:otherwise>
                </c:choose>
                <li><a href="#">Cart</a></li>
                <li><a href="#"><span>shopingcart&nbsp;&nbsp;: </span></a><lable> &nbsp;noitems</lable></li>
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
            <a href="index.html"><img src="images/logo.png" title="logo" /></a>
        </div>
        <!----end-logo---->
        <!----start-top-nav---->
        <div class="top-nav">
            <ul>
                <li><a href="Home">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="Store">Store</a></li>
                <li><a href="store.html">Featured</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<!----End-top-nav---->
<!----End-Header---->

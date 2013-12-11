<%@page import="org.springframework.security.authentication.AnonymousAuthenticationToken"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="pojo.Account"%>
<%@page import="dao.AccountDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder" %>
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
                <%
                    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                    if (!(auth instanceof AnonymousAuthenticationToken)) {
                        String userName = auth.getName();

                        AccountDAO accountDAO = (AccountDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("accountDAO");
                        Account account = accountDAO.get(userName);
                        session.setAttribute("User", account);
                    }
                %>
                <c:choose>
                    <c:when test="${User == null}">
                        <li><a href="Register">Register</a></li>
                        <li><a href="Login">Login</a></li>
                        <li><a href="Wish">Wish List</a></li>
                        <li><a href="#"><span>shopingcart&nbsp;&nbsp;: </span></a><lable> &nbsp;0 items</lable></li>                        
                        </c:when>
                        <c:otherwise>
                        <li><a href="MyInfo">Hello ${User.username}</a></li>
                        <li><a href="<c:url value="j_spring_security_logout" />" > Logout</a></li>
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

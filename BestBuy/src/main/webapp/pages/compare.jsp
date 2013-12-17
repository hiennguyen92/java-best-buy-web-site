<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="css/jquery.rating.css" type="text/css">
<script src="js/jquery.rating.pack.js" type="text/javascript"></script>
<link href="css/style2.css" rel="stylesheet" />
<link href="css/cart.css" rel="stylesheet" />
<script src="js/compare.js" type="text/javascript"></script>
<div class="content">
    <div class="content-grids">
        <h4>Compare products</h4>
        <div id="wrap" align="center">
            <ul>
                <li id="${product1.productId}">
                    <div class="close" align="right">
                        <a href="Compare?id1=${product2.productId}&id2=${product3.productId}&id3=${product4.productId}">x</a>

                    </div>
                    <img src="${product1.imageUrl}" class="items" alt="">

                    <br clear="all">
                    <div class="name">${product1.name}</div>
                    <br clear="all">
                    <div class="name">$<fmt:formatNumber type="number" value="${product1.salePrice}" maxFractionDigits="2" minFractionDigits="2"/></div>
                </li>
                <li id="${product2.productId}">
                    <div class="close" align="right">
                        <a href="Compare?id1=${product1.productId}&id2=${product3.productId}&id3=${product4.productId}">x</a>

                    </div>
                    <img src="${product2.imageUrl}" class="items" alt="">

                    <br clear="all">
                    <div class="name">${product2.name}</div>
                    <br clear="all">
                    <div class="name">$<fmt:formatNumber type="number" value="${product2.salePrice}" maxFractionDigits="2" minFractionDigits="2"/></div>
                </li>
                <c:if test="${product3 != null}">
                <li id="${product3.productId}">
                    <div class="close" align="right">
                        <a href="Compare?id1=${product1.productId}&id2=${product2.productId}&id3=${product4.productId}">x</a>

                    </div>
                    <img src="${product3.imageUrl}" class="items" alt="">

                    <br clear="all">
                    <div class="name">${product3.name}</div>
                    <br clear="all">
                    <div class="name">$<fmt:formatNumber type="number" value="${product3.salePrice}" maxFractionDigits="2" minFractionDigits="2"/></div>
                </li>
                </c:if>
                <c:if test="${product4 != null}">
                <li id="${product4.productId}">
                    <div class="close" align="right">
                        <a href="Compare?id1=${product1.productId}&id2=${product2.productId}&id3=${product3.productId}">x</a>

                    </div>
                    <img src="${product4.imageUrl}" class="items" alt="">

                    <br clear="all">
                    <div class="name">${product4.name}</div>
                    <br clear="all">
                    <div class="name">$<fmt:formatNumber type="number" value="${product4.salePrice}" maxFractionDigits="2" minFractionDigits="2"/></div>
                </li>
                </c:if>
            </ul>

            <br clear="all"/>

            <table class="productcart"><!--************************ begin productcart ************************-->

                <tbody>
                    <tr class="firstrow">
                        <td class="firstcol" style="width: 160px">REVIEWS</td>
                        <td style="width: 20.5%"></td>
                        <td style="width: 20.5%"></td>
                        <td style="width: 20.5%"></td>
                        <td style="width: 20.5%"></td>
                    </tr>
                    <tr class="product_row">

                        <td class="firstcol">Rating</td>
                        <td>
                            <c:forEach var="i" begin="1" end="10">
                                <c:choose>
                                    <c:when test="${product1.rating*2==i}">
                                        <input name="adv1" type="radio" class="star {split:2}" disabled="disabled" checked="checked"/> 
                                    </c:when>
                                    <c:otherwise>
                                        <input name="adv1" type="radio" class="star {split:2}" disabled="disabled"/> 
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="i" begin="1" end="10">
                                <c:choose>
                                    <c:when test="${product2.rating*2==i}">
                                        <input name="adv2" type="radio" class="star {split:2}" disabled="disabled" checked="checked"/> 
                                    </c:when>
                                    <c:otherwise>
                                        <input name="adv2" type="radio" class="star {split:2}" disabled="disabled"/> 
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </td>                        
                        <td>
                            <c:if test="${product3 != null}">
                                <c:forEach var="i" begin="1" end="10">
                                    <c:choose>
                                        <c:when test="${product3.rating*2==i}">
                                            <input name="adv3" type="radio" class="star {split:2}" disabled="disabled" checked="checked"/> 
                                        </c:when>
                                        <c:otherwise>
                                            <input name="adv3" type="radio" class="star {split:2}" disabled="disabled"/> 
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>            
                            </c:if>                            
                        </td>
                        <td>
                            <c:if test="${product4 != null}">
                                <c:forEach var="i" begin="1" end="10">
                                    <c:choose>
                                        <c:when test="${product4.rating*2==i}">
                                            <input name="adv4" type="radio" class="star {split:2}" disabled="disabled" checked="checked"/> 
                                        </c:when>
                                        <c:otherwise>
                                            <input name="adv4" type="radio" class="star {split:2}" disabled="disabled"/> 
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>            
                            </c:if>        
                        </td>
                    </tr>
                    <tr class="firstrow">
                        <td class="firstcol" style="width: 160px">PRODUCT SPECS</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="product_row">

                        <td class="firstcol">TV Type</td>
                        <td>${product1.category.name}</td>
                        <td>${product2.category.name}</td>
                        <td>${product3.category.name}</td>
                        <td>${product4.category.name}</td>
                    </tr>
                    
                    <tr class="product_row">

                        <td class="firstcol">TV Brand</td>
                        <td>${product1.brand.name}</td>
                        <td>${product2.brand.name}</td>
                        <td>${product3.brand.name}</td>
                        <td>${product4.brand.name}</td>
                    </tr>

                    <tr class="product_row">

                        <td class="firstcol">Screen size</td>
                        <td>${product1.screen}"</td>
                        <td>${product2.screen}"</td>
                        <c:if test="${product3 != null}">
                        <td>${product3.screen}"</td>
                        </c:if>
                        <c:if test="${product4 != null}">
                        <td>${product4.screen}"</td>
                        </c:if>
                    </tr>
                    
                    <tr class="product_row">

                        <td class="firstcol">Warranty Terms</td>
                        <td>${product1.warranty} months</td>
                        <td>${product2.warranty} months</td>
                        <c:if test="${product3 != null}">
                        <td>${product3.warranty} months</td>
                        </c:if>
                        <c:if test="${product4 != null}">
                        <td>${product4.warranty} months</td>
                        </c:if>
                    </tr>

                    <tr class="product_row">

                        <td class="firstcol">Vertical Resolution</td>
                        <td>720p </td>
                        <td>720p </td>
                        <c:if test="${product3 != null}">
                        <td>720p</td>
                        </c:if>
                        <c:if test="${product4 != null}">
                        <td>720p </td>
                        </c:if>
                    </tr>

                    <tr class="product_row">

                        <td class="firstcol">Aspect Ratio</td>
                        <td>16:9 </td>
                        <td>16:9 </td>
                        <c:if test="${product3 != null}">
                        <td>16:9 </td>
                        </c:if>
                        <c:if test="${product4 != null}">
                        <td>16:9 </td>
                        </c:if>
                    </tr>
                    
                    <tr class="product_row">

                        <td class="firstcol">Maximum Resolution</td>
                        <td>1366 x 768 </td>
                        <td>1366 x 768 </td>
                        <c:if test="${product3 != null}">
                        <td>1366 x 768 </td>
                        </c:if>
                        <c:if test="${product4 != null}">
                        <td>1366 x 768 </td>
                        </c:if>
                    </tr>
                    
                    <tr class="product_row">

                        <td class="firstcol">HDMI Inputs</td>
                        <td>2 </td>
                        <td>2 </td>
                        <c:if test="${product3 != null}">
                        <td>3</td>
                        </c:if>
                        <c:if test="${product4 != null}">
                        <td>2 </td>
                        </c:if>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
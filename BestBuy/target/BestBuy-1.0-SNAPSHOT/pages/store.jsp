<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="css/style1.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.livequery.js"></script>
<script type="text/javascript" src="js/store.js"></script>
<div class="content">
    <div class="content-grids">

        <div align="left">

            <div id="cart_wrapper" align="center">

                <form action="#" id="cart_form" name="cart_form">

                    <div class="cart-info">
                        <c:forEach var="item" items="${Cart.products}">
                            <div id="each-${item.productId}" class="shopp">
                                <div class="label">
                                    <a href="Info?id=${item.productId}">${item.name}</a>
                                </div>
                                <div class="shopp-price"> 
                                    $<em>${item.price}</em>
                                </div>
                                <span class="shopp-quantity">${item.quantity}</span>
                                <img src="images/remove.png" class="remove" onclick="location.href='Redirect?remove=${item.productId}'"/>
                                <br class="all"/>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="cart-total">

                        <b>Estimated Tax:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> $<span><fmt:formatNumber type="number" value="${Cart.totalPrice*0.1}" maxFractionDigits="2" minFractionDigits="2"/></span>

                        <input type="hidden" name="total-hidden-charges" id="total-hidden-charges" value="0" />
                    </div>

                    <div class="cart-total">

                        <b>Total Charges:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> $<span><fmt:formatNumber type="number" value="${Cart.totalPrice*1.1}" maxFractionDigits="2" minFractionDigits="2"/></span>

                        <input type="hidden" name="total-hidden-charges" id="total-hidden-charges" value="0" />
                    </div>

                    <button type="submit" id="Submit">CheckOut</button>

                </form>
                <br clear="all" />
            </div>

            <div align="center"><a id="show_cart" href="javascript:void(0)">View My Cart</a></div>

            <input type="hidden" id="h_view" value="${view}"/>
            View: 
            <select id="sl_view" name='sl_view'>
                <option value='4'>4 per page</option>
                <option value='8'>8 per page</option>
                <option value='12'>12 per page</option>
                <option selected='selected' value='16'>16 per page</option>
            </select>
            <input type="hidden" id="h_sort" value="${sort}"/>
            Sort by: 
            <select id="sl_sort" name='sl_sort'>
                <option value='1'>Date(Newest->Oldest)</option>
                <option value='2'>Rating(High->Low)</option>
                <option value='3'>Rating(Low->High)</option>
                <option value='4'>Screen size(Big->Small)</option>
                <option value='5'>Screen size(Small->Big)</option>
                <option value='6'>Price(High->Low)</option>
                <option value='7'>Price(Low->High)</option>
            </select>

            <div id="wrap" align="center">

                <ul>
                    <c:forEach var="i" begin="${(page-1)*view}" end="${page*view-4}" step="4">
                        <c:forEach var="product" items="${products}" begin="${i}" end="${i+3}" varStatus="status" >
                            <c:if test="${status.index<Products.size()}">
                                <li id="${product.productId}">
                                    <img src="${product.imageUrl}" class="items" alt="" />

                                    <br clear="all" />
                                    <div>${product.name}</div>
                                    <br clear="all" />
                                </li>                                
                            </c:if>
                        </c:forEach>
                        <c:forEach var="product" items="${Products}" begin="${i}" end="${i+3}" varStatus="status" >
                            <c:if test="${status.index<Products.size()}">
                                <div class="detail-view" id="detail-${product.productId}">

                                    <div class="close" align="right">
                                        <a href="javascript:void(0)">x</a>

                                    </div>

                                    <img src="${product.imageUrl}" class="detail_images" alt="" />

                                    <div class="detail_info">

                                        <label class='item_name'>
                                            <a href="Info?id=${product.productId}">${product.name}</a>
                                        </label>
                                        <br clear="all" />

                                        <p>
                                            ${product.description}

                                            <br clear="all" /><br clear="all" />
                                            $<span class="price">${product.price}</span>

                                        </p>

                                        <br clear="all" />

                                        <button onclick="location.href='Redirect?add=${product.productId}'" class="add-to-cart-button">Add to Cart</button>
                                        <button class="add-to-cart-button">Add compare</button>

                                    </div>


                                </div>
                            </c:if>                            
                        </c:forEach>
                    </c:forEach>                    

                    <br clear="all" />
                </ul>
            </div>
            <div class="pagnation">
                <ul>
                    <c:forEach var="i" begin="1" end="${(Products.size() - 1) / view + 1}">
                        <c:choose>
                            <c:when test="${page == i}">
                                <li><a href="Store?page=${i}&view=${view}&sort=${sort}" class="selected">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                <li><a href="Store?page=${i}&view=${view}&sort=${sort}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                </ul>
            </div>

        </div>

    </div>
</div>
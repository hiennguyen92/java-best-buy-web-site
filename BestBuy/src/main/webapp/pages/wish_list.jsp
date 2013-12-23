<%-- 
    Document   : cart
    Created on : Dec 7, 2013, 10:26:48 AM
    Author     : HOANG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="/WEB-INF/functions" prefix="f" %>
<link href="css/cart.css" rel="stylesheet" />
<link href="css/style1.css" rel="stylesheet" />
<script type="text/javascript" src="js/cart.js"></script>
<div class="content">
    <div class="content-grids">
        <h4>Wish List</h4>
        <table class="productcart"><!--************************ begin productcart ************************-->

            <tbody>
                <tr class="firstrow">
                    <td class="firstcol" style="width: 10%"></td>
                    <td style="width: 60%">Product:</td>
                    <td>Quantity:</td>
                    <td>Price:</td>
                    <td></td>
                </tr>
                <c:forEach var="item" items="${User.wishList.products}">
                    <c:set var="cd" value="${f:s_get(User.wishList.cartId, item.productId)}" />
                    <tr class="product_row">

                        <td class="firstcol"><img width="60px" height="60px" src="${item.imageUrl}" alt="" title='${item.name}' height="48" width="48"></td>
                        <td><a href="Info?id=${item.productId}">${item.name}</a></td>

                        <td>
                            <form action="#">
                                <input id="quantity" size="2" value="${cd.quantity}" type="text">
                            </form>
                        </td>

                        <td><span class="pricedisplay">$<fmt:formatNumber type="number" value="${item.salePrice}" maxFractionDigits="2" minFractionDigits="2"/></span></td>

                        <td>
                            <form id="f_cart" class="f_cart" action="WishList" method="post">
                                <input type="hidden" name="h_id" value="${item.productId}"/>
                                <input id="h_quantity" type="hidden" name="h_quantity" />
                                <input class="img" type="image" src="images/update.png" name="update"></input>
                                <input class="img" type="image" src="images/remove.png" name="remove"></input>
                            </form>
                        </td>

                    </tr>
                </c:forEach>
                
            </tbody>
        </table>
        
        <table class="productcart">

            <tbody>
                <tr class="total_price total_tax">

                    <td style="width: 82%">Tax</td>
                    <td><span id="checkout_tax" class="pricedisplay checkout-tax">$<fmt:formatNumber type="number" value="${User.wishList.totalPrice*0.1}" maxFractionDigits="2" minFractionDigits="2"/></span></td>

                </tr>

                <tr class="total_price">

                    <td>Total Price</td>
                    <td><span id="checkout_total" class="pricedisplay checkout-total">$<fmt:formatNumber type="number" value="${User.wishList.totalPrice*1.1}" maxFractionDigits="2" minFractionDigits="2"/></span></td>

                </tr>

            </tbody>
        </table>
                    <form id="f_checkout" action="Order" method="post">
                        <input type="hidden" name="wish" value=""/>
                        <button type="submit" name="checkout" style="float: right">CHECKOUT</button>
                    </form>
    </div>
</div>

<%-- 
    Document   : cart
    Created on : Dec 7, 2013, 10:26:48 AM
    Author     : HOANG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="css/cart.css" rel="stylesheet" />
<link href="css/style1.css" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Cart</h4>
        <table class="productcart"><!--************************ begin productcart ************************-->

            <tbody>
                <tr class="firstrow">
                    <td class="firstcol" style="width: 10%"></td>
                    <td style="width: 60%">Product:</td>
                    <td>Quantity:</td>
                    <td>Price:</td>
                    <td></td>
                </tr>
                <c:forEach var="item" items="${Cart.products}">
                    <tr class="product_row">

                        <td class="firstcol"><img style="width: 50px; height: 50px" src="${item.imageUrl}" alt="Mp3 Player" title="Mp3 Player" height="48" width="48"></td>
                        <td><a href="Info?id=${item.productId}">${item.name}</a></td>

                        <td>
                            <form action="#">
                                <input id="quantity" size="2" value="${item.quantity}" type="text">
                            </form>
                        </td>

                        <td><span class="pricedisplay">$${item.price}</span></td>

                        <td>
                            <form action="#">
                                <input type="hidden" name="h_id" value="${item.productId}"/>
                                
                                <input class="img" type="image" src="images/update.png"></input>
                                <input class="img" type="image" src="images/remove.png"></input>
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
                    <td><span id="checkout_tax" class="pricedisplay checkout-tax">$<fmt:formatNumber type="number" value="${Cart.totalPrice*0.1}" maxFractionDigits="2" minFractionDigits="2"/></span></td>

                </tr>

                <tr class="total_price">

                    <td>Total Price</td>
                    <td><span id="checkout_total" class="pricedisplay checkout-total">$<fmt:formatNumber type="number" value="${Cart.totalPrice*1.1}" maxFractionDigits="2" minFractionDigits="2"/></span></td>

                </tr>

            </tbody>
        </table>
                    
                    <button type="submit" id="Submit" style="float: right">Check Out</button>
    </div>
</div>

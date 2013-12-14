<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@taglib uri="/WEB-INF/functions" prefix="f" %>
<link href="css/cart.css" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Orders history</h4>
        <c:forEach var="order" items="${oders}">
        <table class="productcart"><!--************************ begin productcart ************************-->

            <tbody>
                <tr class="firstrow">
                    <td class="firstcol" style="width: 10%"></td>
                    <td style="width: 60%">Product:</td>
                    <td>Quantity:</td>
                    <td>Price:</td>
                    <td></td>
                </tr>
                <c:forEach var="item" items="${order.products}">
                    <c:set var="cd" value="${f:s_get(order.cartId, item.productId)}" />
                    <tr class="product_row">

                        <td class="firstcol"><img width="60px" height="60px" src="${item.imageUrl}" alt="" title='${item.name}' height="48" width="48"></td>
                        <td><a href="Info?id=${item.productId}">${item.name}</a></td>

                        <td>
                                <p>${cd.quantity}</p>
                        </td>

                        <td><span class="pricedisplay">$${item.price}</span></td>

                        <td>
                        </td>

                    </tr>
                </c:forEach>
                
            </tbody>
        </table>
        
        <table class="productcart">

            <tbody>
                <tr class="total_price total_tax">

                    <td style="width: 86%">Tax</td>
                    <td><span id="checkout_tax" class="pricedisplay checkout-tax">$<fmt:formatNumber type="number" value="${order.totalPrice*0.1}" maxFractionDigits="2" minFractionDigits="2"/></span></td>

                </tr>

                <tr class="total_price">

                    <td>Total Price</td>
                    <td><span id="checkout_total" class="pricedisplay checkout-total">$<fmt:formatNumber type="number" value="${order.totalPrice*1.1}" maxFractionDigits="2" minFractionDigits="2"/></span></td>

                </tr>

            </tbody>
        </table>
        </c:forEach>
    </div>
</div>
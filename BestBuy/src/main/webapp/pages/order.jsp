<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="js/order.js"></script>
<input id="result" type="hidden" value="${result}"/>
<div class="content">
    <div class="col span_1_of_3">
        <div class="contact-form">
            <h2>Order</h2>
            <form id="f_order" action="Order" method="post">
                <div>
                    <span><label>Name</label></span>
                    <span><input type="text" value="${User.realName}" name="tb_RealName"></span>
                </div>
                <div>
                    <span><label>Phone</label></span>
                    <span><input type="text" value="${User.phone}" name="tb_Phone"></span>
                </div>
                <div>
                    <span><label>Address</label></span>
                    <span><textarea  name="tb_Address">${User.address}</textarea></span>
                </div>
                <div>
                    <span>
                        <c:choose>
                            <c:when test="${!wish}">
                                <label>Total price: $<fmt:formatNumber type="number" value="${Cart.totalPrice*1.1}" maxFractionDigits="2" minFractionDigits="2"/> (${fn:length(Cart.products)} items)</label>                       
                            </c:when>
                            <c:otherwise>
                                <label>Total price: $<fmt:formatNumber type="number" value="${User.wishList.totalPrice*1.1}" maxFractionDigits="2" minFractionDigits="2"/> (${fn:length(User.wishList.products)} items)</label>
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div>
                    <span>
                        <c:choose>
                            <c:when test="${!wish}">
                                <input type="submit" name="purchase" value="Purchase">
                                <input type="button" onclick="location.href='Cart'" value="Edit Cart">                                
                            </c:when>
                            <c:otherwise>
                                <input type="submit" name="purchase_wish" value="Purchase">
                                <input type="button" onclick="location.href='WishList'" value="Edit Wishlist">
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>
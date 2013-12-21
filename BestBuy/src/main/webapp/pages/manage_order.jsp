<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<link href="<s:url value="/css/cart.css"/>" rel="stylesheet" />
<link href="<s:url value="/css/style1.css"/>" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Manage Orders</h4>
        <table class="productcart"><!--************************ begin productcart ************************-->

            <tbody>
                <tr class="firstrow">
                    <td class="firstcol" style="width: 10%">Avatar</td>
                    <td style="width: 30%">Username</td>
                    <td style="width: 10%">Items</td>
                    <td style="width: 15%">Date</td>
                    <td style="width: 15%">Total Price</td>
                    <td></td>
                </tr>
                <c:forEach var="order" items="${orders}">
                    <c:if test="${order.account != null}">
                    <tr class="product_row">

                        <td class="firstcol"><img width="60px" height="60px" src="${pageContext.request.contextPath}/${order.account.avatar}" alt="" title='${order.account.username}' height="48" width="48"></td>
                        <td><a href="${pageContext.request.contextPath}/Profile?name=${order.account.username}">${order.account.username}</a></td>
                        <td>${fn:length(order.products)}</td>
                        
                        <td><fmt:formatDate value="${order.date}"/></td>

                        <td>$<fmt:formatNumber type="number" value="${order.totalPrice}" maxFractionDigits="2" minFractionDigits="2"/></td>

                        <td>
                            <form id="f_mgn_account" class="f_cart" action="#" method="post">
                                <input type="hidden" name="h_username" value="${account.username}"/>
                                <input class="img" type="image" src="${pageContext.request.contextPath}/images/edit.png" name="edit"></input>
                                <input class="img" type="image" src="${pageContext.request.contextPath}/images/remove.png" name="remove"></input>
                            </form>
                        </td>

                    </tr>
                    </c:if>
                </c:forEach>
                
            </tbody>
        </table>
    </div>
</div>
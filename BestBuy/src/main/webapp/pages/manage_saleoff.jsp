<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<link href="<s:url value="/css/cart.css"/>" rel="stylesheet" />
<link href="<s:url value="/css/style1.css"/>" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Manage Sale Off</h4>
        <table class="productcart">
            <tbody>
                <tr class="firstrow">
                    <td style="width: 50%">SALE OFF</td>
                    <td></td>
                </tr>
                <c:choose>
                    <c:when test="${sale != null}">
                        <tr class="product_row">
                            <td colspan="2">Name: ${sale.name}</td>
                        </tr>
                        <tr class="product_row">
                            <td colspan="2">Description: ${sale.description}</td>
                        </tr>
                        <tr class="product_row">
                            <td colspan="2">Sale: ${sale.percent}%</td>
                        </tr>
                        <tr class="product_row">
                            <td>From: <fmt:formatDate value="${sale.from}"/></td>
                            <td>To: <fmt:formatDate value="${sale.to}"/></td>
                        </tr>                           
                    </c:when>
                    <c:otherwise>
                        <tr class="product_row">
                            <td colspan="2">There is no event currently</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        <c:choose>
            <c:when test="${sale != null}">
                <form id="f_checkout" action="ManageSale" method="post">
                    <button type="submit" name="delete" style="float: right">delete event</button>
                    <button type="submit" name="edit" style="float: right">edit event</button>
                </form>
            </c:when>
            <c:otherwise>
                <form id="f_checkout" action="ManageSale" method="post">
                    <button type="submit" name="create" style="float: right">create event</button>
                </form>                
            </c:otherwise>
        </c:choose>
    </div>
</div>
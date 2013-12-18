<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<link href="<s:url value="/css/cart.css"/>" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Statistics</h4>
        <table class="productcart">
            <tbody>
                <tr class="firstrow">
                    <td style="width: 50%">MEMBERS</td>
                    <td></td>
                </tr>
                <tr class="product_row">
                    <td><p>Current members: ${accounts.size()}</p></td>
                </tr>
                <tr class="product_row">
                    <td><p>Active members: ${active}</p></td>
                    <td><p>Non-active members: ${nonActive}</p></td>
                </tr>
            </tbody>
        </table>
        <table class="productcart">
            <tbody>
                <tr class="firstrow">
                    <td style="width: 50%">PRODUCTS</td>
                    <td></td>
                </tr>
                <tr class="product_row">
                    <td>Current products: ${Products.size()}</td>
                    <td></td>
                </tr>
                <tr class="product_row">
                    <td><p>Current brands: ${Brands.size()}</p></td>
                    <td><p>Current categories: ${Categories.size()}</p></td>
                </tr>
            </tbody>
        </table>
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
    </div>
</div>

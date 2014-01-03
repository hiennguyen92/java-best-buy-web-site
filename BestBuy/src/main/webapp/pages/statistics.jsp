<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<link href="<s:url value="/css/cart.css"/>" rel="stylesheet" />
<link href="<s:url value="/css/style1.css"/>" rel="stylesheet" />
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
                    <td><p>Current members: ${fn:length(accounts)}</p></td>
                </tr>
                <tr class="product_row">
                    <td><p>Active members: ${active}</p></td>
                    <td><p>Non-active members: ${nonActive}</p></td>
                </tr>
            </tbody>
        </table>
        <button type="button" onclick="location.href='ManageAccount'" style="float: right; width: 200px; margin-bottom: 10px">Manage accounts</button>
        <table class="productcart">
            <tbody>
                <tr class="firstrow">
                    <td style="width: 50%">PRODUCTS</td>
                    <td></td>
                </tr>
                <tr class="product_row">
                    <td>Current products: ${fn:length(Products)}</td>
                    <td></td>
                </tr>
                <tr class="product_row">
                    <td><p>Current brands: ${fn:length(Brands)}</p></td>
                    <td><p>Current categories: ${fn:length(Categories)}</p></td>
                </tr>
            </tbody>
        </table>
        <button type="button" onclick="location.href='ManageProduct'" style="float: right; width: 200px; margin-bottom: 10px">Manage products</button>
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
        <button type="button" onclick="location.href='ManageSale'" style="float: right; width: 200px; margin-bottom: 10px">Manage saleoff</button>
        <table class="productcart">
            <tbody>
                <tr class="firstrow">
                    <td style="width: 50%">ORDERS</td>
                    <td></td>
                </tr>
                <tr class="product_row">
                    <td><p>Number of orders: ${ordersSize}</p></td>
                </tr>
            </tbody>
        </table>
        <button type="button" onclick="location.href='ManageOrder'" style="float: right; width: 200px; margin-bottom: 10px">Manage orders</button>
        <table class="productcart">
                <tbody>
                <tr class="firstrow">
                            <td style="width: 50%">REPORTS</td>
                            <td></td>
                        </tr>
                        <tr class="product_row">
                            <td><p>Reports Website</p></td>
                        </tr>
                    </tbody>
            </table>
            <button type="button" onclick="location.href='ManageReport'" style="float: right; width: 200px; margin-bottom: 10px">Manage reports</button>

    </div>
</div>

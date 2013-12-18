<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<link href="<s:url value="/css/cart.css"/>" rel="stylesheet" />
<link href="<s:url value="/css/style1.css"/>" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Manage Product</h4>
        <form id="f_checkout" action="ManageProduct" method="post">
            <button type="submit" name="add" style="float: right">Add product</button>
        </form>
        <table class="productcart"><!--************************ begin productcart ************************-->

            <tbody>
                <tr class="firstrow">
                    <td class="firstcol" style="width: 10%">Image</td>
                    <td style="width: 25%">Name</td>
                    <td style="width: 40%">Description</td>
                    <td style="width: 10%">Price</td>
                    <td></td>
                </tr>
                <c:forEach var="item" items="${Products}">
                    <c:set var="product" value="${productDAO.get(item.productId)}"/>
                    <tr class="product_row">

                        <td class="firstcol"><img width="60px" height="60px" src="${pageContext.request.contextPath}/${product.imageUrl}" alt="" title='${product.name}' height="48" width="48"></td>
                        <td><a href="Info?id=${product.productId}">${product.name}</a></td>
                        <c:choose>
                            <c:when test="${product.description.length() > 100}">
                                <td>${product.description.substring(0, 100)}...</td>                            
                            </c:when>
                            <c:otherwise>
                                <td>${product.description}</td>       
                            </c:otherwise>
                        </c:choose>
                        
                        <td>$<fmt:formatNumber type="number" value="${product.price}" maxFractionDigits="2" minFractionDigits="2"/></td>

                        <td>
                            <form id="f_mgn_account" class="f_cart" action="ManageProduct" method="post">
                                <input type="hidden" name="h_id" value="${product.productId}"/>
                                <input class="img" type="image" src="${pageContext.request.contextPath}/images/edit.png" name="edit"></input>
                                <input class="img" type="image" src="${pageContext.request.contextPath}/images/remove.png" name="remove"></input>
                            </form>
                        </td>

                    </tr>
                </c:forEach>
                
            </tbody>
        </table>
    </div>
</div>
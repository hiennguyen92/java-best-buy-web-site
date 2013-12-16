<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@taglib uri="/WEB-INF/functions" prefix="f" %>
<link href="css/cart.css" rel="stylesheet" />
<link href="css/style1.css" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Manage product</h4>
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

                        <td class="firstcol"><img width="60px" height="60px" src="${product.imageUrl}" alt="" title='${product.name}' height="48" width="48"></td>
                        <td><a href="Info?id=${product.productId}">${product.name}</a></td>
                        <c:choose>
                            <c:when test="${product.description.length() > 100}">
                                <td>${product.description.substring(0, 100)}...</td>                            
                            </c:when>
                            <c:otherwise>
                                <td>${product.description}</td>       
                            </c:otherwise>
                        </c:choose>
                        
                        <td>$${product.price}</td>

                        <td>
                            <form id="f_mgn_account" class="f_cart" action="ManageProduct" method="post">
                                <input type="hidden" name="h_id" value="${product.productId}"/>
                                <input class="img" type="image" src="images/edit.png" name="edit"></input>
                                <input class="img" type="image" src="images/remove.png" name="remove"></input>
                            </form>
                        </td>

                    </tr>
                </c:forEach>
                
            </tbody>
        </table>
    </div>
</div>
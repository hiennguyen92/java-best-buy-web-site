<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@taglib uri="/WEB-INF/functions" prefix="f" %>
<link href="css/cart.css" rel="stylesheet" />
<link href="css/style1.css" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Manage account</h4>
        <form id="f_checkout" action="ManageAccount" method="post">
            <button type="submit" name="add" style="float: right">Add account</button>
        </form>
        <table class="productcart"><!--************************ begin productcart ************************-->

            <tbody>
                <tr class="firstrow">
                    <td class="firstcol" style="width: 10%">Avatar</td>
                    <td style="width: 25%">Username</td>
                    <td style="width: 25%">Password</td>
                    <td style="width: 15%">Roles</td>
                    <td style="width: 10%">Status</td>
                    <td></td>
                </tr>
                <c:forEach var="user" items="${accounts}">
                    <c:set var="account" value="${accountDAO.get(user.username)}"/>
                    <tr class="product_row">

                        <td class="firstcol"><img width="60px" height="60px" src="images/avatar.jpg" alt="" title='${account.username}' height="48" width="48"></td>
                        <td><a href="#">${account.username}</a></td>
                        <td>${account.password}</td>
                        
                        <td>
                            <c:forEach var="role" items="${account.roles}">
                                <p>${role.authority}</p>
                            </c:forEach>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${account.enable == 1}">
                                    <p>ACTIVE</p>                                    
                                </c:when>
                                <c:otherwise>
                                    <p>DISABLE</p>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <form id="f_mgn_account" class="f_cart" action="ManageAccount" method="post">
                                <input type="hidden" name="h_username" value="${account.username}"/>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@taglib uri="/WEB-INF/functions" prefix="f" %>
<link href="css/cart.css" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Manage account</h4>
        <table class="productcart"><!--************************ begin productcart ************************-->

            <tbody>
                <tr class="firstrow">
                    <td class="firstcol" style="width: 10%">Avatar</td>
                    <td style="width: 60%">Username</td>
                    <td>Role</td>
                    <td>Status</td>
                    <td></td>
                </tr>
                <c:forEach var="account" items="${accounts}">
                    <tr class="product_row">

                        <td class="firstcol"><img width="60px" height="60px" src="images/avatar.jpg" alt="" title='${account.username}' height="48" width="48"></td>
                        <td><a href="#">${account.username}</a></td>

                        <td>
                            ADMIN
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${account.enable == 1}">
                                    <p>active</p>                                    
                                </c:when>
                                <c:otherwise>
                                    <p>disable</p>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <form id="f_mgn_account" class="f_cart" action="Cart" method="post">
                                <input type="hidden" name="h_id" value="${account.username}"/>
                                <input class="img" type="image" src="images/update.png" name="update"></input>
                                <input class="img" type="image" src="images/remove.png" name="remove"></input>
                            </form>
                        </td>

                    </tr>
                </c:forEach>
                
            </tbody>
        </table>
    </div>
</div>
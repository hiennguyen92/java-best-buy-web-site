<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<link href="<s:url value="/css/cart.css"/>" rel="stylesheet" />
<link href="<s:url value="/css/style1.css"/>" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Manage Accounts</h4>
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
                <c:forEach var="userAccount" items="${accounts}">
                    <tr class="product_row">

                        <td class="firstcol"><img width="60px" height="60px" src="${pageContext.request.contextPath}/${userAccount.avatar}" alt="" title='${userAccount.username}' height="48" width="48"></td>
                        <td><a href="${pageContext.request.contextPath}/Profile?name=${userAccount.username}">${userAccount.username}</a></td>
                        <td>${userAccount.password}</td>
                        
                        <td>
                            <c:forEach var="role" items="${roleDAO.getList(userAccount.username)}">
                                <p>${role.authority}</p>
                            </c:forEach>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${userAccount.enable == 1}">
                                    <p>ACTIVE</p>                                    
                                </c:when>
                                <c:otherwise>
                                    <p>DISABLE</p>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <c:if test="${userAccount.username != User.username}">
                                <form id="f_mgn_account" class="f_cart" action="ManageAccount" method="post">
                                    <input type="hidden" name="h_username" value="${userAccount.username}"/>
                                    <input class="img" type="image" src="${pageContext.request.contextPath}/images/edit.png" name="edit"></input>
                                    <input class="img" type="image" src="${pageContext.request.contextPath}/images/remove.png" name="remove"></input>
                                </form>
                            </c:if>
                        </td>

                    </tr>
                </c:forEach>
                
            </tbody>
        </table>
    </div>
</div>
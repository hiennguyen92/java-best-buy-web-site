<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="comment" items="${product.comments}">
    <table class="menu_table"><!--************************ begin productcart ************************-->

        <tbody style="font-size: small">
            <tr class="product_row">
                <td style="width: 20%">
                    <img height="120px" src="images/avatar.jpg"/>
                </td>
                <td>
                    <p><a href="#">${comment.account.username}</a></p>
                    <p>${comment.content}</p>
                </td>
            </tr>
        </tbody>
    </table>
</c:forEach> 

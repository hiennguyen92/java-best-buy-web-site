<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/jquery.js"></script>
<script src="js/jquery.MetaData.js"></script>
<script src="js/jquery.rating.pack.js" type="text/javascript"></script>
<script type="text/javascript" src="js/single.js"></script>
<label style="float: left">Rating:</label>
<c:forEach var="i" begin="1" end="10">
    <c:choose>
        <c:when test="${product.rating*2>=i&&product.rating*2<i+1}">
            <input name="adv1" type="radio" class="star {split:2}" disabled="disabled" checked="checked"/> 
        </c:when>
        <c:otherwise>
            <input name="adv1" type="radio" class="star {split:2}" disabled="disabled"/> 
        </c:otherwise>
    </c:choose>
</c:forEach>
(${product.rateAmount} rates)
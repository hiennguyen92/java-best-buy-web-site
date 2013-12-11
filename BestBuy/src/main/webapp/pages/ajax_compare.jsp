<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<label style="float: left; margin-top: 5px">Compare items:</label>
<ul style="float: left;">
    <li id="item_1" class="">
    <c:if test="${compare1 != null}">
        <img src="${compare1.imageUrl}" title='${compare1.name}'>
        <input name="compare_1" id="compare_1" value="${compare1.productId}" type="hidden">
        <span class="remove"> </span>
    </c:if>
</li>
<li id="item_2" class="">
<c:if test="${compare2 != null}">
    <img src="${compare2.imageUrl}" title='${compare2.name}'>
    <input name="compare_2" id="compare_2" value="${compare2.productId}" type="hidden">
    <span class="remove"> </span>
</c:if>
</li>
<li id="item_3" class="">
<c:if test="${compare3 != null}">
    <img src="${compare3.imageUrl}" title='${compare3.name}'>
    <input name="compare_3" id="compare_3" value="${compare3.productId}" type="hidden">
    <span class="remove"> </span>
</c:if>
</li>
<li id="item_4" class="">
<c:if test="${compare4 != null}">
    <img src="${compare4.imageUrl}" title='${compare4.name}'>
    <input name="compare_4" id="compare_4" value="${compare4.productId}" type="hidden">
    <span class="remove"> </span>
</c:if>
</li>
</ul>
<form id="f_compare" action="Compare" method="post" style="float: left">
    <input id="id1" name="id1" type="hidden"/>
    <input id="id2" name="id2" type="hidden"/>
    <input id="id3" name="id3" type="hidden"/>
    <input id="id4" name="id4" type="hidden"/>
    <button type="submit">Compare</button>
</form>
<script type="text/javascript" src="js/compare-tab.js"></script>
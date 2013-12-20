<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="/WEB-INF/functions" prefix="f" %>
<link href="css/cart.css" rel="stylesheet" />
<script type="text/javascript" src="js/order-history.js"></script>
<div class="content">
    <div class="content-grids">
        <h4>Orders history</h4>
        <label>Sort by: </label> 
        <select id="sl_sort" name='sl_sort'>
            <option value='1'>Date(Newest->Oldest)</option>
            <option value='2'>Date(Oldest->Newest)</option>
            <option value='3'>Total price(Highest->Lowest)</option>
            <option value='4'>Total price(Lowest->Highest)</option>
        </select>
        <div id="list_orders">
            <%@include file="ajax_orders.jsp" %>
        </div>
    </div>
</div>
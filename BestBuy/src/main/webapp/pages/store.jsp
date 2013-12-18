<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<link href="css/style1.css" rel="stylesheet" />
<link href="css/store.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.livequery.js"></script>
<script type="text/javascript" src="js/store.js"></script>
<script type="text/javascript" src="js/compare-tab.js"></script>
<div class="content">
    <div class="content-grids">

        <div align="left">

            <div id="cart_wrapper" align="center">

                <form action="Order" id="cart_form" name="cart_form">

                    <div class="cart-info">
                        <c:forEach var="item" items="${Cart.products}">
                            <div id="each-${item.productId}" class="shopp">
                                <div class="label">
                                    <a href="Info?id=${item.productId}">${item.name}</a>
                                </div>
                                <div class="shopp-price"> 
                                    $<em>${item.salePrice}</em>
                                </div>
                                <span class="shopp-quantity">${item.quantity}</span>
                                <img src="images/remove.png" class="remove" onclick="location.href='Redirect?remove=${item.productId}'"/>
                                <br class="all"/>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="cart-total">

                        <b>Estimated Tax:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> $<span><fmt:formatNumber type="number" value="${Cart.totalPrice*0.1}" maxFractionDigits="2" minFractionDigits="2"/></span>

                        <input type="hidden" name="total-hidden-charges" id="total-hidden-charges" value="0" />
                    </div>

                    <div class="cart-total">

                        <b>Total Charges:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> $<span><fmt:formatNumber type="number" value="${Cart.totalPrice*1.1}" maxFractionDigits="2" minFractionDigits="2"/></span>

                        <input type="hidden" name="total-hidden-charges" id="total-hidden-charges" value="0" />
                    </div>

                    <button type="submit" id="Submit">CheckOut</button>

                </form>
                <br clear="all" />
            </div>

            <div align="center" style="margin-bottom: 5px"><a id="show_cart" href="javascript:void(0)">View My Cart</a></div>

            <input type="hidden" id="h_view" value="${view}"/>
            <label>View:</label> 
            <select id="sl_view" name='sl_view'>
                <option value='4'>4 per page</option>
                <option value='8'>8 per page</option>
                <option value='12'>12 per page</option>
                <option selected='selected' value='16'>16 per page</option>
            </select>
            <input type="hidden" id="h_sort" value="${sort}"/>
            <label>Sort by: </label> 
            <select id="sl_sort" name='sl_sort'>
                <option value='1'>Date(Newest->Oldest)</option>
                <option value='2'>Rating(High->Low)</option>
                <option value='3'>Rating(Low->High)</option>
                <option value='4'>Screen size(Big->Small)</option>
                <option value='5'>Screen size(Small->Big)</option>
                <option value='6'>Price(High->Low)</option>
                <option value='7'>Price(Low->High)</option>
            </select>
            
            <div class="compare" style="float: right">
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
            </div>

            <div id="list_products">
                <s:include value="/pages/ajax_products.jsp"/>
            </div>
        </div>

    </div>
</div>
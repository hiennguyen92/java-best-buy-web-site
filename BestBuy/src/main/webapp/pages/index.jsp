<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/responsiveslides.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/compare-tab.js"></script>
<link href="css/store.css" rel="stylesheet" />
<link href="css/style1.css" rel="stylesheet" />
<div class="content">
    <div class="top-3-grids">
        <div class="section group">
            <div class="grid_1_of_3 images_1_of_3">
                <a href="Store?Brand=1"><img src="images/1_ch.jpg"></a>
                <h3>SAMSUNG </h3>
            </div>
            <div class="grid_1_of_3 images_1_of_3 second">
                <a href="Store?Brand=2"><img src="images/6_ch.jpg"></a>
                <h3>LG </h3>
            </div>
            <div class="grid_1_of_3 images_1_of_3 theree">
                <a href="Store?Brand=3"><img src="images/7_ch.jpg"></a>
                <h3>Sony </h3>
            </div>
        </div>
    </div>

    <div class="content-grids">
        <h4>Latest products</h4>
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
        <div class="section group">
            <c:forEach var="dec" begin="0" end="3" step="1">
                <c:set var="i" value="${products.size()-1-dec}"/>
                <div class="grid_1_of_4 images_1_of_4 products-info">
                    <img src="${products[i].imageUrl}">
                    <a href="Info?id=${products[i].productId}">${products[i].name}</a>
                    <h3>$${products[i].price}</h3>
                    <ul>
                        <li><a  class="cart" href="Redirect?add=${products[i].productId}"> </a></li>
                        <li><a  class="i" href="Info?id=${products[i].productId}"> </a></li>
                        <li><a  class="Compar" href="javascript:void(0)" onclick="addCompare(${products[i].productId});"> </a></li>
                        <li><a  class="Wishlist" href="Redirect?add_wish=${products[i].productId}"> </a></li>
                    </ul>
                </div>
            </c:forEach> 
        </div>
        <div class="section group">
            <c:forEach var="dec" begin="0" end="3" step="1">
                <c:set var="i" value="${products.size()-5-dec}"/>
                <div class="grid_1_of_4 images_1_of_4 products-info">
                    <img src="${products[i].imageUrl}">
                    <a href="Info?id=${products[i].productId}">${products[i].name}</a>
                    <h3>$${products[i].price}</h3>
                    <ul>
                        <li><a  class="cart" href="Redirect?add=${products[i].productId}"> </a></li>
                        <li><a  class="i" href="Info?id=${products[i].productId}"> </a></li>
                        <li><a  class="Compar" href="javascript:void(0)" onclick="addCompare(${products[i].productId});"> </a></li>
                        <li><a  class="Wishlist" href="Redirect?add_wish=${products[i].productId}"> </a></li>
                    </ul>
                </div>
            </c:forEach> 
        </div>
    </div>
</div>

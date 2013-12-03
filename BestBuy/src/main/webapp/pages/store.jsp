<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/style1.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.livequery.js"></script>
<script type="text/javascript" src="js/store.js"></script>
<div class="content">
    <div class="content-grids">

        <div align="left" style="min-height:800px;">

            <div id="cart_wrapper" align="center">

                <form action="#" id="cart_form" name="cart_form">

                    <div class="cart-info"> </div>

                    <div class="cart-total">

                        <b>Total Charges:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> $<span>0</span>

                        <input type="hidden" name="total-hidden-charges" id="total-hidden-charges" value="0" />
                    </div>

                    <button type="submit" id="Submit">CheckOut</button>

                </form>
            </div>

            <div id="wrap" align="center">

                <a id="show_cart" href="javascript:void(0)">View My Cart</a>

                <ul>
                    <c:forEach var="i" begin="0" end="12" step="4">
                        <c:forEach var="product" items="${Products}" begin="${i}" end="${i+3}" >
                            <li id="${product.productId}">
                                <img src="${product.imageUrl}" class="items" alt="" />

                                <br clear="all" />
                                <div>${product.name}</div>
                                <br clear="all" />
                            </li>
                        </c:forEach>
                        <c:forEach var="product" items="${Products}" begin="${i}" end="${i+3}" >
                            <div class="detail-view" id="detail-${product.productId}">

                                <div class="close" align="right">
                                    <a href="javascript:void(0)">x</a>

                                </div>

                                <img src="${product.imageUrl}" class="detail_images" alt="" />

                                <div class="detail_info">

                                    <label class='item_name'>${product.name}</label>
                                    <br clear="all" />

                                    <p>
                                        ${product.description}

                                        <br clear="all" /><br clear="all" />
                                        $<span class="price">${product.price}</span>

                                    </p>

                                    <br clear="all" />

                                    <button  class="add-to-cart-button">Add to Cart</button>
                                    <button onClick="location.href = 'Info?id=${product.productId}'" class="add-to-cart-button">Detail</button>

                                </div>


                            </div>
                        </c:forEach>
                    </c:forEach>                    

                    <br clear="all" />
                </ul>
            </div>
            <div class="pagnation">
                <ul>
                    <c:forEach var="i" begin="1" end="${(Products.size() - 1) / 16 + 1}">
                        <c:choose>
                            <c:when test="${page == i}">
                                <li><a href="Store?page=${i}" class="selected">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="Store?page=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>

        </div>

    </div>
</div>
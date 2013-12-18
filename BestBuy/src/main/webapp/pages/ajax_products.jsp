<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="js/store.js"></script>
<div id="wrap" align="center">

    <ul>
        <c:forEach var="i" begin="${(page-1)*view}" end="${page*view-4}" step="4">
            <c:forEach var="product" items="${products}" begin="${i}" end="${i+3}" varStatus="status" >
                <c:if test="${status.index<products.size()}">
                    <li id="${product.productId}">
                        <img src="${product.imageUrl}" class="items" alt="" />

                        <br clear="all" />
                        <div>${product.name}</div>
                        <br clear="all" />
                    </li>                                
                </c:if>
            </c:forEach>
            <c:forEach var="product" items="${products}" begin="${i}" end="${i+3}" varStatus="status" >
                <c:if test="${status.index<products.size()}">
                    <div class="detail-view" id="detail-${product.productId}">

                        <div class="close" align="right">
                            <a href="javascript:void(0)">x</a>

                        </div>

                        <img src="${product.imageUrl}" class="detail_images" alt="" />

                        <div class="detail_info">

                            <label class='item_name'>
                                <a href="Info?id=${product.productId}">${product.name}</a>
                            </label>
                            <br clear="all" />

                            <p>
                                ${product.description}

                                <br clear="all" /><br clear="all" />
                                $<span class="price">${product.price}</span>

                            </p>

                            <br clear="all" />

                            <button onclick="location.href = 'Redirect?add=${product.productId}'" class="add-to-cart-button">Add to Cart</button>
                            <button onclick="addCompare(${product.productId})" class="compare-button">Add compare</button>
                            <button onclick="location.href = 'Redirect?add_wish=${product.productId}'" class="compare-button">wish list</button>
                        </div>


                    </div>
                </c:if>                            
            </c:forEach>
        </c:forEach>                    

        <br clear="all" />
    </ul>
</div>
<div class="pagnation">
    <ul>
        <c:forEach var="i" begin="1" end="${(products.size() - 1) / view + 1}">
            <c:choose>
                <c:when test="${page == i}">
                    <li><a href="Store?page=${i}&view=${view}&sort=${sort}${paginate}" class="selected">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="Store?page=${i}&view=${view}&sort=${sort}${paginate}">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
</div>
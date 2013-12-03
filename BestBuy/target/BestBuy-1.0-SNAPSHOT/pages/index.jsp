<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/responsiveslides.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<div class="content">
    <div class="top-3-grids">
        <div class="section group">
            <div class="grid_1_of_3 images_1_of_3">
                <a href="single.html"><img src="images/grid-img1.jpg"></a>
                <h3>Lorem Ipsum is simply dummy text </h3>
            </div>
            <div class="grid_1_of_3 images_1_of_3 second">
                <a href="single.html"><img src="images/grid-img2.jpg"></a>
                <h3>Lorem Ipsum is simply dummy text </h3>
            </div>
            <div class="grid_1_of_3 images_1_of_3 theree">
                <a href="single.html"><img src="images/grid-img3.jpg"></a>
                <h3>Lorem Ipsum is simply dummy text </h3>
            </div>
        </div>
    </div>

    <div class="content-grids">
        <h4>Latest products</h4>
        <div class="section group">
            <c:forEach var="dec" begin="${Products.size()-8}" end="${Products.size()-5}" step="1">
                <c:set var="i" value="${Products.size()-5-dec}"/>
                <div class="grid_1_of_4 images_1_of_4 products-info">
                    <img src="${Products[i].imageUrl}">
                    <a href="Info?id=${Products[i].productId}">${Products[i].name}</a>
                    <h3>$${Products[i].price}</h3>
                    <ul>
                        <li><a  class="cart" href="single.html"> </a></li>
                        <li><a  class="i" href="single.html"> </a></li>
                        <li><a  class="Compar" href="single.html"> </a></li>
                        <li><a  class="Wishlist" href="single.html"> </a></li>
                    </ul>
                </div>
            </c:forEach> 
        </div>
        <div class="section group">
            <c:forEach var="dec" begin="${Products.size()-8}" end="${Products.size()-5}" step="1">
                <c:set var="i" value="${Products.size()-5-dec}"/>
                <div class="grid_1_of_4 images_1_of_4 products-info">
                    <img src="${Products[i].imageUrl}">
                    <a href="Info?id=${Products[i].productId}">${Products[i].name}</a>
                    <h3>$${Products[i].price}</h3>
                    <ul>
                        <li><a  class="cart" href="single.html"> </a></li>
                        <li><a  class="i" href="single.html"> </a></li>
                        <li><a  class="Compar" href="single.html"> </a></li>
                        <li><a  class="Wishlist" href="single.html"> </a></li>
                    </ul>
                </div>
            </c:forEach> 
        </div>
    </div>
</div>

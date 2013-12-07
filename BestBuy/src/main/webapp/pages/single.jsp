<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/jqzoom.css" type="text/css">
<link rel="stylesheet" href="css/jquery.rating.css" type="text/css">
<script src="js/jquery.rating.pack.js" type="text/javascript"></script>
<script src="js/jqzoom.pack.1.0.1.js" type="text/javascript"></script>
<script type="text/javascript" src="js/single.js"></script>
<div class="content">
    <div class="content-grids">
        <div class="details-page">
            <div class="back-links">
                <ul>
                    <li><a href="#">Home</a><img src="images/arrow.png" alt=""></li>
                    <li><a href="#">${product.category.name} TV</a><img src="images/arrow.png" alt=""></li>
                    <li><a href="#">Product Info</a><img src="images/arrow.png" alt=""></li>
                </ul>
            </div>
        </div>
        <div class="detalis-image">
            <div id="content"> <a href="${product.imageUrl}" class="jqzoom" style="" title="Product-Name"> <img src="images/m1.jpg"  title="Product-Name" style="border: 1px solid #e5e5e5;"> </a>
            </div>
        </div>
        <div class="detalis-image-details">
            <div class="brand-value">
                <h3>${product.name}</h3>
                <div class="left-value-details">
                    <ul>
                        <li>Price:</li>
                        <li><h5>$${product.price}</h5></li>
                        <br />
                        <li>
                            <p><label style="float: left">Rating:</label>
                            <c:forEach var="i" begin="1" end="10">
                                <c:choose>
                                    <c:when test="${product.rating*2==i}">
                                        <input name="adv1" type="radio" class="star {split:2}" disabled="disabled" checked="checked"/> 
                                    </c:when>
                                    <c:otherwise>
                                        <input name="adv1" type="radio" class="star {split:2}" disabled="disabled"/> 
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            </p>
                            
                        </li>
                    </ul>
                </div>
                <div class="right-value-details">
                    <a href="#">Instock</a>
                    <p>No reviews</p>
                </div>
                <div class="clear"> </div>
            </div>
            <div class="brand-history">
                <h3>Description :</h3>
                <p>${product.description}</p>
                <a href="Redirect?add=${product.productId}">Addcart</a>
            </div>
            <div class="share">
                <ul>
                    <li> <a href="#"><img src="images/facebook.png" title="facebook" /> FaceBook</a></li>
                    <li> <a href="#"><img src="images/twitter.png" title="Twiiter" />Twiiter</a></li>
                    <li> <a href="#"><img src="images/rss.png" title="Rss" />Rss</a></li>
                </ul>
            </div>
            <div class="clear"> </div>

        </div>
        <div class="clear"> </div>
        <div class="menu_container">
            <p class="menu_head">Overview<span class="plusminus">+</span></p>
            <div class="menu_body" style="display: none;">
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            </div>
            <p class="menu_head">Specifications<span class="plusminus">+</span></p>
            <div class="menu_body" style="display: none;">
                <table border="0" style="width: 100%">
                    <tr class='firstrow'>
                        <td style="width: 30%">Specs:</td>
                        <td style="width: 100%">Details:</td>
                    </tr>
                    <tr class="color">
                        <td>Warranty Term</td>
                        <td>${product.warranty} months</td>
                    </tr>
                    <tr>
                        <td>Screen Size</td>
                        <td>${product.screen} inch</td>
                    </tr>
                    <tr class="color">
                        <td>TV Type</td>
                        <td>${product.category.name}</td>
                    </tr>
                    <tr>
                        <td>Brand</td>
                        <td>${product.brand.name}</td>
                    </tr>
                </table>
            </div>
            <p class="menu_head">Ratings<span class="plusminus">+</span></p>
            <div class="menu_body" style="display: none;">
                <p>
                    <label style="float: left">Rate this:</label> 
                    <input value="0.5" type="radio" class="auto-submit-star required {split:2}"/> 
                    <input value="1" type="radio" class="auto-submit-star {split:2}"/> 
                    <input value="1.5" type="radio" class="auto-submit-star {split:2}"/> 
                    <input value="2" type="radio" class="auto-submit-star {split:2}"/>
                    <input value="2.5" type="radio" class="auto-submit-star {split:2}"/>
                    <input value="3" type="radio" class="auto-submit-star {split:2}"/>
                    <input value="3.5" type="radio" class="auto-submit-star {split:2}"/>
                    <input value="4" type="radio" class="auto-submit-star {split:2}"/>
                    <input value="4.5" type="radio" class="auto-submit-star {split:2}"/>
                    <input value="5" type="radio" class="auto-submit-star {split:2}"/>
                </p>
            </div>
            <p class="menu_head">Reviews<span class="plusminus">+</span></p>
            <div class="menu_body" style="display: none;">
                <c:choose>
                    <c:when test="${product.comments.size() == 0}">
                        <p>This product doesn't have any comment</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="comment" items="${product.comments}">
                            <p>${comment.account.username}</p>
                            <p>${comment.content}</p>
                        </c:forEach>                        
                    </c:otherwise>
                </c:choose>
                <c:if test="${User != null}">
                    <div class="col span_2_of_3">
                        <form class="contact-form" action="Info" method="post">
                            <input type="hidden" name="id" value="${product.productId}"/>
                            <textarea name="ta_content"></textarea>
                            <input type="submit" value="Send"/> 
                        </form>
                    </div>
                    <br class="clear" />

                </c:if>
                         
            </div>
            <p class="menu_head">Accessories<span class="plusminus">+</span></p>
            <div class="menu_body" style="display: none;">
                <c:choose>
                    <c:when test="${product.accessories.size() == 0}">
                        <p>This product doesn't have any accessories</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="accessory" items="${product.accessories}">
                            <p>${accessory.name}</p>
                            <p>${accessory.price}</p>
                            <p>${accessory.rating}</p>
                        </c:forEach>                        
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

</div>
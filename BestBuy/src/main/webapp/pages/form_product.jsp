<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="js/register.js"></script>
<input id="result" type="hidden" value="${result}"/>
<div class="content">
    <div class="col span_1_of_3">
        <div class="contact-form">
            <c:choose>
                <c:when test="${product == null}">
                    <h2>Add Product</h2>
                </c:when>
                <c:otherwise>
                    <h2>Edit Product</h2>
                </c:otherwise>
            </c:choose>
            <form id="f_register" method="post" action="ManageProduct">
                <div>
                    <span><label>PRODUCT NAME</label></span>
                    <span><input type="text" value='${product.name}' name="tb_Name"></span>
                </div>
                <div>
                    <span><label>DESCRIPTION</label></span>
                    <span><textarea type="text" value="" name="tb_Description">${product.description}</textarea></span>
                </div>
                <div>
                    <span><label>PRICE(DOLLAR)</label></span>
                    <span><input type="text" value="${product.price}" name="tb_Price"></span>
                </div>
                <c:if test="${product.tag == null}">
                    <div>
                        <span><label>SCREEN SIZE</label></span>
                        <span><input type="text" value="${product.screen}" name="tb_Phone"></span>
                    </div>
                </c:if>
                <div>
                    <span><label>WARRANTY</label></span>
                    <span><input type="text" value="${product.warranty}" name="tb_Warranty"></span>
                </div>
                <div>
                    <span>
                        <c:choose>
                            <c:when test="${product == null}">
                                <input type="submit" value="ADD" name="add_product">
                            </c:when>
                            <c:otherwise>
                               <input type="submit" value="EDIT" name="edit_product">
                            </c:otherwise>
                        </c:choose>
                        <input type="submit" value="CANCEL" name="cancel">
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<link href="css/style1.css" rel="stylesheet" />
<link href="css/store.css" rel="stylesheet" />
<script type="text/javascript" >
    function goto(link){
        location.href = link;
    }
</script>
<div class="content">
    <div class="content-grids">
        <h4>Nguyen Kim shop</h4>
        <div align="left">
            <div id="wrap" align="center">
                <ul>
                    <c:forEach var="i" begin="0" end="16" step="4" varStatus="status">
                        <c:if test="${status.index<products.size()}">
                            <c:forEach var="product" items="${products}" begin="${i}" end="${i+3}" varStatus="status" >
                                <li onclick="goto('${links[status.index]}')">
                                    <img src="${product.imageUrl}" class="items" alt="" />

                                    <br clear="all" />
                                    <div>${product.name}</div>
                                    <div>${product.description}</div>
                                    <br clear="all" />
                                </li> 
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>
</div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="<s:url value="/js/jquery-ui.js"/>"></script>
<script type="text/javascript" src="js/saleoff.js"></script>
<input id="result" type="hidden" value="${result}"/>
<div class="content">
    <div class="col span_1_of_3">
        <div class="contact-form">
            <c:choose>
                <c:when test="${sale == null}">
                    <h2>Create Event</h2>
                </c:when>
                <c:otherwise>
                    <h2>Edit Event</h2>
                </c:otherwise>
            </c:choose>
            <form id="f_sale" method="post" action="ManageSale">
                <div>
                    <span><label>EVENT NAME</label></span>
                    <span><input type="text" value='${sale.name}' name="tb_Name"></span>
                </div>
                <div>
                    <span><label>DESCRIPTION</label></span>
                    <span><textarea type="text" value="" name="tb_Description">${sale.description}</textarea></span>
                </div>
                <div>
                    <span><label>SALE-OFF (PERCENT)</label></span>
                    <span><input type="text" value="${sale.percent}" name="tb_Percent"></span>
                </div>
                <div>
                    <span><label>FROM DATE</label></span>
                    <span><input type="text" readonly="true" value="<fmt:formatDate value="${sale.from}" pattern="dd/MM/yyyy"/>" name="tb_From" id="fromdate"></span>
                </div>
                <div>
                    <span><label>TO DATE</label></span>
                    <span><input type="text" readonly="true" value="<fmt:formatDate value="${sale.to}" pattern="dd/MM/yyyy"/>" name="tb_To" id="todate"></span>
                </div>
                <div>
                    <span>
                        <c:choose>
                            <c:when test="${sale == null}">
                                <input type="submit" value="CREATE" name="create_event">
                            </c:when>
                            <c:otherwise>
                               <input type="submit" value="EDIT" name="edit_event">
                            </c:otherwise>
                        </c:choose>
                        <input type="button" onclick="location.href='ManageSale'" value="CANCEL" name="cancel">
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>
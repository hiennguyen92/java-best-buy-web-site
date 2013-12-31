<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
    <c:when test="${uploadFileName.substring(0,4).equals('http')}">
        <img id="imgUpload" height="200" width="200" src="${uploadFileName}" />
    </c:when>
    <c:otherwise>
        <img id="imgUpload" height="200" width="200" src="${pageContext.request.contextPath}/${uploadFileName}" />
    </c:otherwise>
</c:choose>
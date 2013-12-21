<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<input id="result" type="hidden" value="${result}"/>
<div class="content">
    <div class="span_2_of_3">
        <h2>${account.username} Profile</h2>
    </div>
    <div class="col span_1_of_3">
        <div class="contact-form">
            <div>
                <span><label>REAL NAME</label></span>
                <span>${account.realName}</span>
            </div>
            <div>
                <span><label>PHONE NUMBER</label></span>
                <span>${account.phone}</span>
            </div>
            <div>
                <span><label>ADDRESS</label></span>
                <span>${account.address}</span>
            </div>
        </div>
    </div>
    <div class="col span_1_of_3">
        <div class="contact-form">
            <span><label>AVATAR</label></span>
            <div id="uploaded_image">
                <img id="imgUpload" height="150" width="150" src="${account.avatar}" />
            </div>
        </div>
    </div>
</div>
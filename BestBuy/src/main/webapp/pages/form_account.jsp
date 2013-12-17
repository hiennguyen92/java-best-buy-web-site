<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<script type="text/javascript" src="js/register.js"></script>
<input id="result" type="hidden" value="${result}"/>
<div class="content">
        <div class="span_2_of_3">
            <c:choose>
                <c:when test="${account == null}">
                    <h2>Add Account</h2>
                </c:when>
                <c:otherwise>
                    <h2>Edit Account</h2>
                </c:otherwise>
            </c:choose>
        </div>
    <div class="col span_1_of_3">
        <div class="contact-form">
            <form id="f_register" method="post" action="ManageAccount">
                <div>
                    <span><label>USERNAME</label></span>
                    <span><input type="text" value="${account.username}" name="tb_Username"></span>
                </div>
                <div>
                    <span><label>PASSWORD</label></span>
                    <span><input type="password" value="${account.password}" name="tb_Password"></span>
                </div>
                <div>
                    <span><label>REAL NAME</label></span>
                    <span><input type="text" value="${account.realName}" name="tb_RealName"></span>
                </div>
                <div>
                    <span><label>PHONE NUMBER</label></span>
                    <span><input type="text" value="${account.phone}" name="tb_Phone"></span>
                </div>
                <div>
                    <span><label>ADDRESS</label></span>
                    <span><textarea type="text" value="" name="tb_Address">${account.address}</textarea></span>
                </div>
                <div>
                    <span><label>ROLES</label>
                        <input type="checkbox" name="cb_admin" value="ROLE_ADMIN">Admin
                        <input type="checkbox" name="cb_user" value="ROLE_USER" checked="true">User
                    </span>
                </div>
                <div>
                    <span>
                        <label>STATUS</label>
                        <c:choose>
                            <c:when test="${account.enable == 0}">
                                <input type="radio" name="r_status" value="1">Enable
                                <input type="radio" name="r_status" value="0" checked="true">Disable
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="r_status" value="1" checked="true">Enable
                                <input type="radio" name="r_status" value="0">Disable
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div>
                    <span>
                        <c:choose>
                            <c:when test="${account == null}">
                                <input type="submit" value="ADD" name="add_account">
                            </c:when>
                            <c:otherwise>
                               <input type="submit" value="EDIT" name="edit_account">
                            </c:otherwise>
                        </c:choose>
                               <input type="button" onclick="location.href='ManageAccount'" value="CANCEL" name="cancel">
                    </span>
                </div>
            </form>
        </div>
    </div>
                <div class="col span_1_of_3">
                    <div class="contact-form">
                        <span><label>AVATAR</label></span>
                        <div id="uploaded_image"><img src="<s:property value='uploadFileName'/>" /></div>
                        <s:form id="upload_image" action="UploadImage" namespace="/" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="h_id" value="${account.username}"/>
                            <s:file name="upload" accept="image/png,image/gif,image/jpeg"/>

                            <sj:submit value="Submit" targets="uploaded_image"/>
                        </s:form>
                    </div>
                </div>
</div>
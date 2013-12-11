<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">
    <div class="col span_1_of_3">
        <div class="contact-form">
            <h2>Login</h2>

            <form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
                <div>
                    <span><label>USERNAME</label></span>
                    <span><input type='text' name='j_username' value=''></span>
                </div>
                <div>
                    <span><label>PASSWORD</label></span>
                    <span><input type='password' name='j_password' /></span>
                </div>
                <div>
                    <span><input type="submit" value="LOGIN"></span>
                </div>
            </form>
        </div>
    </div>
</div>
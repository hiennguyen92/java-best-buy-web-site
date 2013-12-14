<script type="text/javascript" src="js/login.js"></script>
<input id="result" type="hidden" value="${result}"/>
<div class="content">
    <div class="col span_1_of_3">
        <div class="contact-form">
            <h2>Login</h2>
            <form id="f_login" name="f" action="j_spring_security_check" method="post">
                <div>
                    <span><label>USERNAME</label></span>
                    <span><input type="text" value="" name="j_username"></span>
                </div>
                <div>
                    <span><label>PASSWORD</label></span>
                    <span><input type="password" value="" name="j_password"></span>
                </div>
                <div>
                    <span><input type="submit" name="submit" value="LOGIN"></span>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/register.js"></script>
<input id="result" type="hidden" value="${result}"/>
<div class="content">
    <div class="col span_1_of_3">
        <div class="contact-form">
            <h2>Register</h2>
            <form id="f_register" method="post" action="Register">
                <div>
                    <span><label>USERNAME</label></span>
                    <span><input type="text" value="" name="tb_Username"></span>
                </div>
                <div>
                    <span><label>PASSWORD</label></span>
                    <span><input type="password" value="" name="tb_Password"></span>
                </div>
                <div>
                    <span><label>RE-ENTER THE PASSWORD</label></span>
                    <span><input type="password" value="" name="tb_RePassword"></span>
                </div>
                <div>
                    <span><label>YOUR NAME</label></span>
                    <span><input type="text" value="" name="tb_RealName"></span>
                </div>
                <div>
                    <span><label>PHONE NUMBER</label></span>
                    <span><input type="text" value="" name="tb_Phone"></span>
                </div>
                <div>
                    <span><label>ADDRESS</label></span>
                    <span><textarea type="text" value="" name="tb_Address"></textarea></span>
                </div>
                <div>
                    <span><input type="submit" value="REGISTER"></span>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/login.js"></script>
<input id="result" type="hidden" value="${result}"/>
<div id="fb-root"></div>
<script>
    var m_response;

    window.fbAsyncInit = function() {
        FB.init({
            appId: '185367794993208',
            status: true, // check login status
            cookie: true, // enable cookies to allow the server to access the session
            xfbml: true  // parse XFBML
        });

        FB.Event.subscribe('auth.authResponseChange', function(response) {
            m_response = response;
        });
    };

    (function(d) {
        var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement('script');
        js.id = id;
        js.async = true;
        js.src = "//connect.facebook.net/en_US/all.js";
        ref.parentNode.insertBefore(js, ref);
    }(document));
</script>
<script>
    function checklogin()
    {
        if (m_response.status === 'connected') {
            login();
        } else if (m_response.status === 'not_authorized') {
            FB.login();
        } else {
            FB.login();
        }
    }

    function login() {
        document.location = "LogInWithFacebook?AccessTokenKey=" + FB.getAuthResponse()['accessToken'];
    }
</script>
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
            <div >
                <span>
                    <a href="javascript:;" onclick="checklogin()"><label>Login With Facebook Account</label></a>
                </span>
            </div>
        </div>
    </div>
</div>

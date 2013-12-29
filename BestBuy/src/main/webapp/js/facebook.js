$(document).ready(function() {
    window.fbAsyncInit = function() {
        FB.init({
            appId: '587810757944026',
            status: true, // check login status
            cookie: true, // enable cookies to allow the server to access the session
            xfbml: true  // parse XFBML
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


});
function checklogin()
{
    FB.getLoginStatus(function(response) {
        if (response.status === 'connected') {
            login(response.authResponse.accessToken);
        }
        else if (response.status === 'not_authorized') {
            FB.login(function(response) {
                if (response.authResponse) {
                    login(response.authResponse.accessToken);
                } else {
                    window.alert('User cancelled login or did not fully authorize.');
                }
            });
        } else {
            FB.login(function(response) {
                if (response.authResponse) {
                    login(response.authResponse.accessToken);
                } else {
                    window.alert('User cancelled login or did not fully authorize.');
                }
            });
        }
    });
}

function login(token) {
    document.location = "LogInWithFacebook?AccessTokenKey=" + token;
}
function shareLink(url) {
    var image = $(".detalis-image img").attr("src");
    FB.ui({
        method: 'feed',
        link: url,
        picture: image,
        caption: 'Bestbuy product',
    }, function(response) {
        if (response && response.post_id) {
            alert('Post was published.');
        } else {
            alert('Post was not published.');
        }
    });
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oauth;

import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.oauth.provider.ConsumerDetails;
import org.springframework.security.oauth.provider.ConsumerDetailsService;
import org.springframework.security.oauth.provider.token.OAuthProviderToken;
import org.springframework.security.oauth.provider.token.OAuthProviderTokenServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HOANG
 */
@Controller
public class AccessConfirm {

    private OAuthProviderTokenServices tokenServices;
    private ConsumerDetailsService consumerDetailsService;

    public OAuthProviderTokenServices getTokenServices() {
        return tokenServices;
    }

    public void setTokenServices(OAuthProviderTokenServices tokenServices) {
        this.tokenServices = tokenServices;
    }

    public ConsumerDetailsService getConsumerDetailsService() {
        return consumerDetailsService;
    }

    public void setConsumerDetailsService(ConsumerDetailsService consumerDetailsService) {
        this.consumerDetailsService = consumerDetailsService;
    }

    @RequestMapping(value="/oauth/confirm_access", method = RequestMethod.GET)
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
        String token = request.getParameter("oauth_token");
        if (token == null) {
            throw new IllegalArgumentException("A request token to authorize must be provided.");
        }

        OAuthProviderToken providerToken = getTokenServices().getToken(token);
        ConsumerDetails consumer = getConsumerDetailsService().loadConsumerByConsumerKey(providerToken.getConsumerKey());

        String callback = request.getParameter("oauth_callback");
        TreeMap<String, Object> model = new TreeMap<String, Object>();
        model.put("oauth_token", token);
        if (callback != null) {
            model.put("oauth_callback", callback);
        }
        model.put("consumer", consumer);
        return new ModelAndView("access_confirmation", model);
    }
}

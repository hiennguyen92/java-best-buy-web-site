/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring;

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

    @RequestMapping("/oauth/confirm_access")
    public ModelAndView getAccessConfirmation(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String token = request.getParameter("oauth_token");
        if (token == null) {
            throw new IllegalArgumentException("A request token to authorize must be provided.");
        }

        OAuthProviderToken providerToken = tokenServices.getToken(token);
        ConsumerDetails consumer = consumerDetailsService
                .loadConsumerByConsumerKey(providerToken.getConsumerKey());

        String callback = request.getParameter("oauth_callback");
        TreeMap<String, Object> model = new TreeMap<String, Object>();
        model.put("oauth_token", token);
        if (callback != null) {
            model.put("oauth_callback", callback);
        }
        model.put("consumer", consumer);
        return new ModelAndView("access_confirmation", model);
    }
    
    @RequestMapping("/oauth/request_token_authorized")
    public ModelAndView authorized(HttpServletRequest request, HttpServletResponse response){
        return new ModelAndView("request_token_authorized");
    }

    public void setTokenServices(OAuthProviderTokenServices tokenServices) {
        this.tokenServices = tokenServices;
    }

    public void setConsumerDetailsService(ConsumerDetailsService consumerDetailsService) {
        this.consumerDetailsService = consumerDetailsService;
    }
}

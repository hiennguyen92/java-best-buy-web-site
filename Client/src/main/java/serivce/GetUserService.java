/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serivce;

import java.util.HashMap;
import java.util.Map;
import model.AccountService;
import org.springframework.security.oauth.consumer.client.OAuthRestTemplate;

/**
 *
 * @author HOANG
 */
public class GetUserService {

    private String bestBuyUrl;
    private OAuthRestTemplate template;

    public String getBestBuyUrl() {
        return bestBuyUrl;
    }

    public void setBestBuyUrl(String bestBuyUrl) {
        this.bestBuyUrl = bestBuyUrl;
    }

    public OAuthRestTemplate getTemplate() {
        return template;
    }

    public void setTemplate(OAuthRestTemplate template) {
        this.template = template;
    }
    
    public AccountService get(String name){
        Map<String, String> vars = new HashMap<String, String>();
        vars.put("name", name);
        return getTemplate().getForObject(getBestBuyUrl(), AccountService.class, vars);
    }
}

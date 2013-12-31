/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HOANG
 */
@Controller
public class Index {
    
    @RequestMapping(value = "/GetInfo", method = RequestMethod.POST)
    public ModelAndView getUserInfo(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("tb_Name");
        Map<String, String> vars = new HashMap<String, String>();
        vars.put("name", name);
        RestTemplate template = new RestTemplate();
        AccountService account = (AccountService) template.getForObject("http://localhost:39653/BestBuy/Service/user/{name}", AccountService.class, vars);
        request.setAttribute("name", name);
        request.setAttribute("user", account);
        return new ModelAndView("user_info");
    }
}

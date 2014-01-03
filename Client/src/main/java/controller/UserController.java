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
import serivce.GetUserService;

/**
 *
 * @author HOANG
 */
@Controller
public class UserController {
    private GetUserService service;

    public void setService(GetUserService service) {
        this.service = service;
    }
    
    @RequestMapping({"/","/index"})
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response){
        return new ModelAndView("index");
    }
    
    @RequestMapping("/GetInfo")
    public ModelAndView getUserInfo(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        AccountService account = service.get(name);
        request.setAttribute("name", name);
        request.setAttribute("user", account);
        return new ModelAndView("user_info");
    }
}

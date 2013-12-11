/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.CartDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;

/**
 *
 * @author HOANG
 */
public class OrderHistory implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("User");
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
        request.setAttribute("oders", cartDAO.getList(currentUser.getUsername()));
        return "success";
    }
    
}

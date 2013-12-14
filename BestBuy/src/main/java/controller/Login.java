/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import pojo.Account;
import pojo.Cart;

/**
 *
 * @author HOANG
 */
public class Login implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        String result = "";
        HttpSession session = request.getSession();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof User) {
            String userName = ((User)principal).getUsername();
            AccountDAO accountDAO = (AccountDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("accountDAO");
            Account account = accountDAO.get(userName);
                Cart cart = new Cart();
                cart.setAccount(account);
                session.setAttribute("Cart", cart);
                session.setAttribute("User", account);
                return "success";
        }
        return "error";
    }
}

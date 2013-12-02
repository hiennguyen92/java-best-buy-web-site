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
        String userName = request.getParameter("tb_Username");
        String password = request.getParameter("tb_Password");
        if (userName != null && password != null) {
            AccountDAO accountDAO = (AccountDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("accountDAO");
            Account account = accountDAO.get(userName);
            if (account != null && account.getPassword().equals(password)) {
                session.setAttribute("User", account);
                Cart _cart = new Cart();
                session.setAttribute("Cart", _cart);
                return "success";
            } else {
                result = "Login failed! Wrong username or password";
            }
        }
        request.setAttribute("Result", result);
        return "error";
    }
}

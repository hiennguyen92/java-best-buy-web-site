/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.AccountDAO;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Hibernate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;

/**
 *
 * @author HOANG
 */
public class GetUserInfo implements ServletRequestAware {

    private HttpServletRequest request;
    private Account account;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String execute() {
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");  
        account = accountDAO.get(request.getParameter("name"));
        account.setCarts(null);
        account.setWishList(null);
        account.setRoles(null);
        account.setComments(null);
        return "success";
    }
    
}

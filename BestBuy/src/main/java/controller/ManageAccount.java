/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.AccountDAO;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;

/**
 *
 * @author HOANG
 */
public class ManageAccount implements ServletRequestAware {

    private HttpServletRequest request;
    private String username;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String execute() {
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");        
        if(request.getParameter("add") != null)
            return "action";
        if(request.getParameter("edit.x") != null){
            username = request.getParameter("h_username");
            return "action";
        }
        if (request.getParameter("remove.x") != null) {
            String username = request.getParameter("h_username");
            Account account = accountDAO.get(username);
            accountDAO.delete(account);
        }
        request.setAttribute("accounts", accountDAO.getList());
        request.setAttribute("accountDAO", accountDAO);
        return "success";
    }
    
}

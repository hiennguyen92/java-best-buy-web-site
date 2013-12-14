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

/**
 *
 * @author HOANG
 */
public class ManageAccount implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");
        request.setAttribute("accounts", accountDAO.getList());
        return "success";
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.RoleDAO;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;
import pojo.UserRole;

/**
 *
 * @author HOANG
 */
public class Register implements ServletRequestAware {
    HttpServletRequest request;
    
    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }
    
    public String execute() {
        String result = "";
        String userName = request.getParameter("tb_Username");
        String password = request.getParameter("tb_Password");
        if (userName != null && password != null) {
            Account account = null;
            String realName = request.getParameter("tb_RealName");
            String phone = request.getParameter("tb_Phone");
            String address = request.getParameter("tb_Address");
            String avatar = "images/avatar.jpg";
            account = new Account(userName, password, realName, phone, address, avatar, 1);
            AccountDAO accountDAO = (AccountDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("accountDAO");
            if (accountDAO.add(account)) {
                UserRole role = new UserRole(account, "ROLE_USER");
                RoleDAO roleDAO = (RoleDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("roleDAO");
                roleDAO.add(role);
                result = "Registration successful";
                return "success";
            } else {
                result = "Register failed! Your username is existed";
            }
        }
        request.setAttribute("result", result);
        return "error";
    }

}

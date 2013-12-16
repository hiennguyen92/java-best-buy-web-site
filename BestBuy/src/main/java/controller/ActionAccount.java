/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.AccountDAO;
import dao.RoleDAO;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;
import pojo.UserRole;

/**
 *
 * @author HOANG
 */
public class ActionAccount implements ServletRequestAware {

    private HttpServletRequest request;
    private String uploadFileName;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String execute() {
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO"); 
        if(request.getParameter("add_account") != null || request.getParameter("edit_account") != null){
            String userName = request.getParameter("tb_Username");
            String password = request.getParameter("tb_Password");
            String realName = request.getParameter("tb_RealName");
            String phone = request.getParameter("tb_Phone");
            String address = request.getParameter("tb_Address");
            String status = request.getParameter("r_status");
            Account account = new Account(userName, password, realName, phone, address, Integer.parseInt(status));
            if(request.getParameter("add_account") != null){
                if (accountDAO.add(account)){
                    AddRoles(context, account);
                    return "success";
                }
            }
            else{
                account.getRoles().clear();
                if(accountDAO.update(account)){
                    AddRoles(context, account);
                    return "success";
                }
            }
        }
        String username = request.getParameter("User");
        if(!username.equals(""))
             uploadFileName = "images/avatar.jpg";
        request.setAttribute("account", accountDAO.get(username));
        return "error";
    }

    private void AddRoles(ApplicationContext context, Account account) throws BeansException {
        RoleDAO roleDAO = (RoleDAO) context.getBean("roleDAO");
        String roleAdmin = request.getParameter("cb_admin");
        String roleUser = request.getParameter("cb_user");
        UserRole role;
        if(roleAdmin != null){
            role = new UserRole(account, roleAdmin);
            roleDAO.add(role);
        }
        if(roleUser != null){
            role = new UserRole(account, roleUser);
            roleDAO.add(role);
        }
    }
    
}

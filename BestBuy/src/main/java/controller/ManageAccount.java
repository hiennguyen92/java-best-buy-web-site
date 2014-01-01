/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.AccountDAO;
import dao.RoleDAO;
import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
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
public class ManageAccount implements ServletRequestAware {

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

    public String execute() throws IOException {
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");  
        RoleDAO roleDAO = (RoleDAO) context.getBean("roleDAO");
        uploadFileName = "images/avatar.jpg";
        if(request.getParameter("add_account") != null || request.getParameter("edit_account") != null){
            String userName = request.getParameter("tb_Username");
            String password = request.getParameter("tb_Password");
            String realName = request.getParameter("tb_RealName");
            String phone = request.getParameter("tb_Phone");
            String address = request.getParameter("tb_Address");
            String status = request.getParameter("r_status");
            String url = request.getParameter("h_url");
            url = url.substring(url.lastIndexOf("images"));
            if(!url.equals("images/avatar.jpg")){
                String extention = url.substring(url.indexOf('.'));
                File src = new File(request.getSession().getServletContext().getRealPath("/") + "images\\temp" + extention);
                File dest = new File(request.getSession().getServletContext().getRealPath("/") + "images\\avatar_" + userName + extention);
                FileUtils.copyFile(src, dest);
                url = "images/avatar_" + userName + extention;
            }
            Account account = new Account(userName, password, realName, phone, address, url, Integer.parseInt(status));
            if(request.getParameter("add_account") != null){
                if (accountDAO.add(account))
                    AddRoles(context, account);
            }
            else{
                if(accountDAO.update(account))
                    AddRoles(context, account);
            }
        }
        if(request.getParameter("add") != null)
            return "action";
        if(request.getParameter("edit.x") != null){
            String username = request.getParameter("h_username");
            Account account = accountDAO.get(username);
            request.setAttribute("account", account);
            uploadFileName = account.getAvatar();
            return "action";
        }
        if (request.getParameter("remove.x") != null) {
            String username = request.getParameter("h_username");
            Account account = accountDAO.get(username);
            accountDAO.delete(account);
        }
        request.setAttribute("accounts", accountDAO.getList());
        request.setAttribute("roleDAO", roleDAO);
        return "success";
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

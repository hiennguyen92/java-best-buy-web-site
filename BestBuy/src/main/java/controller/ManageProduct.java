/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.ProductDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Product;

/**
 *
 * @author HOANG
 */
public class ManageProduct implements ServletRequestAware {

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
        HttpSession session = request.getSession();
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        if(request.getParameter("add") != null)
            return "action";
        if(request.getParameter("edit.x") != null){
            int id = Integer.parseInt(request.getParameter("h_id"));
            Product product = productDAO.get(id);
            uploadFileName = product.getImageUrl();
            request.setAttribute("product", product);
            return "action";
        }
        if (request.getParameter("remove.x") != null) {
            int id = Integer.parseInt(request.getParameter("h_id"));
            Product product = productDAO.get(id);
            productDAO.delete(product);
        }
        session.setAttribute("Products", productDAO.getList());
        request.setAttribute("productDAO", productDAO);
        return "success";
    }
    
}

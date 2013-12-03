/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author HOANG
 */
public class Home implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        HttpSession session = request.getSession();
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        BrandDAO brandDAO = (BrandDAO) context.getBean("brandDAO");
        CategoryDAO categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        session.setAttribute("Brands", brandDAO.getList());
        session.setAttribute("Categories", categoryDAO.getList());
        session.setAttribute("Products", productDAO.getList());
        return "success";
    }
}

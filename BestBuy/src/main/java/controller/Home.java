/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.AccountDAO;
import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import pojo.Account;
import pojo.Cart;
import pojo.Product;

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
        List<Product> products = productDAO.getList();
        for(int i = 0; i < products.size();){
            if(products.get(i).getProduct() != null)
                products.remove(products.get(i));
            else
                i++;
        }
        request.setAttribute("products", products);
        return "success";
    }
}

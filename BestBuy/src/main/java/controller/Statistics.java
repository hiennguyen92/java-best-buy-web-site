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
import dao.SaleOffDAO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;

/**
 *
 * @author HOANG
 */
public class Statistics implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        BrandDAO brandDAO = (BrandDAO) context.getBean("brandDAO");
        CategoryDAO categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
        SaleOffDAO saleOffDAO = (SaleOffDAO) context.getBean("saleOffDAO");
        List<Account> accounts = accountDAO.getList();
        int active = 0;
        int nonActive = 0;
        for(Account account : accounts){
            if(account.getEnable() == 1)
                active++;
            else
                nonActive++;
        }
        request.setAttribute("accounts", accounts);
        request.setAttribute("active", active);
        request.setAttribute("nonActive", nonActive);
        request.setAttribute("Products", productDAO.getList());
        request.setAttribute("Brands", brandDAO.getList());
        request.setAttribute("Categories", categoryDAO.getList());
        request.setAttribute("sale", saleOffDAO.getLast());
        return "success";
    }
    
}

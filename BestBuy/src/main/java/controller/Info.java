/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.ProductDAO;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author HOANG
 */
public class Info implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        ProductDAO productDAO = (ProductDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("productDAO");
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("product", productDAO.get(id));
        return "success";
    }
}

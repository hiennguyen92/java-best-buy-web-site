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
public class Compare implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        ProductDAO productDAO = (ProductDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("productDAO");
        
        String id1 = request.getParameter("id1");
        String id2 = request.getParameter("id2");
        String id3 = request.getParameter("id3");
        String id4 = request.getParameter("id4");
        String closeId = request.getParameter("close");
        
        request.setAttribute("product1", productDAO.get(Integer.parseInt(id1)));
        request.setAttribute("product2", productDAO.get(Integer.parseInt(id2)));
        if(id3 != null)
            request.setAttribute("product3", productDAO.get(Integer.parseInt(id3)));
        if(id4 != null)
            request.setAttribute("product4", productDAO.get(Integer.parseInt(id4)));
        
        if(closeId != null){
            
        }
        return "success";
    }
    
}

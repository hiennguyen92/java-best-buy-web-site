/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.CartDAO;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Cart;

/**
 *
 * @author HOANG
 */
public class ManageOrder implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute(){
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
        String id = request.getParameter("h_id");
        if(request.getParameter("check.x") != null){
            Cart cart = cartDAO.get(Integer.valueOf(id));
            cart.setChecked(true);
            cartDAO.update(cart);
        }
        if(request.getParameter("edit.x") != null){
            request.setAttribute("order", cartDAO.get(Integer.valueOf(id)));
            return "action";
        }
        if (request.getParameter("remove.x") != null) {
            cartDAO.delete(cartDAO.get(Integer.valueOf(id)));
        }
        request.setAttribute("orders", cartDAO.getList());
        return "success";
    }
    
}

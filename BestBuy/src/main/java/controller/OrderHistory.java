/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.CartDAO;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;
import pojo.Cart;

/**
 *
 * @author HOANG
 */
public class OrderHistory implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("User");
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
        List<Cart> orders = cartDAO.getList(currentUser.getUsername());
        int sort = 1;
        if(request.getParameter("sort") != null){
            sort = Integer.parseInt(request.getParameter("sort"));
            if(sort == 2)
                Collections.sort(orders, new Comparator<Cart>() {

                public int compare(Cart o1, Cart o2) {
                    return o1.getDate().compareTo(o2.getDate());
                }
            });
            else if(sort == 3)
                Collections.sort(orders, new Comparator<Cart>() {

                public int compare(Cart o1, Cart o2) {
                    return o2.getTotalPrice().compareTo(o2.getTotalPrice());
                }
            });
            else if(sort == 4)
                Collections.sort(orders, new Comparator<Cart>() {

                public int compare(Cart o1, Cart o2) {
                    return o1.getTotalPrice().compareTo(o2.getTotalPrice());
                }
            });
        }
        request.setAttribute("orders", orders);
        if(request.getParameter("sort") != null)
            return "ajax_orders";
        return "success";
    }
    
}

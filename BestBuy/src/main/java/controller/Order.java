/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.AccountDAO;
import dao.CartDAO;
import dao.CartDetailDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;
import pojo.Cart;
import pojo.CartDetail;
import pojo.Product;

/**
 *
 * @author HOANG
 */
public class Order implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        HttpSession session = request.getSession();
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        Cart cart = (Cart) session.getAttribute("Cart");
        Account currentUser = (Account) session.getAttribute("User");
        
        if(request.getParameter("purchase") != null){
            AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");
            currentUser.setRealName(request.getParameter("tb_RealName"));
            currentUser.setPhone(request.getParameter("tb_Phone"));
            currentUser.setAddress(request.getParameter("tb_Address"));
            accountDAO.update(currentUser);
            
            CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
            cartDAO.add(cart);
            CartDetailDAO cartDetailDAO = (CartDetailDAO) context.getBean("cartDetailDAO");
            Cart lastCart = cartDAO.getLast();
            CartDetail cd = null;
            for (Product item : cart.getProducts()) {
                int cartID = lastCart.getCartId();
                int itemID = item.getProductId();
                cd = cartDetailDAO.get(cartID, itemID);
                cd.setQuantity(item.getQuantity());
                cartDetailDAO.update(cd);
            }
            cart.getProducts().clear();
            cart.setTotalPrice(0.0);
            return "complete";
        }
        return "success";
    }
    
}

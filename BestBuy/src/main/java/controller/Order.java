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
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");
        CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
        CartDetailDAO cartDetailDAO = (CartDetailDAO) context.getBean("cartDetailDAO");
        Account currentUser = (Account) session.getAttribute("User");
        
        if(request.getParameter("wish") != null){
            request.setAttribute("wish", true);
        }
        
        if(request.getParameter("purchase") != null){
            Cart cart = (Cart) session.getAttribute("Cart");
            currentUser.setRealName(request.getParameter("tb_RealName"));
            currentUser.setPhone(request.getParameter("tb_Phone"));
            currentUser.setAddress(request.getParameter("tb_Address"));
            accountDAO.update(currentUser);
            
            cart.setChecked(false);
            cartDAO.add(cart);
            Cart lastCart = cartDAO.getLast();
            CartDetail cd = null;
            for (Product item : cart.getProducts()) {
                int cartID = lastCart.getCartId();
                int itemID = item.getProductId();
                cd = cartDetailDAO.get(cartID, itemID);
                cd.setQuantity(item.getQuantity());
                cartDetailDAO.update(cd);
            }
            session.setAttribute("Cart", new Cart(currentUser, 0.0, null));
            return "complete";
        }
        
        if(request.getParameter("purchase_wish") != null){
            currentUser.setRealName(request.getParameter("tb_RealName"));
            currentUser.setPhone(request.getParameter("tb_Phone"));
            currentUser.setAddress(request.getParameter("tb_Address"));
            accountDAO.update(currentUser);
            
            Cart wishList = currentUser.getWishList();
            Cart cart = new Cart();
            cart.setAccount(currentUser);
            cart.setTotalPrice(wishList.getTotalPrice());
            cart.getProducts().addAll(wishList.getProducts());
            cart.setChecked(false);
            cartDAO.add(cart);
            Cart lastCart = cartDAO.getLast();
            CartDetail cd = null;
            CartDetail _cd = null;
            for (Product item : cart.getProducts()) {
                int cartID = lastCart.getCartId();
                int itemID = item.getProductId();
                cd = cartDetailDAO.get(cartID, itemID);
                _cd = cartDetailDAO.get(wishList.getCartId(), itemID);
                cd.setQuantity(_cd.getQuantity());
                cartDetailDAO.update(cd);
            }
            wishList.getProducts().clear();
            wishList.setTotalPrice(0.0);
            cartDAO.update(wishList);
            session.setAttribute("Cart", new Cart(currentUser, 0.0, null));
            return "complete";
        }
        return "success";
    }
    
}

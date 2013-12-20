/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.CartDAO;
import dao.CartDetailDAO;
import dao.ProductDAO;
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
public class WishList implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        HttpSession session = request.getSession();
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        CartDetailDAO cartDetailDAO = (CartDetailDAO) context.getBean("cartDetailDAO");
        CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
        Account currentUser = (Account) session.getAttribute("User");
        Cart wishList = currentUser.getWishList();
        
        if (request.getParameter("remove.x") != null) {
            int id = Integer.parseInt(request.getParameter("h_id"));
            Product product = productDAO.get(id);
            CartDetail cd = cartDetailDAO.get(wishList.getCartId(), id);
            wishList.setTotalPrice(wishList.getTotalPrice() - cd.getQuantity() * product.getSalePrice());
            cartDAO.update(wishList);
            cartDetailDAO.delete(cd);
            for(Product _product : wishList.getProducts())
                if(_product.getProductId() == id){
                    wishList.getProducts().remove(_product);
                    break;
                }
        }
        if (request.getParameter("update.x") != null) {
            int quantity = Integer.parseInt(request.getParameter("h_quantity"));
            int id = Integer.parseInt(request.getParameter("h_id"));
            Product product = productDAO.get(id);
            CartDetail cd = cartDetailDAO.get(wishList.getCartId(), id);
            wishList.setTotalPrice(wishList.getTotalPrice() - cd.getQuantity() * product.getSalePrice());
            cd.setQuantity(quantity);
            wishList.setTotalPrice(wishList.getTotalPrice() + quantity * product.getSalePrice());
            cartDAO.update(wishList);
            cartDetailDAO.update(cd);
        }
        if(request.getParameter("checkout") != null){
            Cart cart = new Cart();
            cart.setAccount(currentUser);
            cart.setTotalPrice(wishList.getTotalPrice());
            cart.getProducts().addAll(wishList.getProducts());
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
        }
        return "success";
    }
    
}

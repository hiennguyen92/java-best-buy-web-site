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
import pojo.Cart;
import pojo.CartDetail;
import pojo.Product;

/**
 *
 * @author HOANG
 */
public class MyCart implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        HttpSession session = request.getSession();
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        Cart cart = (Cart) session.getAttribute("Cart");

        if (request.getParameter("remove.x") != null) {
            int id = Integer.parseInt(request.getParameter("h_id"));
            Product product = productDAO.get(id);
            for (Product _product : cart.getProducts()) {
                if (_product.getProductId() == product.getProductId()) {
                    cart.getProducts().remove(_product);
                    cart.setTotalPrice(cart.getTotalPrice() - _product.getPrice() * _product.getQuantity());
                }
            }
            session.setAttribute("Cart", cart);
        }
        if (request.getParameter("update.x") != null) {
            int quantity = Integer.parseInt(request.getParameter("h_quantity"));
            int id = Integer.parseInt(request.getParameter("h_id"));
            Product product = productDAO.get(id);
            for (Product _product : cart.getProducts()) {
                if (_product.getProductId() == product.getProductId()) {
                    cart.setTotalPrice(cart.getTotalPrice() - _product.getPrice() * _product.getQuantity());
                    _product.setQuantity(quantity);
                    cart.setTotalPrice(cart.getTotalPrice() + _product.getPrice() * quantity);
                }
            }
            session.setAttribute("Cart", cart);
        }
        
        if(request.getParameter("checkout") != null){
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
            cart.setTotalPrice(0);
        }
        return "success";
    }

}

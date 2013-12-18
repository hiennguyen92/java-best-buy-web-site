/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
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
public class Redirect implements ServletRequestAware {

    private HttpServletRequest request;
    private String previous;

    public void setServletRequest(HttpServletRequest arg0) {
        // TODO Auto-generated method stub
        request = arg0;
    }

    public String getPrevious() {
        return previous;
    }

    public void setPrevious(String previous) {
        this.previous = previous;
    }

    public String execute() {
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        String temp = request.getHeader("Referer");
        previous = temp.substring(temp.lastIndexOf('/') + 1);
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("User");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        if (request.getParameter("add") != null) {
            int id = Integer.parseInt(request.getParameter("add"));
            Product product = productDAO.get(id);
            product.setQuantity(1);
            boolean isExist = false;
            Cart cart = (Cart) session.getAttribute("Cart");
            for (Product _product : cart.getProducts()) {
                if (_product.getProductId() == product.getProductId()) {
                    isExist = true;
                    _product.setQuantity(_product.getQuantity() + 1);
                    break;
                }
            }
            if (!isExist) {
                cart.getProducts().add(product);
            }
            cart.setTotalPrice(cart.getTotalPrice() + product.getSalePrice());
            session.setAttribute("Cart", cart);
        }
        if (request.getParameter("add_wish") != null) {
            if(currentUser == null)
                return "error";
            int id = Integer.parseInt(request.getParameter("add_wish"));
            Product product = productDAO.get(id);
            product.setQuantity(1);
            boolean isExist = false;
            CartDetailDAO cartDetailDAO = (CartDetailDAO) context.getBean("cartDetailDAO");            
            Cart wishList = currentUser.getWishList();
            CartDetail cd = cartDetailDAO.get(wishList.getCartId(), product.getProductId());
            if(cd != null){
                cd.setQuantity(cd.getQuantity() + 1);
            }
            else {
                wishList.getProducts().add(product);
                cd = new CartDetail(wishList.getCartId(), product.getProductId(), 1);
            }
            wishList.setTotalPrice(wishList.getTotalPrice() + product.getSalePrice());
            CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
            cartDAO.update(wishList);
            cartDetailDAO.update(cd);
        }
        if (request.getParameter("remove") != null) {
            int id = Integer.parseInt(request.getParameter("remove"));
            Product product = productDAO.get(id);
            Cart cart = (Cart) session.getAttribute("Cart");
            for (Product _product : cart.getProducts()) {
                if (_product.getProductId() == product.getProductId()) {
                    cart.getProducts().remove(_product);
                    cart.setTotalPrice(cart.getTotalPrice() - _product.getSalePrice() * _product.getQuantity());
                    break;
                }
            }
            session.setAttribute("Cart", cart);
        }
        if (request.getParameter("compare") != null) {
            int id = Integer.parseInt(request.getParameter("compare"));
            Product product = productDAO.get(id);
            if (session.getAttribute("compare1") == null) {
                session.setAttribute("compare1", product);
            } else if (session.getAttribute("compare2") == null) {
                Product product1 = (Product) session.getAttribute("compare1");
                if(product.getProductId() != product1.getProductId())
                    session.setAttribute("compare2", product);
            } else if (session.getAttribute("compare3") == null) {
                Product product1 = (Product) session.getAttribute("compare1");
                Product product2 = (Product) session.getAttribute("compare2");
                if(product.getProductId() != product1.getProductId() &&
                        product.getProductId() != product2.getProductId())
                    session.setAttribute("compare3", product);
            } else if (session.getAttribute("compare4") == null) {
                Product product1 = (Product) session.getAttribute("compare1");
                Product product2 = (Product) session.getAttribute("compare2");
                Product product3 = (Product) session.getAttribute("compare3");
                if(product.getProductId() != product1.getProductId() &&
                        product.getProductId() != product2.getProductId() &&
                        product.getProductId() != product3.getProductId())
                    session.setAttribute("compare4", product);
            }
            return "ajax_compare";
        }
        if(request.getParameter("remove_compare") != null){
            int id = Integer.parseInt(request.getParameter("remove_compare"));
            session.setAttribute("compare"+id, session.getAttribute("compare"+(id+1)));
            
            if(id == 1){
                session.setAttribute("compare2", session.getAttribute("compare3"));
                session.setAttribute("compare3", session.getAttribute("compare4"));
            }
            else if(id == 2){
                session.setAttribute("compare3", session.getAttribute("compare4"));
            }
            session.removeAttribute("compare4");
            return "ajax_compare";
        }
        return "success";
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Cart;
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
        String temp =  request.getHeader("Referer");
        previous = temp.substring(temp.lastIndexOf('/') + 1);
        HttpSession session = request.getSession();
        if (request.getParameter("logout") != null) {
            session.removeAttribute("Cart");
            session.removeAttribute("User");
        }
        if(request.getParameter("add") != null){
            int id = Integer.parseInt(request.getParameter("add"));
            ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
            Product product = productDAO.get(id);
            product.setQuantity(1);
            boolean isExist = false;
            Cart cart = (Cart) session.getAttribute("Cart");
            for(Product _product : cart.getProducts()){
                if(_product.getProductId() == product.getProductId()){
                    isExist = true;
                    _product.setQuantity(_product.getQuantity()+1);
                    break;
                }
            }
            if(!isExist)
                cart.getProducts().add(product);            
            cart.setTotalPrice(cart.getTotalPrice() + product.getPrice());
            session.setAttribute("Cart", cart);
        }
        if(request.getParameter("remove") != null){
            int id = Integer.parseInt(request.getParameter("remove"));
            ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
            Product product = productDAO.get(id);
            Cart cart = (Cart) session.getAttribute("Cart");
            for(Product _product : cart.getProducts()){
                if(_product.getProductId() == product.getProductId()){
                    cart.getProducts().remove(_product);
                    cart.setTotalPrice(cart.getTotalPrice()-_product.getPrice()*_product.getQuantity());
                }
            }
            session.setAttribute("Cart", cart);
        }
        return "success";
    }

}

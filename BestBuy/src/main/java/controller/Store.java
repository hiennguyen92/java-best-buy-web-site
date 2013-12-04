/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import pojo.Product;

/**
 *
 * @author HOANG
 */
public class Store implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        HttpSession session = request.getSession();
        List<Product> products = (List<Product>) session.getAttribute("Products");
        int page = 1;
        int view = 16;
        int sort = 1;
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        request.setAttribute("page", page);
        
        if(request.getParameter("view") != null)
            view = Integer.parseInt(request.getParameter("view"));
        request.setAttribute("view", view);
        
        if(request.getParameter("sort") != null){
            sort = Integer.parseInt(request.getParameter("sort"));
            if(sort == 2)
                Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o2.getRating().compareTo(o1.getRating());
                }
            });
            else if(sort == 3)
                Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o1.getRating().compareTo(o2.getRating());
                }
            });
            else if(sort == 4)
                Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o2.getScreen().compareTo(o1.getScreen());
                }
            });
            else if(sort == 5)
                Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o1.getScreen().compareTo(o2.getScreen());
                }
            });
            else if(sort == 6)
                Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o2.getPrice().compareTo(o1.getPrice());
                }
            });
            else if(sort == 7)
                Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o1.getPrice().compareTo(o2.getPrice());
                }
            });
        }
        request.setAttribute("sort", sort);
        request.setAttribute("products", products);
        return "success";
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.ProductDAO;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
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
        ProductDAO productDAO = (ProductDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("productDAO");
        List<Product> products = (List<Product>) session.getAttribute("Products");
        int page = 1;
        int view = 16;
        int sort = 1;
        String paginate = "";
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
                    return o2.getSalePrice().compareTo(o1.getSalePrice());
                }
            });
            else if(sort == 7)
                Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o1.getSalePrice().compareTo(o2.getSalePrice());
                }
            });
        }
        request.setAttribute("sort", sort);
        
        int option;
        String param;
        param = request.getParameter("Price");
        if(param != null && !param.equals("")){
            paginate += "&Price=" + param;
            option = Integer.parseInt(param);
            for(int i = 0; i < products.size();){
                double price = products.get(i).getSalePrice();
                if((option == 1 && price >= 150)
                        ||(option == 2 && price < 150 && price >= 250)
                        ||(option == 3 && price < 250 && price >= 350)
                        ||(option == 4 && price < 350))
                    products.remove(products.get(i));
                else
                    i++;
            }
        }
        param = request.getParameter("Brand");
        if(param != null && !param.equals("")){
            paginate += "&Brand=" + param;
            option = Integer.parseInt(param);
            for(int i = 0; i < products.size();){
                if(products.get(i).getBrand().getBrandId() != option)
                    products.remove(products.get(i));
                else
                    i++;
            }
        }
        param = request.getParameter("Type");
        if(param != null && !param.equals("")){
            paginate += "&Type=" + param;
            option = Integer.parseInt(param);
            for(int i = 0; i < products.size();){
                if(products.get(i).getCategory().getCategoryId() != option)
                    products.remove(products.get(i));
                else
                    i++;
            }
        }
        param = request.getParameter("Rate");
        if(param != null && !param.equals("")){
            paginate += "&Rate=" + param;
            option = Integer.parseInt(param);
            for(int i = 0; i < products.size();){
                double rating = products.get(i).getRating();
                if((option == 1 && rating < 5)
                        ||(option == 2 && rating < 4)
                        ||(option == 3 && rating < 3)
                        ||(option == 4 && rating < 2)
                        ||(option == 5 && rating < 1))
                    products.remove(products.get(i));
                else
                    i++;
            }
        }
        param = request.getParameter("Size");
        if(param != null && !param.equals("")){
            paginate += "&Size=" + param;
            option = Integer.parseInt(param);
            for(int i = 0; i < products.size();){
                int size = products.get(i).getScreen();
                if((option == 1 && size > 29)
                        ||(option == 2 && size < 30 && size > 39)
                        ||(option == 3 && size < 40 && size > 49)
                        ||(option == 4 && size < 50 && size > 59)
                        ||(option == 5 && size < 60))
                    products.remove(products.get(i));
                else
                    i++;
            }
        }
        param = request.getParameter("tb_Name");
        if(param != null && !param.equals("")){
            for(int i = 0; i < products.size();){
                String name = products.get(i).getName();
                if(!name.toLowerCase().contains(param.toLowerCase()))
                    products.remove(products.get(i));
                else
                    i++;
            }
        }
        request.setAttribute("paginate", paginate);
        request.setAttribute("products", products);
        if(request.getParameter("page") != null || request.getParameter("view") != null
                || request.getParameter("sort") != null)
            return "ajax_products";
        return "success";
    }
}

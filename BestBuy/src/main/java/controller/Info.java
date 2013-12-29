/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.CommentDAO;
import dao.ProductDAO;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Account;
import pojo.Comment;
import pojo.Product;

/**
 *
 * @author HOANG
 */
public class Info implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        request.setAttribute("url", request.getRequestURL());
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        CommentDAO commentDAO = (CommentDAO) context.getBean("commentDAO");
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.get(id);
        request.setAttribute("product", product);
        if(request.getParameter("ta_content") != null){
            HttpSession session = request.getSession();
            String content = request.getParameter("ta_content");
            Comment comment = new Comment();
            comment.setProduct(product);
            comment.setAccount((Account)session.getAttribute("User"));
            comment.setContent(content);
            commentDAO.add(comment);
            product = productDAO.get(id);
            request.setAttribute("product", product);
            return "ajax_comment";
        }
        if(request.getParameter("rating") != null){
            double rating = Double.valueOf(request.getParameter("rating"));
            product.setRateAmount(product.getRateAmount() + 1);
            product.setRating((product.getRating()*(product.getRateAmount()-1) + rating) / product.getRateAmount());
            productDAO.update(product);
            return "ajax_rating";
        }
        return "success";
    }
}

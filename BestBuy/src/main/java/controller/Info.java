/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.CommentDAO;
import dao.ProductDAO;
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
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.get(id);
        request.setAttribute("product", product);
        if(request.getParameter("ta_content") != null){
            HttpSession session = request.getSession();
            String content = request.getParameter("ta_content");
            CommentDAO commentDAO = (CommentDAO) context.getBean("commentDAO");
            Comment comment = new Comment();
            comment.setAccount((Account)session.getAttribute("User"));
            comment.setProduct(product);
            comment.setContent(content);
            commentDAO.add(comment);
            return "ajax_comment";
        }
        return "success";
    }
}

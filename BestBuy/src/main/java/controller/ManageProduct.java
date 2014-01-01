/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Product;

/**
 *
 * @author HOANG
 */
public class ManageProduct implements ServletRequestAware {

    private HttpServletRequest request;
    private String uploadFileName;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String execute() throws IOException {
        HttpSession session = request.getSession();
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        if(request.getParameter("add_product") != null || request.getParameter("edit_product") != null){
            String strId = request.getParameter("h_id");
            String name = request.getParameter("tb_Name");
            String description = request.getParameter("tb_Description");
            String price = request.getParameter("tb_Price");
            String screen = request.getParameter("tb_Screen");
            String warranty = request.getParameter("tb_Warranty");
            String strBrand = request.getParameter("sl_Brand");
            String strType = request.getParameter("sl_Type");
            String url = request.getParameter("h_url");
            url = url.substring(url.lastIndexOf("images"));
            int id = 0, brand = 0, type = 0;
            if(!strId.equals(""))
                id = Integer.parseInt(strId);
            if(!strBrand.equals(""))
                brand = Integer.parseInt(strBrand);
            if(!strType.equals(""))
                type = Integer.parseInt(strType);
            BrandDAO brandDAO = (BrandDAO) context.getBean("brandDAO");
            CategoryDAO categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
            Product product = new Product(id, name, description, Double.valueOf(price), Integer.valueOf(screen) ,
                    Integer.valueOf(warranty), url, categoryDAO.get(type), brandDAO.get(brand));
            if(strId.equals("")){
                productDAO.add(product);
                Product last = productDAO.getLast();
                id = last.getProductId();
                String extention = url.substring(url.indexOf('.'));
                File src = new File(request.getSession().getServletContext().getRealPath("/") + "images\\temp" + extention);
                File dest = new File(request.getSession().getServletContext().getRealPath("/") + "images\\" + id + "_ch" + extention);
                FileUtils.copyFile(src, dest);
                url = "images/" + id + "_ch" + extention;
            }
            product.setImageUrl(url);
            productDAO.update(product);
        }
        if(request.getParameter("add") != null)
            return "action";
        if(request.getParameter("edit.x") != null){
            int id = Integer.parseInt(request.getParameter("h_id"));
            Product product = productDAO.get(id);
            uploadFileName = product.getImageUrl();
            request.setAttribute("product", product);
            return "action";
        }
        if (request.getParameter("remove.x") != null) {
            int id = Integer.parseInt(request.getParameter("h_id"));
            Product product = productDAO.get(id);
            productDAO.delete(product);
        }
        session.setAttribute("Products", productDAO.getList());
        request.setAttribute("productDAO", productDAO);
        return "success";
    }
    
}

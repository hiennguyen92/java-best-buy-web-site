/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.ProductDAO;
import dao.SaleOffDAO;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Product;
import pojo.SaleOff;

/**
 *
 * @author HOANG
 */
public class ManageSale implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() throws ParseException {
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        SaleOffDAO saleOffDAO = (SaleOffDAO) context.getBean("saleOffDAO");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
        if(request.getParameter("create_event") != null || request.getParameter("edit_event") != null){
            String name = request.getParameter("tb_Name");
            String description = request.getParameter("tb_Description");
            String percent = request.getParameter("tb_Percent");
            DateFormat format = new SimpleDateFormat("dd/mm/yy");
            Date from = format.parse(request.getParameter("tb_From"));
            Date to = format.parse(request.getParameter("tb_To"));
            SaleOff sale = new SaleOff(name, description, Integer.parseInt(percent), from, to);
            SaleOff last = saleOffDAO.getLast();
            if(last == null)
                saleOffDAO.add(sale);
            else{
                sale.setSaleOffId(last.getSaleOffId());
                saleOffDAO.update(sale);
            }            
            for(Product product : productDAO.getList()){
                double temp = 1 - (double)sale.getPercent() / 100;
                product.setSalePrice(product.getPrice() * temp);
                productDAO.update(product);
            }
        }
        if(request.getParameter("create") != null)
            return "action";
        if(request.getParameter("edit") != null){
            request.setAttribute("sale", saleOffDAO.getLast());
            return "action";
        }
        if(request.getParameter("delete") != null){
            SaleOff sale = saleOffDAO.getLast();
            saleOffDAO.delete(sale);
            for(Product product : productDAO.getList()){
                product.setSalePrice(product.getPrice());
                productDAO.update(product);
            }
        }
        request.setAttribute("sale", saleOffDAO.getLast());
        return "success";
    }
    
}

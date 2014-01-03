/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package spring;

import dao.ProductDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Product;

/**
 *
 * @author HOANG
 */
@Controller
@RequestMapping("/product/")
public class GetProductInfo {
    @RequestMapping(value="{id}", method = RequestMethod.GET)
    public @ResponseBody Product getProduct(@PathVariable int id){
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");  
        Product product = productDAO.get(id);
        if(product != null){
            product.setCarts(null);
            product.setAccessories(null);
            product.setComments(null);
            product.setProduct(null);
            product.setImages(null);
            product.getCategory().setProducts(null);
            product.getBrand().setProducts(null);
        }
        return product;
    }
}

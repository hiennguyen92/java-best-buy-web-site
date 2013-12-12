/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import pojo.Product;

/**
 *
 * @author HOANG
 */
public class ProductDAO extends BaseDAO<Product>{
    public ProductDAO(){
        setCls(Product.class);
    }
    
    @Override
    public Product get(int id) {
        Product temp = null;
        Session session = currentSession();
        try {
            temp = (Product) session.get(Product.class, id);
            temp.getAccessories().size();
            temp.getComments().size();
            temp.getImages().size();
        } catch (Exception ex) {
            //Log the exception
            System.out.println(ex);
        } finally {
            session.close();
        }
        return temp;
    }
}

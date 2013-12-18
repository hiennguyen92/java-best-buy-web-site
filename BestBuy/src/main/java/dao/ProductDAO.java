/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
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
            if(temp.getSalePrice() == null)
                temp.setSalePrice(temp.getPrice());
        } catch (Exception ex) {
            //Log the exception
            logger.error(ex.getMessage());
        } finally {
            session.close();
        }
        return temp;
    }
    
    public Product getLast(){
        Product product = null;
        Session session = currentSession();
        
        try {
            String hql = "select a from Product a"
                    + " order by a.productId desc";
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
            product = (Product) query.uniqueResult();
        } catch (HibernateException ex) {
            //Log the exception
            logger.error(ex.getMessage());
            logger.error(ex.getCause());
        } finally {
            session.close();
        }
        return product;
    }
}

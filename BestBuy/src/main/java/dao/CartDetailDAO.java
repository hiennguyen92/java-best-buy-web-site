/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.CartDetail;

/**
 *
 * @author HOANG
 */
public class CartDetailDAO extends BaseDAO<CartDetail> {

    public CartDetailDAO() {
        setCls(CartDetail.class);
    }

    public CartDetail get(int CartId, int ProductId){
        CartDetail cartDetail = null;
        Session session = currentSession();
        
        try {
            String hql = "select a from CartDetail a"
                    + " where a.cartId=:CartId" 
                    + " and a.productId=:ProductId";
            Query query = session.createQuery(hql);
            query.setString("CartId", String.valueOf(CartId));
            query.setString("ProductId", String.valueOf(ProductId));
            cartDetail = (CartDetail) query.uniqueResult();
        } catch (Exception ex) {
            //Log the exception
            System.err.println(ex);
        } finally {
            session.close();
        }
        return cartDetail;
    }
    
    public static CartDetail s_get(int CartId, int ProductId){
        CartDetail cartDetail = null;
        SessionFactory factory = (SessionFactory) new ClassPathXmlApplicationContext("hibernate.xml").getBean("sessionFactory"); 
        Session session = factory.openSession();
        
        try {
            String hql = "select a from CartDetail a"
                    + " where a.cartId=:CartId" 
                    + " and a.productId=:ProductId";
            Query query = session.createQuery(hql);
            query.setString("CartId", String.valueOf(CartId));
            query.setString("ProductId", String.valueOf(ProductId));
            cartDetail = (CartDetail) query.uniqueResult();
        } catch (Exception ex) {
            //Log the exception
            System.err.println(ex);
        } finally {
            session.close();
        }
        return cartDetail;
    }
}

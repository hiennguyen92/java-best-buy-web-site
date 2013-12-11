/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import pojo.Cart;

/**
 *
 * @author HOANG
 */
public class CartDAO extends BaseDAO<Cart>{
    public CartDAO(){
        setCls(Cart.class);
    }
    
    public List<Cart> getList(String username) {
        List<Cart> list = null;
        Session session = currentSession();

        try {
            String hql = "select a from Cart a where a.account.username=:Username";
            Query query = session.createQuery(hql);
            query.setString("Username", username);
            list = query.list();
        } catch (HibernateException ex) {
            //Log the exception
            System.err.println(ex);
        } finally {
            session.close();
        }
        return list;
    }
    
    public Cart getLast(){
        Cart cart = null;
        Session session = currentSession();
        
        try {
            String hql = "select a from Cart a"
                    + " order by a.cartId desc";
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
            cart = (Cart) query.uniqueResult();
        } catch (HibernateException ex) {
            //Log the exception
            System.err.println(ex);
        } finally {
            session.close();
        }
        return cart;
    }
}

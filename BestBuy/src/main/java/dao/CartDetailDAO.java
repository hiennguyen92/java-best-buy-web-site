/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import pojo.CartDetail;

/**
 *
 * @author HOANG
 */
public class CartDetailDAO extends BaseDAO<CartDetail> {

    public CartDetailDAO() {
        setCls(CartDetail.class);
    }

    public CartDetail get(int ShoeID, int CartID) {
        Session session = currentSession();
        CartDetail cartDetail = null;

        try {
            String hql = "select a from CartDetail a"
                    + " where a.CDCart=:CartID"
                    + " and a.CDShoe=:ShoeID";
            Query query = session.createQuery(hql);
            query.setString("ShoeID", String.valueOf(ShoeID));
            query.setString("CartID", String.valueOf(CartID));
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

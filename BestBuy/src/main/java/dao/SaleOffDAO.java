/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import pojo.SaleOff;

/**
 *
 * @author HOANG
 */
public class SaleOffDAO extends BaseDAO<SaleOff>{

    public SaleOffDAO() {
        setCls(SaleOff.class);
    }
    
    public SaleOff getLast(){
        SaleOff sale = null;
        Session session = currentSession();
        
        try {
            String hql = "select a from SaleOff a"
                    + " order by a.saleOffId desc";
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
            sale = (SaleOff) query.uniqueResult();
        } catch (HibernateException ex) {
            //Log the exception
            logger.error(ex.getMessage());
            logger.error(ex.getCause());
        } finally {
            session.close();
        }
        return sale;
    }
}

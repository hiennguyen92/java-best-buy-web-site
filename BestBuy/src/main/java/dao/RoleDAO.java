/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import static dao.BaseDAO.logger;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import pojo.Cart;
import pojo.UserRole;

/**
 *
 * @author HOANG
 */
public class RoleDAO extends BaseDAO<UserRole>{
    public RoleDAO(){
        setCls(UserRole.class);
    }
    
    public List<UserRole> getList(String username) {
        List<UserRole> list = null;
        Session session = currentSession();

        try {
            String hql = "select a from UserRole a where a.account.username=:Username";
            Query query = session.createQuery(hql);
            query.setString("Username", username);
            list = query.list();
        } catch (HibernateException ex) {
            //Log the exception
            logger.error(ex.getMessage());
        } finally {
            session.close();
        }
        return list;
    }
}

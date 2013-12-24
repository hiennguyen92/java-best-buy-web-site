/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import org.hibernate.Session;
import pojo.Account;

/**
 *
 * @author HOANG
 */
public class AccountDAO extends BaseDAO<Account>{
    public AccountDAO(){
        setCls(Account.class);
    }
    
    public Account get(String id) {
        Account temp = null;
        Session session = currentSession();
        try {
            temp = (Account) session.get(Account.class, id);
            temp.getComments().size();
            temp.getRoles().size();
        } catch (Exception ex) {
            //Log the exception
            logger.error(ex.getMessage());
        } finally {
            session.close();
        }
        return temp;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import pojo.Account;

/**
 *
 * @author HOANG
 */
public class AccountDAO extends BaseDAO<Account>{
    public AccountDAO(){
        setCls(Account.class);
    }
}

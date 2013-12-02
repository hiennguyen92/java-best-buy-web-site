/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import pojo.Cart;

/**
 *
 * @author HOANG
 */
public class CartDAO extends BaseDAO<Cart>{
    public CartDAO(){
        setCls(Cart.class);
    }
}

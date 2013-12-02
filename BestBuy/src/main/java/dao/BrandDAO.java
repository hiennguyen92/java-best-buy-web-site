/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import pojo.Brand;

/**
 *
 * @author HOANG
 */
public class BrandDAO extends BaseDAO<Brand>{
    public BrandDAO(){
        setCls(Brand.class);
    }
    
}

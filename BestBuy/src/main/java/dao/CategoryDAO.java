/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import pojo.Category;

/**
 *
 * @author HOANG
 */
public class CategoryDAO extends BaseDAO<Category>{
    public CategoryDAO(){
        setCls(Category.class);
    }
    
}

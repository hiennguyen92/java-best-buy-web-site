/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import pojo.Comment;

/**
 *
 * @author HOANG
 */
public class CommentDAO extends BaseDAO<Comment>{
    public CommentDAO(){
        setCls(Comment.class);
    }
}

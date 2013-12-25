/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pojo;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author HOANG
 */
@Entity
@Table(name = "Comment")
public class Comment implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "CommentId")
    private int commentId;
    @Column(name = "Content", length = 2000)
    private String content;
    @ManyToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name="Username")
    private Account account;
    @ManyToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name="ProductId")
    private Product product;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
}

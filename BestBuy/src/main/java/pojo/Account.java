/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;

/**
 *
 * @author HOANG
 */
@Entity
@AttributeOverrides({
    @AttributeOverride( name="realName", column = @Column(name = "RealName", length = 45) ),
    @AttributeOverride( name="phone", column = @Column(name = "Phone", length = 45) ),
    @AttributeOverride( name="address", column = @Column(name = "Address", length = 1000) ),
    @AttributeOverride( name="avatar", column = @Column(name = "AvatarUrl", length = 100) )
})
@Table(name = "Account")
public class Account extends AccountService implements Serializable {
    @Id
    @Column(name = "Username", length = 45)
    private String username;
    @Column(name = "Password", length = 45)
    private String password;
    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "WishID")
    private Cart wishList = new Cart();
    @Column(name = "Enable")
    private Integer enable;
    @OneToMany(mappedBy = "account", cascade = {CascadeType.ALL})
    private Set<Cart> carts = new HashSet<Cart>(0);
    @OneToMany(mappedBy = "account", cascade = {CascadeType.ALL})
    private Set<Comment> comments = new HashSet<Comment>(0);  
    @OneToMany(mappedBy = "account", cascade = {CascadeType.ALL})
    private Set<UserRole> roles = new HashSet<UserRole>(0);  
    
    public Account() { }

    public Account(String username, String password, String realName, String phone, String address, String avatar, Integer enable) {
        init(username, password, realName, phone, address, avatar, enable);
    }
    
    public void init(String username, String password, String realName, String phone, String address, String avatar, Integer enable){
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.phone = phone;
        this.address = address;
        this.avatar = avatar;
        this.enable = enable;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Cart getWishList() {
        return wishList;
    }

    public void setWishList(Cart wishList) {
        this.wishList = wishList;
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public Set<Cart> getCarts() {
        return carts;
    }

    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Set<UserRole> getRoles() {
        return roles;
    }

    public void setRoles(Set<UserRole> roles) {
        this.roles = roles;
    }
}

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
@Table(name = "Account")
public class Account implements Serializable {
    @Id
    @Column(name = "Username", length = 45)
    private String username;
    @Column(name = "Password", length = 45)
    private String password;
    @Column(name = "RealName", length = 45)
    private String realName;
    @Column(name = "Phone", length = 45)
    private String phone;
    @OneToMany(mappedBy = "account")
    public Set<Cart> carts = new HashSet<Cart>(0);

    public Account() { }

    public Account(String username, String password, String realName, String phone) {
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.phone = phone;
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

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Set<Cart> getCarts() {
        return carts;
    }

    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }
}

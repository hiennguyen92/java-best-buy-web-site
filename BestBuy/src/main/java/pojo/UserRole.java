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
@Table(name = "UserRoles")
public class UserRole implements Serializable{
    @Id
    @GeneratedValue
    @Column(name = "RoleID")
    private int roleId;
    @ManyToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name="Username")
    private Account account;
    @Column(name = "Authority")
    private String authority;

    public UserRole() {
    }

    public UserRole(Account account, String authority) {
        this.account = account;
        this.authority = authority;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }
    
}

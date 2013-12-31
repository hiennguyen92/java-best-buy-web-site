/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.io.Serializable;
import javax.persistence.MappedSuperclass;

/**
 *
 * @author HOANG
 */
@MappedSuperclass
public class AccountService implements Serializable {
    protected String realName;
    protected String phone;
    protected String address;
    protected String avatar;
    
    public AccountService() { }

    public AccountService(String realName, String phone, String address, String avatar) {
        this.realName = realName;
        this.phone = phone;
        this.address = address;
        this.avatar = avatar;
    }
    
    public AccountService cloneThis(){
        return new AccountService(realName, phone, address, avatar);
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}

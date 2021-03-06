/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import org.hibernate.annotations.Cascade;

/**
 *
 * @author HOANG
 */
@Entity
@Table(name = "Cart")
public class Cart implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "CartId")
    private int cartId;
    @ManyToOne
    @JoinColumn(name="Username")
    private Account account;
    @Column(name = "TotalPrice")
    private Double totalPrice;
    @Column(name = "CartDate")
    private Date date = new Date();
    @Column(name = "Checked")
    private Boolean checked;
    @ManyToMany(
            fetch = FetchType.EAGER,
            targetEntity = Product.class)
    @JoinTable(
            name = "Cart_Detail",
            joinColumns = {@JoinColumn(name = "CartId")},
            inverseJoinColumns = {@JoinColumn(name = "ProductId")})
    private Set<Product> products = new HashSet<Product>(0);

    public Cart() {
        totalPrice = 0.0;
    }

    public Cart(Account account, Double totalPrice, Boolean checked) {
        this.account = account;
        this.totalPrice = totalPrice;
        this.checked = checked;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }
    
}

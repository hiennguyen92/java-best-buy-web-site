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
@Table(name = "Cart_Detail")
public class CartDetail implements Serializable {
    @Id
    @Column(name = "CartId")
    private Integer cartId;
    @Id
    @Column(name = "ProductId")
    private Integer productId;
    @Column(name = "Quantity")
    private Integer quantity;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
    
}

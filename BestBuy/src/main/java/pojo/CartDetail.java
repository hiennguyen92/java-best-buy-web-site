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
    private int cartId;
    @Column(name = "ProductId")
    private int productId;
    @Column(name = "Quantity")
    private int quantity;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}

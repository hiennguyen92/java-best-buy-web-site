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
@Table(name = "Product")
public class Product implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ProductId")
    private Integer productId;
    @Column(name = "Name", length = 200)
    private String name;
    @Column(name = "Description", length = 2000)
    private String description;
    @Column(name = "Price")
    private Double price;
    @Column(name = "Rating")
    private Double rating;
    @Column(name = "Screen")
    private Integer screen;
    @Column(name = "Warranty")
    private Integer warranty;
    @Column(name = "ImageUrl", length = 45)
    private String imageUrl;
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "CategoryId")
    public Category category;
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "BrandId")
    public Brand brand;
    @ManyToMany(
            fetch = FetchType.LAZY,
            targetEntity = Cart.class,
            cascade = {CascadeType.ALL})
    @JoinTable(
            name = "Cart_Detail",
            joinColumns = {@JoinColumn(name = "ProductId")},
            inverseJoinColumns = {@JoinColumn(name = "CartId")})
    public Set<Cart> carts = new HashSet<Cart>(0);

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Set<Cart> getCarts() {
        return carts;
    }

    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }

    public Integer getScreen() {
        return screen;
    }

    public void setScreen(Integer screen) {
        this.screen = screen;
    }

    public Integer getWarranty() {
        return warranty;
    }

    public void setWarranty(Integer warranty) {
        this.warranty = warranty;
    }

}

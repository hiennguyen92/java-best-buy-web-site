/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author HOANG
 */
@Entity
@Table(name = "sale_off")
public class SaleOff implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "SaleoffId")
    private Integer saleOffId;
    @Column(name = "Name", length = 1000)
    private String name;
    @Column(name = "Description", length = 2000)
    private String description;
    @Column(name = "Percent")
    private Integer percent;
    @Column(name = "From")
    private Date from;
    @Column(name = "To")
    private Date to;

    public Integer getSaleOffId() {
        return saleOffId;
    }

    public void setSaleOffId(Integer saleOffId) {
        this.saleOffId = saleOffId;
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

    public Integer getPercent() {
        return percent;
    }

    public void setPercent(Integer percent) {
        this.percent = percent;
    }

    public Date getFrom() {
        return from;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public Date getTo() {
        return to;
    }

    public void setTo(Date to) {
        this.to = to;
    }
    
    
}

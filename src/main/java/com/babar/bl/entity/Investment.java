package com.babar.bl.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * @author babar
 * @since 3/5/18.
 */
@Entity
@Table(name = "bl_investment")
public class Investment {

    @Id
    private int id;

    private String madeBy;

    private int amount;

    private String desc;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMadeBy() {
        return madeBy;
    }

    public void setMadeBy(String madeBy) {
        this.madeBy = madeBy;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}

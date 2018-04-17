package com.babar.bl.entity;

import javax.persistence.*;

/**
 * @author sherlock
 * @since 3/25/18.
 */
@Entity
@Table(name = "bl_account")
public class Account {

    @Id
    @GeneratedValue
    private int id;

    private String name;

    @ManyToOne
    private Investor investor;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Investor getInvestor() {
        return investor;
    }

    public void setInvestor(Investor investor) {
        this.investor = investor;
    }
}

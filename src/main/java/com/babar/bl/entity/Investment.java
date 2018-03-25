package com.babar.bl.entity;

import com.babar.bl.entity.common.enums.InvestmentType;

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
    @GeneratedValue
    private int id;

    @ManyToOne
    private Investor investor;

    @Enumerated(EnumType.STRING)
    private InvestmentType investmentType;

    private int amount;

    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Investor getInvestor() {
        return investor;
    }

    public void setInvestor(Investor investor) {
        this.investor = investor;
    }

    public InvestmentType getInvestmentType() {
        return investmentType;
    }

    public void setInvestmentType(InvestmentType investmentType) {
        this.investmentType = investmentType;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}

package com.babar.bl.entity;

import javax.persistence.*;
import java.util.List;

/**
 * @author sherlock
 * @since 3/25/18.
 */
@Entity
@Table(name = "bl_investor")
public class Investor {

    @Id
    @GeneratedValue
    private int id;

    private String name;

    @OneToMany(mappedBy = "investor")
    private List<Investment> investments;

    @OneToMany(mappedBy = "investor")
    private List<Account> accounts;

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

    public List<Investment> getInvestments() {
        return investments;
    }

    public void setInvestments(List<Investment> investments) {
        this.investments = investments;
    }

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Investor)) return false;

        Investor investor = (Investor) o;

        if (id != investor.id) return false;
        if (!name.equals(investor.name)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + name.hashCode();
        return result;
    }
}

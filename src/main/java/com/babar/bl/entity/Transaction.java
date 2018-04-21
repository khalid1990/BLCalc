package com.babar.bl.entity;

import com.babar.bl.entity.common.enums.TransactionType;

import javax.persistence.*;
import java.util.Date;

/**
 * @author sherlock
 * @since 4/21/18.
 */
@Entity
@Table(name = "bl_transaction")
public class Transaction {

    @Id
    @GeneratedValue
    private int id;

    @Temporal(TemporalType.TIMESTAMP)
    private Date transactionDate;

    @Enumerated(EnumType.STRING)
    private TransactionType transactionType;

    @ManyToOne
    private Account account;

    private int amount;

    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public TransactionType getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(TransactionType transactionType) {
        this.transactionType = transactionType;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
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
}

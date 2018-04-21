package com.babar.bl.service;

import com.babar.bl.entity.Account;
import com.babar.bl.entity.Transaction;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author sherlock
 * @since 4/21/18.
 */
public interface TransactionService extends CrudRepository<Transaction, Integer> {

    public List<Transaction> findByAccount(Account account);
}

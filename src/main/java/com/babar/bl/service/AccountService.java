package com.babar.bl.service;

import com.babar.bl.entity.Account;
import org.springframework.data.repository.CrudRepository;

/**
 * @author sherlock
 * @since 3/25/18.
 */
public interface AccountService extends CrudRepository<Account, Integer> {
}

package com.babar.bl.service;

import com.babar.bl.entity.Investor;
import org.springframework.data.repository.CrudRepository;

/**
 * @author sherlock
 * @since 3/25/18.
 */
public interface InvestorService extends CrudRepository<Investor, Integer> {
}

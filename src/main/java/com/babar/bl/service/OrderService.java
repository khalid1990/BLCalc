package com.babar.bl.service;

import com.babar.bl.entity.Order;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * @author babar
 * @since 3/6/18.
 */
public interface OrderService extends CrudRepository<Order, Integer> {
}

package com.babar.bl.service;

import com.babar.bl.entity.Order;
import com.babar.bl.entity.OrderProductCount;
import com.babar.bl.entity.Product;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author sherlock
 * @since 4/4/18.
 */
public interface OrderProductCountService extends CrudRepository<OrderProductCount, Integer> {

    OrderProductCount findByOrderAndProduct(Order order, Product product);

    List<OrderProductCount> findByOrder(Order order);
}

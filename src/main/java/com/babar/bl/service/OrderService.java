package com.babar.bl.service;

import com.babar.bl.entity.Order;
import com.babar.bl.entity.Shipment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * @author babar
 * @since 3/6/18.
 */
/*Notice you don't need @Repository annotation here*/
public interface OrderService extends CrudRepository<Order, Integer> {

    List<Order> findByShipped(boolean shipped);

    List<Order> findByShipment(Shipment shipment);
}

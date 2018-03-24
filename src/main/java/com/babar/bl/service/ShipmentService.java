package com.babar.bl.service;

import com.babar.bl.entity.Shipment;
import org.springframework.data.repository.CrudRepository;

/**
 * @author sherlock
 * @since 3/23/18.
 */
public interface ShipmentService extends CrudRepository<Shipment, Integer> {}

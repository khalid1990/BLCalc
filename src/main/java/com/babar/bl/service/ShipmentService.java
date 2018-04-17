package com.babar.bl.service;

import com.babar.bl.entity.Account;
import com.babar.bl.entity.Shipment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author sherlock
 * @since 3/23/18.
 */
public interface ShipmentService extends CrudRepository<Shipment, Integer> {

    public List<Shipment> findByAccount(Account account);
}

package com.babar.bl.web.helper;

import com.babar.bl.entity.Shipment;
import com.babar.bl.service.OrderProductCountService;
import com.babar.bl.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author sherlock
 * @since 4/15/18.
 */
@Component
public class ShipmentHelper {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderProductCountService opcService;

    public int getShipmentPayableAmount(Shipment shipment) {
        return orderService.findByShipment(shipment)
                .stream()
                .mapToInt(order ->
                        opcService
                                .findByOrder(order).stream()
                                .mapToInt(opc -> opc.getProduct().getSellingPrice() * opc.getCount()).sum()
                                + order.getDeliveryCharge() - order.getDiscountAmount())
                .sum();
    }
}

package com.babar.bl.web.controller;

import com.babar.bl.entity.Order;
import com.babar.bl.entity.Shipment;
import com.babar.bl.entity.common.enums.PaymentMethod;
import com.babar.bl.entity.common.enums.ShipmentStatus;
import com.babar.bl.entity.common.enums.TransportVendor;
import com.babar.bl.service.OrderService;
import com.babar.bl.service.ShipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * @author sherlock
 * @since 3/23/18.
 */
@Controller
@RequestMapping("/shipment")
public class ShipmentController {

    private static final String SHIPMENT_FORM = "shipment/shipment-form";

    private static final String SHIPMENT_VIEW_FORM = "shipment/shipment-view-form";

    private static final String SHIPMENT_LIST_VIEW = "shipment/shipment-list-view";

    @Autowired
    private ShipmentService shipmentService;

    @Autowired
    private OrderService orderService;

    @GetMapping("/create")
    public String create(ModelMap modelMap) {
        modelMap.put("shipment", new Shipment());
        modelMap.put("transportVendors", TransportVendor.values());
        modelMap.put("shipmentStatuses", ShipmentStatus.values());
        modelMap.put("paymentMethods", PaymentMethod.values());

        return SHIPMENT_FORM;
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("id") int id, ModelMap modelMap) {
        modelMap.put("shipment", shipmentService.findOne(id));
        modelMap.put("transportVendors", TransportVendor.values());
        modelMap.put("shipmentStatuses", ShipmentStatus.values());
        modelMap.put("paymentMethods", PaymentMethod.values());

        return SHIPMENT_FORM;
    }

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        modelMap.put("shipment", shipmentService.findOne(id));
        modelMap.put("unshippedOrders", orderService.findByShipped(false));

        return SHIPMENT_VIEW_FORM;
    }

    @GetMapping("/list")
    public String list(ModelMap modelMap) {
        modelMap.put("shipments", shipmentService.findAll());

        return SHIPMENT_LIST_VIEW;
    }

    @PostMapping(value = "/index", params = "_action_save")
    public String saveOrUpdate(@ModelAttribute Shipment shipment) {
        shipmentService.save(shipment);

        return "redirect:show?id=" + shipment.getId();
    }

    @GetMapping(value = "/addToShipment")
    public String addToShipment(@RequestParam("shipmentId") int shipmentId,
                                @RequestParam("orderId") int orderId) {

        Shipment shipment = shipmentService.findOne(shipmentId);
        Order order = orderService.findOne(orderId);
        shipment.getOrders().add(order);
        shipmentService.save(shipment);

        order.setShipped(true);
        orderService.save(order);

        return "redirect:show?id=" + shipment.getId();
    }

    @GetMapping(value = "/removeFromShipment")
    public String removeFromShipment(@RequestParam("shipmentId") int shipmentId,
                                     @RequestParam("orderId") int orderId) {

        Shipment shipment = shipmentService.findOne(shipmentId);
        Order order = orderService.findOne(orderId);
        shipment.getOrders().remove(order);
        shipmentService.save(shipment);

        order.setShipped(false);
        orderService.save(order);

        return "redirect:show?id=" + shipment.getId();
    }
}

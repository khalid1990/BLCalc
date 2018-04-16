package com.babar.bl.web.controller;

import com.babar.bl.entity.Order;
import com.babar.bl.entity.Shipment;
import com.babar.bl.entity.common.enums.PaymentMethod;
import com.babar.bl.entity.common.enums.ShipmentStatus;
import com.babar.bl.entity.common.enums.TransportVendor;
import com.babar.bl.service.AccountService;
import com.babar.bl.service.OrderService;
import com.babar.bl.service.ShipmentService;
import com.babar.bl.web.helper.ShipmentHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author sherlock
 * @since 3/23/18.
 */
@Controller
@RequestMapping("/shipment")
@SessionAttributes(ShipmentController.COMMAND_NAME)
public class ShipmentController {

    public static final String COMMAND_NAME = "shipment";

    private static final String SHIPMENT_FORM = "shipment/shipment-form";

    private static final String SHIPMENT_VIEW_FORM = "shipment/shipment-view-form";

    private static final String SHIPMENT_LIST_VIEW = "shipment/shipment-list-view";

    @Autowired
    private ShipmentService shipmentService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private ShipmentHelper shipmentHelper;

    @InitBinder(value = COMMAND_NAME)
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/create")
    public String create(ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, new Shipment());
        modelMap.put("transportVendors", TransportVendor.values());
        modelMap.put("shipmentStatuses", ShipmentStatus.values());
        modelMap.put("accounts", accountService.findAll());

        return SHIPMENT_FORM;
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("id") int id, ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, shipmentService.findOne(id));
        modelMap.put("transportVendors", TransportVendor.values());
        modelMap.put("shipmentStatuses", ShipmentStatus.values());
        modelMap.put("accounts", accountService.findAll());

        return SHIPMENT_FORM;
    }

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        Shipment shipment = shipmentService.findOne(id);
        modelMap.put(COMMAND_NAME, shipment);
        modelMap.put("orders", orderService.findByShipment(shipment));
        modelMap.put("unshippedOrders", orderService.findByShipped(false));
        modelMap.put("payableAmount", shipmentHelper.getShipmentPayableAmount(shipment));

        return SHIPMENT_VIEW_FORM;
    }

    @GetMapping("/list")
    public String list(ModelMap modelMap) {
        modelMap.put("shipments", shipmentService.findAll());

        return SHIPMENT_LIST_VIEW;
    }

    @PostMapping(value = "/index", params = "_action_save")
    public String saveOrUpdate(@ModelAttribute Shipment shipment) {
        if (shipment.getShipmentStatus().equals(ShipmentStatus.COMPLETED)) {
            int oldAmount = shipment.getAccount().getAmount();
            shipment.getAccount().setAmount(oldAmount + shipment.getAmountPaid());
        }
        shipmentService.save(shipment);

        return "redirect:show?id=" + shipment.getId();
    }

    @GetMapping(value = "/addToShipment")
    public String addToShipment(@RequestParam("shipmentId") int shipmentId,
                                @RequestParam("orderId") int orderId) {

        Shipment shipment = shipmentService.findOne(shipmentId);
        Order order = orderService.findOne(orderId);
        order.setShipment(shipment);
        order.setShipped(true);
        orderService.save(order);

        return "redirect:show?id=" + shipment.getId();
    }

    @GetMapping(value = "/removeFromShipment")
    public String removeFromShipment(@RequestParam("shipmentId") int shipmentId,
                                     @RequestParam("orderId") int orderId) {

        Order order = orderService.findOne(orderId);
        order.setShipment(null);
        order.setShipped(false);
        orderService.save(order);

        return "redirect:show?id=" + shipmentId;
    }
}

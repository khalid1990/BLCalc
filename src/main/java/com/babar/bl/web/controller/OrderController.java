package com.babar.bl.web.controller;

import com.babar.bl.entity.Order;
import com.babar.bl.entity.common.enums.OrderStatus;
import com.babar.bl.entity.common.enums.TransportVendor;
import com.babar.bl.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * @author babar
 * @since 3/6/18.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    private static final String ORDER_FORM = "order/order-form";

    private static final String ORDER_VIEW_FORM = "order/order-view-form";

    private static final String ORDER_LIST_VIEW = "order/order-list-view";

    @Autowired
    private OrderService orderService;

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        Order order = orderService.findOne(id);
        modelMap.put("order", order);

        return ORDER_VIEW_FORM;
    }

    @GetMapping(value = "/create")
    public String create(ModelMap modelMap) {
        Order order = new Order();
        modelMap.put("order", order);
        modelMap.put("transportVendors", TransportVendor.values());
        modelMap.put("orderStatuses", OrderStatus.values());

        return ORDER_FORM;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id, ModelMap modelMap) {
        Order order = orderService.findOne(id);
        modelMap.put("order", order);
        modelMap.put("transportVendors", TransportVendor.values());
        modelMap.put("orderStatuses", OrderStatus.values());

        return ORDER_FORM;
    }

    @GetMapping(value = "/list")
    public String list(ModelMap modelMap) {
        modelMap.put("orders", orderService.findAll());

        return ORDER_LIST_VIEW;
    }

    @PostMapping(value = "/index")
    public String saveOrUpdate(@ModelAttribute Order order) {
        orderService.save(order);

        return "redirect:show?id=" + order.getId();
    }
}

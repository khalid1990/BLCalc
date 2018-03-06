package com.babar.bl.web.controller;

import com.babar.bl.entity.Order;
import com.babar.bl.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author babar
 * @since 3/6/18.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    private static final String ORDER_FORM = "order/order-form";

    private static final String ORDER_VIEW_FORM = "order/order-view-form";

    @Autowired
    private OrderService orderService;

    @ResponseBody
    @GetMapping("/show")
    public Order show(@RequestParam("id") int id) {
        return orderService.findOne(id);
    }

    @GetMapping(value = "/create")
    public String create() {
        return ORDER_FORM;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id) {
        return ORDER_FORM;
    }
}

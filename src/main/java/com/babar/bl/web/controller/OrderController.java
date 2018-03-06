package com.babar.bl.web.controller;

import com.babar.bl.entity.Order;
import com.babar.bl.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @Autowired
    private OrderService orderService;

    @ResponseBody
    @RequestMapping("/show")
    public Order show(@RequestParam("id") int id) {
        return orderService.findOne(id);
    }
}

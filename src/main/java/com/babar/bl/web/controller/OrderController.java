package com.babar.bl.web.controller;

import com.babar.bl.entity.Order;
import com.babar.bl.entity.OrderProductCount;
import com.babar.bl.entity.Product;
import com.babar.bl.entity.common.enums.OrderStatus;
import com.babar.bl.entity.common.enums.TransportVendor;
import com.babar.bl.service.OrderProductCountService;
import com.babar.bl.service.OrderService;
import com.babar.bl.service.ProductService;
import com.babar.bl.web.helper.OrderHelper;
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
@SessionAttributes(OrderController.COMMAND_NAME)
public class OrderController {

    public static final String COMMAND_NAME = "order";

    private static final String ORDER_FORM = "order/order-form";

    private static final String ORDER_VIEW_FORM = "order/order-view-form";

    private static final String ORDER_LIST_VIEW = "order/order-list-view";

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderProductCountService opcService;

    @Autowired
    private OrderHelper orderHelper;

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        Order order = orderService.findOne(id);
        orderHelper.populateOrderModelForReadOnly(modelMap, order);

        return ORDER_VIEW_FORM;
    }

    @GetMapping(value = "/create")
    public String create(ModelMap modelMap) {
        Order order = new Order();
        orderHelper.populateOrderModelForEditable(modelMap, order);

        return ORDER_FORM;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id, ModelMap modelMap) {
        Order order = orderService.findOne(id);
        orderHelper.populateOrderModelForEditable(modelMap, order);

        return ORDER_FORM;
    }

    @GetMapping(value = "/list")
    public String list(ModelMap modelMap) {
        modelMap.put("orders", orderService.findAll());

        return ORDER_LIST_VIEW;
    }

    @PostMapping(value = "/index", params = "_action_save")
    public String saveOrUpdate(@ModelAttribute Order order) {
        orderService.save(order);

        return "redirect:show?id=" + order.getId();
    }

    @GetMapping(value = "/addProduct")
    public String addProduct(@RequestParam("orderId") int orderId,
                             @RequestParam("productId") int productId) {

        Order order = orderService.findOne(orderId);
        Product product = productService.findOne(productId);
        OrderProductCount opc = opcService.findByOrderAndProduct(order, product);
        if (opc != null) {
            opc.setCount(opc.getCount() + 1);
        } else {
            opc = new OrderProductCount();
            opc.setOrder(order);
            opc.setProduct(product);
            opc.setCount(1);
        }
        opcService.save(opc);

        return "redirect:show?id=" + orderId;
    }

    @GetMapping(value = "/removeProduct")
    public String removeProduct(@RequestParam("orderId") int orderId,
                                @RequestParam("productId") int productId) {
        Order order = orderService.findOne(orderId);
        Product product = productService.findOne(productId);
        OrderProductCount opc = opcService.findByOrderAndProduct(order, product);
        if (opc != null) {
            if (opc.getCount() > 1) {
                opc.setCount(opc.getCount()-1);
                opcService.save(opc);
            } else {
                opcService.delete(opc);
            }
        }

        return "redirect:show?id=" + orderId;
    }
}

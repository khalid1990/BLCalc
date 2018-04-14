package com.babar.bl.web.helper;

import com.babar.bl.entity.Order;
import com.babar.bl.entity.OrderProductCount;
import com.babar.bl.entity.common.enums.OrderStatus;
import com.babar.bl.entity.common.enums.TransportVendor;
import com.babar.bl.service.OrderProductCountService;
import com.babar.bl.service.ProductService;
import com.babar.bl.web.controller.OrderController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import java.util.List;
import java.util.stream.Stream;

/**
 * @author sherlock
 * @since 4/14/18.
 */
@Component
public class OrderHelper {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderProductCountService opcService;

    public void populateOrderModelForReadOnly(ModelMap modelMap, Order order) {
        modelMap.put(OrderController.COMMAND_NAME, order);
        modelMap.put("products", productService.findAll());
        modelMap.put("addedProducts", opcService.findByOrder(order));

        List<OrderProductCount> opcS = opcService.findByOrder(order);
        int totalItems = opcS.stream().mapToInt(OrderProductCount::getCount).sum();
        int totalAmount = opcS.stream().mapToInt(opc -> opc.getProduct().getSellingPrice() * opc.getCount()).sum() + order.getDeliveryCharge();
        int payableAmount = totalAmount - order.getDiscountAmount();
        int netBuyingPrice = opcS.stream().mapToInt(opc -> opc.getProduct().getBuyingPrice() * opc.getCount()).sum();
        int netBenefit = payableAmount - netBuyingPrice;

        modelMap.put("totalItems", totalItems);
        modelMap.put("totalAmount", totalAmount);
        modelMap.put("payableAmount", payableAmount);
        modelMap.put("netBenefit", netBenefit);
    }

    public void populateOrderModelForEditable(ModelMap modelMap, Order order) {
        modelMap.put(OrderController.COMMAND_NAME, order);
        modelMap.put("transportVendors", TransportVendor.values());
        modelMap.put("orderStatuses", OrderStatus.values());
    }
}

package com.babar.bl.web.controller;

import com.babar.bl.entity.Account;
import com.babar.bl.entity.Investor;
import com.babar.bl.entity.Product;
import com.babar.bl.entity.Shipment;
import com.babar.bl.entity.common.enums.ShipmentStatus;
import com.babar.bl.service.InvestorService;
import com.babar.bl.service.OrderService;
import com.babar.bl.service.ProductService;
import com.babar.bl.service.ShipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * @author sherlock
 * @since 4/17/18.
 */
@Controller
@RequestMapping("/")
public class MainController {

    private static final String DASHBOARD_VIEW = "main/dashboard-view";

    @Autowired
    private ProductService productService;

    @Autowired
    private InvestorService investorService;

    @Autowired
    private ShipmentService shipmentService;

    @GetMapping(value = "/dashboard")
    public String showDashBoard(ModelMap modelMap) {
        int totalProductsInAmount = ((List<Product>)productService.findAll())
                .stream()
                .mapToInt(product -> product.getBuyingPrice() * product.getStock()).sum();
        modelMap.put("totalProductsInAmount", totalProductsInAmount);
        modelMap.put("products", productService.findAll());

        Map<Investor, Integer> investorToCashMap = ((List<Investor>) investorService.findAll())
                .stream()
                .collect(Collectors.toMap(Function.identity(),
                        investor -> investor.getAccounts()
                                .stream()
                                .mapToInt(account -> shipmentService.findByAccount(account)
                                        .stream()
                                        .filter(shipment -> shipment.getShipmentStatus() == ShipmentStatus.SHIPMENT_DONE_AND_PAID)
                                        .mapToInt(Shipment::getAmountPaid).sum())
                                .sum()));
        modelMap.put("investorToCashMap", investorToCashMap);

        int totalCashInHand = 0;

        for (Map.Entry<Investor, Integer> entry : investorToCashMap.entrySet()) {
            totalCashInHand += entry.getValue();
        }

        modelMap.put("totalCashInHand", totalCashInHand);

        int totalDueBills = ((List<Shipment>) shipmentService.findAll())
                .stream()
                .filter(shipment -> shipment.getShipmentStatus() ==  ShipmentStatus.SHIPPED_WITH_VENDOR
                        || shipment.getShipmentStatus() == ShipmentStatus.SHIPMENT_DONE_AND_UNPAID)
                .mapToInt(Shipment::getTotalAmount).sum();

        modelMap.put("totalDueBills", totalDueBills);

        List<Shipment> activeShipments = ((List<Shipment>)shipmentService.findAll())
                .stream()
                .filter(shipment -> shipment.getShipmentStatus() == ShipmentStatus.SHIPPED_WITH_VENDOR
                        || shipment.getShipmentStatus() == ShipmentStatus.SHIPMENT_DONE_AND_UNPAID)
                .collect(Collectors.toList());
        modelMap.put("activeShipments", activeShipments);

        return DASHBOARD_VIEW;
    }
}

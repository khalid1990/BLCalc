package com.babar.bl.web.controller;

import com.babar.bl.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author babar
 * @since 3/6/18.
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    private static final String PRODUCT_FORM = "product/product-form";

    private static final String PRODUCT_VIEW_FORM = "product/product-view-form";

    @Autowired
    private ProductService productService;

    @GetMapping("/create")
    public String create() {
        return PRODUCT_FORM;
    }

    @GetMapping("/show")
    public String show(@RequestParam("id") int id) {
        return PRODUCT_FORM;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id) {
        return PRODUCT_FORM;
    }
}


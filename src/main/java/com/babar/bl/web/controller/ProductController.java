package com.babar.bl.web.controller;

import com.babar.bl.entity.Product;
import com.babar.bl.entity.common.enums.Material;
import com.babar.bl.entity.common.enums.ProductType;
import com.babar.bl.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * @author babar
 * @since 3/6/18.
 */
@Controller
@RequestMapping("/product")
@SessionAttributes(ProductController.COMMAND_NAME)
public class ProductController {

    public static final String COMMAND_NAME = "product";

    private static final String PRODUCT_FORM = "product/product-form";

    private static final String PRODUCT_VIEW_FORM = "product/product-view-form";

    private static final String PRODUCT_LIST_VIEW = "product/product-list-view";

    @Autowired
    private ProductService productService;

    @GetMapping("/create")
    public String create(ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, new Product());
        modelMap.put("productTypes", ProductType.values());
        modelMap.put("materials", Material.values());

        return PRODUCT_FORM;
    }

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        Product product = productService.findOne(id);
        modelMap.put(COMMAND_NAME, product);

        return PRODUCT_VIEW_FORM;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id, ModelMap modelMap) {
        Product product =  productService.findOne(id);
        modelMap.put(COMMAND_NAME, product);

        return PRODUCT_FORM;
    }

    @GetMapping(value = "/list")
    public String list(ModelMap modelMap) {
        modelMap.put("products", productService.findAll());

        return PRODUCT_LIST_VIEW;
    }

    @PostMapping(value = "/index", params = "_action_save")
    public String saveOrUpdate(@ModelAttribute Product product) {
        productService.save(product);

        return "redirect:show?id=" + product.getId();
    }
}

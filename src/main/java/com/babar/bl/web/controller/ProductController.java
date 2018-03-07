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
@SessionAttributes(ProductController.SESSION_KEY)
public class ProductController {

    public static final String SESSION_KEY = "product";

    private static final String PRODUCT_FORM = "product/product-form";

    private static final String PRODUCT_VIEW_FORM = "product/product-view-form";

    @Autowired
    private ProductService productService;

    @GetMapping("/create")
    public String create(ModelMap modelMap) {
        modelMap.put(SESSION_KEY, new Product());
        modelMap.put("productTypes", ProductType.values());
        modelMap.put("materials", Material.values());

        return PRODUCT_FORM;
    }

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        Product product = productService.findOne(id);
        modelMap.put(SESSION_KEY, product);

        return PRODUCT_VIEW_FORM;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id, ModelMap modelMap) {
        Product product =  productService.findOne(id);
        modelMap.put(SESSION_KEY, product);

        return PRODUCT_FORM;
    }

    @ResponseBody
    @PostMapping(value = "/index", params = "_action_save")
    public String saveOrUpdate(@ModelAttribute Product product) {
        productService.save(product);

        return "redirect:show?id=" + product.getId();
    }
}

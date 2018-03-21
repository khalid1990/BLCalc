package com.babar.bl.web.controller;

import com.babar.bl.service.InvestmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author babar
 * @since 3/6/18.
 */
@Controller
@RequestMapping("/investment")
public class InvestmentController {

    private static final String INVESTMENT_FORM = "investment/investment-form";

    private static final String INVESTMENT_VIEW_FORM = "investment/investment-view-form";

    @Autowired
    private InvestmentService investmentService;

    @GetMapping(value = "/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        modelMap.put("investment", investmentService.findOne(id));

        return INVESTMENT_VIEW_FORM;
    }

    @GetMapping(value = "/create")
    public String create() {
        return INVESTMENT_FORM;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id) {
        return INVESTMENT_FORM;
    }
}

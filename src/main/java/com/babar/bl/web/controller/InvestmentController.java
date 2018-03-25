package com.babar.bl.web.controller;

import com.babar.bl.entity.Investment;
import com.babar.bl.entity.common.enums.InvestmentType;
import com.babar.bl.service.InvestmentService;
import com.babar.bl.service.InvestorService;
import com.babar.bl.web.helper.InvestmentHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author babar
 * @since 3/6/18.
 */
@Controller
@RequestMapping("/investment")
@SessionAttributes(InvestmentController.COMMAND_NAME)
public class InvestmentController {

    public static final String COMMAND_NAME = "investment";

    private static final String INVESTMENT_FORM = "investment/investment-form";

    private static final String INVESTMENT_VIEW_FORM = "investment/investment-view-form";

    private static final String INVESTMENT_LIST_VIEW = "investment/investment-list-view";

    @Autowired
    private InvestmentService investmentService;

    @Autowired
    private InvestorService investorService;

    @Autowired
    private InvestmentHelper helper;

    @InitBinder(value = COMMAND_NAME)
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping(value = "/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, investmentService.findOne(id));

        return INVESTMENT_VIEW_FORM;
    }

    @GetMapping(value = "/create")
    public String create(ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, new Investment());
        modelMap.put("investors", investorService.findAll());
        modelMap.put("investmentTypes", InvestmentType.values());

        return INVESTMENT_FORM;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id, ModelMap modelMap) {
        Investment investment = investmentService.findOne(id);
        modelMap.put(COMMAND_NAME, investment);

        modelMap.put("investors", investorService.findAll());
        modelMap.put("investmentTypes", InvestmentType.values());

        return INVESTMENT_FORM;
    }

    @GetMapping(value = "/list")
    public String list(ModelMap modelMap) {
        modelMap.put("investments", investmentService.findAll());
        modelMap.put("investorToInvestment", helper.investmentToInvestorMap());
        modelMap.put("investmentTypeToAmount", helper.investmentTypeToAmountMap());

        return INVESTMENT_LIST_VIEW;
    }

    @PostMapping(value = "/index", params = "_action_save")
    public String saveOrUpdate(@ModelAttribute Investment investment) {
        investmentService.save(investment);

        return "redirect:show?id=" + investment.getId();
    }
}

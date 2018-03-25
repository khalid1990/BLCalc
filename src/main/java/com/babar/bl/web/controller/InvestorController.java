package com.babar.bl.web.controller;

import com.babar.bl.entity.Investor;
import com.babar.bl.service.InvestorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Entity;

/**
 * @author sherlock
 * @since 3/26/18.
 */
@Controller
@RequestMapping(("/investor"))
@SessionAttributes(InvestorController.COMMAND_NAME)
public class InvestorController {

    public static final String COMMAND_NAME = "investor";

    private static final String INVESTOR_FORM = "investor/investor-form";

    private static final String INVESTOR_VIEW_FORM = "investor/investor-view-form";

    private static final String INVESTOR_LIST_VIEW = "investor/investor-list-view";

    @Autowired
    private InvestorService investorService;

    @GetMapping("/create")
    public String create(ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, new Investor());

        return INVESTOR_FORM;
    }

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, investorService.findOne(id));

        return INVESTOR_VIEW_FORM;
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("id") int id, ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, investorService.findOne(id));

        return INVESTOR_FORM;
    }

    @GetMapping("/list")
    public String list(ModelMap modelMap) {
        modelMap.put("investors", investorService.findAll());

        return INVESTOR_LIST_VIEW;
    }

    @PostMapping("/index")
    public String saveOrUpdate(@ModelAttribute Investor investor) {
        Investor savedInstance = investorService.save(investor);

        return "redirect:show?id=" + investor.getId();
    }
}

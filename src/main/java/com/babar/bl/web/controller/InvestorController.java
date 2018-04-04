package com.babar.bl.web.controller;

import com.babar.bl.entity.Account;
import com.babar.bl.entity.Investor;
import com.babar.bl.service.AccountService;
import com.babar.bl.service.InvestorService;
import org.hibernate.Hibernate;
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
@SessionAttributes({InvestorController.COMMAND_NAME, InvestorController.ACCOUNT_COMMAND_NAME})
public class InvestorController {

    public static final String COMMAND_NAME = "investor";

    public static final String ACCOUNT_COMMAND_NAME = "account";

    private static final String INVESTOR_FORM = "investor/investor-form";

    private static final String INVESTOR_VIEW_FORM = "investor/investor-view-form";

    private static final String INVESTOR_LIST_VIEW = "investor/investor-list-view";

    private static final String ACCOUNT_FORM = "account/account-form";

    private static final String ACCOUNT_VIEW_FORM = "account/account-view-form";

    @Autowired
    private InvestorService investorService;

    @Autowired
    private AccountService accountService;

    @GetMapping("/create")
    public String create(ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, new Investor());

        return INVESTOR_FORM;
    }

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        Investor investor = investorService.findOne(id);
        modelMap.put(COMMAND_NAME, investor);
        int totalAmount = investor.getAccounts().stream().mapToInt(Account::getAmount).sum();
        modelMap.put("totalAmount", totalAmount);

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

    @GetMapping("/createAccount")
    public String createAccount(@RequestParam("investorId") int investorId, ModelMap modelMap) {
        Account account = new Account();
        account.setInvestor(investorService.findOne(investorId));
        modelMap.put(ACCOUNT_COMMAND_NAME, account);

        return ACCOUNT_FORM;
    }

    @GetMapping("/showAccount")
    public String showAccount(@RequestParam("id") int id, ModelMap modelMap) {
        Account account = accountService.findOne(id);
        modelMap.put(ACCOUNT_COMMAND_NAME, account);

        return ACCOUNT_VIEW_FORM;
    }

    @PostMapping(value = "/index", params = "_action_add_account")
    public String saveAccount(@ModelAttribute Account account) {
        accountService.save(account);
        Investor investor = investorService.findOne(account.getInvestor().getId());
        investor.getAccounts().add(account);
        investorService.save(investor);

        return "redirect:show?id=" + account.getInvestor().getId();
    }
}

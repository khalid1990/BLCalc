package com.babar.bl.web.controller;

import com.babar.bl.entity.*;
import com.babar.bl.entity.common.enums.ShipmentStatus;
import com.babar.bl.entity.common.enums.TransactionType;
import com.babar.bl.service.AccountService;
import com.babar.bl.service.InvestorService;
import com.babar.bl.service.ShipmentService;
import com.babar.bl.service.TransactionService;
import com.babar.bl.web.helper.InvestorHelper;
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
@SessionAttributes({InvestorController.COMMAND_NAME,
        InvestorController.ACCOUNT_COMMAND_NAME, InvestorController.TRANSACTION_COMMAND_NAME})
public class InvestorController {

    public static final String COMMAND_NAME = "investor";

    public static final String ACCOUNT_COMMAND_NAME = "account";

    public static final String TRANSACTION_COMMAND_NAME = "transaction";

    private static final String INVESTOR_FORM = "investor/investor-form";

    private static final String INVESTOR_VIEW_FORM = "investor/investor-view-form";

    private static final String INVESTOR_LIST_VIEW = "investor/investor-list-view";

    private static final String ACCOUNT_FORM = "account/account-form";

    private static final String ACCOUNT_VIEW_FORM = "account/account-view-form";

    private static final String TRANSACTION_FORM = "transaction/transaction-form";

    @Autowired
    private InvestorService investorService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private TransactionService transactionService;

    @Autowired
    private InvestorHelper investorHelper;

    @GetMapping("/create")
    public String create(ModelMap modelMap) {
        modelMap.put(COMMAND_NAME, new Investor());

        return INVESTOR_FORM;
    }

    @GetMapping("/show")
    public String show(@RequestParam("id") int id, ModelMap modelMap) {
        Investor investor = investorService.findOne(id);
        modelMap.put(COMMAND_NAME, investor);
        int totalAmount = investor.getAccounts().stream()
                .mapToInt(investorHelper::getAccountAmount)
                .sum();
        modelMap.put("totalAmount", totalAmount);
        modelMap.put("totalInvestment", investor.getInvestments()
                .stream()
                .mapToInt(Investment::getAmount)
                .sum()
        );

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
        modelMap.put("totalAmount", investorHelper.getAccountAmount(account));
        modelMap.put("transactions", transactionService.findByAccount(account));

        return ACCOUNT_VIEW_FORM;
    }

    @PostMapping(value = "/index", params = "_action_add_account")
    public String saveAccount(@ModelAttribute Account account) {
        accountService.save(account);

        return "redirect:show?id=" + account.getInvestor().getId();
    }

    @GetMapping(value = "/addTransaction")
    public String addTransaction(@RequestParam("accountId") int accountId, ModelMap modelMap) {
        Transaction transaction = new Transaction();
        Account account = accountService.findOne(accountId);
        transaction.setAccount(account);

        modelMap.put(TRANSACTION_COMMAND_NAME, transaction);
        modelMap.put("transactions", TransactionType.values());

        return TRANSACTION_FORM;
    }

    @PostMapping(value = "/saveTransaction")
    public String saveTransaction(@ModelAttribute Transaction transaction) {
        transactionService.save(transaction);

        return "redirect:showAccount?id=" +  transaction.getAccount().getId();
    }
}

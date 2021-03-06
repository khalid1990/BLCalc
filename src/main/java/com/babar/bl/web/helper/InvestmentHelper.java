package com.babar.bl.web.helper;

import com.babar.bl.entity.Investment;
import com.babar.bl.entity.Investor;
import com.babar.bl.entity.common.enums.InvestmentType;
import com.babar.bl.service.InvestmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author sherlock
 * @since 3/23/18.
 */
@Component
public class InvestmentHelper {

    @Autowired
    private InvestmentService investmentService;

    public Map<String, Integer> investmentToInvestorMap() {
        Map<String, Integer> map = new HashMap<>();

        for (Investment investment : investmentService.findAll()) {
            Investor investor = investment.getInvestor();
            Integer amount = investment.getAmount();

            if (map.containsKey(investor.getName())) {
                map.put(investor.getName(), map.get(investor.getName()) + amount);
            } else {
                map.put(investor.getName(), amount);
            }
        }

        return map;
    }

    public Map<InvestmentType, Integer> investmentTypeToAmountMap() {
        Map<InvestmentType, Integer> map = new HashMap<>();

        for (Investment investment : investmentService.findAll()) {
            InvestmentType investmentType = investment.getInvestmentType();
            Integer amount = investment.getAmount();

            if (map.containsKey(investmentType)) {
                map.put(investmentType, map.get(investmentType) + amount);
            } else {
                map.put(investmentType, amount);
            }

        }

        return map;
    }
}

package com.babar.bl.web.helper;

import com.babar.bl.entity.Account;
import com.babar.bl.entity.Shipment;
import com.babar.bl.entity.Transaction;
import com.babar.bl.entity.common.enums.ShipmentStatus;
import com.babar.bl.entity.common.enums.TransactionType;
import com.babar.bl.service.ShipmentService;
import com.babar.bl.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sherlock
 * @since 4/21/18.
 */
@Component
public class InvestorHelper {

    @Autowired
    private ShipmentService shipmentService;

    @Autowired
    private TransactionService transactionService;

    public int getAccountAmount(Account account) {
        int shipmentAmount = shipmentService.findByAccount(account)
                .stream()
                .filter(shipment -> shipment.getShipmentStatus() == ShipmentStatus.SHIPMENT_DONE_AND_PAID)
                .mapToInt(Shipment::getAmountPaid)
                .sum();

        int transactionAmount = 0;

        transactionAmount = ((List<Transaction>) transactionService.findAll())
                .stream()
                .mapToInt(transaction -> transaction.getTransactionType() == TransactionType.INCREMENTAL ?
                        transaction.getAmount() : transaction.getAmount() * -1).sum();

        return shipmentAmount + transactionAmount;
    }
}

package com.babar.bl.entity;

import com.babar.bl.entity.common.enums.PaymentMethod;
import com.babar.bl.entity.common.enums.ShipmentStatus;
import com.babar.bl.entity.common.enums.TransportVendor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * @author sherlock
 * @since 3/23/18.
 */
@Entity
@Table(name = "bl_shipment")
public class Shipment {

    @Id
    @GeneratedValue
    private int id;

    @Enumerated(EnumType.STRING)
    private TransportVendor transportVendor;

    private int serialNoWithTransportVendor;

    @Enumerated(EnumType.STRING)
    private ShipmentStatus shipmentStatus;

    @Temporal(TemporalType.TIMESTAMP)
    private Date shipmentDate;

    @ManyToOne
    private Account account;

    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDate;

    private int amountPaid;

    private String comment;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TransportVendor getTransportVendor() {
        return transportVendor;
    }

    public void setTransportVendor(TransportVendor transportVendor) {
        this.transportVendor = transportVendor;
    }

    public int getSerialNoWithTransportVendor() {
        return serialNoWithTransportVendor;
    }

    public void setSerialNoWithTransportVendor(int serialNoWithTransportVendor) {
        this.serialNoWithTransportVendor = serialNoWithTransportVendor;
    }

    public ShipmentStatus getShipmentStatus() {
        return shipmentStatus;
    }

    public void setShipmentStatus(ShipmentStatus shipmentStatus) {
        this.shipmentStatus = shipmentStatus;
    }

    public Date getShipmentDate() {
        return shipmentDate;
    }

    public void setShipmentDate(Date shipmentDate) {
        this.shipmentDate = shipmentDate;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(int amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Shipment shipment = (Shipment) o;

        if (id != shipment.id) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id;
    }
}

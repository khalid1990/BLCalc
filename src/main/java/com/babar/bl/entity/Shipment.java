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

    @Enumerated(EnumType.STRING)
    private PaymentMethod paymentMethod;

    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDate;

    private int payableAmount;

    private int amountPaid;

    private String comment;

    @OneToMany
    private List<Order> orders;

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

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getPayableAmount() {
        return payableAmount;
    }

    public void setPayableAmount(int payableAmount) {
        this.payableAmount = payableAmount;
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

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
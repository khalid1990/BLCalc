package com.babar.bl.entity;

import com.babar.bl.entity.common.enums.OrderStatus;
import com.babar.bl.entity.common.enums.TransportVendor;

import javax.persistence.*;

/**
 * @author babar
 * @since 3/5/18.
 */
@Entity
@Table(name = "bl_order") //this was necessary, apparently h2db won't let you create a table named order
public class Order {

    @Id
    @GeneratedValue
    private int id;

    private String systemId;

    private String clientName;

    private String clientFbId;

    private String address;

    private String phone;

    private String orderDetail;

    private boolean insideDhaka;

    @Enumerated(EnumType.STRING)
    private TransportVendor transportVendor;

    @Enumerated(EnumType.STRING)
    private OrderStatus orderStatus;

    private int deliveryCharge;

    private int discountAmount;

    private int totalAmount;

    private int netBenefit;

    private String comment;

    private boolean shipped;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSystemId() {
        return systemId;
    }

    public void setSystemId(String systemId) {
        this.systemId = systemId;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getClientFbId() {
        return clientFbId;
    }

    public void setClientFbId(String clientFbId) {
        this.clientFbId = clientFbId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(String orderDetail) {
        this.orderDetail = orderDetail;
    }

    public boolean isInsideDhaka() {
        return insideDhaka;
    }

    public void setInsideDhaka(boolean insideDhaka) {
        this.insideDhaka = insideDhaka;
    }

    public TransportVendor getTransportVendor() {
        return transportVendor;
    }

    public void setTransportVendor(TransportVendor transportVendor) {
        this.transportVendor = transportVendor;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public int getDeliveryCharge() {
        return deliveryCharge;
    }

    public void setDeliveryCharge(int deliveryCharge) {
        this.deliveryCharge = deliveryCharge;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getNetBenefit() {
        return netBenefit;
    }

    public void setNetBenefit(int netBenefit) {
        this.netBenefit = netBenefit;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean isShipped() {
        return shipped;
    }

    public void setShipped(boolean shipped) {
        this.shipped = shipped;
    }
}

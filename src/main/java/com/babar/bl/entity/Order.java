package com.babar.bl.entity;

import com.babar.bl.entity.common.enums.OrderStatus;
import com.babar.bl.entity.common.enums.TransportVendor;

import javax.persistence.*;
import java.util.List;

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

    private String comment;

    private boolean shipped;

    @ManyToOne
    private Shipment shipment;

    @OneToMany(mappedBy = "order")
    private List<OrderProductCount> orderProductCounts;

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

    public Shipment getShipment() {
        return shipment;
    }

    public void setShipment(Shipment shipment) {
        this.shipment = shipment;
    }

    public int getTotalAmount() {
        return orderProductCounts.stream().mapToInt(opc -> opc.getProduct().getSellingPrice() * opc.getCount()).sum()
                + deliveryCharge - discountAmount;
    }

    public List<OrderProductCount> getOrderProductCounts() {
        return orderProductCounts;
    }

    public void setOrderProductCounts(List<OrderProductCount> orderProductCounts) {
        this.orderProductCounts = orderProductCounts;
    }
}

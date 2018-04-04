package com.babar.bl.entity;

import javax.persistence.*;

/**
 * @author sherlock
 * @since 4/4/18.
 */
@Entity
@Table(name = "bl_order_product_count")
public class OrderProductCount {

    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    private Order order;

    @ManyToOne
    private Product product;

    private int count;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}

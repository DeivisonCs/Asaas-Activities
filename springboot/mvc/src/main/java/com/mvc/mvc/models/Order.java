package com.mvc.mvc.models;

import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private LocalDate delivery_date;
    private BigDecimal price;
    private String productUrl;
    private String imageUrl;
    private String description;

    public Order(){}

    public Order(String name, LocalDate delivery_date, BigDecimal price, String productUrl, String imageUrl,
            String description) {
        this.name = name;
        this.delivery_date = delivery_date;
        this.price = price;
        this.productUrl = productUrl;
        this.imageUrl = imageUrl;
        this.description = description;
    }
}
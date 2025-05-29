package com.mvc.mvc.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class OrderDTO {
    private Long id;
    private String name;
    private LocalDate delivery_date;
    private BigDecimal price;
    private String productUrl;
    private String imageUrl;
    private String description;
}

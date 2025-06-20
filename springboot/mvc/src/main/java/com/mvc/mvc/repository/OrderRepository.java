package com.mvc.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mvc.mvc.models.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
}

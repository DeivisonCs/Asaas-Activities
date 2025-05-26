package com.mvc.mvc.controllers;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.mvc.models.Order;
import com.mvc.mvc.repository.OrderRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/home")
@RequiredArgsConstructor
public class HomeController {

    private final OrderRepository orderRepository;
    // @PersistenceContext
    // private EntityManager entityManager;
    
    @GetMapping()
    public String home(Model model){

        
        // ----------- Não consegui fazer essa query funcionar -----------------

        // Query selectAllQuery = entityManager.createQuery("select * from orders", Order.class);
        // List<Order> orders = selectAllQuery.getResultList();
        // model.addAttribute("orders", orders);
        
        // ------------------------------------------------------------------

        List<Order> orders = orderRepository.findAll();
        model.addAttribute("orders", orders);


        return "home";
    }

    @GetMapping("/hello")
    public String hello(){
        return "hello";
    }
}

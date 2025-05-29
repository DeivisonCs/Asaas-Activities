package com.cleanarchitecture.domain.school;

public class Email {

    private String address;

    public Email (String address) {

        if (address == null || !address.matches("/^[a-z0-9.]+@[a-z0-9]+\\.[a-z]+\\.([a-z]+)?$/i"))
            throw new IllegalArgumentException("Invalid Email!");

        this.address = address;
    }
}

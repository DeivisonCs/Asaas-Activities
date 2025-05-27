package com.cleanarchitecture.domain.school;

import java.util.ArrayList;
import java.util.List;

public class Student {
    private CPF cpf;
    private String name;
    private Email email;

    private List<PhoneNumber> phoneNumbers = new ArrayList<>();

    public void addPhoneNumber(String ddd, String number){
        phoneNumbers.add(new PhoneNumber(ddd, number));
    }
}

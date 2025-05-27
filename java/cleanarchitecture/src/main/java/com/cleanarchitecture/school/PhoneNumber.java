package com.cleanarchitecture.school;

public class PhoneNumber {

    private String ddd;
    private String number;

    public PhoneNumber (String ddd, String number){

        if(ddd == null || number == null)
            throw new IllegalArgumentException("Blank Arguments!");
            
        if(!ddd.matches("\\d{2}"))
            throw new IllegalArgumentException("Blank Arguments!");
            
        if(number.length() < 9)
            number = "9" + number;
            
        if(!number.matches("\\d{9}"))
            throw new IllegalArgumentException("Blank Arguments!");

        this.ddd = ddd;
        this.number = number;
    }
}

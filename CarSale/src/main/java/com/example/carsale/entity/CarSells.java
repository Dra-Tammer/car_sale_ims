package com.example.carsale.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CarSells {
    private String Sellid;
    private String Type;
    private String Color;
    private String price;
    private Date Day;
    private int Amount;
    private String Name;
}

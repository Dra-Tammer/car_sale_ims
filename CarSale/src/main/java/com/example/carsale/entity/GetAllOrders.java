package com.example.carsale.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

// 封装一个返回
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetAllOrders {
    private List<CarSells> records;
    private int total;
}

package com.example.carsale.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 接收增加订单的请求体中的对象类型
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Temp {
    private String type;
    private String color;
    private int amount;
    private String name;
}

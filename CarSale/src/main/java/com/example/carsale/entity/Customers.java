package com.example.carsale.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("customers")
public class Customers {
    private String Customerid;
    private String Name;
    private String Address;
    private String Contact;
}

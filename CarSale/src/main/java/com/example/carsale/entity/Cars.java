package com.example.carsale.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Time;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("cars")
public class Cars {
    @TableId
    private String Carid;
    private String Type;
    private String Color;
    private String Factory;
    private Date Createtime;
    private float Price;
    private String status;
}

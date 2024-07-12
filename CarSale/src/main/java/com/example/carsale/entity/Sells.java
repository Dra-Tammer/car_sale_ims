package com.example.carsale.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
// carid 和 sellid绑定对象
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sells {
    String carid;
    String sellid;
}

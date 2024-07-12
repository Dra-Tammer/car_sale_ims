package com.example.carsale.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Records {
    private String Recordid;
    private Date Time;
    private String Type;
    private String Content;
}

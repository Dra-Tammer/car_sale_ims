package com.example.carsale.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// lombok 自动帮我们写好get set方法和无参构造，有参构造
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("staffs")
public class Staffs {
    private String Staffid;
    private String Name;
    private String Sex;
    private int Age;
    private String Origin;
    private String Education;
}

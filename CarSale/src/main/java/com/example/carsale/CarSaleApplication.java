package com.example.carsale;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.carsale.mapper")
public class CarSaleApplication {

    public static void main(String[] args) {
        SpringApplication.run(CarSaleApplication.class, args);
    }

}

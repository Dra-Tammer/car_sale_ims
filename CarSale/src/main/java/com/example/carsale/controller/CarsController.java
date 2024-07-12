package com.example.carsale.controller;

import com.example.carsale.common.Result;
import com.example.carsale.entity.Cars;
import com.example.carsale.sevice.CarService;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;

@RestController
@CrossOrigin
public class CarsController {
    @Autowired
    CarService carService;

    @GetMapping("/car/all")
    public Result<?> carsAll() {
        return Result.success(carService.ShowAllCars());
    }

    @GetMapping("/car/query")
    public Result<?> carQueryByInformation(
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "color", required = false) String color,
            @RequestParam(name = "status", required = false) String status) {
        return Result.success(carService.CarConditionQuery(type, color, status));
    }

    @GetMapping("/car/category")
    public Result<?> getCarsCategory() {
        return Result.success(carService.carCategory());
    }

    @GetMapping("/car/unsold")
    public Result<?> getUnsoldCarTypes() {
        return Result.success(carService.unsoldCarTypes());
    }

    @GetMapping("/car/unsold/color")
    public Result<?> getColorByUnsoldCarType(@RequestParam(name = "type", required = false) String type) {
        return Result.success(carService.colorByUnsoldCarType(type));
    }

    @GetMapping("/car/delete")
    public Result<?> deleteCarById(@RequestParam(name = "id", required = false) String id) {
        return Result.success(carService.deleteCar(id));
    }

    @GetMapping("/car/update")
    public Result<?> updateCarPrice(
            @RequestParam(name = "id", required = true) String id,
            @RequestParam(name = "price", required = true) float price
    ) {
        return Result.success(carService.updateCar(id, price));
    }

    @PostMapping("/car/insert")
    public Result<?> insertCar(
            @RequestParam(name = "id", required = true) String id,
            @RequestParam(name = "type", required = true) String type,
            @RequestParam(name = "color", required = true) String color,
            @RequestParam(name = "price", required = true) float price,
            @RequestParam(name = "factory", required = true) String factory
    ) {
        Cars cars = new Cars();
        cars.setCarid(id);
        cars.setType(type);
        cars.setColor(color);
        cars.setFactory(factory);
        cars.setPrice(price);
        cars.setStatus("unsold");
        long currentTimeMillis = System.currentTimeMillis();
        Date date = new Date(currentTimeMillis);
        cars.setCreatetime(date);
        return Result.success(carService.insertCar(cars));
    }
}

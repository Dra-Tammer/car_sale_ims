package com.example.carsale.controller;

import com.example.carsale.common.Result;
import com.example.carsale.entity.*;
import com.example.carsale.mapper.CarSellsMapper;
import com.example.carsale.sevice.CarSellService;
import com.example.carsale.sevice.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.PushbackInputStream;
import java.util.List;

@RestController
@CrossOrigin
public class CarSellsController {
    @Autowired
    CarSellService carSellService;

    @GetMapping("/order/all")
    public Result<?> carSellsAll() {
        return Result.success(carSellService.ShowAllCarSells());
    }

    @GetMapping("/order/list")
    public Result<?> carSellList(
            @RequestParam(name = "page", required = false) int pageNum,
            @RequestParam(name = "limit", required = false) int pageSize) {
        return Result.success(carSellService.GetAllSellOrderInformation(pageNum, pageSize));
    }

    @PostMapping("/order/add")
    public Result<?> carOrderAdd(@RequestBody Temp temp) {
        return Result.success(carSellService.AddOrder(temp));
    }


    @GetMapping("/order/income")
    public Result<?> getIncome() {
        return Result.success(carSellService.sumIncome());
    }

    @GetMapping("/order/car/count")
    public Result<?> getCarCount() {
        return Result.success(carSellService.carCount());
    }

    @DeleteMapping("/order/delete")
    public Result<?> carOrderDelete(@RequestParam String sellid) {
        return Result.success(carSellService.orderDelete(sellid));
    }

    @GetMapping("/order/query")
    public Result<?> carOrderQuery(
            @RequestParam(name = "page", required = false) int pageNum,
            @RequestParam(name = "limit", required = false) int pageSize,
            @RequestParam(name = "id", required = false) String sellid,
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "name", required = false) String name
    ) {
        return Result.success(carSellService.CarSellConditionQuery(pageNum, pageSize, sellid, type, name));
    }

    @GetMapping("/order/year")
    public Result<?> yearCount() {
        return Result.success(carSellService.carSellsStatistics());
    }

}

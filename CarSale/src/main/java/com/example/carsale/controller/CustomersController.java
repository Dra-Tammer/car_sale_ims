package com.example.carsale.controller;

import com.example.carsale.common.Result;
import com.example.carsale.sevice.CustomerService;
import com.example.carsale.sevice.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class CustomersController {
    @Autowired
    CustomerService customerService;

    @GetMapping("/customer/all")
    public Result<?> customersAll() {
        return Result.success(customerService.ShowAllCustomers());
    }

    @GetMapping("/customer/query")
    public Result<?> customerQueryByInformation(
            @RequestParam(name = "name", required = false) String name) {
        return Result.success(customerService.customerConditionQuery(name));
    }

    @GetMapping("/customer/count")
    public Result<?> customerCount() {
        return Result.success(customerService.GetNumberOfCustomers());
    }

    @GetMapping("/customer/content")
    public Result<?> customerContent(@RequestParam(name = "customerid", required = false) String customerid) {
        return Result.success(customerService.GetRecordByCustomerId(customerid));
    }
}

package com.example.carsale.sevice;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.carsale.entity.Cars;
import com.example.carsale.mapper.CarsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CarService {
    @Autowired
    private CarsMapper carsMapper;

    public List<Cars> ShowAllCars() {
        return carsMapper.selectList(null);
    }

    public List<Cars> CarConditionQuery(String type, String color, String status) {
        QueryWrapper<Cars> queryWrapper = new QueryWrapper<>();
        if (type != null && !type.isEmpty()) {
            queryWrapper.eq("type", type);
        }
        if (color != null && !color.isEmpty()) {
            queryWrapper.eq("color", color);
        }
        if (status != null && !status.isEmpty()) {
            queryWrapper.eq("status", status);
        }
        return carsMapper.selectList(queryWrapper);
    }

    public List<Cars> CarTypeColorQuery(String type, String color) {
        QueryWrapper<Cars> queryWrapper = new QueryWrapper<>();
        if (type != null && !type.isEmpty()) {
            queryWrapper.eq("type", type);
        }
        if (color != null && !color.isEmpty()) {
            queryWrapper.eq("color", color);
        }
        return carsMapper.selectList(queryWrapper);
    }

    public List<String> carCategory() {
        return carsMapper.selectDistinctCarTypes();
    }

    public List<String> unsoldCarTypes() {
        return carsMapper.selectUnsoldCarTypes();
    }

    public List<String> colorByUnsoldCarType(String type) {
        return carsMapper.selectColorByUnsoldCarType(type);
    }

    public int deleteCar(String id) {
        return carsMapper.deleteById(id);
    }

    public int updateCar(String id, float price) {
        UpdateWrapper<Cars> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("carid", id).set("price", price);
        return carsMapper.update(null, updateWrapper);
    }

    public int insertCar(Cars cars) {
        return carsMapper.insert(cars);
    }
}

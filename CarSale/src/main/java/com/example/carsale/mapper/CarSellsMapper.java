package com.example.carsale.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.carsale.entity.CarSells;
import com.example.carsale.entity.YearCount;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface CarSellsMapper extends BaseMapper<CarSells> {
    @Select("select sum(price) AS Total from car_sells")
    int sumIncome();

    @Select("select sum(amount) as total from car_sells")
    int carCount();

    @Select("SELECT YEAR(day) AS year, COUNT(*) AS count FROM car_sells GROUP BY YEAR(day);")
    List<YearCount> selectYearCounts();
}

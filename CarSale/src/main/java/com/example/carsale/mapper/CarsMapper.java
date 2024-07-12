package com.example.carsale.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.carsale.entity.Cars;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CarsMapper extends BaseMapper<Cars> {
    @Select("select distinct type from cars")
    List<String> selectDistinctCarTypes();

    @Select("select distinct type from cars where `status` = 'unsold'")
    List<String> selectUnsoldCarTypes();

    @Select("select distinct color from cars where type = #{type} and  `status` = 'unsold'")
    List<String> selectColorByUnsoldCarType(String type);

}

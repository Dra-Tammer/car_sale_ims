package com.example.carsale.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.carsale.entity.Staffs;
import org.apache.ibatis.annotations.Select;

import java.util.List;

// mybatisplus 基础的增删改查
public interface StaffsMapper extends BaseMapper<Staffs> {
    // 自己定义查询的逻辑
    //    @Select("select * from staffs where name like '王%';")
    //    staffs.selectLike();
    @Select("select distinct name from staffs")
    List<String> selectDistinctStaffName();
    @Select("select count(*) from staffs")
    int staffsSum();
}

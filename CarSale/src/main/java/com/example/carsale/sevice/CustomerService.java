package com.example.carsale.sevice;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.carsale.entity.Communications;
import com.example.carsale.entity.Customers;
import com.example.carsale.entity.Records;
import com.example.carsale.mapper.CommunicationsMapper;
import com.example.carsale.mapper.CustomersMapper;
import com.example.carsale.mapper.RecordsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CustomerService {
    @Autowired
    private CustomersMapper customersMapper;
    @Autowired
    private RecordsMapper recordsMapper;
    @Autowired
    private CommunicationsMapper communicationsMapper;

    public List<Customers> ShowAllCustomers() {
        return customersMapper.selectList(null);
    }

    public List<Customers> customerConditionQuery(String name) {
        QueryWrapper<Customers> queryWrapper = new QueryWrapper<>();
        if (name != null && !name.isEmpty()) {
            queryWrapper.eq("name", name);
        }
        return customersMapper.selectList(queryWrapper);
    }

    public int GetNumberOfCustomers() {
        QueryWrapper<Customers> queryWrapper = new QueryWrapper<>();
        // 可以添加其他条件
        // queryWrapper.eq("字段名", 值);
        return Math.toIntExact(customersMapper.selectCount(queryWrapper));
    }

    public List<Records> GetRecordByCustomerId(String customerid) {
        QueryWrapper<Communications> queryCommunication = new QueryWrapper<>();
        queryCommunication.eq("customerid", customerid);
        Communications c = communicationsMapper.selectList(queryCommunication).get(0);
        QueryWrapper<Records> queryRecord = new QueryWrapper<>();
        queryRecord.eq("recordid", c.getRecordid());
        return recordsMapper.selectList(queryRecord);
    }
}

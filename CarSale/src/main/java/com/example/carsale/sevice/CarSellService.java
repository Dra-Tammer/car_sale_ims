package com.example.carsale.sevice;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.carsale.entity.*;
import com.example.carsale.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import javax.management.Query;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@RestController
public class CarSellService {
    @Autowired
    private CarSellsMapper carSellsMapper;
    @Autowired
    private CarsMapper carsMapper;
    @Autowired
    private ChargesMapper chargesMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private SellsMapper sellsMapper;
    @Autowired
    private StaffsMapper staffsMapper;

    public List<CarSells> ShowAllCarSells() {
        return carSellsMapper.selectList(null);
    }

    public GetAllOrders GetAllSellOrderInformation(int pageNum, int pageSize) {
        Page<CarSells> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<CarSells> queryWrapper = new LambdaQueryWrapper<>();
        carSellsMapper.selectPage(page, queryWrapper);
        return new GetAllOrders(page.getRecords(), (int) page.getTotal());
    }

    public GetAllOrders CarSellConditionQuery(int pageNum, int pageSize, String sellid, String type, String name) {
        QueryWrapper<CarSells> queryWrapper = new QueryWrapper<>();
        Page<CarSells> page = new Page<>(pageNum, pageSize);
        if (sellid != null && !sellid.isEmpty()) {
            queryWrapper.eq("sellid", sellid);
        }
        if (type != null && !type.isEmpty()) {
            queryWrapper.eq("type", type);
        }
        if (name != null && !name.isEmpty()) {
            queryWrapper.eq("name", name);
        }
        carSellsMapper.selectPage(page, queryWrapper);
        return new GetAllOrders(page.getRecords(), (int) page.getTotal());
    }

    public boolean AddOrder(Temp temp) {
        int count = Math.toIntExact(carSellsMapper.selectCount(null)) + 10;
        CarSells carSells = new CarSells();
        String sellid = "10" + count;
        carSells.setSellid(sellid);
        // 查询汽车的信息
        QueryWrapper<Cars> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("type", temp.getType()).eq("color", temp.getColor()).eq("status", "unsold");
        queryWrapper.eq("type", temp.getType()).eq("color", temp.getColor()).eq("status", "unsold");
        Cars car = carsMapper.selectList(queryWrapper).get(0);
        if (car != null) {
            float price = car.getPrice();
            carSells.setType(temp.getType());
            carSells.setColor(temp.getColor());
            carSells.setPrice(String.valueOf(price));
            long currentTimeMillis = System.currentTimeMillis();
            Date date = new Date(currentTimeMillis);
            carSells.setDay(date);
            carSells.setAmount(temp.getAmount());
            carSells.setName(temp.getName());
            car.setStatus("sold");
            carsMapper.updateById(car);
        }

        carSellsMapper.insert(carSells);
        Sells sells = new Sells();
        sells.setSellid(sellid);
        sells.setCarid(car.getCarid());
        sellsMapper.insert(sells);
        QueryWrapper<Staffs> staffsQueryWrapper = new QueryWrapper<>();
        staffsQueryWrapper.eq("name", temp.getName());
        Staffs staffs = staffsMapper.selectOne(staffsQueryWrapper);
        Charges charges = new Charges();
        charges.setSellid(sellid);
        charges.setStaffid(staffs.getStaffid());
        chargesMapper.insert(charges);
        return true;
    }

    public int sumIncome() {
        return carSellsMapper.sumIncome();
    }

    public int carCount() {
        return carSellsMapper.carCount();
    }

    public boolean orderDelete(String sellid) {
        try {
            QueryWrapper<Charges> chargesQueryWrapper = new QueryWrapper<>();
            chargesQueryWrapper.eq("sellid", sellid);
            chargesMapper.delete(chargesQueryWrapper);
            QueryWrapper<Orders> ordersQueryWrapper = new QueryWrapper<>();
            ordersQueryWrapper.eq("sellid", sellid);
            ordersMapper.delete(ordersQueryWrapper);
            QueryWrapper<Sells> sellsQueryWrapper = new QueryWrapper<>();
            sellsQueryWrapper.eq("sellid", sellid);
            String carid = sellsMapper.selectOne(sellsQueryWrapper).getCarid();
            sellsMapper.delete(sellsQueryWrapper);

            QueryWrapper<Cars> carsQueryWrapper = new QueryWrapper<>();
            carsQueryWrapper.eq("carid", carid);
            Cars cars = carsMapper.selectOne(carsQueryWrapper);
            cars.setStatus("unsold");
            carsMapper.updateById(cars);
        } catch (Exception e) {
            e.getCause();
        }

        QueryWrapper<CarSells> carSellsQueryWrapper = new QueryWrapper<>();
        carSellsQueryWrapper.eq("sellid", sellid);
        carSellsMapper.delete(carSellsQueryWrapper);

        return true;
    }

    public List<YearCount> carSellsStatistics() {
        return carSellsMapper.selectYearCounts();
    }



}

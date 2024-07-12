package com.example.carsale.controller;

import com.example.carsale.common.Result;
import com.example.carsale.sevice.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

// 控制层
// 负责把后端的数据流返回给前端
@RestController
// 解决跨域问题
@CrossOrigin
public class StaffsController {
    @Autowired
    // 自动装填，拿到业务层的对象
    StaffService staffService;

    @RequestMapping("/staff/insert") // 定义路由
    public String insert(String Staffid, String name, String Sex, int Age, String Origin, String Education) {
        return staffService.InsertStaff(Staffid, name, Sex, Age, Origin, Education);
    }

    @RequestMapping("/staff/all")
    public Result<?> staffsAll() {
        return Result.success(staffService.ShowAllStaffs());
    }

    @GetMapping("/staff/query")
    public Result<?> staffQueryByInformation(
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "sex", required = false) String sex,
            @RequestParam(name = "education", required = false) String education) {
        return Result.success(staffService.StaffConditionQuery(name, sex, education));
    }

    @GetMapping("/staff/name")
    public Result<?> getStaffName() {
        return Result.success(staffService.staffName());
    }
    @GetMapping("/staff/count")
    public Result<?> getStaffCount() {
        return Result.success(staffService.staffTotal());
    }
}

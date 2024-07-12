package com.example.carsale.sevice;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.carsale.entity.Staffs;
import com.example.carsale.mapper.StaffsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

// 业务层是对mapper层进行加工
// 返回json格式的数据
@RestController
public class StaffService {
    @Autowired
    // 自动装填
    private StaffsMapper staffsMapper;

    public String InsertStaff(String Staffid, String name, String Sex, int Age, String Origin, String Education) {
        return staffsMapper.insert(new Staffs(Staffid, name, Sex, Age, Origin, Education)) > 0 ? "success!" : "fail!";
    }

    public List<Staffs> ShowAllStaffs() {
        return staffsMapper.selectList(null);
    }

    public List<Staffs> StaffConditionQuery(String name, String sex, String education) {
        QueryWrapper<Staffs> queryWrapper = new QueryWrapper<>();
        if (name != null && !name.isEmpty()) {
            queryWrapper.eq("name", name);
        }
        if (sex != null && !sex.isEmpty()) {
            queryWrapper.eq("sex", sex);
        }
        if (education != null && !education.isEmpty()) {
            queryWrapper.eq("education", education);
        }
        return staffsMapper.selectList(queryWrapper);
    }

    public List<String> staffName() {
        return staffsMapper.selectDistinctStaffName();
    }

    public int staffTotal() {
        return staffsMapper.staffsSum();
    }
}

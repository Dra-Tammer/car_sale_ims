package models

import "car_sales_ims/dao"

type Staff struct {
	StaffID   string `json:"id"`
	Name      string `json:"name"`
	Sex       string `json:"sex"`
	Age       int    `json:"age"`
	Origin    string `json:"origin"`
	Education string `json:"education"`
}

func GetAllStaffInformation() (staffs []*Staff, err error) {
	if err = dao.DB.Find(&staffs).Error; err != nil {
		return nil, err
	}
	return
}

func StaffConditionQuery(name string, sex string, education string) (staffs []*Staff, err error) {
	if name != "" && sex != "" && education != "" {
		if err = dao.DB.Where("name = ? AND sex = ? AND education = ?", name, sex, education).Find(&staffs).Error; err != nil {
			return nil, err
		}
		return
	} else if name == "" && sex != "" && education != "" {
		if err = dao.DB.Where("sex = ? AND education = ?", sex, education).Find(&staffs).Error; err != nil {
			return nil, err
		}
		return
	} else if name == "" && sex == "" && education != "" {
		if err = dao.DB.Where("education = ?", education).Find(&staffs).Error; err != nil {
			return nil, err
		}
		return
	} else if name == "" && sex == "" && education == "" {
		if err = dao.DB.Find(&staffs).Error; err != nil {
			return nil, err
		}
		return
	} else if name != "" && sex != "" && education == "" {
		if err = dao.DB.Where("name = ? AND sex = ?", name, sex).Find(&staffs).Error; err != nil {
			return nil, err
		}
		return
	} else if name == "" && sex != "" && education == "" {
		if err = dao.DB.Where("sex = ?", sex).Find(&staffs).Error; err != nil {
			return nil, err
		}
		return
	} else if name != "" && sex == "" && education == "" {
		if err = dao.DB.Where("name = ?", name).Find(&staffs).Error; err != nil {
			return nil, err
		}
		return
	} else {
		if err = dao.DB.Where("name = ? AND education = ?", name, education).Find(&staffs).Error; err != nil {
			return nil, err
		}
		return
	}
}

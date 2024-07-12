package models

import (
	"car_sales_ims/dao"
)

type Car struct {
	CarID      string  `json:"id" gorm:"column:carid"`
	Type       string  `json:"type"`
	Color      string  `json:"color"`
	Factory    string  `json:"factory"`
	CreateTime Time    `json:"create_time"`
	Price      float32 `json:"price"`
	Status     string  `json:"status"`
}

func GetAllCarsInformation() (cars []*Car, err error) {
	if err = dao.DB.Find(&cars).Error; err != nil {
		return nil, err
	}
	return
}

func CarConditionQuery(carType string, color string, status string) (cars []*Car, err error) {
	if carType == "" && color == "" && status == "" {
		if err = dao.DB.Find(&cars).Error; err != nil {
			return nil, err
		}
		return
	} else if carType == "" && color == "" && status != "" {
		if err = dao.DB.Where("status = ?", status).Find(&cars).Error; err != nil {
			return nil, err
		}
		return
	} else if carType == "" && color != "" && status == "" {
		if err = dao.DB.Where("color = ?", color).Find(&cars).Error; err != nil {
			return nil, err
		}
		return
	} else if carType == "" && color != "" && status != "" {
		if err = dao.DB.Where("color = ? AND status = ?", color, status).Find(&cars).Error; err != nil {
			return nil, err
		}
		return
	} else if carType != "" && color == "" && status == "" {
		carType = "%" + carType + "%"
		if err = dao.DB.Where("type LIKE ?", carType).Find(&cars).Error; err != nil {
			return nil, err
		}
		return
	} else if carType != "" && color == "" && status != "" {
		carType = "%" + carType + "%"
		if err = dao.DB.Where("type LIKE ? AND status = ?", carType, status).Find(&cars).Error; err != nil {
			return nil, err
		}
		return
	} else if carType != "" && color != "" && status == "" {
		carType = "%" + carType + "%"
		if err = dao.DB.Where("type LIKE ? AND color = ?", carType, color).Find(&cars).Error; err != nil {
			return nil, err
		}
		return
	} else {
		carType = "%" + carType + "%"
		if err = dao.DB.Where("type LIKE ? AND color = ? AND status = ?", carType, color, status).Find(&cars).Error; err != nil {
			return nil, err
		}
		return
	}
}

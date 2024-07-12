package models

import (
	"car_sales_ims/dao"
	"log"
	"math/rand"
	"strconv"
	"time"
)

type CarSell struct {
	SellID string `json:"id" gorm:"column:sellid"`
	Type   string `json:"type"`
	Color  string `json:"color"`
	Price  string `json:"price"`
	Day    Time   `json:"day"`
	Amount int    `json:"amount"`
	Name   string `json:"name"`
}

type Charge struct {
	SellID  string
	StaffID string
}

type Order struct {
	CustomerID string
	SellID     string
}

type Sell struct {
	CarID  string
	SellID string
}

func DeleteCarSellOrder(id string) bool {
	dao.DB.Where("sellId = ?", id).Delete(Charge{})
	dao.DB.Where("sellId = ?", id).Delete(Order{})
	var sell *Sell
	dao.DB.Where("sellId = ?", id).Find(&sell)
	dao.DB.Where("sellId = ?", id).Delete(Sell{})
	dao.DB.Model(&Car{}).Where("carid = ?", sell.CarID).Update("status", "unsold")
	err := dao.DB.Where("sellID = ?", id).Delete(CarSell{}).Error
	if err != nil {
		return false
	}
	return true
}

func AddCarSellOrder(carType string, color string, amount int, name string) bool {
	rand.Seed(time.Now().UnixNano())
	var price float32
	var car = &Car{}
	dao.DB.Where("type = ? AND color = ?", carType, color).First(&car)
	price = car.Price
	s := strconv.FormatFloat(float64(price), 'f', -1, 32)
	car_sell := CarSell{
		SellID: strconv.Itoa((2000 + rand.Intn(1001))),
		Type:   carType,
		Color:  color,
		Price:  s,
		Amount: amount,
		Name:   name,
		Day:    Time(time.Now().Local().Truncate(24 * time.Hour)),
	}
	dao.DB.Create(&car_sell)
	dao.DB.Model(&Car{}).Where("type = ? AND color = ? AND status = ?", carType, color, "unsold").Limit(1).Update("status", "sold")
	return true
}

func GetAllSellOrderInformation(page string) (CarSell []*CarSell, err error, total int64) {
	pageNum, numErr := strconv.Atoi(page)
	if numErr != nil {
		log.Println("字符串转换出问题了，终止程序")
		return
	}
	pageNum = (pageNum - 1) * 10
	if err = dao.DB.Offset(pageNum).Limit(10).Find(&CarSell).Error; err != nil {
		return nil, err, 0
	}
	if err = dao.DB.Table("car_sells").Count(&total).Error; err != nil {
		return nil, err, 0
	}
	return
}

func SellOrderConditionQuery(sellID string, carType string, name string, page string) (carsell []*CarSell, err error, total int64) {
	pageNum, numErr := strconv.Atoi(page)
	if numErr != nil {
		log.Println("字符串转换出问题了，终止程序")
		return
	}
	pageNum = (pageNum - 1) * 10
	if sellID == "" && carType == "" && name == "" {
		if err = dao.DB.Offset(pageNum).Limit(10).Find(&carsell).Error; err != nil {
			return nil, err, 0
		}
		if err = dao.DB.Table("car_sells").Count(&total).Error; err != nil {
			return nil, err, 0
		}
		return
	} else if sellID == "" && carType == "" && name != "" {
		if err = dao.DB.Offset(pageNum).Limit(10).Where("name = ?", name).Find(&carsell).Error; err != nil {
			return nil, err, 0
		}
		if err = dao.DB.Table("car_sells").Where("name = ?", name).Count(&total).Error; err != nil {
			return nil, err, 0
		}
		return
	} else if sellID == "" && carType != "" && name == "" {
		if err = dao.DB.Offset(pageNum).Limit(10).Where("type = ?", carType).Find(&carsell).Error; err != nil {
			return nil, err, 0
		}
		if err = dao.DB.Table("car_sells").Where("type = ?", carType).Count(&total).Error; err != nil {
			return nil, err, 0
		}
		return
	} else if sellID == "" && carType != "" && name != "" {
		if err = dao.DB.Offset(pageNum).Limit(10).Where("type = ? AND name = ?", carType, name).Find(&carsell).Error; err != nil {
			return nil, err, 0
		}
		if err = dao.DB.Table("car_sells").Where("type = ? AND name = ?", carType, name).Count(&total).Error; err != nil {
			return nil, err, 0
		}
		return
	} else if sellID != "" && carType == "" && name == "" {
		if err = dao.DB.Offset(pageNum).Limit(10).Where("sellid = ?", sellID).Find(&carsell).Error; err != nil {
			return nil, err, 0
		}
		if err = dao.DB.Table("car_sells").Where("sellid = ?", sellID).Count(&total).Error; err != nil {
			return nil, err, 0
		}
		return
	} else if sellID != "" && carType == "" && name != "" {
		if err = dao.DB.Offset(pageNum).Limit(10).Where("sellid = ? AND name = ?", sellID, name).Find(&carsell).Error; err != nil {
			return nil, err, 0
		}
		return
	} else if sellID != "" && carType != "" && name == "" {
		if err = dao.DB.Offset(pageNum).Limit(10).Where("sellid = ? AND type = ?", sellID, carType).Find(&carsell).Error; err != nil {
			return nil, err, 0
		}
		if err = dao.DB.Table("car_sells").Where("sellid = ? AND type = ?", sellID, carType).Count(&total).Error; err != nil {
			return nil, err, 0
		}
		return
	} else {
		if err = dao.DB.Offset(pageNum).Limit(10).Where("sellid = ? AND type = ? AND name = ?", sellID, carType, name).Find(&carsell).Error; err != nil {
			return nil, err, 0
		}
		if err = dao.DB.Table("car_sells").Where("sellid = ? AND type = ? AND name = ?", sellID, carType, name).Count(&total).Error; err != nil {
			return nil, err, 0
		}
		return
	}
}

func GetAllSellsOrder() (car_sells []*CarSell, err error) {
	if err = dao.DB.Find(&car_sells).Error; err != nil {
		return nil, err
	}
	return
}

func GetTotalIncome() (income int64) {
	dao.DB.Model(&CarSell{}).Select("sum(price)").Scan(&income)
	return
}

package models

import (
	"car_sales_ims/dao"
)

type Customer struct {
	CustomerID string `json:"id"`
	Name       string `json:"name"`
	Address    string `json:"address"`
	Contact    string `json:"contact"`
}

func GetAllCustomerInformation() (customers []*Customer, err error) {
	if err = dao.DB.Find(&customers).Error; err != nil {
		return nil, err
	}
	return
}

func CustomerConditionQuery(name string) (customers []*Customer, err error) {
	if name == "" {
		if err = dao.DB.Find(&customers).Error; err != nil {
			return nil, err
		}
		return
	} else {
		if err = dao.DB.Where("name = ?", name).Find(&customers).Error; err != nil {
			return nil, err
		}
		return
	}
}

func GetRecordByCustomerId(id string) (records []*Record, err error) {
	if err = dao.DB.Table("Records").Select("Records.recordId,Records.time,Records.type,Records.Content").Joins("JOIN Communications ON Records.RecordID = Communications.RecordID").
		Joins("JOIN Customers ON Communications.CustomerID = Customers.CustomerID").
		Where("Customers.CustomerID = ?", id).Scan(&records).Error; err != nil {
		return nil, err
	}
	return records, nil
}

func GetNumberOfCustomers() (num int64) {
	dao.DB.Model(&Customer{}).Count(&num)
	return
}

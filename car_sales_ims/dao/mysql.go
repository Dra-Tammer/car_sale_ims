package dao

import (
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var (
	DB  *gorm.DB
	err error
)

func InitMySQL() {
	dsn := "root:720118@tcp(127.0.0.1:3306)/car_sales?charset=utf8mb4&parseTime=True&loc=Local"
	//dsn := "car_sales:720118@tcp(127.0.0.1:3306)/car_sales?charset=utf8mb4&parseTime=True&loc=Local"
	DB, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic(err)
	}
}

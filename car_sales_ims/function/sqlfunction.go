package function

import (
	"car_sales_ims/dao"
	"car_sales_ims/models"
)

func CheckUserByName(name string) (*models.User, error) {
	user := &models.User{}
	result := dao.DB.Where("name = ?", name).First(&user)
	if result.Error != nil {
		return user, result.Error
	}
	return user, nil
}

func CheckPassword(user *models.User, password string) bool {
	if user.Password != password {
		return false
	}
	return true
}

package controller

import (
	"car_sales_ims/models"
	"car_sales_ims/response"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetCustomersList(ctx *gin.Context) {
	customers, err := models.GetAllCustomerInformation()
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "输出客户信息有误")
		return
	}
	response.Success(ctx, gin.H{"customers": customers}, "查找成功")
}

func CustomerQueryByInformation(ctx *gin.Context) {
	name := ctx.Query("name")
	customers, err := models.CustomerConditionQuery(name)
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "查询出现错误")
		return
	}
	response.Success(ctx, gin.H{"customers": customers}, "查找成功")
}

func GetRecordById(ctx *gin.Context) {
	id := ctx.Query("id")
	records, err := models.GetRecordByCustomerId(id)
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "查询出现错误")
		return
	}
	response.Success(ctx, gin.H{"records": records}, "查询成功")
}

func Count(ctx *gin.Context) {
	count := models.GetNumberOfCustomers()
	response.Success(ctx, gin.H{"count": count}, "查询成功")
}

func Income(ctx *gin.Context) {
	income := models.GetTotalIncome()
	response.Success(ctx, gin.H{"income": income}, "查找成功")
}

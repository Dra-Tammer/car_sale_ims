package controller

import (
	"car_sales_ims/models"
	"car_sales_ims/response"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetStaffsList(ctx *gin.Context) {
	staffs, err := models.GetAllStaffInformation()
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "输出员工信息有误")
		return
	}
	response.Success(ctx, gin.H{"staffs": staffs}, "查找成功")
}

func StaffQueryByInformation(ctx *gin.Context) {
	name := ctx.Query("name")
	sex := ctx.Query("sex")
	education := ctx.Query("education")
	staffs, err := models.StaffConditionQuery(name, sex, education)
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "查询出现错误")
		return
	}
	response.Success(ctx, gin.H{"staffs": staffs}, "查询成功")
}

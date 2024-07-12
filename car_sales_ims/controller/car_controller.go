package controller

import (
	"car_sales_ims/models"
	"car_sales_ims/response"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetCarsList(ctx *gin.Context) {
	cars, err := models.GetAllCarsInformation()
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "输出汽车信息有误")
		return
	}
	response.Success(ctx, gin.H{"cars": cars}, "查找成功")
}

func CarQueryByInformation(ctx *gin.Context) {
	carType := ctx.Query("type")
	color := ctx.Query("color")
	status := ctx.Query("status")
	cars, err := models.CarConditionQuery(carType, color, status)
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "查询出现错误")
		return
	}
	response.Success(ctx, gin.H{"cars": cars}, "查找成功")
}

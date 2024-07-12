package controller

import (
	"car_sales_ims/models"
	"car_sales_ims/response"
	"github.com/gin-gonic/gin"
	"github.com/goccy/go-json"
	"net/http"
	"strconv"
)

func Add(ctx *gin.Context) {
	//carType := ctx.PostForm("type")
	//color := ctx.PostForm("color")
	//amount := ctx.PostForm("amount")
	//name := ctx.PostForm("name")
	var requestMap = make(map[string]string)
	json.NewDecoder(ctx.Request.Body).Decode(&requestMap)
	carType := requestMap["type"]
	color := requestMap["color"]
	amount := requestMap["amount"]
	name := requestMap["name"]
	num, _ := strconv.Atoi(amount)
	result := models.AddCarSellOrder(carType, color, num, name)
	if result {
		response.Success(ctx, gin.H{"result": result}, "添加成功")
	}
}

func GetSellsOrderList(ctx *gin.Context) {
	page := ctx.Query("page")
	orders, err, total := models.GetAllSellOrderInformation(page)
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "输出订单信息有误")
		return
	}
	response.Success(ctx, gin.H{"orders": orders, "total": total}, "查找成功")
}

func SellsOrderByInformation(ctx *gin.Context) {
	page := ctx.Query("page")
	sellID := ctx.Query("id")
	carType := ctx.Query("type")
	name := ctx.Query("name")
	orders, err, total := models.SellOrderConditionQuery(sellID, carType, name, page)
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "查询出现错误")
		return
	}
	response.Success(ctx, gin.H{"orders": orders, "total": total}, "查找成功")
}

func DeleteSellOrderBySellID(ctx *gin.Context) {
	id := ctx.Query("id")
	status := models.DeleteCarSellOrder(id)
	if status {
		response.Success(ctx, gin.H{"status": status}, "删除成功")
	} else {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "删除失败")
		return
	}
}

func GetAll(ctx *gin.Context) {
	car_sells, err := models.GetAllSellsOrder()
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "输出全部订单信息有误，终止程序")
		return
	}
	response.Success(ctx, gin.H{"car_sells": car_sells}, "查找成功")
}

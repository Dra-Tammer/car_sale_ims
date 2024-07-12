package router

import (
	"car_sales_ims/controller"
	"github.com/gin-gonic/gin"
)

func CollectRoute(r *gin.Engine) *gin.Engine {
	r.POST("/user/login", controller.UserLogin)
	r.GET("/car/all", controller.GetCarsList)
	r.GET("/car/query", controller.CarQueryByInformation)
	r.GET("/staff/all", controller.GetStaffsList)
	r.GET("/staff/query", controller.StaffQueryByInformation)
	r.GET("/customer/all", controller.GetCustomersList)
	r.GET("/customer/query", controller.CustomerQueryByInformation)
	r.GET("/customer/content", controller.GetRecordById)
	r.GET("/customer/count", controller.Count)
	r.GET("/order/all", controller.GetSellsOrderList)
	r.GET("/order/list", controller.GetAll)
	r.GET("/order/query", controller.SellsOrderByInformation)
	r.POST("/order/add", controller.Add)
	r.DELETE("/order/delete", controller.DeleteSellOrderBySellID)
	r.GET("/order/income", controller.Income)
	return r
}

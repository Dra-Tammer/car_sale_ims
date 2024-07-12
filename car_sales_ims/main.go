package main

import (
	"car_sales_ims/dao"
	"car_sales_ims/router"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.Use(cors.Default())
	r = router.CollectRoute(r)
	dao.InitMySQL()
	panic(r.Run(":8082"))
}

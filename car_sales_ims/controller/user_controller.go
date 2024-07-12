package controller

import (
	"car_sales_ims/function"
	"car_sales_ims/models"
	"car_sales_ims/response"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/goccy/go-json"
	"log"
	"net/http"
)

func UserLogin(ctx *gin.Context) {
	var requestMap = make(map[string]string)
	json.NewDecoder(ctx.Request.Body).Decode(&requestMap)
	name := requestMap["username"]
	password := requestMap["password"]

	//name := ctx.PostForm("username")
	//password := ctx.PostForm("password")
	user, _ := function.CheckUserByName(name)
	if user.ID == 0 {
		response.Response(ctx, http.StatusUnprocessableEntity, 422, nil, "用户不存在，请先注册")
		return
	}
	right := function.CheckPassword(user, password)
	if !right {
		response.Response(ctx, http.StatusBadRequest, 400, nil, "密码错误，请重新输入密码")
		return
	}
	// 发放token
	token, err := models.ReleaseToken(user)
	if err != nil {
		response.Response(ctx, http.StatusInternalServerError, 500, nil, "系统异常")
		log.Printf("token generate error:%v", err)
		return
	}
	fmt.Println(name, password, token)
	response.Success(ctx, gin.H{"token": token}, "登陆成功")
}

func GetUserInfoByToken(ctx *gin.Context) {
	fmt.Println("请求了这个方法")
	ctx.JSON(http.StatusOK, gin.H{
		"code": 200,
		"data": gin.H{
			"roles":        "admin",
			"introduction": "I am a super administrator",
			"avator":       "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif",
			"name":         "Super Admin",
		},
	})
}

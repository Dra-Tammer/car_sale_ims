package middleware

//
//import (
//	"StudyDemo/LoginRegisterCheck/function"
//	"StudyDemo/LoginRegisterCheck/modules"
//	"github.com/gin-gonic/gin"
//	"net/http"
//	"strings"
//)
//
//func AuthMiddleware() gin.HandlerFunc {
//	return func(ctx *gin.Context) {
//		//获取authorization header
//		tokenString := ctx.GetHeader("Authorization")
//		//验证格式 validate token formate
//		if tokenString == "" || !strings.HasPrefix(tokenString, "Bearer") {
//			ctx.JSON(http.StatusUnauthorized, gin.H{
//				"code": 401,
//				"msg":  "权限不足",
//			})
//			ctx.Abort() // 将这次请求给抛弃掉
//			return
//		}
//		tokenString = tokenString[7:] //七位之后截取
//		//从token中截取出我们的claim然后返回
//		token, claims, err := modules.ParseToken(tokenString)
//		if err != nil || !token.Valid {
//			//如果token解析失败或者失效
//			ctx.JSON(http.StatusUnauthorized, gin.H{
//				"code": 401,
//				"msg":  "权限不足",
//			})
//			ctx.Abort()
//			return
//		}
//		//验证通过之后获取其中的userid
//		userId := claims.UserId
//		//通过userid去数据库中判断是否被删除
//		user, _ := function.CheckUserByID(userId)
//		if user.ID == 0 {
//			ctx.JSON(http.StatusUnauthorized, gin.H{
//				"code": 401,
//				"msg":  "权限不足",
//			})
//			ctx.Abort()
//			return
//		}
//		//用户在数据库中存在，将user信息写入上下文
//		ctx.Set("user", user)
//		ctx.Next()
//	}
//}

package models

import (
	"github.com/dgrijalva/jwt-go"
	"time"
)

// 建立一个jwt的密钥
var jwtKey = []byte("a_secret_crect")

type Claims struct {
	UserId uint
	jwt.StandardClaims
}

func ReleaseToken(user *User) (string, error) {
	expirationTime := time.Now().Add(7 * 24 * time.Hour) //设置token过期时间是7天
	claims := &Claims{
		UserId: user.ID,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: expirationTime.Unix(),
			IssuedAt:  time.Now().Unix(),
			Issuer:    "loginIssue",
			Subject:   "user token",
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString(jwtKey)
	if err != nil {
		return "", err //如果生成错误将这个错误返回
	}
	return tokenString, nil
}

// 从tokenstring中解析出我们的claim然后返回
func ParseToken(tokenString string) (*jwt.Token, *Claims, error) {
	claims := &Claims{}
	token, err := jwt.ParseWithClaims(tokenString, claims, func(token *jwt.Token) (i interface{}, err error) {
		return jwtKey, nil
	})
	return token, claims, err
}

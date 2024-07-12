<h1 align="center">汽车销售信息管理系统</h1>

<p align="center">
  <a href="https://github.com/vuejs/vue">
    <img src="https://img.shields.io/badge/vue-brightgreeng" alt="vue">
  </a>
  <a href="https://element.eleme.cn/#/zh-CN">
    <img src="https://img.shields.io/badge/Element-purple" alt="element-ui">
  </a>
  <a href="https://spring.io/">
    <img src="https://img.shields.io/badge/SpringBoot-brightgreen" alt="springboot">
  </a>
  <a href="https://baomidou.com/">
    <img src="https://img.shields.io/badge/Mybatis_Plus-purple" alt="mybatis-plus">
  </a>
  <a href="https://github.com/gin-gonic/gin">
    <img src="https://img.shields.io/badge/gin-brightgreen" alt="gin">       
  </a>
  <a href="https://gorm.io/zh_CN/docs/index.html">
    <img src="https://img.shields.io/badge/gorm-purple" alt="gorm">
  </a>
</p>

简体中文

<p align="center">DESIGNED BY TAMMER</p>

## Introduction

**汽车销售信息管理系统**
十分基础的课程设计包含基本的CRUD操作，服务端有两个版本，go+gin+gorm版本相较于java+springboot+mybatis-plus版本少了车辆的添加，删除以及一些数据处理，前端是拿花裤衩大佬的vue-element-admin进行修改的

> vue-element-admin：https://github.com/PanJiaChen/vue-element-admin.git

### 实现的功能：

- 基本的数据展示
- 车辆的查询、增加、删除，车辆价格的修改
- 员工信息的查询
- 客户信息的查询，业务联系记录的导出
- 销售订单的查询、修改、删除，全部订单的导出和单个订单的导出
- `admin`账户和`sales`账户显示的页面不同

## Preparation

您需要本地安装 [node](https://nodejs.org/) 和 [git](https://git-scm.com/)
本项目是基于`vue`,`elementui`,`axios`,`vue-router`,`spring`,`mybatis-plus`,`gin`,`gorm`提前了解和学习这些知识将大大有助于本项目的使用。

## Features

```
- 包含基础的增删改查，必要的数据展示

- 将所学的服务端开发的基础知识应用于实践

- 使用springboot或者gin快速搭建一个http服务端项目
```

## Getting started
### 服务端

```bash
SpringBoot: 

# enter the project directory
cd CarSale

# install dependency
# modify the sql config
# run 
```
项目监听端口 http://localhost:8083 
```bash
gin

# enter the project directory
cd car_sales_ims

# modify the sql config
# run
go run main.go 
```
项目监听端口 http://localhost:8082
### 客户端

```bash
# enter the project directory
cd CarSale_client

# install dependency
npm install

# develop
npm run dev
```
本项目将自动在 http://localhost:9527 打开

## Developer

`tammer`

## Shortcomings

屎山代码，糟糕的数据库设计（设置的外键太多）
